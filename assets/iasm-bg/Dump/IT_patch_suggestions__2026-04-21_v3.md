# IT.zip — Patch Suggestions (P0/P1)

Generated: 2026-04-21_v3

## P0 — Bloquants Factory/Standalone

### 1) FACTORY_MANIFEST_IT.yaml — YAML invalide (ligne orpheline)

- Symptôme: parse YAML échoue autour de la ligne ~121 (fragment `noc_dispatch, noc_dispatcher]`).

- Fix minimal recommandé: supprimer la ligne orpheline + les lignes associées si besoin.

  - Cible: supprimer la ligne qui contient exactement `noc_dispatch, noc_dispatcher]`.

  - Vérif: `yamllint` / `python -c "import yaml; yaml.safe_load(open('FACTORY_MANIFEST_IT.yaml'))"`.


### 2) 00_INDEX/RUNBOOK_DISPATCH.yaml — références legacy `IT-AssistanTI_*`

- Remplacer **7** occurrences de `IT-AssistanTI_N2`/`IT-AssistanTI_N3` → `IT-Assistant-N2`/`IT-Assistant-N3`.

  - Règles affectées: ad_operations, ad_user_mgmt, dc_prepost, onedrive_sync, print_diag, rds, support_n2_generic


### 3) 00_INDEX/agents_index.yaml — clé `IT-_FrontLine`

- Renommer la clé `IT-_FrontLine` → `IT-FrontLine`.

- Vérifier que `agents_index.agents.<id>.path` pointe vers `20_Agents/IT-FrontLine`.


### 4) 00_INDEX/agents.yaml — entrée `IT-BackupDRMaster` incorrecte

- Problème: `IT-BackupDRMaster` pointe vers `20_Agents/IT-ClientDocMaster`.

- Fix: corriger l’entrée pour que :

  - `IT-BackupDRMaster.path` = `20_Agents/IT-BackupDRMaster`

  - ajouter/retablir l’entrée `IT-ClientDocMaster` avec `path` = `20_Agents/IT-ClientDocMaster`


### 5) 00_INDEX/gpt_catalog.yaml — `IT-AssistanTI_FrontLine` et paths vers `IT-Assistant-FrontLine`

- Problème: le catalog contient une entrée `IT-AssistanTI_FrontLine` dont les fichiers pointent vers un dossier absent.

- Fix recommandé:

  - renommer l’ID catalog → `IT-FrontLine`

  - mettre `paths.agent/contract/prompt` vers `20_Agents/IT-FrontLine/...`


### 6) 80_MACHINES/hub_routing.yaml — default_actor_id legacy

- 2 règles utilisent `IT-AssistanTI_FrontLine`.

- Fix: remplacer par `IT-FrontLine`.


### 7) 00_INDEX/KNOWLEDGE_INDEX.yaml — 21 références bundles/templates cassées

- Cause: naming des bundles (présents) ne préfixe pas `IT-`.

- Fix recommandé: régénérer l’index depuis `IT-SHARED/60_BUNDLES/*`.

  - Exemple: `IT-SHARED/60_BUNDLES/BUNDLE_KP_IT-AssetMaster_V1.md` → `IT-SHARED/60_BUNDLES/BUNDLE_KP_AssetMaster_V1.md`.

  - Corriger aussi `BUNDLE_KP_Assistant-N3_V1.md.md` → `BUNDLE_KP_Assistant-N3_V1.md`.

- Template manquant référencé: `IT-SHARED/20_TEMPLATES/TEMPLATE_BUNDLE_CW_CLOSE.md` (absent) → créer ou retirer.


### 8) intents.yaml — intents manquants utilisés dans hub_routing + agents

- `hub_routing.yaml` référence **71** intents absents de `00_INDEX/intents.yaml`.

- Les agents utilisent **85** intents absents de l’index.

- Fix: régénérer `intents.yaml` à partir de l’union :

  - intents déclarés dans `20_Agents/**/agent.yaml`

  - intents utilisés dans `80_MACHINES/hub_routing.yaml`

  - intents dans `00_INDEX/RUNBOOK_DISPATCH.yaml` (si applicable)


## P1 — Qualité produit (docs/runbooks) : références internes à corriger


### IT-Commandare-Infra

- `IT-SHARED/10_RUNBOOKS/NOC/RUNBOOK__IT_INCIDENT_COMMAND_V1.md` → suggéré: IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__INCIDENT_COMMAND_V1.md / IT-SHARED/10_RUNBOOKS/RUNBOOK_MASTER__IT_v1.md


### IT-Commandare-NOC

- `IT-SHARED/10_RUNBOOKS/NOC/RUNBOOK__IT_NOC_COMMAND_CENTER.md` → suggéré: IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__NOC_COMMAND_CENTER.md / IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__INCIDENT_COMMAND_V1.md

- `IT-SHARED/10_RUNBOOKS/NOC/RUNBOOK__IT_NOC_DISPATCH.md` → suggéré: IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__DISPATCH.md / IT-SHARED/10_RUNBOOKS/SUPPORT/RUNBOOK__IT_MSP_CONNECTWISE_DISPATCH_V1.md

- `IT-SHARED/10_RUNBOOKS/NOC/RUNBOOK__IT_INCIDENT_COMMAND_V1.md` → suggéré: IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__INCIDENT_COMMAND_V1.md / IT-SHARED/10_RUNBOOKS/RUNBOOK_MASTER__IT_v1.md


### IT-Commandare-OPR

- `IT-SHARED/10_RUNBOOKS/SUPPORT/RUNBOOK__IT_COMMANDARE_OPR.md` → suggéré: IT-SHARED/10_RUNBOOKS/SUPPORT/SUPPORT__RUNBOOK__COMMANDARE_OPR.md / IT-SHARED/10_RUNBOOKS/SUPPORT/RUNBOOK__IT_COMMANDARE_TECH.md


### IT-MaintenanceMaster

- `IT-SHARED/10_RUNBOOKS/MAINTENANCE/RUNBOOK__Windows_Patching.md` → suggéré: IT-SHARED/10_RUNBOOKS/MAINTENANCE/99_ARCHIVE/RUNBOOK__Windows_Patching.md / IT-SHARED/10_RUNBOOKS/MAINTENANCE/99_ARCHIVE/RUNBOOK__Patching_Process.md

- `IT-SHARED/10_RUNBOOKS/MAINTENANCE/RUNBOOK__Windows_Patching_COMPLET_V2.md` → suggéré: IT-SHARED/10_RUNBOOKS/MAINTENANCE/99_ARCHIVE/RUNBOOK__Windows_Patching.md / IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_MAINTENANCE_Patching-Windows_V1.md


### IT-NOCDispatcher

- `IT-SHARED/10_RUNBOOKS/NOC/RUNBOOK__IT_NOC_DISPATCH.md` → suggéré: IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__DISPATCH.md / IT-SHARED/10_RUNBOOKS/SUPPORT/RUNBOOK__IT_MSP_CONNECTWISE_DISPATCH_V1.md


### IT-SysAdmin

- `IT-SHARED/10_RUNBOOKS/MAINTENANCE/RUNBOOK__Windows_Patching.md` → suggéré: IT-SHARED/10_RUNBOOKS/MAINTENANCE/99_ARCHIVE/RUNBOOK__Windows_Patching.md / IT-SHARED/10_RUNBOOKS/MAINTENANCE/99_ARCHIVE/RUNBOOK__Patching_Process.md

- `IT-SHARED/10_RUNBOOKS/MAINTENANCE/RUNBOOK__Windows_Patching_COMPLET_V2.md` → suggéré: IT-SHARED/10_RUNBOOKS/MAINTENANCE/99_ARCHIVE/RUNBOOK__Windows_Patching.md / IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_MAINTENANCE_Patching-Windows_V1.md

- `IT-SHARED/10_RUNBOOKS/NOC/RUNBOOK__IT_VEEAM_OPERATIONS_V1.md` → suggéré: IT-SHARED/10_RUNBOOKS/INFRA/RUNBOOK__IT_VEEAM_OPERATIONS_V1.md / IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK_VEEAM_OPERATIONS_V1.md

- `IT-SHARED/10_RUNBOOKS/NOC/RUNBOOK__IT_BACKUP_DR_TEST_V1.md` → suggéré: IT-SHARED/10_RUNBOOKS/INFRA/RUNBOOK__IT_BACKUP_DR_TEST_V1.md / IT-SHARED/10_RUNBOOKS/INFRA/99_ARCHIVE/RUNBOOK__IT_BACKUP_DR_TEST_V1.md

- `IT-SHARED/10_RUNBOOKS/RUNBOOK_MENU_CONTEXTUEL_V4.md` → suggéré: IT-SHARED/RUNBOOK_MENU_CONTEXTUEL_V4.md / IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/RUNBOOK_MENU_CONTEXTUEL_V4.md


### IT-UrgenceMaster

- `IT-SHARED/10_RUNBOOKS/NOC/RUNBOOK__IT_INCIDENT_COMMAND_V1.md` → suggéré: IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__INCIDENT_COMMAND_V1.md / IT-SHARED/10_RUNBOOKS/RUNBOOK_MASTER__IT_v1.md

- `IT-SHARED/10_RUNBOOKS/NOC/RUNBOOK__IT_NOC_FRONTDOOR_v2.md` → suggéré: IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__FRONTDOOR_v2.md / IT-SHARED/10_RUNBOOKS/NOC/NOC_RUNBOOK__IT_NETWORK_DIAGNOSTIC_V1.md
