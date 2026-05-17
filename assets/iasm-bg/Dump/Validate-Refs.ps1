<#
Validate-Refs.ps1
Valide les references routing -> agents/playbooks.
Compatible Windows PowerShell 5.1. Sans modules externes. 100% ASCII.
Version 3.1 - 2026-04-26
  Supporte format hub_routing.yaml : intents:[..], agent:, playbook:
  Supporte aliases.yaml : FACTORY/00_INDEX/aliases.yaml
#>
[CmdletBinding()]
param(
  [Parameter(Mandatory=$false)]
  [string]$RootPath = "C:\Intranet_EA\EAIA\FACTORY",

  [Parameter(Mandatory=$false)]
  [string]$OutJson = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "_lib\ValidationLib.ps1")

if (-not (Test-Path -LiteralPath $RootPath)) {
  Write-Result "ERR" ("RootPath introuvable: {0}" -f $RootPath)
  exit 1
}

$router = Get-RepoFile -RootPath $RootPath `
  -Candidates @("40_ROUTING\hub_routing.yaml","00_INDEX\hub_routing.yaml","hub_routing.yaml") `
  -FallbackName "hub_routing.yaml"

$agentsIdx = Get-RepoFile -RootPath $RootPath `
  -Candidates @("00_INDEX\agents_index.yaml","agents_index.yaml") `
  -FallbackName "agents_index.yaml"

$playbooksIdx = Get-RepoFile -RootPath $RootPath `
  -Candidates @("00_INDEX\playbooks_index.yaml","playbooks_index.yaml",
                "00_INDEX\playbooks.yaml","playbooks.yaml") `
  -FallbackName "playbooks_index.yaml"

$aliasesFile = Get-RepoFile -RootPath $RootPath `
  -Candidates @("00_INDEX\aliases.yaml","aliases.yaml") `
  -FallbackName "aliases.yaml"

$errors   = New-Object System.Collections.Generic.List[string]
$warnings = New-Object System.Collections.Generic.List[string]
$aliasHits = New-Object System.Collections.Generic.List[string]

if (-not $router)    { $errors.Add("hub_routing.yaml introuvable.") | Out-Null }
if (-not $agentsIdx) { $errors.Add("agents_index.yaml introuvable.") | Out-Null }

if ($errors.Count -gt 0) {
  foreach ($e in $errors) { Write-Result "ERR" $e }
  exit 1
}

Write-Result "OK" ("RootPath:  {0}" -f $RootPath)
Write-Result "OK" ("Router:    {0}" -f $router)
Write-Result "OK" ("Agents:    {0}" -f $agentsIdx)
if ($playbooksIdx) {
  Write-Result "OK" ("Playbooks: {0}" -f $playbooksIdx)
} else {
  Write-Result "WARN" "playbooks_index.yaml introuvable - verification playbook ignoree."
}
if ($aliasesFile) {
  Write-Result "OK" ("Aliases:   {0}" -f $aliasesFile)
} else {
  Write-Result "WARN" "aliases.yaml introuvable - resolution alias ignoree. Emplacement attendu: FACTORY/00_INDEX/aliases.yaml"
}

$aliases = Parse-AliasesFile -Path $aliasesFile
$agentAliases = $aliases.agent_aliases
$playbookAliases = $aliases.playbook_aliases

# Parse routing avec le parser dedie (intents:[], agent:, playbook:)
$routes = Parse-RoutingTable -Path $router
if ($routes.Count -eq 0) {
  $errors.Add("Aucune route detectee dans hub_routing.yaml.") | Out-Null
}

# Agents connus : accepter id, actor_id, agent_id
$agentsSet = Extract-IdsFromYamlLite -Path $agentsIdx `
  -Keys @("actor_id","id","agent_id","agentId","display_name")

if ($agentsSet.Count -eq 0) {
  $warnings.Add("Aucun ID agent detecte dans agents_index.yaml.") | Out-Null
}

# Playbooks connus
$playbooksSet = New-Object 'System.Collections.Generic.HashSet[string]'
if ($playbooksIdx) {
  $playbooksSet = Extract-IdsFromYamlLite -Path $playbooksIdx `
    -Keys @("playbook_id","id","playbookId")
} else {
  $pbFiles = Get-RepoFilesByPattern -RootPath $RootPath `
    -Patterns @("playbook*.yaml","playbook*.yml","*playbooks*.yaml","*playbooks*.yml")
  foreach ($f in $pbFiles) {
    try {
      $tmp = Extract-IdsFromYamlLite -Path $f.FullName -Keys @("playbook_id","id","playbookId")
      foreach ($x in $tmp) { [void]$playbooksSet.Add($x) }
    } catch {
      $warnings.Add(("Parse impossible: {0}" -f $f.FullName)) | Out-Null
    }
  }
}

# Validation
$intentSet = New-Object 'System.Collections.Generic.HashSet[string]'

foreach ($r in $routes) {
  $ln     = $r["__startLine"]
  $intent = $r["intent"]
  $actor  = $r["actor_id"]
  $pb     = $r["playbook_id"]

  if (-not $intent -or -not $actor) {
    $errors.Add(("Route incomplete ({0}:{1}) intent='{2}' actor='{3}'." `
      -f $router, $ln, $intent, $actor)) | Out-Null
    continue
  }

  if (-not $intentSet.Add($intent)) {
    $errors.Add(("Intent duplique '{0}' ({1}:{2})." -f $intent, $router, $ln)) | Out-Null
  }

  $actorCanonical = Resolve-CanonicalId -Value $actor -AliasMap $agentAliases
  if ($actorCanonical -ne $actor) {
    $aliasHits.Add(("agent alias: {0} -> {1} (intent '{2}')" -f $actor, $actorCanonical, $intent)) | Out-Null
  }

  if ($agentsSet.Count -gt 0 -and -not $agentsSet.Contains($actorCanonical)) {
    $warnings.Add(("actor_id inconnu '{0}' pour intent '{1}' ({2}:{3}). Resolu='{4}'." `
      -f $actor, $intent, $router, $ln, $actorCanonical)) | Out-Null
  }

  if ($pb) {
    $pbCanonical = Resolve-CanonicalId -Value $pb -AliasMap $playbookAliases
    if ($pbCanonical -ne $pb) {
      $aliasHits.Add(("playbook alias: {0} -> {1} (intent '{2}')" -f $pb, $pbCanonical, $intent)) | Out-Null
    }

    if ($playbooksSet.Count -gt 0 -and -not $playbooksSet.Contains($pbCanonical)) {
      $warnings.Add(("playbook inconnu '{0}' pour intent '{1}' ({2}:{3}). Resolu='{4}'." `
        -f $pb, $intent, $router, $ln, $pbCanonical)) | Out-Null
    }
  }
}

Write-Host ""
Write-Host "=== Resultats Validate-Refs ===" -ForegroundColor Cyan
Write-Result "OK"   ("Routes parsees (intents expandus) : {0}" -f $routes.Count)
Write-Result "OK"   ("Agents connus (agents_index)       : {0}" -f $agentsSet.Count)
Write-Result "OK"   ("Playbooks connus (index)           : {0}" -f $playbooksSet.Count)
Write-Result "OK"   ("Agent aliases charges             : {0}" -f $agentAliases.Count)
Write-Result "OK"   ("Playbook aliases charges          : {0}" -f $playbookAliases.Count)
Write-Result "OK"   ("Alias resolus dans routing         : {0}" -f $aliasHits.Count)
Write-Result "WARN" ("Warnings                           : {0}" -f $warnings.Count)
Write-Result "ERR"  ("Erreurs                            : {0}" -f $errors.Count)

foreach ($a in $aliasHits) { Write-Result "OK" $a }
foreach ($w in $warnings) { Write-Result "WARN" $w }
foreach ($e in $errors)   { Write-Result "ERR"  $e }

if ($OutJson -and $OutJson.Trim() -ne "") {
  $obj = [ordered]@{
    rootPath  = $RootPath
    files     = [ordered]@{
      router          = $router
      agents_index    = $agentsIdx
      playbooks_index = $playbooksIdx
      aliases         = $aliasesFile
    }
    counts    = [ordered]@{
      routes           = $routes.Count
      agents           = $agentsSet.Count
      playbooks        = $playbooksSet.Count
      agent_aliases    = $agentAliases.Count
      playbook_aliases = $playbookAliases.Count
      alias_hits       = $aliasHits.Count
      warnings         = $warnings.Count
      errors           = $errors.Count
    }
    alias_hits = @($aliasHits)
    warnings   = @($warnings)
    errors     = @($errors)
  }
  $obj | ConvertTo-Json -Depth 6 | Out-File -FilePath $OutJson -Encoding UTF8
  Write-Result "OK" ("Rapport JSON: {0}" -f $OutJson)
}

if ($errors.Count -gt 0) { exit 1 } else { exit 0 }
