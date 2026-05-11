# EAIA — Ajout de la couche explicative agents MSP

## Objectif

Réintroduire dans la refonte premium une couche plus explicite sur ce que font réellement les agents MSP Intelligence IT.

## Changements

- Ajout de `pages/msp-case-windows-postcheck.html` comme casepage détaillé post-maintenance Windows Server.
- Logo officiel appliqué dans l’entête de la nouvelle page : `../assets/images/eaia-logo-officiel.png`.
- Ajout d’une section `Comment lire les démos` dans `pages/msp-demos.html`.
- Ajout d’une carte vers le nouveau cas Windows / Post-maintenance.
- Ajout d’un lien `Agents` dans la navigation du cas SQL / ERP Performance.
- Ajout d’un bloc `Lecture agent` dans le cas SQL pour rendre visible la valeur agentique.

## Commandes Git

```bash
git add pages/msp-demos.html pages/msp-case-resolutionsql-performance.html pages/msp-case-windows-postcheck.html EAIA_MSP_AGENT_EXPLANATION_UPDATE.md EAIA_MSP_AGENT_EXPLANATION_LINK_CHECK.txt
git commit -m "clarify MSP agent actions in case demos"
git push
```
