# EA|IA — Charte couleurs officielle

> Version 1.0 · Designer DAM · Mai 2026

---

## Palette principale

| Rôle | Nom | HEX | RGB | Usage |
|---|---|---|---|---|
| Fond | Noir pur | `#000000` | `0, 0, 0` | Arrière-plan principal |
| Surface 1 | Noir profond | `#070707` | `7, 7, 7` | Cards, sections |
| Surface 2 | Noir doux | `#0D0D0D` | `13, 13, 13` | Niveaux secondaires |
| Or EA | Or chaud | `#EDAF45` | `237, 175, 69` | Logo EA, CTAs, accents |
| Or cercle | Or lumineux | `#DC961A` | `220, 150, 26` | Cercle logo, séparateurs φ |
| Or foncé | Or brossé | `#CC8E28` | `204, 142, 40` | Bordures, labels, kickers |
| Or hover | Or vif | `#FFD04F` | `255, 208, 79` | Hover sur boutons, highlights |
| Argent IA | Argent brossé | `#D5D5D1` | `213, 213, 209` | Logo IA, texte secondaire |
| Texte | Blanc chaud | `#F2EFEA` | `242, 239, 234` | Corps de texte principal |
| Muted | Gris or | `#6A6460` | `106, 100, 96` | Texte discret, métadonnées |
| Bordure | Brun très foncé | `#181410` | `24, 20, 16` | Séparateurs, bordures |

---

## Dégradés

### Séparateur φ (ligne horizontale signature)
```css
background: linear-gradient(
  90deg,
  transparent,
  #CC8E28 38.2%,
  #EDAF45 50%,
  #CC8E28 61.8%,
  transparent
);
```

### Diviseur logo (trait vertical)
```css
background: linear-gradient(180deg, #DC961A, #EDAF45);
```

### Fond hero subtil
```css
background: radial-gradient(
  ellipse at 70% 50%,
  rgba(220, 150, 26, 0.04) 0%,
  transparent 60%
);
```

---

## Typographie

| Usage | Police | Graisse | Style |
|---|---|---|---|
| Logo EA | System serif fallback | 900 | Italic |
| Logo IA | System sans | 300 | Normal |
| Titres | `'Segoe UI', Helvetica, Arial` | 800 | Normal |
| Corps | `'Segoe UI', Helvetica, Arial` | 400 | Normal |
| Labels | `'Segoe UI', Helvetica, Arial` | 700 | Normal · `letter-spacing: .28em` · uppercase |
| Code | `monospace` | 400 | Normal |

---

## Cercle logo — Spécifications φ

```
⌀ cercle     : 387 px  (à 1640×624)
Centre       : (313, 193) px
Épaisseur    : 1 px
Couleur bord : #DC961A
Ticks        : top · bottom · left · right
Séparateur   : trait vertical #DC961A → #EDAF45, 2px
```

---

## Dimensions Facebook — Nombre d'or (φ = 1.618034)

| Format | Dimensions | Zone logo | Zone visuelle |
|---|---|---|---|
| Cover @2x | 1640 × 624 px | 626 px (38.2%) | 1014 px (61.8%) |
| Cover @1x | 820 × 312 px | 313 px | 507 px |
| Profile | 500 × 500 px | — | — |
| Post carré | 1080 × 1080 px | — | — |
| Story | 1080 × 1920 px | 731 px (φ²) haut | 1189 px bas |
| LinkedIn | 1200 × 627 px | — | — |
| Web hero | 1920 × 700 px | — | — |

---

## À ne pas faire

- ❌ Modifier les proportions du cercle logo
- ❌ Utiliser le cercle sans les ticks (haut/bas/gauche/droite)
- ❌ Placer EA|IA sur fond clair
- ❌ Changer la graisse du logo (EA = 900 italic, IA = 300 normal)
- ❌ Utiliser un or différent de `#EDAF45` pour EA
- ❌ Utiliser un argent différent de `#D5D5D1` pour IA

---

*EA|IA Technologies · Charte v1.0 · Designer DAM · 2026*
