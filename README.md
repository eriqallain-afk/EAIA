# EA|IA — Intelligence artificielle opérationnelle

> **La prochaine étape de l'IA n'est pas une conversation. C'est une armée.**

[![Version](https://img.shields.io/badge/version-1.0.0--lancement-gold?style=flat-square&color=CC8E28)](CHANGELOG.md)
[![Licence](https://img.shields.io/badge/licence-Propriétaire-silver?style=flat-square&color=555)](LICENSE)
[![Armées déployées](https://img.shields.io/badge/armées-6-gold?style=flat-square&color=DC961A)](kit/armees.md)
[![Agents actifs](https://img.shields.io/badge/agents-130%2B-gold?style=flat-square&color=EDAF45)](kit/armees.md)

---

## Qu'est-ce qu'EA|IA?

**EA|IA est une FACTORY d'agents IA.**

Pas une marque avec des produits. Une usine à agents avec 5 équipes core, 10 playbooks de fabrication et un pipeline de déploiement reproductible vers n'importe quel secteur.

EA|IA conçoit et déploie des **armées d'agents IA spécialisés** qui appliquent des workflows métier réels, produisent des livrables concrets et s'intègrent aux opérations d'une organisation.

```
EA|IA/
├── FACTORY/    ← EA|IA — back-office, infrastructure de fabrication
├── PRODUCTS/   ← Les 6 armées déployées par secteur
└── SHARED/     ← Ressources communes
```

---

## Les 6 armées déployées

| Code | Armée | Agents | Secteur |
|---|---|---|---|
| **IT** | MSP Intelligence IT | 26+ | IT / MSP — produit phare |
| **DAM** | ARMY DAM DESIGN | 19 | Design d'intérieur & Construction |
| **TRAD** | ARMY TRAD INTEL | 13 | Intelligence stratégique & Marchés |
| **IASM** | IASM | 19 | Accompagnement psychologique structuré |
| **EDU** | EDU SERVICES | multi | Éducation secondaire |
| **NEA** | ARMY NEA WRITING | 7 | Édition & Publications |

---

## Architecture de la FACTORY

### 5 équipes core · 39 agents

```
TEAM CTL  (3 agents)  — Surveillance continue : WatchdogIA · AlertRouter · HealthReporter
TEAM HUB  (10 agents) — Orchestration : MasterOrchestrator · Router · Concierge · AvatarForge
TEAM META (14 agents) — Fabrication : PromptMaster · PlaybookBuilder · AgentProductFactory
TEAM IAHQ (10 agents) — Stratégie : Economist · SolutionOrchestrator · ProcessMapper
TEAM OPS  (3 agents)  — Exécution critique : RouterIA · PlaybookRunner · DossierIA
```

### Flux d'exécution

```
Requête → CTL (surveillance) → HUB → OPS-RouterIA → OPS-PlaybookRunner
       → [META | IAHQ | Armée déployée] → OPS-DossierIA → Livrable
```

### Standard par agent

```
FACTORY/20_AGENTS/<TEAM>/<TEAM-NomAgent>/
├── agent.yaml       ← identité, intents, version, escalade
├── contract.yaml    ← interface I/O (input / output / guardrails)
└── prompt.md        ← instructions système
```

### 10 playbooks de fabrication

| Playbook | Catégorie | Durée |
|---|---|---|
| `BUILD_ARMY_FACTORY` | Fabrication | 300 min · 8 étapes |
| `BUILD_TEAM_FROM_SCRATCH` | Fabrication | 180 min · 6 étapes |
| `CLONE_AND_ADAPT_AGENT` | Fabrication | 45 min · 4 étapes |
| `IAHQ_FRONTDOOR` | Stratégie | 180 min · 7 étapes |
| `ARMY_AUDIT_COMPLETE` | Opérationnel | 90 min · 5 étapes |
| `FACTORY_HEALTH_CHECK` | Surveillance | 20 min · 3 étapes |

---

## Ce repo

Ce repo contient le **kit de lancement public EA|IA** :

```
ea-ia/
├── index.html              ← Landing page lancement (GitHub Pages)
├── msp-preview.html        ← Preview MSP Intelligence IT
├── kit/
│   ├── armees.md           ← Description des 6 armées
│   ├── palette.md          ← Charte couleurs officielle
│   ├── specs-phi.md        ← Spécifications nombre d'or φ
│   └── textes-campagne.md  ← Textes officiels de lancement
├── assets/
│   └── images/             ← Visuels de marque
├── CHANGELOG.md
└── LICENSE
```

---

## Identité visuelle

| Élément | HEX | Usage |
|---|---|---|
| Fond | `#000000` | Arrière-plan principal |
| Or EA | `#EDAF45` | Logo EA, accents primaires |
| Or cercle | `#DC961A` | Cercle logo, séparateurs |
| Or foncé | `#CC8E28` | Bordures, labels |
| Or lumineux | `#FFD04F` | Hover, highlights |
| Argent IA | `#D5D5D1` | Logo IA, texte secondaire |

**Composition selon φ = 1.618034** · Zone logo 38.2% · Zone visuelle 61.8%

---

## Déploiement GitHub Pages

```bash
# 1. Cloner
git clone https://github.com/<username>/ea-ia.git
cd ea-ia

# 2. Activer GitHub Pages
# Settings → Pages → Source: main / root

# 3. Domaine custom (optionnel)
echo "eaia.ca" > CNAME
git add CNAME && git commit -m "add: custom domain"
git push
```

La page sera disponible à `https://<username>.github.io/ea-ia` ou sur votre domaine.

---

## Contact & Démo

📩 **contact@eaia.ca**
📅 **Démo 20 min** — Apportez un workflow, un document ou un problème récurrent de votre secteur.

---

## Slogan

```
Des agents IA qui connaissent votre métier.
Pas des chatbots génériques.
Des armées IA opérationnelles.
```

---

*EA|IA Technologies · φ = 1.618034 · 2026*
