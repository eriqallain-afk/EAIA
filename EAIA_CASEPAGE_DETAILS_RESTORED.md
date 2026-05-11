# EAIA — restauration des détails opérationnels dans les casepages MSP

## Correction effectuée

Les pages MSP avaient été trop résumées dans la refonte premium. Cette passe restaure la profondeur opérationnelle tout en conservant l’apparence premium.

## Pages modifiées

- `pages/eaia-msp-resolution-billet-agent.html`
- `pages/msp-capacite-resolution-11-serveurs.html`
- `pages/msp-demos.html`

## Standard de contenu rétabli

Chaque casepage doit montrer :

1. Billet source anonymisé
2. Lecture agent
3. Diagnostic / risques
4. Pipeline de traitement
5. Plan ou action minimale défendable
6. Livrables prêts à copier
7. Valeur commerciale

## Anonymisation

Les noms client / serveur ont été remplacés par des libellés génériques : `APP-01`, `SQL-01`, `DC-01`, etc.

## Commandes Git

```bash
git add pages/eaia-msp-resolution-billet-agent.html pages/msp-capacite-resolution-11-serveurs.html pages/msp-demos.html EAIA_CASEPAGE_DETAILS_RESTORED.md EAIA_CASEPAGE_DETAILS_LINK_CHECK.txt

git commit -m "restore detailed MSP casepage content"

git push
```
