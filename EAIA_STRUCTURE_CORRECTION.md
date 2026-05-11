# EAIA — correction structure MSP / Factory / logo

## Corrections appliquées

1. **Client anonymisé**
   - L’ancien fichier public `pages/eaia-msp-case-page-1746993-canards-du-lac-brome.html` exposait un nom client dans le nom de fichier / carte.
   - Remplacé par : `pages/msp-case-page-client-anonymise.html`.
   - Libellé public : **Client manufacturier régional**.

2. **MSP = cas MSP seulement**
   - `pages/msp-demos.html` ne contient plus :
     - `Qualification — Formulaire de besoin client`;
     - `Architecture — Comprendre la FACTORY`.
   - La page MSP contient maintenant seulement :
     - Résolution de billet serveur;
     - Incident NOC / Hyper-V;
     - Maintenance 11 serveurs;
     - Cas MSP anonymisé.

3. **Factory = architecture + formulaire**
   - `pages/factory.html` reçoit la section `#cadrage`.
   - Le formulaire `pages/eaia-formulaire-besoins-agents.html` est rattaché au parcours Factory.

4. **Logo officiel**
   - Logo officiel conservé intact : `assets/images/eaia-logo-officiel.png`.
   - Image source : `LOGO.png`, dimensions 1126 × 772.
   - Utilisé dans l’entête global des pages.

## Suppression à effectuer dans Git

```bash
git rm pages/eaia-msp-case-page-1746993-canards-du-lac-brome.html
```

## Commit suggéré

```bash
git add index.html msp-preview.html pages assets/images/eaia-logo-officiel.png EAIA_STRUCTURE_CORRECTION.md EAIA_STRUCTURE_LINK_CHECK.txt

git rm pages/eaia-msp-case-page-1746993-canards-du-lac-brome.html

git commit -m "fix EAIA MSP demo taxonomy and anonymize client case"

git push
```
