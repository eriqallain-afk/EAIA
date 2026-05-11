# EAIA — Ajout CasePage Exchange Transport MSP

## Verdict de valeur ajoutée

La page a été retenue comme **cas MSP à forte valeur démonstrative**.

Motifs :
- cas Exchange concret et fréquent en MSP : back pressure du transport causé par pression disque;
- métriques fortes : 6% d’espace libre initial, 9,9 GB récupérés, 1973 fichiers temporaires obsolètes supprimés, 0 redémarrage;
- excellent garde-fou opérationnel : protection explicite de la Queue Exchange / `mail.que`;
- pipeline complet : ingestion, triage, précheck, analyse de risque, action minimale, postcheck, fermeture, capitalisation;
- version publique déjà anonymisée : client manufacturier multi-sites, aucun nom serveur ou client réel exposé.

## Fichier ajouté

```txt
pages/msp-case-exchange-transport.html
```

## Fichier modifié

```txt
pages/msp-demos.html
```

Nouvelle carte ajoutée :

```txt
Exchange / Transport — Back pressure Exchange
```

## Logo

Le logo circulaire local de la page source a été retiré. La page utilise maintenant le logo officiel du site :

```txt
../assets/images/eaia-logo-officiel.png
```

CSS appliqué :

```css
height:52px;
width:auto;
object-fit:contain;
```

## Commandes Git recommandées

```bash
git add pages/msp-demos.html pages/msp-case-exchange-transport.html EAIA_MSP_EXCHANGE_CASE_UPDATE.md EAIA_MSP_EXCHANGE_LINK_CHECK.txt

git commit -m "add MSP Exchange transport case page"

git push
```
