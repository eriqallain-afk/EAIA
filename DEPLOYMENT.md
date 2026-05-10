# DEPLOYMENT — Guide de déploiement EA|IA

> Et hints pour tirer le maximum du repo public.

---

## 1. Structure recommandée du repo

```
ea-ia/                          ← nom court, propre, brandé
├── index.html                  ← Landing page principale (GitHub Pages la prend en auto)
├── msp-preview.html            ← Preview MSP IT
├── kit/
│   ├── armees.md
│   ├── palette.md
│   ├── specs-phi.md
│   └── textes-campagne.md
├── assets/
│   └── images/
│       ├── logo-ea-ia.png      ← Logo isolé sur fond transparent
│       ├── bandeau-*.png       ← Bandeaux 1640×624
│       └── og-image.png        ← Image Open Graph 1200×630 (voir hint #4)
├── .nojekyll                   ← CRITIQUE — GitHub Pages sans Jekyll
├── CNAME                       ← Domaine custom (voir hint #2)
├── README.md
├── CHANGELOG.md
└── LICENSE
```

---

## 2. Activer GitHub Pages

```
1. Settings → Pages (menu gauche)
2. Source : "Deploy from a branch"
3. Branch : main / (root)
4. Save
```

→ Disponible à : `https://github.com/eriqallain-afk/EAIA//msp-preview.html`

**Délai :** 1–3 minutes au premier déploiement, quasi-instantané ensuite.

---

## 3. Domaine custom

Si tu veux `eaia.ca` ou `launch.eaia.ca` :

```bash
# Créer le fichier CNAME
echo "eaia.ca" > CNAME
# ou
echo "launch.eaia.ca" > CNAME

git add CNAME && git commit -m "add: custom domain" && git push
```

Puis chez ton registraire DNS :

```
# Pour domaine racine (eaia.ca)
Type A  →  185.199.108.153
Type A  →  185.199.109.153
Type A  →  185.199.110.153
Type A  →  185.199.111.153

# Pour sous-domaine (launch.eaia.ca)
Type CNAME  →  <username>.github.io
```

GitHub gère le SSL automatiquement (Let's Encrypt). Cocher "Enforce HTTPS" dans Settings → Pages.

---

## 4. Open Graph — Partage réseaux sociaux

Ajoute ces balises dans le `<head>` de `index.html` pour un partage propre sur Facebook, LinkedIn, iMessage :

```html
<meta property="og:title" content="EA|IA — Intelligence artificielle opérationnelle">
<meta property="og:description" content="La prochaine étape de l'IA n'est pas une conversation. C'est une armée. 6 armées déployées. 130+ agents actifs.">
<meta property="og:image" content="https://eaia.ca/assets/images/og-image.png">
<meta property="og:url" content="https://eaia.ca">
<meta property="og:type" content="website">
<meta name="twitter:card" content="summary_large_image">
```

**L'image OG :** prendre un des bandeaux 1640×624, le recadrer à 1200×630. C'est ce que Facebook, LinkedIn et iMessage affichent en preview quand tu partages le lien.

---

## 5. robots.txt — SEO de base

```bash
cat > robots.txt << 'EOF'
User-agent: *
Allow: /

Sitemap: https://eaia.ca/sitemap.xml
EOF
```

---

## 6. Workflow Git recommandé

```bash
# Branches recommandées
main        ← production (ce qui est en ligne)
dev         ← développement en cours
feature/*   ← nouvelles fonctionnalités

# Exemple ajout d'une page armée
git checkout -b feature/page-dam-design
# ... modifications ...
git add . && git commit -m "add: page verticale ARMY DAM DESIGN"
git checkout main && git merge feature/page-dam-design
git push
```

---

## 7. Nom du repo

Recommandations dans l'ordre de préférence :

| Nom | Avantage |
|---|---|
| `ea-ia` | Court, exact, brandé |
| `eaia` | Encore plus court |
| `eaia-launch` | Clair sur l'intention |
| `eaia.ca` | Si tu vises le domaine exact |

Évite les underscores (`ea_ia`) — moins propre dans les URLs GitHub Pages.

---

## 8. Topics GitHub (référencement)

Dans Settings → About → Topics, ajouter :

```
artificial-intelligence  ai-agents  msp  intelligence-artificielle
operational-ai  agent-architecture  quebec  french
```

Ça aide au référencement GitHub Search et montre le sérieux du projet.

---

## 9. Hint critique — le .nojekyll

Sans le fichier `.nojekyll` à la racine, GitHub Pages passe ton site dans Jekyll (un générateur de site statique Ruby) qui **ignore les fichiers commençant par `_`** et peut casser les URLs. Le fichier vide `.nojekyll` désactive Jekyll complètement. Il est déjà dans ce repo.

---

## 10. Analytics (optionnel)

Si tu veux savoir combien de personnes visitent la landing page :

```html
<!-- Google Analytics 4 — dans <head> de index.html -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

Alternative gratuite et plus privée : **Plausible Analytics** (plausible.io) ou **Umami** (auto-hébergeable).

---

## Checklist de lancement

```
☐ Renommer index.html → la landing page principale
☐ Ajouter les balises OG dans le <head>
☐ Créer le fichier CNAME avec ton domaine
☐ Vérifier que .nojekyll est présent
☐ Activer GitHub Pages (Settings → Pages)
☐ Configurer les DNS chez ton registraire
☐ Tester le HTTPS (Settings → Pages → Enforce HTTPS)
☐ Partager le lien sur Facebook pour tester le preview OG
☐ Ajouter les topics GitHub
```

---

*EA|IA Technologies · φ = 1.618034 · 2026*
