# EAIA — ajout de nouveaux cas MSP et modèle casepage

## Cas intégrés / renforcés

- `pages/msp-case-windows-postcheck.html`
- `pages/msp-case-dhcp-scope.html`
- `pages/msp-case-qnap-backupradar.html`
- `pages/msp-case-incident-noc-hyperv.html`

## Page de choix MSP mise à jour

- `pages/msp-demos.html`

Nouveaux liens ajoutés :

- DHCP / Scope saturé
- BackupRadar / QNAP / Wasabi

Cas existants renforcés au format détaillé :

- Windows / Post-maintenance
- NOC / Hyper-V

## Modèle commun ajouté

- `EAIA_MSP_CASEPAGE_TEMPLATE.md`

Ce modèle sert à uniformiser toutes les pages de cas MSP : hero, billet source anonymisé, lecture agent, risques, diagnostic, pipeline, livrables et valeur MSP.

## Logo

Toutes les nouvelles pages utilisent le logo officiel :

```txt
../assets/images/eaia-logo-officiel.png
```

## Commandes Git suggérées

```bash
git add pages/msp-demos.html pages/msp-case-windows-postcheck.html pages/msp-case-dhcp-scope.html pages/msp-case-qnap-backupradar.html pages/msp-case-incident-noc-hyperv.html EAIA_MSP_CASEPAGE_TEMPLATE.md EAIA_MSP_CASES_BATCH_UPDATE.md EAIA_MSP_CASES_BATCH_LINK_CHECK.txt

git commit -m "add MSP demo cases and standardize casepage model"

git push
```
