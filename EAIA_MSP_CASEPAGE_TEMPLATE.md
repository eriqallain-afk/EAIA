# EAIA — Modèle standard de page de cas MSP

Objectif : uniformiser toutes les pages de démonstration MSP en conservant le style premium EA|IA et le contenu opérationnel détaillé.

## Structure obligatoire

1. **Hero**
   - Type de cas
   - Promesse opérationnelle
   - 4 à 6 métriques lisibles
   - CTA vers lecture agent et livrables

2. **Billet source anonymisé**
   - Sujet / source / symptôme / risque
   - Aucun nom client réel
   - Aucun ticket réel si public
   - Aucun secret, URL interne, identifiant sensible

3. **Lecture agent**
   - Ce que le billet dit
   - Ce que le billet implique
   - Ce qui est confirmé / probable / à valider
   - Action minimale défendable

4. **Risques et garde-fous**
   - Lecture seule avant changement
   - Pas de remédiation en lot sur système critique
   - Ne pas suraffirmer une cause racine non prouvée
   - Maintenir les limites de preuve visibles

5. **Diagnostic structuré**
   - Tableau : Élément / Constat / Impact / Décision

6. **Pipeline agent**
   - 5 à 10 étapes réutilisables
   - Chaque étape explique ce que l’agent fait, pas seulement le résultat

7. **Capacités démontrées**
   - Triage
   - Corrélation
   - Garde-fous
   - Livrables
   - Coordination

8. **Livrables prêts à copier**
   - Note interne CW
   - Discussion client / facturable
   - Avis Teams ou rapport coordonnateur

9. **Valeur MSP**
   - Moins de risque
   - Meilleure cohérence
   - Meilleure facturation / documentation
   - Actif commercial réutilisable

## Standard graphique

- Logo officiel obligatoire : `../assets/images/eaia-logo-officiel.png`
- Ne pas utiliser de logo texte seul ni le vieux logo bleu.
- Garder le style premium : noir, or, argent, Cormorant Garamond, JetBrains Mono, Outfit.
- Toutes les pages MSP doivent être liées depuis `pages/msp-demos.html`.

## Règle d’anonymisation

Remplacer les clients, billets, serveurs et identifiants sensibles :

- Client réel → `client anonymisé`, `client manufacturier régional`, `organisation multi-sites`
- Ticket réel → `CASE-MSP-00X`
- Serveur réel → `DC-01`, `SQL-01`, `APP-01`, `HV-01`, `FS-01`
- Courriels / URLs / secrets → retirer ou remplacer par une description fonctionnelle
