# EAIA — Uniformisation du logo officiel

## Changement

Le logo image utilisé comme référence par la page de démonstration de cas MSP est maintenant appliqué dans l’entête de toutes les pages HTML du site.

## Logo officiel utilisé

```txt
assets/images/eaia-logo-officiel.png
```

Ce fichier reprend le logo EA IA noir / or / argent, sans déformation.

## Pages ajustées

- `index.html`
- `msp-preview.html`
- `pages/factory.html`
- `pages/msp-demos.html`
- `pages/msp-case-incident-noc-hyperv.html`
- `pages/msp-capacite-resolution-11-serveurs.html`
- `pages/eaia-msp-case-page-1746993-canards-du-lac-brome.html`
- `pages/eaia-msp-resolution-billet-agent.html`
- `pages/eaia-formulaire-besoins-agents.html`

## Navigation standardisée

Toutes les pages utilisent maintenant la même barre globale :

- logo officiel à gauche;
- lien La FACTORY;
- lien MSP Intelligence IT;
- lien Démonstrateurs;
- lien Brief client;
- CTA Planifier une démo.

## Commandes Git suggérées

```bash
git add index.html msp-preview.html pages assets/images/eaia-logo-officiel.png EAIA_LOGO_UNIFICATION.md
git commit -m "standardize EAIA logo across site pages"
git push
```
