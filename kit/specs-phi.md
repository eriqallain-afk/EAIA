# EA|IA — Spécifications nombre d'or (φ)

> φ = 1.618033988749895

---

## Principe de composition

EA|IA utilise le nombre d'or comme système de proportion pour toutes ses compositions visuelles. La grille φ divise chaque espace en deux sections dont le rapport est φ:1.

```
Section A / Section B = φ
Section A = Largeur totale / (1 + φ)
Section B = Largeur totale - Section A
```

---

## Application — Bandeau 1640×624

```
Largeur totale  : 1640 px
Zone logo       : 1640 ÷ (1 + 1.618) = 626 px  [38.2%]
Zone visuelle   : 1640 - 626        = 1014 px  [61.8%]

Hauteur totale  : 624 px
Section logo    : 624 ÷ 1.618       = 386 px  (EA|IA)
Section tagline : 624 - 386         = 238 px  (tagline)

Cercle ⌀        : 626 ÷ 1.618       = 387 px
Marge H cercle  : (626 - 387) ÷ 2  = 119 px / côté
Centre cercle   : (313, 193) px
```

---

## Ratios vérifiés

| Rapport | Valeur | Attendu | ✓ |
|---|---|---|---|
| (zone logo + visuelle) / zone logo | 1014 / 626 | φ = 1.618 | ✓ |
| section logo / section tagline | 386 / 238 | φ = 1.618 | ✓ |
| zone logo / cercle ⌀ | 626 / 387 | φ = 1.618 | ✓ |

---

## Application — Story 1080×1920

```
Zone haute (logo)   : 1920 ÷ φ²  = 731 px
Zone basse (visuel) : 1920 - 731 = 1189 px
```

---

## Séparateur φ — Règle CSS

```css
.phi-sep {
  height: 1px;
  background: linear-gradient(
    90deg,
    transparent,
    #CC8E28 38.2%,   /* point φ gauche */
    #EDAF45 50%,     /* centre */
    #CC8E28 61.8%,   /* point φ droit */
    transparent
  );
  opacity: 0.45;
}
```

---

*EA|IA Technologies · φ = 1.618034 · 2026*
