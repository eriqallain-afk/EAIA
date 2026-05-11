# EA|IA — Ajout du cas MSP SQL / ERP Performance

## Fichier ajouté

- `pages/msp-case-resolutionsql-performance.html`

## Lien ajouté

- `pages/msp-demos.html` — carte `SQL / ERP Performance`

## Angle corrigé

Le cas n’est pas présenté comme un incident SQL déclaré au départ. La page raconte maintenant le scénario exact :

1. demande initiale : redémarrage contrôlé;
2. courriel client : mention de lenteur ERP;
3. précheck : anomalies de performance détectées;
4. diagnostic : pression disque / processus dominants;
5. correction : exclusions Sentinel + alignement groupe SQL;
6. postcheck : stabilisation et livrables.

## Logo

La page utilise le logo officiel :

```txt
../assets/images/eaia-logo-officiel.png
```

Aucune déformation : `height:auto`, `object-fit:contain`.

## Commandes Git

```bash
git add pages/msp-demos.html pages/msp-case-resolutionsql-performance.html EAIA_MSP_SQL_PERFORMANCE_UPDATE.md EAIA_MSP_SQL_PERFORMANCE_LINK_CHECK.txt
git commit -m "add MSP SQL ERP performance case page"
git push
```
