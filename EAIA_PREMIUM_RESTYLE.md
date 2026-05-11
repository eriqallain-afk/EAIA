# Refonte EA|IA — Style Premium MSP v2

Refonte visuelle complète inspirée de `IT_MSP_LANDING_PAGE_v2_EAIA.html`.

## Décision design
- Style retenu : noir profond, or feutré, typographie Cormorant Garamond + JetBrains Mono + Outfit.
- Look : firme d’architecture IA / cabinet premium, moins page technique brute.
- Logo : utilisation du logo officiel image `assets/images/eaia-logo-officiel.png` partout, sans déformation.

## Pages refaites
- `index.html`
- `msp-preview.html`
- `pages/factory.html`
- `pages/msp-demos.html`
- `pages/eaia-apercu-besoin-client.html`
- `pages/eaia-formulaire-besoins-agents.html`
- `pages/eaia-msp-resolution-billet-agent.html`
- `pages/msp-capacite-resolution-11-serveurs.html`
- `pages/msp-case-exchange-transport.html`
- `pages/msp-case-incident-noc-hyperv.html`
- `pages/msp-case-page-client-anonymise.html`

## Routage conservé
- Factory : architecture + cadrage + formulaires.
- MSP : produit + démonstrateurs terrain seulement.
- Cas clients : anonymisés et publiables.

## Git
```bash
git add index.html msp-preview.html pages assets/images/eaia-logo-officiel.png EAIA_PREMIUM_RESTYLE.md EAIA_PREMIUM_LINK_CHECK.txt
git commit -m "restyle EAIA site with premium architecture design"
git push
```
