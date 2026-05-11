# EAIA — Renforcement du cas MSP Estimation & fenêtres de maintenance

Fichiers modifiés :
- pages/msp-capacite-resolution-11-serveurs.html
- pages/msp-demos.html
- msp-preview.html

Objectif :
- Mettre en évidence la capacité MSP Intelligence IT d'estimer le temps nécessaire pour une intervention multi-serveurs.
- Montrer la création de fenêtres de maintenance par lots applicatifs, rôles et risques.
- Conserver le style premium EA|IA et le logo officiel image.

Ce que la page démontre :
- 11 serveurs analysés.
- 5 fenêtres proposées.
- Effort estimé autour de 15 h.
- Contingence 10 % standard et 25 % pour SQL / hybride.
- Vérification des sauvegardes avant chaque fenêtre.
- Snapshots sauf contrôleurs de domaine.
- Cycle complet : precheck, patching, reboot, postcheck, suppression snapshot, rapports.
- Livrables : note interne, discussion client, rapport coordonnateur, modèle KB.

Commande Git suggérée :

git add msp-preview.html pages/msp-demos.html pages/msp-capacite-resolution-11-serveurs.html EAIA_MSP_ESTIMATION_WINDOWS_UPDATE.md EAIA_MSP_ESTIMATION_WINDOWS_LINK_CHECK.txt

git commit -m "enhance MSP maintenance estimation case page"

git push
