# EAIA — intégration pages Factory / MSP demos / formulaire

## Changements effectués

- Ajout de `pages/factory.html` : page d’explication de la FACTORY EA|IA.
- Ajout de `pages/msp-demos.html` : page de choix des démonstrateurs MSP.
- Intégration et normalisation des pages :
  - `pages/msp-case-incident-noc-hyperv.html`
  - `pages/msp-capacite-resolution-11-serveurs.html`
  - `pages/eaia-msp-case-page-1746993-canards-du-lac-brome.html`
  - `pages/eaia-formulaire-besoins-agents.html`
  - `pages/eaia-msp-resolution-billet-agent.html`
- Correction dans `index.html` : lien MSP vers `msp-preview.html`.
- Correction dans `msp-preview.html` : retour vers `index.html`.
- Ajout de liens depuis `msp-preview.html` vers la page de choix des démos.
- Normalisation de l’entête sur les pages ajoutées : même police, taille, logo typographique EA|IA et navigation cohérente.

## Parcours recommandé

`index.html` → `msp-preview.html` → `pages/msp-demos.html` → page de démo choisie.

## Commandes Git suggérées

```bash
git add index.html msp-preview.html pages/factory.html pages/msp-demos.html pages/msp-case-incident-noc-hyperv.html pages/msp-capacite-resolution-11-serveurs.html pages/eaia-msp-case-page-1746993-canards-du-lac-brome.html pages/eaia-formulaire-besoins-agents.html pages/eaia-msp-resolution-billet-agent.html EAIA_INTEGRATION_PAGES.md

git commit -m "integrate EAIA factory and MSP demo pages"

git push
```
