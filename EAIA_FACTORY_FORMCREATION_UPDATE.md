# EAIA — Ajout page aperçu de besoin client dans Cadrage Factory

## Objectif
Ajout de la page `EAIA-FormCreation.html` dans le site EA|IA comme ressource de **Cadrage Factory**.

Cette page permet à un client de remplir son contexte, ses objectifs, son stack, ses contraintes et ses coordonnées, puis de générer un aperçu automatique :

- type d’équipe d’agents recommandé ;
- priorité principale ;
- agents proposés ;
- plan de démarrage 30 jours ;
- payload JSON prêt pour webhook / CRM / Make / Zapier / n8n.

## Fichier ajouté

```txt
pages/eaia-apercu-besoin-client.html
```

## Fichier modifié

```txt
pages/factory.html
```

## Intégration

La page est maintenant liée dans :

```txt
pages/factory.html#cadrage
```

Carte ajoutée :

```txt
Aperçu — Besoin client & équipe d’agents
```

## Logo

Le logo texte de la page source a été remplacé par le logo officiel image :

```txt
../assets/images/eaia-logo-officiel.png
```

Le logo est affiché via `img`, avec proportions conservées :

```css
.eaia-logo-img{
  display:block;
  height:52px;
  width:auto;
  object-fit:contain;
}
```

## Correctif supplémentaire

Le bouton `Prendre un appel` ne pointe plus vers le placeholder Calendly `VOTRE-LIEN`. Il pointe maintenant vers :

```txt
mailto:contact@eaia.ca?subject=EAIA%20-%20Appel%20de%20cadrage
```

## Commandes Git recommandées

```bash
git add pages/factory.html pages/eaia-apercu-besoin-client.html EAIA_FACTORY_FORMCREATION_UPDATE.md EAIA_FACTORY_FORMCREATION_LINK_CHECK.txt

git commit -m "add Factory client need preview page"

git push
```
