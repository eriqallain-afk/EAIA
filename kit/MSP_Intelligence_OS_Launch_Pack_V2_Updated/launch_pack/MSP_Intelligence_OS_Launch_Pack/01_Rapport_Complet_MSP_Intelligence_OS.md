# MSP Intelligence OS - Rapport complet de lancement

**Produit:** Plateforme MSP Intelligence OS / MSP Intelligence IT  
**Marque:** EA IA - Intelligence artificielle opérationnelle  
**Sources analysées:** `IT.zip`, `msp.zip`, repo produit `eriqallain-afk/IT`, repo événement `eriqallain-afk/github.io`.  
**Date:** 2026-05-23

## 1. Constat exécutif

MSP Intelligence OS n’est pas un simple GPT. C’est une plateforme opérationnelle issue d’une pratique terrain MSP/admin système, organisée en agents, playbooks, runbooks, templates, scripts, bundles de knowledge et pages de cas. Le dossier contient **32 agents**, **123 fichiers de runbooks**, **37 règles de dispatch**, **29 playbooks**, **93 templates**, **30 scripts**, **27 checklists**, **83 bundles** et **37 pages/cas de démonstration**. Volume total analysé : **1334 fichiers**.

## 2. Positionnement recommandé

**Nom de lancement :** MSP Intelligence OS.  
**Formule :** Le système d’exploitation IA pour MSP, bâti sur 25 ans de terrain et 164 formations cumulées.  
**Promesse :** transformer les tickets, alertes, maintenances et incidents MSP en interventions guidées, documentées, sécurisées et facturables.

> Vos techniciens n’ont pas besoin d’un autre chatbot. Ils ont besoin d’un système qui sait lire un billet, choisir le bon runbook, guider l’intervention, produire la note ConnectWise, générer le rapport client et capitaliser la connaissance.

## 3. Architecture produit

- **Standalone :** True
- **Point d’entrée :** OPS-RouterIA via `80_MACHINES/hub_routing.yaml`
- **Fallback interne :** IT-Commandare-NOC
- **Escalade interne :** IT-UrgenceMaster
- **Intégrations déclarées :** connectwise_manage, azure_ad, m365, azure_cloud, n_able, datto
- **Langues :** fr, en
- **Repo produit :** https://github.com/eriqallain-afk/IT
- **Repo événement :** https://github.com/eriqallain-afk/github.io

## 4. Agents - inventaire opérationnel

|agent|role|version|status|description|commands|
|---|---|---|---|---|---|
|IT-AssetMaster|operations|1.0.0|active|Inventaire IT & CMDB : structure, maintient et exploite actifs HW/SW.|/inventaire [client] / /inventaire / /eol [client] / /eol / /licences [client] / /licences|
|IT-Assistant-N2|support|2.0.0|active|Technicien MSP N1/N2 — support téléphonique et helpdesk. Guide le technicien étape par étape pour les problèmes courants : réinitialisation MDP, imprimantes, Outlook, VPN utilisateur, OneDrive, RDS. Escalade structurée automatique P2→P1 vers IT-Commandare-TECH ou IT-Commandare-NOC. NE traite PAS : maintenance planifiée, patching serveurs, scripts PS avancés → IT-MaintenanceMaster.|/start / /close / /escalade|
|IT-Assistant-N3|support|2.0.0|active|Assistant technique MSP complet N1 a N3. Guide le technicien en temps reel de l ouverture du billet jusqu a la cloture dans ConnectWise. Couvre Windows M365 AD RDS FileServer Print Linux Reseau VEEAM Securite Panne. Scripts PS standards checklists runbooks integres 4 livrables CW de cloture. Un seul agent. Une seule conversation. Du triage a la fermeture du billet.|/start / /start_maint / /runbook / /script / /close / /status|
|IT-BackupDRMaster|infra|1.0.0|active|Sauvegardes & DR : stratégies RPO/RTO, tests, runbooks.|/triage [job] / /triage / /restore [contexte] / /restore / /dr [client] / /dr|
|IT-ClientDocMaster|documentation|3.0.0|active|Documentaliste Hudu (edocs) MSP. Extrait les informations IT persistantes des interventions et produit des fiches objets prêtes à coller dans Hudu.|/kb / /analyse [coller texte] / /analyse [coller la note CW de l'intervention] / /analyse [coller la conversation de support complète] / /analyse [coller le brief YAML de l'agent IT-MaintenanceMaster] / /fiche [type]|
|IT-CloudMaster|infra|1.0.0|active|Cloud Azure/M365/SaaS : architectures, gouvernance, sécurité.|/exchange [symptôme] / /exchange / /entraid [symptôme] / /entraid / /teams [symptôme] / /teams|
|IT-Commandare-Infra|commandare|1.0.0|active|Chef d'exécution Infrastructure & Cloud : lead technique sur les incidents et alertes liés aux serveurs, VMs, stockage, réseau infra, Azure/M365 et DR. Coordonne InfrastructureMaster, CloudMaster, BackupDRMaster et NetworkMaster. Produit un plan d'action, évalue l'impact et pilote jusqu'à stabilisation.|/triage / /escalade / /teams / /flagup / /close / /status|
|IT-Commandare-NOC|commandare|2.0.0|active|Commandare NOC : pilote les opérations du Network Operations Center. Triage avancé, corrélation d'alertes, évaluation de sévérité, coordination des réponses réseau/connectivité/backup/urgence. Pose le plan de réponse initial et mobilise les spécialistes NOC appropriés.|/triage / /escalade / /teams / /flagup / /close / /status|
|IT-Commandare-OPR|commandare|2.0.0|active|Commandare OPR : pilote toutes les opérations administratives et documentaires MSP. Scribe officiel, communications clients, rapports, CMDB, clôture formelle de chaque incident.|/close / /close [1] / /close [postmortem] / /close [3] / /close [DoD check] / /close [2]|
|IT-Commandare-TECH|commandare|1.0.0|active|Chef d’exécution technique : diagnostic, remédiation, plan de changement et validation post-fix.|/triage / /escalade / /teams / /flagup / /close / /status|
|IT-ComplianceMaster|compliance|1.0.0|active|Agent de conformité réglementaire MSP — trois périmètres : (1) Client : obligations légales du client (Loi 25, PCI-DSS, HIPAA, cyber-assurance), (2) MSP interne : conformité des opérations du MSP lui-même (SOC 2, Loi 25 sous-traitant), (3) MSP chez le client : comment le MSP opère à l'infrastructure client (accès, Passportal, moindre privilège, trail d'audit). Produit des rapports facturables et des plans de remédiation.|/audit-client [client] [framework] / /audit-msp / /audit-footprint [client] / /gap [client] [framework] / /remediation [client] / /rapport [type]|
|IT-FrontLine|support|1.1.0|active|Technicien MSP première ligne. Deux modes : appels directs entrants (script d'appel + menus numérotés) et tickets reçus de MSPBOT ou assignés par le coordinateur. MSPBOT pousse les billets par priorité — le technicien ne les cherche pas. Résout MDP, accès, lecteurs réseau, imprimantes, Outlook, applications métier, VPN, postes (< 45 min). Fait la clôture CW complète (Note Interne + Discussion STAR) comme tout technicien N2.|/appel / /ticket / /triage / /close / /status|
|IT-KnowledgeKeeper|knowledge|3.0.0|active|Gestionnaire de la base de connaissances MSP. Transforme les incidents résolus en articles KB réutilisables et runbooks. Détecte les patterns, suggère des intents à RouterIA, capitalise le savoir-faire technique de l'équipe.|/kb / /kb_brief / /kb-quick / /detectnow / /search / /pattern|
|IT-MaintenanceMaster|infra|2.0.0|active|Spécialiste campagnes de patching Windows — maintenance préventive, mises à jour RMM, 550+ serveurs. Applique les conventions de nommage IT standardisées sur tous les livrables. Produit des scripts PowerShell avec header, UTF-8, transcript et logging imposés.|/start / /start_maint / /runbook [sujet] / /runbook / /test / /quiet|
|IT-MonitoringMaster|noc|1.0.0|active|Supervision/observabilité : KPIs, alertes, rapports.|/alerte / /seuils [type] / /seuils / /rapport / /config [actif] / /config|
|IT-NOCDispatcher|noc|1.0.0|active|Dispatcher NOC : affectation, priorisation, escalade et suivi (SLA) des tickets/alertes.|/dispatch / /escalade_sla / /handover / /status / /close / /dispatch [ticket]|
|IT-NetworkMaster|infra|1.0.0|active|Réseau : LAN/WAN/VPN/WiFi/routage/QoS/firewalls.|/diag [symptôme] / /diag / /firewall [marque] / /firewall / /vpn [symptôme] / /vpn|
|IT-OPS-DossierIA|specialise|1.0.0|active|Archiviste/traçabilité: consolide tickets, décisions, preuves, étapes exécutées, et produit un ‘dossier’ prêt à copier dans le système ITSM.|/dossier [brief complet de l'intervention] / /dossier [outputs complets de l'incident] / /kb / /flagup [contexte + statut + prochaine étape + agent cible]|
|IT-OPS-PlaybookRunner|specialise|1.0.0|active|Exécuteur guidé: transforme un runbook sélectionné en plan d’exécution étape-par-étape, avec validations, arrêt sur risque, et handoff vers DossierIA.|/replsummary|
|IT-OPS-QAMaster|qa_ops|1.0.0|active|Agent OPS de qualité plateforme MSP Intelligence AI. Surveille la qualité des outputs des agents, analyse les incidents loggués dans 00_QA/incidents/, détecte les patterns d'erreurs systémiques, propose des correctifs soumis à validation EA, et valide les nouveaux agents avant activation. Tout technicien peut logguer un incident. Correctifs = soumis à EA pour validation avant application.|/log [agent] [description] / /analyse [incident-id] / /patterns / /fix [incident-id] / /review-agent [agent-id] / /dashboard|
|IT-OPS-RouterIA|specialise|1.0.0|active|Routeur IT: choisit l’intent + runbook/playbook à appliquer, et livre une fiche runbook actionnable (Discovery-first si rôle non confirmé).|/replsummary / /suggest-intent|
|IT-OPS-SyncFactory|ops_sync|1.0.0|active|Agent OPS de synchronisation Produit → Factory. Analyse les changements structurels du produit MSP Intelligence AI (nouveaux agents, modules, versions), génère un rapport de synchronisation dans 00_FACTORY_SYNC/outbox/ à destination de la Factory.|/sync / /diff [date] / /state / /push-factory|
|IT-OnOffBoarder|transitions|1.1.0|active|Agent de gestion complète des transitions MSP : onboarding et offboarding, dans les deux sens — nouveau client MSP (découverte infra, mise à niveau, SOC, déploiement outils) et départ client MSP (inventaire, remise accès, handover), ainsi que onboarding et offboarding d'employés chez un client (AD, M365, équipements, accès, licences). Une seule équipe, deux directions, quatre scénarios.|/start [client/user] [onboard/offboard] / /onboard client [nom] / /offboard client [nom] / /onboard user [nom] [client] / /offboard user [nom] [client] / /analyse-infra [client]|
|IT-ReportMaster|reporting|3.0.0|active|Génère les rapports IT : postmortem, mensuel, QBR, weekly, sécurité, patching, backup, health, EOL|/postmortem / /mensuel / /qbr / /securite / /patching / /backup|
|IT-ScriptMaster|automation|1.0.0|active|Génère des scripts PowerShell/Bash pour opérations IT MSP|/script [description] / /script / /audit [script] / /audit [coller le script PowerShell ci-dessous] / /lib [catégorie] / /lib|
|IT-SecurityMaster|security|2.0.0|active|Expert cybersécurité MSP : évaluation des risques, analyse de posture, triage alertes de sécurité, remédiation et documentation d'incidents. Référence pour audits CIS/NIST, gestion EDR/XDR, réponse incidents (IR) et conseils conformité (SOC2, ISO27001, PIPEDA).|/triage [alerte] / /triage / /ir [phase] / /ir / /audit / /rapport [période]|
|IT-SysAdmin|infra|2.0.0|active|Administrateur système polyvalent — AD, M365, serveurs Windows/Linux, scripts, incidents N2/N3. Applique les conventions de nommage IT standardisées sur tous les livrables. Produit des scripts PowerShell avec header, UTF-8, transcript et logging imposés.|/check / /start / /replsummary / /start_maint / /runbook [sujet] / /runbook|
|IT-TechOPS|tech_ops_terrain|1.0.0|active|Agent d'opérations techniques terrain. Guide les techniciens à travers les opérations quotidiennes structurées : déploiement poste, remplacement matériel, migration logiciel, déménagement de bureau, configuration périphériques. Precheck / postcheck systématiques. Clôture CW propre incluse.|/start [type] / /precheck / /guide [étape] / /postcheck / /doc / /close|
|IT-TicketOpsAI|ticket_ops|1.0.0|active|Triage, documentation et fermeture de billets TI — MSP TicketOps AI. Accompagne le technicien du premier contact jusqu'à la clôture complète : triage structuré, analyse technique, livrables CW (Note, Discussion, Email, Teams), mémos, rapports client/coordo, validation de scripts et évaluation des risques.|/start / /analyse / /role_profile [YAML] / /role_profile / /run / /script [étape]|
|IT-TicketScribe|operations|4.0.0|active|Rédacteur ConnectWise : notes brutes → Note Interne, Discussion, Email, Teams, edocs, escalade.|/close / /note / /discussion / /draft / /email / /escalade|
|IT-UrgenceMaster|urgence|1.2.0|active|Copilote MSP pour la gestion d'urgences IT P1/P2 en intervention live. Qualifie l'incident, impose les notices Teams, guide la validation GO/NO-GO, déclenche les escalades et génère les livrables ConnectWise de clôture ou de passation.|/urgence / /panne / /retour / /escalade / /flagup / /teams|
|IT-VoIPMaster|infra|1.0.0|active|Téléphonie IP & UC : design, évolution, optimisation.|/diag [symptôme] / /diag / /design [contexte] / /design / /qualite / /close|

## 5. Commandes et fonctions par agent

### @IT-AssetMaster (IT-AssetMaster)

**Rôle :** operations  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-AssetMaster`  
**Description :** Inventaire IT & CMDB : structure, maintient et exploite actifs HW/SW.

**Intents :** it, cmdb, assets

- `/inventaire [client]` - Commande documentee dans les fichiers de l’agent.

- `/inventaire` - Commande documentee dans les fichiers de l’agent.

- `/eol [client]` - Commande documentee dans les fichiers de l’agent.

- `/eol` - Commande documentee dans les fichiers de l’agent.

- `/licences [client]` - Commande documentee dans les fichiers de l’agent.

- `/licences` - Commande documentee dans les fichiers de l’agent.

- `/audit [client]` - Commande documentee dans les fichiers de l’agent.

- `/audit` - Commande documentee dans les fichiers de l’agent.

- `/cycle [asset]` - Commande documentee dans les fichiers de l’agent.

- `/cycle` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

### @IT-Assistant-N2 (IT-Assistant-N2)

**Rôle :** support  
**Version :** 2.0.0  
**Chemin :** `20_Agents/IT-Assistant-N2`  
**Description :** Technicien MSP N1/N2 — support téléphonique et helpdesk. Guide le technicien étape par étape pour les problèmes courants : réinitialisation MDP, imprimantes, Outlook, VPN utilisateur, OneDrive, RDS. Escalade structurée automatique P2→P1 vers IT-Commandare-TECH ou IT-Commandare-NOC. NE traite PAS : maintenance planifiée, patching serveurs, scripts PS avancés → IT-MaintenanceMaster.

**Intents :** support, n1, n2, helpdesk, telephone, utilisateur, password, imprimante, outlook, vpn_user, onedrive, rds_utilisateur

**Garde-fous :** SCOPE 100% IT uniquement — hors IT : refus poli unique. | JAMAIS : mots de passe, tokens, clés API, codes MFA. | JAMAIS : IPs dans les livrables clients ou externes. | AVANT action risquée : [ACTION À RISQUE] + confirmation explicite. | LECTURE SEULE EN PREMIER — collecter avant d'agir. | ZÉRO INVENTION : non confirmé → [À CONFIRMER] + 1 question max.

- `/start` - Nouvelle demande helpdesk : triage, guide étapes, escalade si requis.

- `/close` - Clôture : CW Note Interne + CW Discussion client-safe.

- `/escalade` - Génère le bloc d'escalade structuré vers IT-Commandare-TECH ou IT-Commandare-NOC.

### @IT-Assistant-N3 (IT-Assistant-N3)

**Rôle :** support  
**Version :** 2.0.0  
**Chemin :** `20_Agents/IT-Assistant-N3`  
**Description :** Assistant technique MSP complet N1 a N3. Guide le technicien en temps reel de l ouverture du billet jusqu a la cloture dans ConnectWise. Couvre Windows M365 AD RDS FileServer Print Linux Reseau VEEAM Securite Panne. Scripts PS standards checklists runbooks integres 4 livrables CW de cloture. Un seul agent. Une seule conversation. Du triage a la fermeture du billet.

**Intents :** it, ticket, incident, support, maintenance, patching, health_check, audit, snapshot, script, windows, active_directory, m365, exchange, teams_ms, sharepoint, rds, file_server, print, linux, network, backup, veeam, cloud, security, power_outage, post_shutdown, triage, diagnostic, guidance, closeout, cw_ticket, connectwise

**Garde-fous :** SCOPE STRICT : Sujets informatiques et techniques MSP uniquement. | REFUS : vie personnelle, week-end, sports, jeux video, politique, religion -> reponse IT only. | JAMAIS : mots de passe, tokens, cles API, codes MFA, secrets. | JAMAIS : adresses IP dans les livrables externes. | AVANT action destructrice : [WARNING IMPACT] obligatoire + validation explicite. | LECTURE SEULE EN PREMIER : collecte avant remediation. | JAMAIS reboot liste automatique : 1 serveur a la fois apres validation. | ZERO INVENTION : non confirme -> [A CONFIRMER] + 1 question max. | ESCALADE : ransomware, breach, DC compromis, perte donnees, P1. | Reference : IT-SHARED/10_RUNBOOKS/00_POLICIES/GUARDRAILS__IT_AGENTS_MASTER.md

- `/start` - Nouvelle intervention : triage, plan, checklist, scripts pre-action.

- `/start_maint` - Pack maintenance : patching, ordre serveurs, risques, scripts pre/post.

- `/runbook` - Runbook : /runbook veeam | /runbook m365 | /runbook panne | /runbook reseau

- `/script` - Generer un script PowerShell ou Bash pour une action precise.

- `/close` - Cloture : CW Discussion + Note interne + Email client + Annonce Teams.

- `/status` - Resume de l intervention en cours.

### @IT-BackupDRMaster (IT-BackupDRMaster)

**Rôle :** infra  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-BackupDRMaster`  
**Description :** Sauvegardes & DR : stratégies RPO/RTO, tests, runbooks.

**Intents :** it, backup, dr

- `/triage [job]` - Commande documentee dans les fichiers de l’agent.

- `/triage` - Commande documentee dans les fichiers de l’agent.

- `/restore [contexte]` - Commande documentee dans les fichiers de l’agent.

- `/restore` - Commande documentee dans les fichiers de l’agent.

- `/dr [client]` - Commande documentee dans les fichiers de l’agent.

- `/dr` - Commande documentee dans les fichiers de l’agent.

- `/check [résultats]` - Commande documentee dans les fichiers de l’agent.

- `/check` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/triage [job + erreur exacte]` - Commande documentee dans les fichiers de l’agent.

- `/restore [fichier + chemin + point de restauration]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

### @IT-ClientDocMaster (IT-ClientDocMaster)

**Rôle :** documentation  
**Version :** 3.0.0  
**Chemin :** `20_Agents/IT-ClientDocMaster`  
**Description :** Documentaliste Hudu (edocs) MSP. Extrait les informations IT persistantes des interventions et produit des fiches objets prêtes à coller dans Hudu.

**Modes :** EDOCS_CAPTURE, EDOCS_UPDATE, EDOCS_AUDIT

**Intents :** hudu, edocs, documentation, fiche_objet, it, cmdb_hudu

**Garde-fous :** ZÉRO MDP dans les fiches. | ZÉRO IP interne visible. | Liaisons montantes ET descendantes obligatoires. | Zéro champ [À COMPLÉTER] publié.

- `/kb` - Commande documentee dans les fichiers de l’agent.

- `/analyse [coller texte]` - Commande documentee dans les fichiers de l’agent.

- `/analyse [coller la note CW de l'intervention]` - Commande documentee dans les fichiers de l’agent.

- `/analyse [coller la conversation de support complète]` - Commande documentee dans les fichiers de l’agent.

- `/analyse [coller le brief YAML de l'agent IT-MaintenanceMaster]` - Commande documentee dans les fichiers de l’agent.

- `/fiche [type]` - Commande documentee dans les fichiers de l’agent.

- `/analyse` - Commande documentee dans les fichiers de l’agent.

- `/serveur [contexte]` - Commande documentee dans les fichiers de l’agent.

- `/vm` - Commande documentee dans les fichiers de l’agent.

- `/vm [contexte]` - Commande documentee dans les fichiers de l’agent.

- `/hyperviseur [contexte]` - Commande documentee dans les fichiers de l’agent.

- `/reseau [contexte]` - Commande documentee dans les fichiers de l’agent.

### @IT-CloudMaster (IT-CloudMaster)

**Rôle :** infra  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-CloudMaster`  
**Description :** Cloud Azure/M365/SaaS : architectures, gouvernance, sécurité.

**Intents :** it, cloud, azure, m365

- `/exchange [symptôme]` - Commande documentee dans les fichiers de l’agent.

- `/exchange` - Commande documentee dans les fichiers de l’agent.

- `/entraid [symptôme]` - Commande documentee dans les fichiers de l’agent.

- `/entraid` - Commande documentee dans les fichiers de l’agent.

- `/teams [symptôme]` - Commande documentee dans les fichiers de l’agent.

- `/teams` - Commande documentee dans les fichiers de l’agent.

- `/reset` - Commande documentee dans les fichiers de l’agent.

- `/intune [symptôme]` - Commande documentee dans les fichiers de l’agent.

- `/intune` - Commande documentee dans les fichiers de l’agent.

- `/keepit` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

### @IT-Commandare-Infra (IT-Commandare-Infra)

**Rôle :** commandare  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-Commandare-Infra`  
**Description :** Chef d'exécution Infrastructure & Cloud : lead technique sur les incidents et alertes liés aux serveurs, VMs, stockage, réseau infra, Azure/M365 et DR. Coordonne InfrastructureMaster, CloudMaster, BackupDRMaster et NetworkMaster. Produit un plan d'action, évalue l'impact et pilote jusqu'à stabilisation.

**Intents :** it_commandare_infra, infra_incident, infra_alert, server_down, vm_incident, storage_incident, cloud_incident, azure_incident, m365_incident, dc_incident, network_infra, dr_incident, backup_critical, capacity_critical, resource_exhaustion

- `/triage` - Commande documentee dans les fichiers de l’agent.

- `/escalade` - Commande documentee dans les fichiers de l’agent.

- `/teams` - Commande documentee dans les fichiers de l’agent.

- `/flagup` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/status` - Commande documentee dans les fichiers de l’agent.

- `/triage [description complète]` - Commande documentee dans les fichiers de l’agent.

- `/triage [incident avec plusieurs couches impactées]` - Commande documentee dans les fichiers de l’agent.

- `/triage [incident]` - Commande documentee dans les fichiers de l’agent.

- `/escalade [domaine]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

- `/script` - Commande documentee dans les fichiers de l’agent.

### @IT-Commandare-NOC (IT-Commandare-NOC)

**Rôle :** commandare  
**Version :** 2.0.0  
**Chemin :** `20_Agents/IT-Commandare-NOC`  
**Description :** Commandare NOC : pilote les opérations du Network Operations Center. Triage avancé, corrélation d'alertes, évaluation de sévérité, coordination des réponses réseau/connectivité/backup/urgence. Pose le plan de réponse initial et mobilise les spécialistes NOC appropriés.

**Modes :** NOC_TRIAGE, CORRELATION_MULTI, ESCALADE_P1, SHIFT_HANDOVER

**Intents :** noc, monitoring, incident, triage, alerte, alerte_monitoring, rmm_alert, reseau_down, vpn_incident, backup_critical, voip_alert, correlation, commandare_noc, noc_triage

**Garde-fous :** Scope strict : alertes, monitoring, réseau, VPN, backup, VoIP, urgences. | Tickets support utilisateur → IT-Commandare-TECH. | Serveurs/VMs/Cloud/EntraID → IT-Commandare-Infra. | Incidents sécurité actifs (breach, malware) → IT-SecurityMaster en lead. | Fermeture administrative ticket → IT-Commandare-OPR. | JAMAIS : mots de passe, tokens, clés API, codes MFA, IPs dans les livrables. | AVANT toute action destructrice : '⚠️ Impact :' + validation explicite. | Ne jamais inventer un résultat non confirmé : utiliser [À CONFIRMER].

- `/triage` - Commande documentee dans les fichiers de l’agent.

- `/escalade` - Commande documentee dans les fichiers de l’agent.

- `/teams` - Commande documentee dans les fichiers de l’agent.

- `/flagup` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/status` - Commande documentee dans les fichiers de l’agent.

- `/triage [description complète de l'alerte]` - Commande documentee dans les fichiers de l’agent.

- `/close [choix livrable CW]` - Commande documentee dans les fichiers de l’agent.

- `/triage [incident]` - Commande documentee dans les fichiers de l’agent.

- `/escalade [domaine]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

- `/script` - Commande documentee dans les fichiers de l’agent.

### @IT-Commandare-OPR (IT-Commandare-OPR)

**Rôle :** commandare  
**Version :** 2.0.0  
**Chemin :** `20_Agents/IT-Commandare-OPR`  
**Description :** Commandare OPR : pilote toutes les opérations administratives et documentaires MSP. Scribe officiel, communications clients, rapports, CMDB, clôture formelle de chaque incident.

**Modes :** CLOSE, POSTMORTEM, QBR, COMMUNICATION, CHANGE_REQUEST, CMDB_UPDATE

**Intents :** opr, it, documentation, cw, ticket, report, cmdb, postmortem, qbr, communication, change_management, commandare_opr

**Garde-fous :** JAMAIS d'IP dans les livrables externes. | JAMAIS de credentials dans aucun livrable. | Vérifier DoD avant toute fermeture de ticket. | Phrase d'ouverture CW imposée. | Clôture P1/P2 → post-mortem obligatoire.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/close [1]` - Commande documentee dans les fichiers de l’agent.

- `/close [postmortem]` - Commande documentee dans les fichiers de l’agent.

- `/close [3]` - Commande documentee dans les fichiers de l’agent.

- `/close [DoD check]` - Commande documentee dans les fichiers de l’agent.

- `/close [2]` - Commande documentee dans les fichiers de l’agent.

- `/rapport` - Commande documentee dans les fichiers de l’agent.

- `/triage [incident]` - Commande documentee dans les fichiers de l’agent.

- `/escalade [domaine]` - Commande documentee dans les fichiers de l’agent.

- `/teams` - Commande documentee dans les fichiers de l’agent.

- `/flagup` - Commande documentee dans les fichiers de l’agent.

- `/status` - Commande documentee dans les fichiers de l’agent.

### @IT-Commandare-TECH (IT-Commandare-TECH)

**Rôle :** commandare  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-Commandare-TECH`  
**Description :** Chef d’exécution technique : diagnostic, remédiation, plan de changement et validation post-fix.

**Intents :** troubleshooting, remediation, change, incident, it_commandare_tech, tech_escalation

**Garde-fous :** Scope strict : répondre uniquement sur le sujet du billet actif ou de la tâche IT confiée. | Hors périmètre IT/MSP → refus poli + redirection vers ticket CW dédié. | Jamais : mots de passe, tokens, clés API, codes MFA, IPs dans les livrables. | Avant toute action destructrice (reboot/suppression/coupure) : '⚠️ Impact :' + validation explicite. | Ne jamais inventer un résultat non confirmé : utiliser [À CONFIRMER]. | Référence : IT-SHARED/10_RUNBOOKS/00_POLICIES/GUARDRAILS__IT_AGENTS_MASTER.md

- `/triage` - Commande documentee dans les fichiers de l’agent.

- `/escalade` - Commande documentee dans les fichiers de l’agent.

- `/teams` - Commande documentee dans les fichiers de l’agent.

- `/flagup` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/status` - Commande documentee dans les fichiers de l’agent.

- `/triage [description complète]` - Commande documentee dans les fichiers de l’agent.

- `/close [choix livrable CW]` - Commande documentee dans les fichiers de l’agent.

- `/triage [description complète avec IOC si disponibles]` - Commande documentee dans les fichiers de l’agent.

- `/triage [incident]` - Commande documentee dans les fichiers de l’agent.

- `/escalade [domaine]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

### @IT-ComplianceMaster (IT-ComplianceMaster)

**Rôle :** compliance  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-ComplianceMaster`  
**Description :** Agent de conformité réglementaire MSP — trois périmètres : (1) Client : obligations légales du client (Loi 25, PCI-DSS, HIPAA, cyber-assurance), (2) MSP interne : conformité des opérations du MSP lui-même (SOC 2, Loi 25 sous-traitant), (3) MSP chez le client : comment le MSP opère à l'infrastructure client (accès, Passportal, moindre privilège, trail d'audit). Produit des rapports facturables et des plans de remédiation.

**Intents :** conformite, compliance, loi25, pci_dss, hipaa, cyber_assurance, audit_conformite, remédiation, rgpd, soc2, donnees_personnelles, vie_privee

**Garde-fous :** ZÉRO IP, credentials, CVE dans les rapports clients. | Rapport client = langage non-technique, bénéfices, aucun détail de faille. | Chiffres = source citée uniquement — jamais inventés. | [DONNÉES REQUISES : ...] si information manquante — jamais inventer. | Recommandations = max 5 par rapport, avec responsable + délai + effort.

- `/audit-client [client] [framework]` - Audit de conformité d'un client contre un framework (loi25/pci/hipaa/cyber-assurance/tous)

- `/audit-msp` - Audit de conformité interne du MSP (Loi 25 sous-traitant, SOC 2, pratiques internes)

- `/audit-footprint [client]` - Audit de la conformité des pratiques MSP chez ce client (accès, Passportal, trail)

- `/gap [client] [framework]` - Rapport de lacunes priorisé — Critique / Important / Recommandé

- `/remediation [client]` - Plan de remédiation facturable — actions, responsable, délai, effort estimé

- `/rapport [type]` - Générer un livrable : interne | client-safe | executif | auditeur

- `/suivi [client]` - Réévaluation trimestrielle — progrès sur les items de remédiation

- `/inventaire-donnees [client]` - Inventaire des données personnelles/sensibles (requis Loi 25)

- `/close` - Clôture CW — note interne + discussion client + email

### @IT-FrontLine (IT-FrontLine)

**Rôle :** support  
**Version :** 1.1.0  
**Chemin :** `20_Agents/IT-FrontLine`  
**Description :** Technicien MSP première ligne. Deux modes : appels directs entrants (script d'appel + menus numérotés) et tickets reçus de MSPBOT ou assignés par le coordinateur. MSPBOT pousse les billets par priorité — le technicien ne les cherche pas. Résout MDP, accès, lecteurs réseau, imprimantes, Outlook, applications métier, VPN, postes (< 45 min). Fait la clôture CW complète (Note Interne + Discussion STAR) comme tout technicien N2.

**Intents :** frontline, appel_direct, telephone, ticket_mspbot, triage, helpdesk, n1, n2, password, acces, outlook, imprimante, lecteur_reseau, vpn, application, it

**Garde-fous :** JAMAIS de credentials — Passportal uniquement. | Identité VÉRIFIÉE avant toute réinitialisation MDP — sans exception. | P1 détecté → escalade immédiate — aucune tentative de résolution. | Sécurité suspectée → IT-SecurityMaster — ne pas toucher au poste. | Scope IT uniquement — hors IT : refus poli unique. | Zéro invention — [À CONFIRMER] + 1 question max.

- `/appel` - Démarrer un appel direct entrant — identification + script + menus.

- `/ticket` - Ticket reçu de MSPBOT ou coordinateur — afficher plan d'action immédiat.

- `/triage` - Générer la note de triage CW avant transfert.

- `/close` - Clôture rapide si résolu — résumé pour le technicien N2 qui fera la note CW.

- `/status` - Résumé de l'intervention en cours.

### @IT-KnowledgeKeeper (IT-KnowledgeKeeper)

**Rôle :** knowledge  
**Version :** 3.0.0  
**Chemin :** `20_Agents/IT-KnowledgeKeeper`  
**Description :** Gestionnaire de la base de connaissances MSP. Transforme les incidents résolus en articles KB réutilisables et runbooks. Détecte les patterns, suggère des intents à RouterIA, capitalise le savoir-faire technique de l'équipe.

**Intents :** kb, knowledge, procedures, articles, capitalisation, search_kb, pattern_kb, suggest_intent

**Garde-fous :** ZÉRO IP dans les articles KB publiés | ZÉRO credentials — référencer Passportal uniquement | ZÉRO [À CONFIRMER] dans un article publié | Cause racine = cause réelle, pas le symptôme visible | Ne jamais modifier MASTER_DISPATCH_INDEX directement — /suggest-intent via QAMaster

- `/kb` - Commande documentee dans les fichiers de l’agent.

- `/kb_brief` - Commande documentee dans les fichiers de l’agent.

- `/kb-quick` - Commande documentee dans les fichiers de l’agent.

- `/detectnow` - Commande documentee dans les fichiers de l’agent.

- `/search` - Commande documentee dans les fichiers de l’agent.

- `/pattern` - Commande documentee dans les fichiers de l’agent.

- `/suggest-intent` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

- `/audit` - Commande documentee dans les fichiers de l’agent.

- `/index` - Commande documentee dans les fichiers de l’agent.

- `/audit [kb-id]` - Commande documentee dans les fichiers de l’agent.

- `/kb [brief de l'intervention]` - Commande documentee dans les fichiers de l’agent.

### @IT-MaintenanceMaster (IT-MaintenanceMaster)

**Rôle :** infra  
**Version :** 2.0.0  
**Chemin :** `20_Agents/IT-MaintenanceMaster`  
**Description :** Spécialiste campagnes de patching Windows — maintenance préventive, mises à jour RMM, 550+ serveurs. Applique les conventions de nommage IT standardisées sur tous les livrables. Produit des scripts PowerShell avec header, UTF-8, transcript et logging imposés.

**Intents :** maintenance, patching, health_check, audit, snapshot, script_maint

**Garde-fous :** Scope strict : répondre uniquement sur le sujet du billet actif ou de la tâche IT confiée. | Hors périmètre IT/MSP → refus poli + redirection vers ticket CW dédié. | Jamais : mots de passe, tokens, clés API, codes MFA, IPs dans les livrables. | Avant toute action destructrice (reboot/suppression/coupure) : '⚠️ Impact :' + validation explicite. | Ne jamais inventer un résultat non confirmé : utiliser [À CONFIRMER]. | Référence : 00_POLICIES/GUARDRAILS__IT_AGENTS_MASTER.md

- `/start` - Commande documentee dans les fichiers de l’agent.

- `/start_maint` - Commande documentee dans les fichiers de l’agent.

- `/runbook [sujet]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

- `/test` - Commande documentee dans les fichiers de l’agent.

- `/quiet` - Commande documentee dans les fichiers de l’agent.

- `/replsummary` - Commande documentee dans les fichiers de l’agent.

- `/showrepl` - Commande documentee dans les fichiers de l’agent.

- `/script [description]` - Commande documentee dans les fichiers de l’agent.

- `/script` - Commande documentee dans les fichiers de l’agent.

- `/check [résultats]` - Commande documentee dans les fichiers de l’agent.

- `/check` - Commande documentee dans les fichiers de l’agent.

### @IT-MonitoringMaster (IT-MonitoringMaster)

**Rôle :** noc  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-MonitoringMaster`  
**Description :** Supervision/observabilité : KPIs, alertes, rapports.

**Intents :** it, monitoring, observability

- `/alerte` - Commande documentee dans les fichiers de l’agent.

- `/seuils [type]` - Commande documentee dans les fichiers de l’agent.

- `/seuils` - Commande documentee dans les fichiers de l’agent.

- `/rapport` - Commande documentee dans les fichiers de l’agent.

- `/config [actif]` - Commande documentee dans les fichiers de l’agent.

- `/config` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/alerte [coller l'alerte complète]` - Commande documentee dans les fichiers de l’agent.

- `/alerte [alerte récurrente]` - Commande documentee dans les fichiers de l’agent.

- `/rapport [données période]` - Commande documentee dans les fichiers de l’agent.

- `/alerte [détails]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

### @IT-NOCDispatcher (IT-NOCDispatcher)

**Rôle :** noc  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-NOCDispatcher`  
**Description :** Dispatcher NOC : affectation, priorisation, escalade et suivi (SLA) des tickets/alertes.

**Intents :** dispatch, sla, coordination, incident, it_noc_dispatch, noc_dispatch

**Garde-fous :** Scope strict : répondre uniquement sur le sujet du billet actif ou de la tâche IT confiée. | Hors périmètre IT/MSP → refus poli + redirection vers ticket CW dédié. | Jamais : mots de passe, tokens, clés API, codes MFA, IPs dans les livrables. | Avant toute action destructrice (reboot/suppression/coupure) : '⚠️ Impact :' + validation explicite. | Ne jamais inventer un résultat non confirmé : utiliser [À CONFIRMER]. | Référence : IT-SHARED/10_RUNBOOKS/00_POLICIES/GUARDRAILS__IT_AGENTS_MASTER.md

- `/dispatch` - Commande documentee dans les fichiers de l’agent.

- `/escalade_sla` - Commande documentee dans les fichiers de l’agent.

- `/handover` - Commande documentee dans les fichiers de l’agent.

- `/status` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/dispatch [ticket]` - Commande documentee dans les fichiers de l’agent.

- `/escalade_sla [ticket]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

- `/script` - Commande documentee dans les fichiers de l’agent.

- `/runbook [n°\|sujet]` - Commande documentee dans les fichiers de l’agent.

- `/charge` - Commande documentee dans les fichiers de l’agent.

- `/p1-status` - Commande documentee dans les fichiers de l’agent.

### @IT-NetworkMaster (IT-NetworkMaster)

**Rôle :** infra  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-NetworkMaster`  
**Description :** Réseau : LAN/WAN/VPN/WiFi/routage/QoS/firewalls.

**Intents :** it, network, firewall

- `/diag [symptôme]` - Commande documentee dans les fichiers de l’agent.

- `/diag` - Commande documentee dans les fichiers de l’agent.

- `/firewall [marque]` - Commande documentee dans les fichiers de l’agent.

- `/firewall` - Commande documentee dans les fichiers de l’agent.

- `/vpn [symptôme]` - Commande documentee dans les fichiers de l’agent.

- `/vpn` - Commande documentee dans les fichiers de l’agent.

- `/vlan [contexte]` - Commande documentee dans les fichiers de l’agent.

- `/vlan` - Commande documentee dans les fichiers de l’agent.

- `/qos [contexte]` - Commande documentee dans les fichiers de l’agent.

- `/qos` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/vpn [symptôme + type VPN + poste]` - Commande documentee dans les fichiers de l’agent.

### @IT-OPS-DossierIA (IT-OPS-DossierIA)

**Rôle :** specialise  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-OPS-DossierIA`  
**Description :** Archiviste/traçabilité: consolide tickets, décisions, preuves, étapes exécutées, et produit un ‘dossier’ prêt à copier dans le système ITSM.

**Intents :** it.archive, it.postmortem, it.ticket_update

- `/dossier [brief complet de l'intervention]` - Commande documentee dans les fichiers de l’agent.

- `/dossier [outputs complets de l'incident]` - Commande documentee dans les fichiers de l’agent.

- `/kb` - Commande documentee dans les fichiers de l’agent.

- `/flagup [contexte + statut + prochaine étape + agent cible]` - Commande documentee dans les fichiers de l’agent.

### @IT-OPS-PlaybookRunner (IT-OPS-PlaybookRunner)

**Rôle :** specialise  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-OPS-PlaybookRunner`  
**Description :** Exécuteur guidé: transforme un runbook sélectionné en plan d’exécution étape-par-étape, avec validations, arrêt sur risque, et handoff vers DossierIA.

**Intents :** it.execute_runbook, it.runbook_guided

- `/replsummary` - Commande documentee dans les fichiers de l’agent.

### @IT-OPS-QAMaster (IT-OPS-QAMaster)

**Rôle :** qa_ops  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-OPS-QAMaster`  
**Description :** Agent OPS de qualité plateforme MSP Intelligence AI. Surveille la qualité des outputs des agents, analyse les incidents loggués dans 00_QA/incidents/, détecte les patterns d'erreurs systémiques, propose des correctifs soumis à validation EA, et valide les nouveaux agents avant activation. Tout technicien peut logguer un incident. Correctifs = soumis à EA pour validation avant application.

**Intents :** qa, qualite, incident_agent, review_agent, pre_activation, pattern_detection, amelioration_continue

**Garde-fous :** Correctifs JAMAIS appliqués sans validation EA. | Incidents = faits documentés, jamais d'accusations sans preuve. | Revue pre-activation = checklist exhaustive — aucun raccourci. | auto_activation: false — validation EA obligatoire pour tout nouvel agent.

- `/log [agent] [description]` - Logguer un incident qualité sur un agent — accessible à tout technicien

- `/analyse [incident-id]` - Analyser un incident spécifique — cause racine + correctif proposé

- `/patterns` - Détecter des patterns systémiques à travers les incidents récents

- `/fix [incident-id]` - Générer un correctif structuré — soumis à EA pour validation

- `/review-agent [agent-id]` - Revue pre-activation d'un nouvel agent — checklist complète

- `/dashboard` - Tableau de bord qualité plateforme — scores, tendances, incidents ouverts

- `/rapport` - Rapport QA mensuel pour EA — état de la plateforme, correctifs appliqués

### @IT-OPS-RouterIA (IT-OPS-RouterIA)

**Rôle :** specialise  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-OPS-RouterIA`  
**Description :** Routeur IT: choisit l’intent + runbook/playbook à appliquer, et livre une fiche runbook actionnable (Discovery-first si rôle non confirmé).

**Intents :** it.discovery.server_role, it.patching.dc.windows_updates_missing, it.route

- `/replsummary` - Commande documentee dans les fichiers de l’agent.

- `/suggest-intent` - Commande documentee dans les fichiers de l’agent.

### @IT-OPS-SyncFactory (IT-OPS-SyncFactory)

**Rôle :** ops_sync  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-OPS-SyncFactory`  
**Description :** Agent OPS de synchronisation Produit → Factory. Analyse les changements structurels du produit MSP Intelligence AI (nouveaux agents, modules, versions), génère un rapport de synchronisation dans 00_FACTORY_SYNC/outbox/ à destination de la Factory.

**Intents :** sync_factory, changelog_produit, rapport_changements, mise_a_jour_factory

**Garde-fous :** Ne jamais modifier les fichiers d'agents directement — rapporter seulement. | Changements = faits documentés avec chemins exacts. | CURRENT_STATE.yaml mis à jour à chaque /sync.

- `/sync` - Analyser les changements depuis le dernier sync et générer le rapport Factory

- `/diff [date]` - Lister tous les changements depuis une date donnée

- `/state` - Afficher l'état actuel du produit (00_FACTORY_SYNC/CURRENT_STATE.yaml)

- `/push-factory` - Générer le fichier outbox/FACTORY_SYNC_{date}.yaml prêt pour la Factory

### @IT-OnOffBoarder (IT-OnOffBoarder)

**Rôle :** transitions  
**Version :** 1.1.0  
**Chemin :** `20_Agents/IT-OnOffBoarder`  
**Description :** Agent de gestion complète des transitions MSP : onboarding et offboarding, dans les deux sens — nouveau client MSP (découverte infra, mise à niveau, SOC, déploiement outils) et départ client MSP (inventaire, remise accès, handover), ainsi que onboarding et offboarding d'employés chez un client (AD, M365, équipements, accès, licences). Une seule équipe, deux directions, quatre scénarios.

**Intents :** onboarding, offboarding, nouveau_client, depart_client, nouvel_employe, depart_employe, decouverte_infra, baseline, mise_a_niveau, soc_onboarding, deploiement_outils, handover, inventaire

**Garde-fous :** JAMAIS de credentials, IP internes, CVE dans les livrables clients. | JAMAIS de données sensibles dans le rapport client — baseline interne seulement. | Tout champ non confirmé sur le terrain = [À CONFIRMER] — zéro invention. | Rapport client : langage non-technique, bénéfices métier. | Passportal pour TOUS les accès — jamais consigner un mot de passe ailleurs. | Offboarding user : validation manager obligatoire avant désactivation. | Offboarding client : approbation EA obligatoire avant révocation accès MSP.

- `/start [client|user] [onboard|offboard]` - Point d'entrée universel — détecter le scénario et lancer le bon workflow.

- `/onboard client [nom]` - Démarrer l'onboarding complet d'un nouveau client MSP (phases 0 à 6).

- `/offboard client [nom]` - Démarrer l'offboarding d'un client MSP qui quitte (inventaire → handover).

- `/onboard user [nom] [client]` - Onboarding d'un nouvel employé chez un client.

- `/offboard user [nom] [client]` - Offboarding d'un employé qui quitte un client.

- `/analyse-infra [client]` - Phase 1 — Analyse complète de l'infrastructure (10 domaines).

- `/gap [client]` - Phase 2 — Analyse des lacunes vs standards MSP + score de risque.

- `/upgrade [client]` - Phase 3 — Proposition de mise à niveau (priorité + coût + délai).

- `/deploiement [client]` - Phase 4 — Checklist déploiement outils MSP (RMM, EDR, backup, monitoring).

- `/soc [client]` - Phase 5 — Handover SOC : brief NOC, runbooks assignés, SLA activé.

- `/rapport [type]` - Générer un livrable : rapport-decouverte | rapport-client | brief-noc | rapport-cloture.

- `/checklist [scenario]` - Générer la checklist pour n'importe quel scénario à la demande.

- `/close` - Clôture : Note CW + Hudu + Brief NOC + rapport de clôture.

### @IT-ReportMaster (IT-ReportMaster)

**Rôle :** reporting  
**Version :** 3.0.0  
**Chemin :** `20_Agents/IT-ReportMaster`  
**Description :** Génère les rapports IT : postmortem, mensuel, QBR, weekly, sécurité, patching, backup, health, EOL

**Intents :** it, genere

- `/postmortem` - Commande documentee dans les fichiers de l’agent.

- `/mensuel` - Commande documentee dans les fichiers de l’agent.

- `/qbr` - Commande documentee dans les fichiers de l’agent.

- `/securite` - Commande documentee dans les fichiers de l’agent.

- `/patching` - Commande documentee dans les fichiers de l’agent.

- `/backup` - Commande documentee dans les fichiers de l’agent.

- `/health` - Commande documentee dans les fichiers de l’agent.

- `/incident-summary` - Commande documentee dans les fichiers de l’agent.

- `/eol` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/mensuel [mois]` - Commande documentee dans les fichiers de l’agent.

- `/qbr [trimestre]` - Commande documentee dans les fichiers de l’agent.

### @IT-ScriptMaster (IT-ScriptMaster)

**Rôle :** automation  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-ScriptMaster`  
**Description :** Génère des scripts PowerShell/Bash pour opérations IT MSP

**Intents :** it, genere

- `/script [description]` - Commande documentee dans les fichiers de l’agent.

- `/script` - Commande documentee dans les fichiers de l’agent.

- `/audit [script]` - Commande documentee dans les fichiers de l’agent.

- `/audit [coller le script PowerShell ci-dessous]` - Commande documentee dans les fichiers de l’agent.

- `/lib [catégorie]` - Commande documentee dans les fichiers de l’agent.

- `/lib` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/script [description complète]` - Commande documentee dans les fichiers de l’agent.

- `/audit [coller le script]` - Commande documentee dans les fichiers de l’agent.

- `/script [tâche 1]` - Commande documentee dans les fichiers de l’agent.

- `/script [tâche 2]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

### @IT-SecurityMaster (IT-SecurityMaster)

**Rôle :** security  
**Version :** 2.0.0  
**Chemin :** `20_Agents/IT-SecurityMaster`  
**Description :** Expert cybersécurité MSP : évaluation des risques, analyse de posture, triage alertes de sécurité, remédiation et documentation d'incidents. Référence pour audits CIS/NIST, gestion EDR/XDR, réponse incidents (IR) et conseils conformité (SOC2, ISO27001, PIPEDA).

**Intents :** security, incident_security, alert_security, audit, vulnerability, compliance, risk, edr, phishing, ransomware, breach, cve, it_security_audit, security_triage

- `/triage [alerte]` - Commande documentee dans les fichiers de l’agent.

- `/triage` - Commande documentee dans les fichiers de l’agent.

- `/ir [phase]` - Commande documentee dans les fichiers de l’agent.

- `/ir` - Commande documentee dans les fichiers de l’agent.

- `/audit` - Commande documentee dans les fichiers de l’agent.

- `/rapport [période]` - Commande documentee dans les fichiers de l’agent.

- `/rapport` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/triage [description alerte]` - Commande documentee dans les fichiers de l’agent.

- `/audit [client]` - Commande documentee dans les fichiers de l’agent.

- `/rapport [mois]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

### @IT-SysAdmin (IT-SysAdmin)

**Rôle :** infra  
**Version :** 2.0.0  
**Chemin :** `20_Agents/IT-SysAdmin`  
**Description :** Administrateur système polyvalent — AD, M365, serveurs Windows/Linux, scripts, incidents N2/N3. Applique les conventions de nommage IT standardisées sur tous les livrables. Produit des scripts PowerShell avec header, UTF-8, transcript et logging imposés.

**Intents :** maintenance, patching, health_check, audit, snapshot, script_maint

**Garde-fous :** Scope strict : répondre uniquement sur le sujet du billet actif ou de la tâche IT confiée. | Hors périmètre IT/MSP → refus poli + redirection vers ticket CW dédié. | Jamais : mots de passe, tokens, clés API, codes MFA, IPs dans les livrables. | Avant toute action destructrice (reboot/suppression/coupure) : '⚠️ Impact :' + validation explicite. | Ne jamais inventer un résultat non confirmé : utiliser [À CONFIRMER]. | Référence : IT-SHARED/10_RUNBOOKS/00_POLICIES/GUARDRAILS__IT_AGENTS_MASTER.md

- `/check` - Commande documentee dans les fichiers de l’agent.

- `/start` - Commande documentee dans les fichiers de l’agent.

- `/replsummary` - Commande documentee dans les fichiers de l’agent.

- `/start_maint` - Commande documentee dans les fichiers de l’agent.

- `/runbook [sujet]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

- `/test` - Commande documentee dans les fichiers de l’agent.

- `/quiet` - Commande documentee dans les fichiers de l’agent.

- `/showrepl` - Commande documentee dans les fichiers de l’agent.

- `/script [description]` - Commande documentee dans les fichiers de l’agent.

- `/script` - Commande documentee dans les fichiers de l’agent.

- `/check [résultats]` - Commande documentee dans les fichiers de l’agent.

### @IT-TechOPS (IT-TechOPS)

**Rôle :** tech_ops_terrain  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-TechOPS`  
**Description :** Agent d'opérations techniques terrain. Guide les techniciens à travers les opérations quotidiennes structurées : déploiement poste, remplacement matériel, migration logiciel, déménagement de bureau, configuration périphériques. Precheck / postcheck systématiques. Clôture CW propre incluse.

**Intents :** techops, operations_terrain, deploiement, poste_de_travail, migration, hardware, remplacement, configuration, setup, installation, demenagement, peripherique, imprimante_setup, reimagination

**Garde-fous :** JAMAIS de credentials dans les livrables. | Precheck OBLIGATOIRE avant toute intervention physique. | Backup confirmé avant tout remplacement de disque ou migration. | Données client : confirmer effacement sécurisé avant retrait d'asset. | P1 détecté → escalade immédiate — jamais continuer seul. | 1 action à la fois — confirmer avant de continuer.

- `/start [type]` - Démarrer une opération — type : deploiement, migration, hardware, config, demenagement.

- `/precheck` - Validation pré-intervention — tout vérifier avant de commencer.

- `/guide [étape]` - Étapes numérotées avec explication du POURQUOI.

- `/postcheck` - Validation post-intervention — confirmer que tout fonctionne.

- `/doc` - Documenter l'opération — note CW + Hudu si applicable.

- `/close` - Fermeture CW complète — Note Interne + Discussion.

### @IT-TicketOpsAI (IT-TicketOpsAI)

**Rôle :** ticket_ops  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-TicketOpsAI`  
**Description :** Triage, documentation et fermeture de billets TI — MSP TicketOps AI. Accompagne le technicien du premier contact jusqu'à la clôture complète : triage structuré, analyse technique, livrables CW (Note, Discussion, Email, Teams), mémos, rapports client/coordo, validation de scripts et évaluation des risques.

**Intents :** ticket, triage, close, documentation, rapport, script_check, risques

**Garde-fous :** Scope strict : répondre uniquement sur le sujet du billet actif ou de la tâche IT confiée. | Hors périmètre IT/MSP → refus poli + redirection vers ticket CW dédié. | Jamais : mots de passe, tokens, clés API, codes MFA, IPs dans les livrables Discussion/Email/Teams. | Avant toute action destructrice (reboot/suppression/coupure) : '⚠️ Impact :' + validation explicite. | Ne jamais inventer un résultat non confirmé : utiliser [À CONFIRMER]. | Référence : IT-SHARED/10_RUNBOOKS/00_POLICIES/GUARDRAILS__IT_AGENTS_MASTER.md

- `/start` - Commande documentee dans les fichiers de l’agent.

- `/analyse` - Commande documentee dans les fichiers de l’agent.

- `/role_profile [YAML]` - Commande documentee dans les fichiers de l’agent.

- `/role_profile` - Commande documentee dans les fichiers de l’agent.

- `/run` - Commande documentee dans les fichiers de l’agent.

- `/script [étape]` - Commande documentee dans les fichiers de l’agent.

- `/script` - Commande documentee dans les fichiers de l’agent.

- `/script-check` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/memo` - Commande documentee dans les fichiers de l’agent.

- `/risques` - Commande documentee dans les fichiers de l’agent.

- `/handoff` - Commande documentee dans les fichiers de l’agent.

### @IT-TicketScribe (IT-TicketScribe)

**Rôle :** operations  
**Version :** 4.0.0  
**Chemin :** `20_Agents/IT-TicketScribe`  
**Description :** Rédacteur ConnectWise : notes brutes → Note Interne, Discussion, Email, Teams, edocs, escalade.

**Intents :** it, ticket, writing

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/note` - Commande documentee dans les fichiers de l’agent.

- `/discussion` - Commande documentee dans les fichiers de l’agent.

- `/draft` - Commande documentee dans les fichiers de l’agent.

- `/email` - Commande documentee dans les fichiers de l’agent.

- `/escalade` - Commande documentee dans les fichiers de l’agent.

- `/review` - Commande documentee dans les fichiers de l’agent.

- `/review
[Coller la note existante à réviser]` - Commande documentee dans les fichiers de l’agent.

- `/kb` - Commande documentee dans les fichiers de l’agent.

- `/close [coller résumé de l'intervention]` - Commande documentee dans les fichiers de l’agent.

- `/draft [description]` - Commande documentee dans les fichiers de l’agent.

- `/escalade [contexte + actions tentées]` - Commande documentee dans les fichiers de l’agent.

### @IT-UrgenceMaster (IT-UrgenceMaster)

**Rôle :** urgence  
**Version :** 1.2.0  
**Chemin :** `20_Agents/IT-UrgenceMaster`  
**Description :** Copilote MSP pour la gestion d'urgences IT P1/P2 en intervention live. Qualifie l'incident, impose les notices Teams, guide la validation GO/NO-GO, déclenche les escalades et génère les livrables ConnectWise de clôture ou de passation.

**Intents :** urgence, panne, panne_hq, hydro_quebec, incident, p1, p2, reseau_down, serveur_critique, multi_services, retour_courant, go_nogo, flagup, escalade, cloture

- `/urgence` - Commande documentee dans les fichiers de l’agent.

- `/panne` - Commande documentee dans les fichiers de l’agent.

- `/retour` - Commande documentee dans les fichiers de l’agent.

- `/escalade` - Commande documentee dans les fichiers de l’agent.

- `/flagup` - Commande documentee dans les fichiers de l’agent.

- `/teams` - Commande documentee dans les fichiers de l’agent.

- `/status` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/kb` - Commande documentee dans les fichiers de l’agent.

- `/teams [6]` - Commande documentee dans les fichiers de l’agent.

- `/urgence [description]` - Commande documentee dans les fichiers de l’agent.

- `/escalade [domaine]` - Commande documentee dans les fichiers de l’agent.

### @IT-VoIPMaster (IT-VoIPMaster)

**Rôle :** infra  
**Version :** 1.0.0  
**Chemin :** `20_Agents/IT-VoIPMaster`  
**Description :** Téléphonie IP & UC : design, évolution, optimisation.

**Intents :** it, voip, uc

- `/diag [symptôme]` - Commande documentee dans les fichiers de l’agent.

- `/diag` - Commande documentee dans les fichiers de l’agent.

- `/design [contexte]` - Commande documentee dans les fichiers de l’agent.

- `/design` - Commande documentee dans les fichiers de l’agent.

- `/qualite` - Commande documentee dans les fichiers de l’agent.

- `/close` - Commande documentee dans les fichiers de l’agent.

- `/diag [symptôme précis]` - Commande documentee dans les fichiers de l’agent.

- `/runbook` - Commande documentee dans les fichiers de l’agent.

- `/script` - Commande documentee dans les fichiers de l’agent.

- `/runbook [n°\|sujet]` - Commande documentee dans les fichiers de l’agent.

- `/baseline [client]` - Commande documentee dans les fichiers de l’agent.

- `/sip-trace` - Commande documentee dans les fichiers de l’agent.

## 6. Playbooks opérationnels

|id|description|steps_count|steps|status|
|---|---|---|---|---|
|INTAKE_ROUTE_EXECUTE|Flux standard : route -> exécute -> archive|3|route:OPS-RouterIA -> execute:OPS-PlaybookRunner -> archive:OPS-DossierIA||
|IT_ASSET_LOOKUP_V1|Trouver et livrer le bon asset IT-SHARED (template/runbook/checklist/reference/script).|1|execute:IT-OPS-AssetFinderIA||
|IT_CHANGE_EXEC|Planifier/exécuter un change -> validations -> reporting -> archive|5|assess:IT-Commandare-TECH -> dispatch:IT-NOCDispatcher -> implement:IT-Commandare-TECH -> report:IT-ReportMaster -> archive:OPS-DossierIA||
|IT_COMMANDARE_NOC|Commandare NOC: triage/diagnostic initial, sévérité, plan de réponse.|1|execute:IT-Commandare-NOC||
|IT_COMMANDARE_OPR|Commandare OPR: gouvernance ops, communication, coordination & contrôle.|1|execute:IT-Commandare-OPR||
|IT_COMMANDARE_TECH|Commandare TECH: troubleshooting/RCA, plan de remediation, risques.|3|cadrage:IT-Commandare-TECH -> execute:IT-Commandare-TECH -> archive:OPS-DossierIA||
|IT_CW_INTERVENTION_LIVE_CLOSE|ConnectWise : LIVE journal + closeout CW + KB|3|intervention:IT-MaintenanceMaster -> closeout:IT-TicketScribe -> kb:IT-KnowledgeKeeper||
|IT_INCIDENT_TRIAGE|NOC triage -> dispatch -> remediation -> reporting -> archive|5|triage:IT-Commandare-NOC -> dispatch:IT-NOCDispatcher -> execute:IT-Commandare-TECH -> report:IT-ReportMaster -> archive:OPS-DossierIA||
|IT_MSP_LIVE_ASSIST|Assistance MSP temps réel (appel/chat/remote) : triage guidé, notes ticket, comms, escalade, KB draft.|1|execute:IT-MaintenanceMaster||
|IT_MSP_TICKET_TO_KB|Ticket MSP -> diagnostic -> communication -> knowledge|3|support:IT-Assistant-N3 -> closeout:IT-TicketScribe -> kb:IT-KnowledgeKeeper||
|IT_NOC_DISPATCH|NOC dispatch: prioriser/assigner/escalader et suivre SLA.|3|triage:IT-Commandare-NOC -> dispatch:IT-NOCDispatcher -> archive:OPS-DossierIA||
|IT_NOC_HANDOFF|Handoff NOC (fin de quart/escalade) -> synthèse -> reporting -> archive|4|summarize:IT-Commandare-NOC -> dispatch:IT-NOCDispatcher -> report:IT-ReportMaster -> archive:OPS-DossierIA||
|IT_MAINT_PATCH_REBOOT_VALIDATE|Maintenance Windows (patching via CW RMM) : plan -> precheck -> patch -> reboot (si requis) -> postcheck -> closeout.|3|plan_et_live:IT-MaintenanceMaster -> closeout:IT-TicketScribe -> archive:OPS-DossierIA||
|IT_POST_SHUTDOWN_VALIDATE|Post-shutdown électrique : baseline réseau/stockage/virtualisation -> services critiques -> monitoring -> rapport.|4|triage:IT-Commandare-NOC -> validate:IT-MaintenanceMaster -> report:IT-ReportMaster -> archive:OPS-DossierIA||
|IT_N2_SUPPORT_TELEPHONIQUE|Support N1/N2 téléphonique : guide étape-par-étape → escalade si P2→P1|3|execute:IT-Assistant-N2 -> escalade_si_requis:IT-Assistant-N3 -> closeout:IT-TicketScribe||
|IT_SECURITY_INCIDENT_RESPONSE|Réponse incident sécurité : triage → containment → investigation → remédiation → postmortem|5|triage:IT-Commandare-NOC -> response:IT-SecurityMaster -> infrastructure:IT-Commandare-Infra -> report:IT-ReportMaster -> archive:OPS-DossierIA||
|IT_FRONTLINE_CALL_TO_CLOSE|Flux première ligne (FrontLine) : réception billet MSPBOT ou appel direct -> triage -> résolution N2 -> clôture CW -> KB si P1/P2. |5|receive:IT-FrontLine -> triage_and_resolve:IT-FrontLine -> closeout:IT-FrontLine -> kb_if_needed:IT-KnowledgeKeeper -> archive:OPS-DossierIA||
|IT_URGENCE_P1P2|Flux urgence P1/P2 en live : qualification -> notice Teams -> escalade spécialiste -> validation GO/NO-GO -> clôture ou Flag Up -> KB -> archive. |9|qualification:IT-UrgenceMaster -> escalade_noc:IT-Commandare-NOC -> escalade_infra:IT-Commandare-Infra -> escalade_securite:IT-SecurityMaster -> validation_retour:IT-UrgenceMaster -> closeout:IT-UrgenceMaster -> kb:IT-KnowledgeKeeper -> report:IT-ReportMaster -> archive:OPS-DossierIA||
|IT_URGENCE_PANNE_HQ|Panne électrique HQ : alerte -> validation HQ -> surveillance -> retour courant -> GO/NO-GO -> correctif ou Flag Up -> cloture CW. |5|receive:IT-UrgenceMaster -> monitor:IT-UrgenceMaster -> validate:IT-UrgenceMaster -> closeout:IT-UrgenceMaster -> kb:IT-KnowledgeKeeper||
|IT_COMMANDARE_INFRA|Commandare INFRA : triage incident infra/cloud, mobilise les spécialistes, coordination résolution.|2|triage:IT-Commandare-Infra -> execute:IT-Commandare-Infra||
|IT_BACKUP_DR_TRIAGE|Backup/DR : triage job → diagnostic → restauration → rapport → archive|4|triage:IT-BackupDRMaster -> closeout:IT-TicketScribe -> kb:IT-KnowledgeKeeper -> archive:OPS-DossierIA||
|IT_PROJET_SOW|Opportunité projet détectée → escalade ventes → analyse → estimation → SOW → validation EA → soumission client|8|detect:IT-FrontLine -> analyze:IT-ProjetSOW -> estimate:IT-ProjetSOW -> sow:IT-ProjetSOW -> validate:EA -> submit:IT-ProjetSOW -> report:IT-ReportMaster -> archive:IT-OPS-DossierIA|staging|
|IT_CLOUD_SUPPORT|Cloud/M365 : diagnostic → résolution → communication client → KB|3|execute:IT-CloudMaster -> closeout:IT-TicketScribe -> kb_if_needed:IT-KnowledgeKeeper||
|IT_MONITORING_ALERT|Alerte monitoring : analyse → dispatch → validation → rapport|3|analyze:IT-MonitoringMaster -> dispatch:IT-NOCDispatcher -> archive:OPS-DossierIA||
|IT_SCRIPT_REQUEST|Demande script : conception → validation → documentation → déploiement|3|create:IT-ScriptMaster -> document:IT-TicketScribe -> kb:IT-KnowledgeKeeper||
|IT_VOIP_SUPPORT|VoIP : diagnostic → résolution → validation → clôture CW|2|execute:IT-VoIPMaster -> closeout:IT-TicketScribe||
|IT_ASSET_MANAGEMENT|Asset/CMDB : inventaire → audit → rapport → mise à jour CMDB|2|execute:IT-AssetMaster -> report:IT-ReportMaster||
|IT_DOC_PRODUCTION|Documentation client : analyse → fiches Hudu → validation → publication|2|execute:IT-ClientDocMaster -> kb:IT-KnowledgeKeeper||
|IT_TICKETOPS_FULL_FLOW|MSP TicketOps AI — cycle complet : start → triage → analyse → close → rapport → archive|8|start:IT-TicketOpsAI -> triage:IT-TicketOpsAI -> analyse:IT-TicketOpsAI -> script_check:IT-TicketOpsAI -> close:IT-TicketOpsAI -> rapport:IT-TicketOpsAI -> kb:IT-KnowledgeKeeper -> archive:OPS-DossierIA||

## 7. Dispatch runbooks - routage automatique

Ces règles mappent symptômes/mots-clés vers runbook, agent par défaut et playbook. C’est le cœur du côté “OS” : le système choisit une procédure au lieu d’improviser.

|id|priority|cmd|agent|playbook|runbook_path|patterns|
|---|---|---|---|---|---|---|
|pending_reboot|1|22|IT-MaintenanceMaster|IT_MAINT_PATCH_REBOOT_VALIDATE|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT_RB_PendingReboot_OneByOne.md|pending reboot, reboot pending, redémarrage en attente, windows update pending, CBS_RebootPending, WU_RebootRequired, Script Monitor.*pending reboot, reboot required|
|windows_patching|2|20|IT-MaintenanceMaster|IT_MAINT_PATCH_REBOOT_VALIDATE|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT_RB_Patching_COMPLET.md|patching, windows update, mise à jour, mises à jour, patch tuesday, cumulative update, security update, fenêtre de maintenance, maintenance window, KB[0-9]{7}|
|patching_cwrmm|3|21|IT-MaintenanceMaster|IT_MAINT_PATCH_REBOOT_VALIDATE|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT_RB_Windows_Patching_CW_RMM_OneByOne.md|CW RMM, connectwise rmm, patch via rmm, déployer patch|
|wsus|4|24|IT-MaintenanceMaster||IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT__RB__WSUS_Maintenance_V1.md|wsus, windows server update services, WSUS sync, approbation WSUS|
|server_health|5|23|IT-MaintenanceMaster||IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT_RB_Srv_Health_Chk_V1.md|server health, santé serveur, health check, CPU.*élevé, mémoire.*élevée, disque.*plein, disk.*full, disk.*space, espace disque, high cpu, performance.*serveur, serveur.*lent, slow server|
|post_panne|6|26|IT-UrgenceMaster|IT_POST_SHUTDOWN_VALIDATE|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT_RB_Post_Shutdown_Electrical_Validation.md|post.*panne, panne électrique, power.*outage, retour.*courant, power.*restore, après panne, electrical, hydro, ups|
|print_server|7|27|IT-MaintenanceMaster||IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT_RB_PrintServer_PrePost_Validation.md|print.*server, serveur.*impression, imprimante.*serveur, spooler, print.*prepost|
|audit_trim|8|25|IT-SysAdmin||IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT_RB_AUDIT_TRIMESTRIEL.md|audit trimestriel, audit.*infrastructure, infrastructure.*audit, audit.*serveurs|
|dc_prepost|10|01|IT-Assistant-N3||IT-SHARED/10_RUNBOOKS/INFRA/RUNBOOK__DC_PrePost_Validation.md|domain controller, contrôleur de domaine, dc.*reboot, dc.*restart, redémarrage.*dc, dc.*precheck, dc.*postcheck, prepost.*dc, replication.*ad, réplication.*ad, ad.*réplication, NTDS, SYSVOL, netlogon.*down, FSMO|
|ad_operations|11|05|IT-Assistant-N3||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__AD_DC_Operations_V1.md|active directory, GPO, group policy, OU.*move, déplacer.*OU, compte.*verrouillé, locked.*account, mot de passe.*expire, password.*expire, réinitialisation.*MDP, password reset.*AD, Entra.*Connect, AD.*sync|
|ad_user_mgmt|12|06|IT-Assistant-N2||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RB__AD_User_Management_V1.md|créer.*utilisateur, create.*user, désactiver.*compte, disable.*account, nouveau.*employé, onboarding.*AD, départ.*employé, AD user|
|sql_prepost|13|02|IT-SysAdmin||IT-SHARED/10_RUNBOOKS/INFRA/RUNBOOK__SQL_PrePost_Validation.md|SQL.*server, serveur.*SQL, sql.*reboot, sql.*restart, base de données.*redémarrage, MSSQL, sqlservr, sql.*precheck, sql.*postcheck|
|rds|14|04|IT-Assistant-N3||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__RDS_Operations_V1.md|RDS, remote desktop, bureau à distance, session.*RDS, RemoteApp, TermService, session.*bloquée, session.*gelée|
|hyperv|15|07|IT-SysAdmin||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__HyperV_Operations_And_Check_V1.md|hyper-v, hyperv, VM.*hyper, machine virtuelle.*hyper, vmms|
|vmware|16|08|IT-SysAdmin||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__VMware_vSphere_Operations_V1.md|vmware, vsphere, esxi, vcenter, vm.*vmware|
|m365_exchange|20|15|IT-CloudMaster||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__M365_Exchange_Online_V1.md|exchange.*online, exchange.*problème, courriel.*bloqué, email.*blocked, mail.*flow, boîte.*mail.*inaccessible, messagerie.*down, transport.*exchange|
|m365_intune|21|16|IT-CloudMaster||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__M365_Intune_Devices_V1.md|intune, mdm.*compliance, conformité.*appareil, wipe.*device, effacer.*appareil, enrôlement.*intune|
|m365_teams|22|17|IT-CloudMaster||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__M365_Teams_SharePoint_OneDrive_V1.md|teams.*problème, sharepoint.*sync, onedrive.*sync, teams.*audio, teams.*vidéo, collaboration.*cloud|
|entra_id|23|13|IT-CloudMaster||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__EntraID_Operations_V1.md|entra.*id, azure.*ad, MFA.*problème, MFA.*reset, conditional.*access, authentification.*azure|
|onedrive_sync|24|59|IT-Assistant-N2||IT-SHARED/10_RUNBOOKS/SUPPORT/SUPPORT__RUNBOOK__OneDrive_SharePoint_Sync_V1.md|onedrive.*ne synchronise, onedrive.*sync.*fail, onedrive.*erreur, sharepoint.*erreur.*sync|
|vpn_client|30|55|IT-NetworkMaster||IT-SHARED/10_RUNBOOKS/SUPPORT/SUPPORT__RUNBOOK__VPN_Client_Troubleshooting_V1.md|VPN.*problème, vpn.*ne.*connect, ssl vpn, ipsec.*down, forticlient, watchguard.*vpn, tunnel.*vpn, vpn.*timeout|
|firewall_fortinet|31|10|IT-NetworkMaster||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__Fortinet_Operations_V1.md|fortinet, fortigate, fortios|
|firewall_watchguard|32|10|IT-NetworkMaster||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__WatchGuard_Operations_V1.md|watchguard, firebox|
|firewall_meraki|33|10|IT-NetworkMaster||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__Meraki_Operations_V1.md|meraki, cisco.*meraki|
|firewall_sonicwall|34|10|IT-NetworkMaster||IT-SHARED/10_RUNBOOKS/INFRA/INFRA__RUNBOOK__SonicWall_Operations_V1.md|sonicwall, sonic wall|
|veeam_job|40|32|IT-BackupDRMaster||IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_BACKUP_Veeam-Operations_V1.md|veeam.*fail, veeam.*error, veeam.*échec, backup.*veeam, job.*veeam, veeam.*warning|
|datto_backup|41|33|IT-BackupDRMaster||IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__Datto_Operations_V1.md|datto.*fail, datto.*error, datto.*échec, bcdr.*fail, agent.*datto|
|keepit|42|34|IT-BackupDRMaster||IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__Keepit_Operations_V1.md|keepit, keepit.*fail, backup.*m365.*fail, keepit.*déconnecté|
|dr_test|43|35|IT-BackupDRMaster||IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__DR_Plan_Validation_V1.md|test.*DR, DR.*test, test.*reprise, disaster.*recovery.*test, RPO.*RTO, plan.*relève|
|incident_response|50|40|IT-SecurityMaster|IT_SECURITY_INCIDENT_RESPONSE|IT-SHARED/10_RUNBOOKS/SECURITY/RUNBOOK__IT_SECURITY_INCIDENT_RESPONSE.md|ransomware, chiffrement.*fichiers, breach, intrusion, compromis, compte.*compromis, malware, virus détecté, EDR.*alerte, SentinelOne.*alerte, CrowdStrike.*alerte|
|alert_triage_security|51|41|IT-SecurityMaster||IT-SHARED/10_RUNBOOKS/SECURITY/SEC-SECU-AlertResponse_V2.md|alerte.*sécurité, security.*alert, SIEM.*alerte, threat.*detected, menace détectée, suspicious.*activity|
|m365_compliance|52|44|IT-SecurityMaster||IT-SHARED/10_RUNBOOKS/SECURITY/SECURITY__RUNBOOK__M365_Compliance_Purview_V1.md|purview, DLP.*alerte, compliance.*m365, rétention.*données, eDiscovery|
|support_n2_generic|60|51|IT-Assistant-N2||IT-SHARED/10_RUNBOOKS/SUPPORT/RUNBOOK__N2_Support_V1.md|mot de passe.*oublié, password.*forgot, compte.*verrouillé.*utilisateur, imprimante.*ne.*imprime, imprimante.*problème, outlook.*ne.*ouvre, outlook.*crash, wifi.*problème, réseau.*utilisateur, logiciel.*plante, application.*crash, poste.*lent|
|print_diag|61|53|IT-Assistant-N2||IT-SHARED/60_BUNDLES/BUNDLE_SUPPORT_Print_Diag_V1.md|imprimante.*erreur, impression.*échouée, cannot print, print.*spooler, spooler.*arrêté, impression.*réseau|
|incident_command|70|30|IT-Commandare-NOC|IT_URGENCE_P1P2|IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__INCIDENT_COMMAND_V1.md|site.*down, site.*entier.*inaccessible, WAN.*down, réseau.*entier.*down, serveurs.*inaccessibles, P1, incident.*critique, CRITICAL.*incident|
|noc_frontdoor|71|31|IT-NOCDispatcher|IT_NOC_DISPATCH|IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__FRONTDOOR_v2.md|nouveau.*ticket, new.*ticket, triage.*billet, billet.*entrant, alerte.*RMM, alerte.*N-able, alerte.*CW RMM, alerte.*Auvik|
|rmm_monitoring|72|37|IT-MonitoringMaster||IT-SHARED/10_RUNBOOKS/NOC/NOC__RUNBOOK__NAble_RMM_Operations_V1.md|N-able.*alerte, nable.*alerte, CW RMM.*alerte, auvik.*alerte, monitoring.*alerte|

## 8. Bibliothèque de runbooks

|category|count|
|---|---|
|INFRA|29|
|99_ARCHIVE|23|
|SUPPORT|21|
|NOC|15|
|OPR|11|
|MAINTENANCE|9|
|SECURITY|8|
|00_POLICIES|3|
|RUNBOOKS_MD|2|
|PROJET|1|
|ROOT|1|

### 00_POLICIES

|title|path|ext|
|---|---|---|
|GUARDRAILS__IT_AGENTS_MASTER|IT-SHARED/10_RUNBOOKS/00_POLICIES/GUARDRAILS__IT_AGENTS_MASTER.md|.md|
|PROMPT_FRAMEWORK_MSP_Intelligence_V1|IT-SHARED/10_RUNBOOKS/00_POLICIES/PROMPT_FRAMEWORK_MSP_Intelligence_V1.md|.md|
|RUNBOOK — Cycle de vie d'un agent (ajout / modification / activation)|IT-SHARED/10_RUNBOOKS/00_POLICIES/RUNBOOK__AGENT_LIFECYCLE_V1.md|.md|

### 99_ARCHIVE

|title|path|ext|
|---|---|---|
|RUNBOOK — Domain Controller (AD DS/DNS) — Precheck/Postcheck|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-AD-DC_PrePost_ARCHIVE.md|.md|
|RUNBOOK — CONFIGURATION BACKUP MSP|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-BACKUP-Config_ARCHIVE.md|.md|
|RUNBOOK — CONFIGURATION BACKUP MSP|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-BACKUP-Config_ARCHIVE2.md|.md|
|RUNBOOK — IT_BACKUP_DR_TEST_V1|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-BACKUP-DR_Test_ARCHIVE.md|.md|
|RUNBOOK — ARCHITECTURE CLOUD MSP|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-CLOUD-Architecture_ARCHIVE.md|.md|
|RUNBOOK — ONBOARDING UTILISATEUR M365|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-M365-Onboarding_ARCHIVE.md|.md|
|RUNBOOK — GESTION UTILISATEURS M365|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-M365-UserMgmt_ARCHIVE.md|.md|
|RUNBOOK — CONFIGURATION RESEAU INITIAL|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-NET-NetworkSetup_ARCHIVE.md|.md|
|RUNBOOK — CYCLE DE VIE DES ACTIFS IT|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-OPS-AssetLifecycle_ARCHIVE.md|.md|
|RUNBOOK — CYCLE DE VIE DES ACTIFS IT|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-OPS-AssetLifecycle_ARCHIVE2.md|.md|
|RUNBOOK — Post-Shutdown Électrique (reprise infra) — NOC/MSP|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-SRV-PostShutdown_ARCHIVE.md|.md|
|RUNBOOK — Print Server — Precheck/Postcheck|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/INFRA-SRV-PrintServer_ARCHIVE.md|.md|
|RUNBOOK — AUDIT TRIMESTRIEL INFRASTRUCTURE TI|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/MAINT-SRV-AuditTrimestriel_ARCHIVE.md|.md|
|RUNBOOK — Windows Server Patching (Complet)|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/MAINT-WIN-Patching_Complet_ARCHIVE.md|.md|
|RUNBOOK - Windows Server Patching|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/MAINT-WIN-Patching_Legacy_ARCHIVE.md|.md|
|RUNBOOK - Patching Process|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/MAINT-WIN-Patching_Process_ARCHIVE.md|.md|
|RUNBOOK — DIAGNOSTIC RESEAU IT|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/NOC-NET-NetworkDiag_ARCHIVE.md|.md|
|RUNBOOK — TRIAGE ALERTES SECURITE|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/SEC-SECU-AlertTriage_ARCHIVE.md|.md|
|RUNBOOK — Réponse aux Incidents de Sécurité MSP|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/SEC-SECU-IncidentResponse_ARCHIVE.md|.md|
|RUNBOOK — IT MSP: Dispatch ConnectWise (Type/Sub-type) + NOC Cells (OPS Ready)|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/SUP-OPS-CW_Dispatch_ARCHIVE.md|.md|
|RUNBOOK — IT_INTERVENTION_LIVE|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/SUP-OPS-InterventionLive_ARCHIVE.md|.md|
|RUNBOOK — IT_INTERVENTION_LIVE|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/SUP-OPS-InterventionLive_ARCHIVE2.md|.md|
|RUNBOOK — IT_MSP_TICKET_TO_KB|IT-SHARED/10_RUNBOOKS/99_ARCHIVE/SUP-OPS-TicketToKB_ARCHIVE.md|.md|

### INFRA

|title|path|ext|
|---|---|---|
|INFRA-AD-DC_Operations_V3|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-AD-DC_Operations_V3.md|.md|
|INFRA-AD-DC_PrePost_Validation_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-AD-DC_PrePost_Validation_V2.md|.md|
|INFRA-AD-EntraID_Operations_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-AD-EntraID_Operations_V2.md|.md|
|INFRA-AD-FolderSecurity_V1|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-AD-FolderSecurity_V1.md|.md|
|INFRA-AD-GPO_Management_V1|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-AD-GPO_Management_V1.md|.md|
|INFRA-AD-UserManagement_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-AD-UserManagement_V2.md|.md|
|INFRA-BACKUP-Veeam_Operations_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-BACKUP-Veeam_Operations_V2.md|.md|
|INFRA-CLOUD-Architecture_Review_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-CLOUD-Architecture_Review_V2.md|.md|
|INFRA-M365-Exchange_Online_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-M365-Exchange_Online_V2.md|.md|
|INFRA-M365-Intune_Devices_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-M365-Intune_Devices_V2.md|.md|
|INFRA-M365-Teams_SharePoint_OneDrive_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-M365-Teams_SharePoint_OneDrive_V2.md|.md|
|INFRA-M365-UserManagement_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-M365-UserManagement_V2.md|.md|
|INFRA-M365-UserOnboarding_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-M365-UserOnboarding_V2.md|.md|
|INFRA-NET-Fortinet_Operations_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-NET-Fortinet_Operations_V2.md|.md|
|INFRA-NET-Meraki_Operations_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-NET-Meraki_Operations_V2.md|.md|
|INFRA-NET-NetworkDiagnostic_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-NET-NetworkDiagnostic_V2.md|.md|
|INFRA-NET-NetworkSetup_V1|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-NET-NetworkSetup_V1.md|.md|
|INFRA-NET-SonicWall_Operations_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-NET-SonicWall_Operations_V2.md|.md|
|INFRA-NET-Unifi_Mikrotik_Operations_V1|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-NET-Unifi_Mikrotik_Operations_V1.md|.md|
|INFRA-NET-WatchGuard_Operations_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-NET-WatchGuard_Operations_V2.md|.md|
|INFRA-OPS-QuickStart_V1|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-OPS-QuickStart_V1.md|.md|
|INFRA-SRV-HealthCheck_Template_V1|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-SRV-HealthCheck_Template_V1.md|.md|
|INFRA-SRV-HyperV_Operations_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-SRV-HyperV_Operations_V2.md|.md|
|INFRA-SRV-NewVM_Deployment_V1|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-SRV-NewVM_Deployment_V1.md|.md|
|INFRA-SRV-RDS_Operations_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-SRV-RDS_Operations_V2.md|.md|
|INFRA-SRV-SQL_PrePost_Validation_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-SRV-SQL_PrePost_Validation_V2.md|.md|
|INFRA-SRV-VMware_Operations_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-SRV-VMware_Operations_V2.md|.md|
|INFRA-SRV-XCPng_Operations_V1|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-SRV-XCPng_Operations_V1.md|.md|
|INFRA-VOIP-Diagnostic_V2|IT-SHARED/10_RUNBOOKS/INFRA/INFRA-VOIP-Diagnostic_V2.md|.md|

### MAINTENANCE

|title|path|ext|
|---|---|---|
|MAINT-OPS-CMDB_AssetAudit_V1|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT-OPS-CMDB_AssetAudit_V1.md|.md|
|MAINT-SRV-AuditTrimestriel_V2|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT-SRV-AuditTrimestriel_V2.md|.md|
|MAINT-SRV-HealthCheck_V2|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT-SRV-HealthCheck_V2.md|.md|
|MAINT-SRV-PostShutdown_Electrical_V2|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT-SRV-PostShutdown_Electrical_V2.md|.md|
|MAINT-SRV-PrintServer_PrePost_V1|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT-SRV-PrintServer_PrePost_V1.md|.md|
|MAINT-WIN-Patching CW-RMM V3|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT-WIN-Patching_CW-RMM_V3.md|.md|
|MAINT-WIN-Patching_Complet_V3|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT-WIN-Patching_Complet_V3.md|.md|
|MAINT-WIN-PendingReboot_V2|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT-WIN-PendingReboot_V2.md|.md|
|MAINT-WIN-WSUS_Maintenance_V2|IT-SHARED/10_RUNBOOKS/MAINTENANCE/MAINT-WIN-WSUS_Maintenance_V2.md|.md|

### NOC

|title|path|ext|
|---|---|---|
|NOC-BACKUP-Backup_Configuration_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-BACKUP-Backup_Configuration_V2.md|.md|
|NOC-BACKUP-DR_Plan_Validation_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-BACKUP-DR_Plan_Validation_V2.md|.md|
|NOC-BACKUP-DR_Test_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-BACKUP-DR_Test_V2.md|.md|
|NOC-BACKUP-Datto_Operations_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-BACKUP-Datto_Operations_V2.md|.md|
|NOC-BACKUP-Keepit_Operations_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-BACKUP-Keepit_Operations_V2.md|.md|
|NOC-BACKUP-Restore_Test_Trimestriel_V1|IT-SHARED/10_RUNBOOKS/NOC/NOC-BACKUP-Restore_Test_Trimestriel_V1.md|.md|
|NOC-BACKUP-Validation_Statut_Sauvegardes_V1|IT-SHARED/10_RUNBOOKS/NOC/NOC-BACKUP-Validation_Statut_Sauvegardes_V1.md|.md|
|NOC-BACKUP-Veeam_Cloud_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-BACKUP-Veeam_Cloud_V2.md|.md|
|NOC-BACKUP-Veeam_Operations_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-BACKUP-Veeam_Operations_V2.md|.md|
|NOC-OPS-CommandCenter_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-OPS-CommandCenter_V2.md|.md|
|NOC-OPS-Dispatch_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-OPS-Dispatch_V2.md|.md|
|NOC-OPS-FrontDoor_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-OPS-FrontDoor_V2.md|.md|
|NOC-OPS-IncidentCommand_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-OPS-IncidentCommand_V2.md|.md|
|NOC-RMM-CWRMM_Auvik_Operations_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-RMM-CWRMM_Auvik_Operations_V2.md|.md|
|NOC-RMM-NAble_Operations_V2|IT-SHARED/10_RUNBOOKS/NOC/NOC-RMM-NAble_Operations_V2.md|.md|

### OPR

|title|path|ext|
|---|---|---|
|OPR-CMDB-Reconciliation-CW-Hudu-RMM_V1|IT-SHARED/10_RUNBOOKS/OPR/OPR-CMDB-Reconciliation-CW-Hudu-RMM_V1.md|.md|
|OPR-CW-TicketQualityAudit_V1|IT-SHARED/10_RUNBOOKS/OPR/OPR-CW-TicketQualityAudit_V1.md|.md|
|OPR-ClientCommunication-Cadence_V1|IT-SHARED/10_RUNBOOKS/OPR/OPR-ClientCommunication-Cadence_V1.md|.md|
|OPR-RUNBOOK-SKELETON|IT-SHARED/10_RUNBOOKS/OPR/OPR-EOL-EOS-RiskRegister_V1.md|.md|
|OPR-RUNBOOK-SKELETON|IT-SHARED/10_RUNBOOKS/OPR/OPR-Handoff-ShiftChange_V1.md|.md|
|OPR-RUNBOOK-SKELETON|IT-SHARED/10_RUNBOOKS/OPR/OPR-Monthly-Client-OpsPack_V1.md|.md|
|OPR-PostIncident-Review-P1P2_V1|IT-SHARED/10_RUNBOOKS/OPR/OPR-PostIncident-Review-P1P2_V1.md|.md|
|OPR-ProblemManagement-CAPA_V1|IT-SHARED/10_RUNBOOKS/OPR/OPR-ProblemManagement-CAPA_V1.md|.md|
|OPR-RUNBOOK-SKELETON|IT-SHARED/10_RUNBOOKS/OPR/OPR-QBR-DataCollection_V1.md|.md|
|OPR-SLA-BreachPrevention_V1|IT-SHARED/10_RUNBOOKS/OPR/OPR-SLA-BreachPrevention_V1.md|.md|
|OPR-RUNBOOK-SKELETON|IT-SHARED/10_RUNBOOKS/OPR/OPR-Weekly-OpsReview_V1.md|.md|

### PROJET

|title|path|ext|
|---|---|---|
|RUNBOOK — Processus Projet & SOW MSP|IT-SHARED/10_RUNBOOKS/PROJET/PROJET-SOW_Process_V1.md|.md|

### ROOT

|title|path|ext|
|---|---|---|
|RUNBOOK_MASTER__IT_v2|IT-SHARED/10_RUNBOOKS/RUNBOOK_MASTER__IT_v2.md|.md|

### RUNBOOKS_MD

|title|path|ext|
|---|---|---|
|RUNBOOK — DC patching & prechecks (Windows Updates) — RUNBOOK__DC_PATCHING_PRECHECK|IT-SHARED/10_RUNBOOKS/RUNBOOKS_MD/RUNBOOK__DC_PATCHING_PRECHECK.md|.md|
|RUNBOOK__SERVER_ROLE_DISCOVERY|IT-SHARED/10_RUNBOOKS/RUNBOOKS_MD/RUNBOOK__SERVER_ROLE_DISCOVERY.md|.md|

### SECURITY

|title|path|ext|
|---|---|---|
|SEC-COMPLIANCE-5Piliers_Framework_V1|IT-SHARED/10_RUNBOOKS/SECURITY/SEC-COMPLIANCE-5Piliers_Framework_V1.md|.md|
|SEC-ENTRA-SecurityCompliance_V1|IT-SHARED/10_RUNBOOKS/SECURITY/SEC-ENTRA-SecurityCompliance_V1.md|.md|
|SEC-M365-Compliance_Purview_V2|IT-SHARED/10_RUNBOOKS/SECURITY/SEC-M365-Compliance_Purview_V2.md|.md|
|SEC-OPS-LicenseAudit_V2|IT-SHARED/10_RUNBOOKS/SECURITY/SEC-OPS-LicenseAudit_V2.md|.md|
|SEC-PURVIEW-ComplianceAudit_V1|IT-SHARED/10_RUNBOOKS/SECURITY/SEC-PURVIEW-ComplianceAudit_V1.md|.md|
|SEC-SECU-AlertResponse V2|IT-SHARED/10_RUNBOOKS/SECURITY/SEC-SECU-AlertResponse_V2.md|.md|
|SEC-SECU-IncidentResponse_V3|IT-SHARED/10_RUNBOOKS/SECURITY/SEC-SECU-IncidentResponse_V3.md|.md|
|SEC-SECU-SecurityAudit V2|IT-SHARED/10_RUNBOOKS/SECURITY/SEC-SECU-SecurityAudit_V2.md|.md|

### SUPPORT

|title|path|ext|
|---|---|---|
|RUNBOOK — IT MSP: Dispatch ConnectWise (Type/Sub-type) + NOC Cells (OPS Ready)|IT-SHARED/10_RUNBOOKS/SUPPORT/RUNBOOK__IT_MSP_CONNECTWISE_DISPATCH_V1.md|.md|
|SUP-M365-OneDrive_SharePoint_Sync_V2|IT-SHARED/10_RUNBOOKS/SUPPORT/SUP-M365-OneDrive_SharePoint_Sync_V2.md|.md|
|SUP-N1N2-SupportTriage V2|IT-SHARED/10_RUNBOOKS/SUPPORT/SUP-N1N2-SupportTriage_V2.md|.md|
|SUP-N2-Support_V2|IT-SHARED/10_RUNBOOKS/SUPPORT/SUP-N2-Support_V2.md|.md|
|SUP-NET-VPN_Troubleshooting_V2|IT-SHARED/10_RUNBOOKS/SUPPORT/SUP-NET-VPN_Troubleshooting_V2.md|.md|
|SUP-OPS-CW_Dispatch_V2|IT-SHARED/10_RUNBOOKS/SUPPORT/SUP-OPS-CW_Dispatch_V2.md|.md|
|SUP-OPS-CW_InterventionLive_Close_V2|IT-SHARED/10_RUNBOOKS/SUPPORT/SUP-OPS-CW_InterventionLive_Close_V2.md|.md|
|SUP-OPS-CommandareOPR_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/SUP-OPS-CommandareOPR_V1.md|.md|
|SUP-OPS-CommandareTech_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/SUP-OPS-CommandareTech_V1.md|.md|
|SUP-OPS-TicketToKB_V2|IT-SHARED/10_RUNBOOKS/SUPPORT/SUP-OPS-TicketToKB_V2.md|.md|
|SUP-WKS-Alerte_AV_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Alerte_AV_V1.md|.md|
|SUP-WKS-Imprimante_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Imprimante_V1.md|.md|
|SUP-WKS-Login_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Login_V1.md|.md|
|SUP-WKS-Offboarding_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Offboarding_V1.md|.md|
|SUP-WKS-Onboarding_Poste_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Onboarding_Poste_V1.md|.md|
|SUP-WKS-Outlook_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Outlook_V1.md|.md|
|SUP-WKS-Partage_Reseau_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Partage_Reseau_V1.md|.md|
|SUP-WKS-Poste_Lent_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Poste_Lent_V1.md|.md|
|SUP-WKS-Profil_Corrompu_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Profil_Corrompu_V1.md|.md|
|SUP-WKS-Teams_AV_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-Teams_AV_V1.md|.md|
|SUP-WKS-VPN_Client_V1|IT-SHARED/10_RUNBOOKS/SUPPORT/WKS/SUP-WKS-VPN_Client_V1.md|.md|

## 9. Templates, scripts, checklists, bundles

|type|category|count|
|---|---|---|
|Bundle|KNOWLEDGEPACK|37|
|Bundle|ROOT|34|
|Script|ROOT|30|
|Template|08_TEMPLATE_REPORTS|24|
|Checklist|ROOT|15|
|Example|ROOT|15|
|Template|01_TEMPLATE_CW|13|
|Checklist|99_ARCHIVE|12|
|Bundle|99_ARCHIVE|12|
|Template|15_TEMPLATE_TICKETOPS|11|
|Template|02_TEMPLATE_COM|7|
|Template|06_TEMPLATE _INCIDENT|6|
|Template|07_TEMPLATE_BACKUP|6|
|Example|TEMPLATE_CONCEPT|6|
|Template|14_TEMPLATE_HEALTH|5|
|Template|99_ARCHIVE|5|
|Example|99_ARCHIVE|5|
|Template|04_TEMPLATE_SUPPORT|3|
|Template|09_TEMPLATE_HUDU|3|
|KB|ROOT|3|
|Template|10_TEMPLATE_SCRIPT|2|
|Template|12_TEMPLATE_DIAG|2|
|Template|00_TEMPLATE_MASTER|1|
|Template|03_TEMPLATE_MAINTENANCE|1|
|Template|05_TEMPLATE_KNOWLEDGE|1|
|Template|11_TEMPLATE_SECURITY|1|
|Template|13_NAMING_STANDARDS|1|
|Template|16_TEMPLATE_PROJET|1|

### Template

|category|title|path|
|---|---|---|
|00_TEMPLATE_MASTER|TEMPLATE LIBRARY — IT-AssistanceTI_N2 et N3 - IT-MaintenanceMaster et autre assistant (MASTER)|IT-SHARED/20_TEMPLATES/00_TEMPLATE_MASTER/TEMPLATE_MASTER_Library-IT_V1.md|
|01_TEMPLATE_CW|EXEMPLES_CLOSE_CW_REELS.md|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/99_ARCHIVE/EXEMPLES_CLOSE_CW_REELS.md|
|01_TEMPLATE_CW|TEMPLATE: CW_DISCUSSION (Note ConnectWise - Facturable)|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/99_ARCHIVE/TEMPLATE__CW_DISCUSSION.md|
|01_TEMPLATE_CW|CW_DISCUSSION_STAR — Template|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/99_ARCHIVE/TEMPLATE__CW_DISCUSSION_STAR.md|
|01_TEMPLATE_CW|TEMPLATE: CW_NOTE_INTERNE (Note technique - Base de connaissance)|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/99_ARCHIVE/TEMPLATE__CW_NOTE_INTERNE.md|
|01_TEMPLATE_CW|TEMPLATE — CW_NOTE_INTERNE (par asset)|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/99_ARCHIVE/TEMPLATE__CW_NOTE_INTERNE__PER_ASSET.md|
|01_TEMPLATE_CW|CW TEMPLATE LIBRARY — IT-InterventionCopilot|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/99_ARCHIVE/TEMPLATE__CW_TEMPLATE_LIBRARY__INTERVENTION_COPILOT.md|
|01_TEMPLATE_CW|TEMPLATE: EMAIL_CLIENT (Notification client)|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/99_ARCHIVE/TEMPLATE__EMAIL_CLIENT.md|
|01_TEMPLATE_CW|TEMPLATE BUNDLE — CW CLOSE|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/TEMPLATE_BUNDLE_CW_CLOSE.md|
|01_TEMPLATE_CW|TEMPLATE: CW_DISCUSSION (Note ConnectWise - Facturable)|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/TEMPLATE_CW_Discussion-STAR_V1.md|
|01_TEMPLATE_CW|TEMPLATE: EMAIL_CLIENT (Notification client)|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/TEMPLATE_CW_Email-Client_V1.md|
|01_TEMPLATE_CW|CW TEMPLATE LIBRARY — IT-MaintenanceMaster|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/TEMPLATE_CW_Intervention-Library_V1.md|
|01_TEMPLATE_CW|TEMPLATE: CW_NOTE_INTERNE (Note technique - Base de connaissance)|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/TEMPLATE_CW_Note-Interne_V1.md|
|01_TEMPLATE_CW|TEMPLATE CW — Projet & SOW|IT-SHARED/20_TEMPLATES/01_TEMPLATE_CW/TEMPLATE_CW_PROJET_SOW_V1.md|
|02_TEMPLATE_COM|TEMPLATE — TEAMS NOTICE (COPIABLE)|IT-SHARED/20_TEMPLATES/02_TEMPLATE_COM/99_ARCHIVE/TEMPLATE __TEAMS_NOTICE.md|
|02_TEMPLATE_COM|CW TEMPLATE LIBRARY — IT-InterventionCopilot|IT-SHARED/20_TEMPLATES/02_TEMPLATE_COM/99_ARCHIVE/TEMPLATE_CW_LIBRARY__INTERVENTION_COPILOT.md|
|02_TEMPLATE_COM|TEMPLATE - Health Check|IT-SHARED/20_TEMPLATES/02_TEMPLATE_COM/99_ARCHIVE/TEMPLATE__INTERVENTION_EN_COURS.md|
|02_TEMPLATE_COM|TEMPLATE_COM_Email-Interruption-Planifiee_V1|IT-SHARED/20_TEMPLATES/02_TEMPLATE_COM/TEMPLATE_COM_Email-Interruption-Planifiee_V1.md|
|02_TEMPLATE_COM|TEMPLATE_COM_Teams-Incident-Actif_V1|IT-SHARED/20_TEMPLATES/02_TEMPLATE_COM/TEMPLATE_COM_Teams-Incident-Actif_V1.md|
|02_TEMPLATE_COM|TEMPLATE_COM_Teams-Maintenance_V1|IT-SHARED/20_TEMPLATES/02_TEMPLATE_COM/TEMPLATE_COM_Teams-Maintenance_V1.md|
|02_TEMPLATE_COM|TEMPLATE — FLAG UP / AVERTISSEMENT|IT-SHARED/20_TEMPLATES/02_TEMPLATE_COM/TEMPLATE__FLAG_UP_AVERTISSEMENT.md|
|03_TEMPLATE_MAINTENANCE|TEMPLATE_MAINTENANCE_MAJ-CVE-et-Planifiee_V1|IT-SHARED/20_TEMPLATES/03_TEMPLATE_MAINTENANCE/TEMPLATE_MAINTENANCE_MAJ-CVE-et-Planifiee_V1.md|
|04_TEMPLATE_SUPPORT|TEMPLATES D'INTERVENTIONS|IT-SHARED/20_TEMPLATES/04_TEMPLATE_SUPPORT/INTERVENTION_TEMPLATE_INFRA_AZUREVM.md|
|04_TEMPLATE_SUPPORT|TEMPLATES D'INTERVENTIONS|IT-SHARED/20_TEMPLATES/04_TEMPLATE_SUPPORT/INTERVENTION_TEMPLATE_IT.md|
|04_TEMPLATE_SUPPORT|TEMPLATE_SUPPORT_Escalade-et-Service-Restaure_V1|IT-SHARED/20_TEMPLATES/04_TEMPLATE_SUPPORT/TEMPLATE_SUPPORT_Escalade-et-Service-Restaure_V1.md|
|05_TEMPLATE_KNOWLEDGE|TEMPLATE_KNOWLEDGE_KB-Article-et-Procedure_V1|IT-SHARED/20_TEMPLATES/05_TEMPLATE_KNOWLEDGE/TEMPLATE_KNOWLEDGE_KB-Article-et-Procedure_V1.md|
|06_TEMPLATE _INCIDENT|TEMPLATE — TEAMS NOTICE (COPIABLE)|IT-SHARED/20_TEMPLATES/06_TEMPLATE _INCIDENT/99_ARCHIVE/TEMPLATE__INCIDENT_CRITIQUE.md|
|06_TEMPLATE _INCIDENT|TEMPLATE - Incident Log|IT-SHARED/20_TEMPLATES/06_TEMPLATE _INCIDENT/99_ARCHIVE/TEMPLATE__INCIDENT_LOG.md|
|06_TEMPLATE _INCIDENT|TEMPLATE_INCIDENT_Log-et-Critique_V1|IT-SHARED/20_TEMPLATES/06_TEMPLATE _INCIDENT/TEMPLATE_INCIDENT_Log-et-Critique_V1.md|
|06_TEMPLATE _INCIDENT|TEMPLATE_INTERVENTION_Compact_V1|IT-SHARED/20_TEMPLATES/06_TEMPLATE _INCIDENT/TEMPLATE_INTERVENTION_Compact_V1.md|
|06_TEMPLATE _INCIDENT|TEMPLATE_INTERVENTION_P1_PostMortem_V1|IT-SHARED/20_TEMPLATES/06_TEMPLATE _INCIDENT/TEMPLATE_INTERVENTION_P1_PostMortem_V1.md|
|06_TEMPLATE _INCIDENT|TEMPLATE_INTERVENTION_Standard_V1|IT-SHARED/20_TEMPLATES/06_TEMPLATE _INCIDENT/TEMPLATE_INTERVENTION_Standard_V1.md|
|07_TEMPLATE_BACKUP|TEMPLATE - Restore Request|IT-SHARED/20_TEMPLATES/07_TEMPLATE_BACKUP/99_ARCHIVE/TEMPLATE__RESTORE_REQUEST.md|
|07_TEMPLATE_BACKUP|TEMPLATE — TEAMS NOTICE (COPIABLE)|IT-SHARED/20_TEMPLATES/07_TEMPLATE_BACKUP/99_ARCHIVE/TEMPLATE__TEST_RESTORE.md|
|07_TEMPLATE_BACKUP|TEMPLATE_BACKUP_DR-Test-et-Restore_V1|IT-SHARED/20_TEMPLATES/07_TEMPLATE_BACKUP/TEMPLATE_BACKUP_DR-Test-et-Restore_V1.md|
|07_TEMPLATE_BACKUP|TEMPLATE_BACKUP_Restore_Trimestriel_V1|IT-SHARED/20_TEMPLATES/07_TEMPLATE_BACKUP/TEMPLATE_BACKUP_Restore_Trimestriel_V1.md|
|07_TEMPLATE_BACKUP|Modèle de diagnostic VEEAM|IT-SHARED/20_TEMPLATES/07_TEMPLATE_BACKUP/TEMPLATE_DIAG_VEEAM|
|07_TEMPLATE_BACKUP|Rapport Test DR|IT-SHARED/20_TEMPLATES/07_TEMPLATE_BACKUP/TEMPLATE_DR_TEST.md|
|08_TEMPLATE_REPORTS|TEMPLATE - Azure Health Report|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/99_ARCHIVE/TEMPLATE__AZURE_HEALTH_REPORT.md|
|08_TEMPLATE_REPORTS|TEMPLATE: Cloud Health Report|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/99_ARCHIVE/TEMPLATE__CLOUD_HEALTH_REPORT.md|
|08_TEMPLATE_REPORTS|TEMPLATE - Incident Report|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/99_ARCHIVE/TEMPLATE__INCIDENT_REPORT.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Rapport QBR (Quarterly Business Review) MSP|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/99_ARCHIVE/TEMPLATE__QBR_REPORT_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Rapport Mensuel IT MSP|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/99_ARCHIVE/TEMPLATE__RAPPORT_MENSUEL_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE - Status Report|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/99_ARCHIVE/TEMPLATE__STATUS_REPORT.md|
|08_TEMPLATE_REPORTS|TEMPLATE - Technical Report|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/99_ARCHIVE/TEMPLATE__Technical_Report.md|
|08_TEMPLATE_REPORTS|TEMPLATE_AUDIT_TRAIL_Tech-GPT-Conversation_V1|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_AUDIT_TRAIL_Tech-GPT-Conversation_V1.md|
|08_TEMPLATE_REPORTS|Rapport de Sauvegarde|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_BACKUP_REPORT.md|
|08_TEMPLATE_REPORTS|TEMPLATE — CAPA (Corrective and Preventive Actions)|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_CAPA_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Revue d'Architecture Cloud|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_CLOUD_ARCHITECTURE_REVIEW_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Rapport de Conformité IT|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_COMPLIANCE_REPORT_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Plan de Reprise après Sinistre (DR Plan)|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_DR_PLAN_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — QBR Exécutif (Direction client)|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_QBR_EXECUTIVE_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE_RAPPORT_Compliance_5Piliers_V1|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_RAPPORT_Compliance_5Piliers_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Rapport Pipeline Projets MSP|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_RAPPORT_PIPELINE_PROJETS_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE - Azure Health Report|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_REPORT_Azure-Health_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Rapport Client Mensuel IT MSP|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_REPORT_Client_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE: Cloud Health Report|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_REPORT_Cloud-Health_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Rapport Coordonnateur (Opérations MSP)|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_REPORT_Coordonnateur_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Rapport Mensuel IT MSP|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_REPORT_Mensuel_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Postmortem d'Incident IT|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_REPORT_Postmortem_V2.md|
|08_TEMPLATE_REPORTS|TEMPLATE — Rapport QBR (Quarterly Business Review) MSP|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_REPORT_QBR_V1.md|
|08_TEMPLATE_REPORTS|TEMPLATE_REPORT_Status-et-Technique_V1|IT-SHARED/20_TEMPLATES/08_TEMPLATE_REPORTS/TEMPLATE_REPORT_Status-et-Technique_V1.md|
|09_TEMPLATE_HUDU|TEMPLATE — Fiches Objet IT (edocs)|IT-SHARED/20_TEMPLATES/09_TEMPLATE_HUDU/99_ARCHIVE/TEMPLATE__EDOCS_FICHE_OBJET_IT.md|
|09_TEMPLATE_HUDU|TEMPLATE_KNOWLEDGE_KB-Article-et-Procedure_V1|IT-SHARED/20_TEMPLATES/09_TEMPLATE_HUDU/99_ARCHIVE/TEMPLATE__KB_Article.md|
|09_TEMPLATE_HUDU|TEMPLATE — Fiches Objet IT (edocs)|IT-SHARED/20_TEMPLATES/09_TEMPLATE_HUDU/TEMPLATE_HUDU_Fiche-Objet-IT_V1.md|
|10_TEMPLATE_SCRIPT|Requires -Version 5.1|IT-SHARED/20_TEMPLATES/10_TEMPLATE_SCRIPT/99_ARCHIVE/POWERSHELL__Template_Standard_v1.ps1|
|10_TEMPLATE_SCRIPT|TEMPLATE_SCRIPT_Header-PS-Standard_V1|IT-SHARED/20_TEMPLATES/10_TEMPLATE_SCRIPT/TEMPLATE_SCRIPT_Header-PS-Standard_V1.md|
|11_TEMPLATE_SECURITY|TEMPLATE_SECURITY_Incident-et-Postmortem-SOC_V1|IT-SHARED/20_TEMPLATES/11_TEMPLATE_SECURITY/TEMPLATE_SECURITY_Incident-et-Postmortem-SOC_V1.md|
|12_TEMPLATE_DIAG|TEMPLATE DIAG DFRS|IT-SHARED/20_TEMPLATES/12_TEMPLATE_DIAG/99_ARCHIVE/TEMPLATE_DIAG_DFRS|
|12_TEMPLATE_DIAG|TEMPLATE_DIAG_PostPanneHQ.md|IT-SHARED/20_TEMPLATES/12_TEMPLATE_DIAG/TEMPLATE_DIAG_PostPanneHQ.md|
|13_NAMING_STANDARDS|NAMING_STANDARDS_v1.md|IT-SHARED/20_TEMPLATES/13_NAMING_STANDARDS/NAMING_STANDARDS_v1.md|
|14_TEMPLATE_HEALTH|TEMPLATES D'INTERVENTIONS|IT-SHARED/20_TEMPLATES/14_TEMPLATE_HEALTH/99_ARCHIVE/INTERVENTION_TEMPLATE_IT.md|
|14_TEMPLATE_HEALTH|TEMPLATE - Azure Health Report|IT-SHARED/20_TEMPLATES/14_TEMPLATE_HEALTH/99_ARCHIVE/TEMPLATE__Azure_Health_Report.md|
|14_TEMPLATE_HEALTH|TEMPLATE: Cloud Health Report|IT-SHARED/20_TEMPLATES/14_TEMPLATE_HEALTH/99_ARCHIVE/TEMPLATE__Cloud_Health_Report.md|
|14_TEMPLATE_HEALTH|TEMPLATE - Health Check|IT-SHARED/20_TEMPLATES/14_TEMPLATE_HEALTH/99_ARCHIVE/TEMPLATE__Health_Check.md|
|14_TEMPLATE_HEALTH|TEMPLATE - Server Health Check|IT-SHARED/20_TEMPLATES/14_TEMPLATE_HEALTH/TEMPLATE__Server_Health_Check.md|
|15_TEMPLATE_TICKETOPS|CLOSE_BackupFailed — Fermeture Backup échoué|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/CLOSE_BackupFailed.md|
|15_TEMPLATE_TICKETOPS|CLOSE_DNS-DHCP — Fermeture Problème DNS/DHCP|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/CLOSE_DNS-DHCP.md|
|15_TEMPLATE_TICKETOPS|CLOSE_DisquePlein — Fermeture Disque plein|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/CLOSE_DisquePlein.md|
|15_TEMPLATE_TICKETOPS|CLOSE_Patching — Fermeture Patching Serveurs|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/CLOSE_Patching.md|
|15_TEMPLATE_TICKETOPS|CLOSE_Postcheck — Fermeture Postcheck post-intervention|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/CLOSE_Postcheck.md|
|15_TEMPLATE_TICKETOPS|CLOSE_RDSLicensing — Fermeture Licences RDS|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/CLOSE_RDSLicensing.md|
|15_TEMPLATE_TICKETOPS|CLOSE_RebootServeur — Fermeture Reboot serveur|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/CLOSE_RebootServeur.md|
|15_TEMPLATE_TICKETOPS|CLOSE_SnapshotVMware — Fermeture Snapshot VMware|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/CLOSE_SnapshotVMware.md|
|15_TEMPLATE_TICKETOPS|CLOSE_WindowsUpdateMissing — Fermeture Windows Update manquantes|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/CLOSE_WindowsUpdateMissing.md|
|15_TEMPLATE_TICKETOPS|ESCALADE VENTES — Template agent terrain → IT-ProjetSOW|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/ESCALADE_VENTES.md|
|15_TEMPLATE_TICKETOPS|HANDOFF_SCHEMA.yaml — Schéma de passation inter-agents IT-TicketOpsAI|IT-SHARED/20_TEMPLATES/15_TEMPLATE_TICKETOPS/HANDOFF_SCHEMA.yaml|
|16_TEMPLATE_PROJET|TEMPLATE — Statement of Work (SOW) Client MSP|IT-SHARED/20_TEMPLATES/16_TEMPLATE_PROJET/TEMPLATE_SOW_CLIENT_V1.md|
|99_ARCHIVE|TEMPLATE — FLAG UP / AVERTISSEMENT|IT-SHARED/20_TEMPLATES/99_ARCHIVE/TEMPLATE__FLAG_UP_AVERTISSEMENT.md|
|99_ARCHIVE|GPT SETUP CARD — @IT-[NomAgent]|IT-SHARED/20_TEMPLATES/99_ARCHIVE/TEMPLATE__GPT_SETUP_CARD.md|
|99_ARCHIVE|TEMPLATE — Postmortem d'Incident IT|IT-SHARED/20_TEMPLATES/99_ARCHIVE/TEMPLATE__POSTMORTEM_V2.md|
|99_ARCHIVE|TEMPLATE — Rapport QBR (Quarterly Business Review) MSP|IT-SHARED/20_TEMPLATES/99_ARCHIVE/TEMPLATE__QBR_REPORT_V1.md|
|99_ARCHIVE|TEMPLATE - Health Check|IT-SHARED/20_TEMPLATES/99_ARCHIVE/TEMPLATE__SERVICE_RESTAURE_OK.md|

### Script

|category|title|path|
|---|---|---|
|ROOT|LIBRARY_BASH_Bash-Snippets_V1|IT-SHARED/30_SCRIPTS/LIBRARY_BASH_Bash-Snippets_V1.md|
|ROOT|POWERSHELL LIBRARY: Event Log Analysis|IT-SHARED/30_SCRIPTS/LIBRARY_DIAG_EventLog-Analysis_V1.md|
|ROOT|POWERSHELL LIBRARY: Server Management|IT-SHARED/30_SCRIPTS/LIBRARY_MAINT_Server-Management_V1.md|
|ROOT|LIBRARY_PS_PowerShell-Snippets_V1|IT-SHARED/30_SCRIPTS/LIBRARY_PS_PowerShell-Snippets_V1.md|
|ROOT|LIBRARY_BASH_Bash-Snippets_V1|IT-SHARED/30_SCRIPTS/LIBRARY__Bash_Snippets.md|
|ROOT|LIBRARY_PS_PowerShell-Snippets_V1|IT-SHARED/30_SCRIPTS/LIBRARY__PowerShell_Snippets.md|
|ROOT|>|IT-SHARED/30_SCRIPTS/MAINT-SRV-MasterScript_V1.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/POWERSHELL__Template_Standard_v1.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/SCRIPT_AUDIT_AD-Health_V1.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/SCRIPT_AUDIT_HealthCheck-Server_V1.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/SCRIPT_Analyse_Serveur_TicketOps_V1.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/SCRIPT_BACKUP_Veeam-JobStatus_V1.ps1|
|ROOT|!>|IT-SHARED/30_SCRIPTS/SCRIPT_DIAG_Collect-Server-Check_V1.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/SCRIPT_DIAG_DCDIAG-Quick_V1.ps1|
|ROOT|>|IT-SHARED/30_SCRIPTS/SCRIPT_DIAG_Health-and-Updates_V1.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/SCRIPT_DIAG_Pending-Reboot_V1.ps1|
|ROOT|>|IT-SHARED/30_SCRIPTS/SCRIPT_DIAG_Precheck-DC-DNS_V1.ps1|
|ROOT|>|IT-SHARED/30_SCRIPTS/SCRIPT_DIAG_Precheck-HyperV_V1.ps1|
|ROOT|>|IT-SHARED/30_SCRIPTS/SCRIPT_DIAG_Precheck-Server-Generic_V1.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/SCRIPT_DIAG_RAM-TopProcess_V1.ps1|
|ROOT|============================================================|IT-SHARED/30_SCRIPTS/SCRIPT_DIAG_SLOW_SRV_V1.ps1|
|ROOT|SCRIPT MAINTENANCE CW-MaintenanceConsole-Launcher V1|IT-SHARED/30_SCRIPTS/SCRIPT_MAINTENANCE_CW-MaintenanceConsole-Launcher_V1.ps1|
|ROOT|>|IT-SHARED/30_SCRIPTS/SCRIPT_MAINTENANCE_CW-MaintenanceConsole_V1.ps1|
|ROOT|Restart-Computer -Force  ⚠️ NE PAS décommenter sans validation explicite du technicien|IT-SHARED/30_SCRIPTS/SCRIPT_MAINT_DISM-SFC-Restore_V1.ps1|
|ROOT|Plus précis si dispo|IT-SHARED/30_SCRIPTS/SCRIPT_PRECHECK_DC_V3.ps1|
|ROOT|============================================================|IT-SHARED/30_SCRIPTS/SCRIPT_PRECHECK_POSTCHECK_V3.ps1|
|ROOT|>|IT-SHARED/30_SCRIPTS/SCRIPT_PostCheck_PanneHQ.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/SCRIPT_SECU_M365-CompteCompromis_V1.ps1|
|ROOT|Requires -Version 5.1|IT-SHARED/30_SCRIPTS/SCRIPT_TEMPLATE_PS-Standard_V1.ps1|
|ROOT|Boot time (vérifie que ça a bien rebooté récemment)|IT-SHARED/30_SCRIPTS/Script_RebootInfoShort_SRV.ps1|

### Checklist

|category|title|path|
|---|---|---|
|99_ARCHIVE|CHECKLIST - Déploiement Azure VM|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST_INFRA_Azure-VM-Deployment_V1.md|
|99_ARCHIVE|CHECKLIST: Microsoft 365 Configuration Best Practices|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST_INFRA_M365-Configuration_V1.md|
|99_ARCHIVE|CHECKLIST_MASTER_Compliance-et-BestPractices_V1|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST_MASTER_Compliance-et-BestPractices_V1.md|
|99_ARCHIVE|CHECKLIST LIBRARY — IT-AssistanceTechnique (MASTER)|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST_MASTER_Library-IT_V1.md|
|99_ARCHIVE|CHECKLIST_NOC_Shift-Handover_V1|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST_NOC_Shift-Handover_V1.md|
|99_ARCHIVE|CHECKLIST_REPORT_KPIs-MSP-Mensuels_V1|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST_REPORT_KPIs-MSP-Mensuels_V1.md|
|99_ARCHIVE|CHECKLIST_SECURITY_Hardening-et-Audit_V1|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST_SECURITY_Hardening-et-Audit_V1.md|
|99_ARCHIVE|CHECKLIST_BACKUP_DR-Readiness_V1|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST__DR_Readiness.md|
|99_ARCHIVE|CHECKLIST — KICKOFF (Ticket MSP)|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST__KICKOFF_TICKET.md|
|99_ARCHIVE|CHECKLIST — POSTCHECK (Generic Windows Server)|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST__POSTCHECK_GENERIC.md|
|99_ARCHIVE|CHECKLIST — PRECHECK (Generic Windows Server)|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST__PRECHECK_GENERIC.md|
|99_ARCHIVE|CHECKLIST_SECURITY_Hardening-et-Audit_V1|IT-SHARED/40_CHECKLISTS/99_ARCHIVE/CHECKLIST__Security.md|
|ROOT|BUNDLE — CHECKLISTS IT MSP|IT-SHARED/40_CHECKLISTS/BUNDLE_CHECKLISTS_IT_V1.md|
|ROOT|CHECKLIST_BACKUP_DR-Readiness_V1|IT-SHARED/40_CHECKLISTS/CHECKLIST_BACKUP_DR-Readiness_V1.md|
|ROOT|CHECKLIST — CLOSEOUT (ConnectWise)|IT-SHARED/40_CHECKLISTS/CHECKLIST_CW_Closeout_V1.md|
|ROOT|CHECKLIST — KICKOFF (Ticket MSP)|IT-SHARED/40_CHECKLISTS/CHECKLIST_CW_Kickoff-Ticket_V1.md|
|ROOT|CHECKLIST - Déploiement Azure VM|IT-SHARED/40_CHECKLISTS/CHECKLIST_INFRA_Azure-VM-Deployment_V1.md|
|ROOT|CHECKLIST: Microsoft 365 Configuration Best Practices|IT-SHARED/40_CHECKLISTS/CHECKLIST_INFRA_M365-Configuration_V1.md|
|ROOT|CHECKLIST — POSTCHECK (Generic Windows Server)|IT-SHARED/40_CHECKLISTS/CHECKLIST_MAINTENANCE_Postcheck-Generic_V1.md|
|ROOT|CHECKLIST_MAINTENANCE_Pre-Maintenance_V1|IT-SHARED/40_CHECKLISTS/CHECKLIST_MAINTENANCE_Pre-Maintenance_V1.md|
|ROOT|CHECKLIST — PRECHECK (Generic Windows Server)|IT-SHARED/40_CHECKLISTS/CHECKLIST_MAINTENANCE_Precheck-Generic_V1.md|
|ROOT|CHECKLIST_MASTER_Compliance-et-BestPractices_V1|IT-SHARED/40_CHECKLISTS/CHECKLIST_MASTER_Compliance-et-BestPractices_V1.md|
|ROOT|CHECKLIST LIBRARY — IT-Assistant-N3 (MASTER)|IT-SHARED/40_CHECKLISTS/CHECKLIST_MASTER_Library-IT_V1.md|
|ROOT|CHECKLIST_NOC_Shift-Handover_V1|IT-SHARED/40_CHECKLISTS/CHECKLIST_NOC_Shift-Handover_V1.md|
|ROOT|CHECKLIST_REPORT_KPIs-MSP-Mensuels_V1|IT-SHARED/40_CHECKLISTS/CHECKLIST_REPORT_KPIs-MSP-Mensuels_V1.md|
|ROOT|CHECKLIST_SECURITY_Hardening-et-Audit_V1|IT-SHARED/40_CHECKLISTS/CHECKLIST_SECURITY_Hardening-et-Audit_V1.md|
|ROOT|CHECKLIST_SUPPORT_Intervention-Steps_V1|IT-SHARED/40_CHECKLISTS/CHECKLIST_SUPPORT_Intervention-Steps_V1.md|

### Bundle

|category|title|path|
|---|---|---|
|99_ARCHIVE|BUNDLE — BUNDLE_INFRA_365|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE_INFRA_365.md|
|99_ARCHIVE|BUNDLE — BUNDLE_INFRA_SERVER|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE_INFRA_SERVER.md|
|99_ARCHIVE|BUNDLE — BUNDLE_INFRA_VIRTUALISATION|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE_INFRA_VIRTUALISATION.md|
|99_ARCHIVE|BUNDLE_KP — IT-FrontLine|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE_KP_AssistanTI-FrontLine_V1.md|
|99_ARCHIVE|BUNDLE_KP_AssistanTI-N2_V1|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE_KP_AssistanTI-N2_V1.md|
|99_ARCHIVE|BUNDLE_KP_AssistanTI-N3_V1|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE_KP_AssistanTI-N3_V1.md|
|99_ARCHIVE|BUNDLE — IT Sécurité MSP|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE_SECURITY_Securite_V1.md|
|99_ARCHIVE|Bundle — Firewall & Network Security Runbooks|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE__INFRA_Firewall.md|
|99_ARCHIVE|BUNDLE — IT Core MSP|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE__IT_CORE_MSP.md|
|99_ARCHIVE|BUNDLE — IT Gouvernance MSP|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE__IT_GOVERNANCE.md|
|99_ARCHIVE|BUNDLE — IT Intervention & NOC MSP|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE__IT_NOC_INTERVENTION.md|
|99_ARCHIVE|BUNDLE — IT Sécurité MSP|IT-SHARED/60_BUNDLES/99_ARCHIVE/BUNDLE__IT_SECURITY.md|
|ROOT|BUNDLE_INFRA_CLOUD_AWS_V1|IT-SHARED/60_BUNDLES/BUNDLE_INFRA_CLOUD_AWS_V1.md|
|ROOT|BUNDLE_INFRA_CLOUD_GCP_GoogleWorkspace_V1|IT-SHARED/60_BUNDLES/BUNDLE_INFRA_CLOUD_GCP_GoogleWorkspace_V1.md|
|ROOT|BUNDLE_INFRA_DNS_Domains_V1|IT-SHARED/60_BUNDLES/BUNDLE_INFRA_DNS_Domains_V1.md|
|ROOT|BUNDLE — BUNDLE_INFRA_FIREWALL|IT-SHARED/60_BUNDLES/BUNDLE_INFRA_FIREWALL.md|
|ROOT|BUNDLE_INFRA_LINUX_V1|IT-SHARED/60_BUNDLES/BUNDLE_INFRA_LINUX_V1.md|
|ROOT|BUNDLE — IT Core MSP|IT-SHARED/60_BUNDLES/BUNDLE_MASTER_Core-MSP_V1.md|
|ROOT|BUNDLE — IT Gouvernance MSP|IT-SHARED/60_BUNDLES/BUNDLE_MASTER_Gouvernance_V1.md|
|ROOT|BUNDLE — IT Intervention & NOC MSP|IT-SHARED/60_BUNDLES/BUNDLE_NOC_Intervention_V1.md|
|ROOT|BUNDLE_NOC_SOC_SIEM_V1|IT-SHARED/60_BUNDLES/BUNDLE_NOC_SOC_SIEM_V1.md|
|ROOT|BUNDLE_RUNBOOKS_IT_BACKUP_DR|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOKS_IT_BACKUP_DR.md|
|ROOT|BUNDLE_RUNBOOKS_IT_BACKUP_DR_ADDENDUM_V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOKS_IT_BACKUP_DR_ADDENDUM_V1.md|
|ROOT|BUNDLE_RUNBOOKS_IT_CLOUD|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOKS_IT_CLOUD.md|
|ROOT|BUNDLE_RUNBOOKS_IT_INFRA|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOKS_IT_INFRA.md|
|ROOT|BUNDLE_RUNBOOKS_IT_NOC_URGENCE|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOKS_IT_NOC_URGENCE.md|
|ROOT|BUNDLE_RUNBOOKS_IT_RESEAU_VOIP|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOKS_IT_RESEAU_VOIP.md|
|ROOT|BUNDLE_RUNBOOKS_IT_SECURITE|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOKS_IT_SECURITE.md|
|ROOT|BUNDLE_RUNBOOKS_IT_SUPPORT|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOKS_IT_SUPPORT.md|
|ROOT|BUNDLE RUNBOOK BACKUP Datto-Keepit-DR V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_BACKUP_Datto-Keepit-DR_V1.md|
|ROOT|BUNDLE RUNBOOK BACKUP Veeam-Operations V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_BACKUP_Veeam-Operations_V1.md|
|ROOT|BUNDLE RUNBOOK INFRA AD-Operations V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_INFRA_AD-Operations_V1.md|
|ROOT|BUNDLE RUNBOOK INFRA Firewall-VPN V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_INFRA_Firewall-VPN_V1.md|
|ROOT|BUNDLE RUNBOOK INFRA Hyperviseurs V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_INFRA_Hyperviseurs_V1.md|
|ROOT|BUNDLE RUNBOOK INFRA M365 V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_INFRA_M365_V1.md|
|ROOT|BUNDLE RUNBOOK INFRA RDS-Operations V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_INFRA_RDS-Operations_V1.md|
|ROOT|BUNDLE RUNBOOK MAINTENANCE Patching-Windows V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_MAINTENANCE_Patching-Windows_V1.md|
|ROOT|BUNDLE RUNBOOK MAINTENANCE Server-Health V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_MAINTENANCE_Server-Health_V1.md|
|ROOT|BUNDLE RUNBOOK NOC RMM-Monitoring V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_NOC_RMM-Monitoring_V1.md|
|ROOT|BUNDLE RUNBOOK SECURITY Incident-Response V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_SECURITY_Incident-Response_V1.md|
|ROOT|BUNDLE RUNBOOK SUPPORT Intervention-Live V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_SUPPORT_Intervention-Live_V1.md|
|ROOT|BUNDLE RUNBOOK SUPPORT Triage-KB V1|IT-SHARED/60_BUNDLES/BUNDLE_RUNBOOK_SUPPORT_Triage-KB_V1.md|
|ROOT|BUNDLE_SUPPORT_N1_UserSupport_V1|IT-SHARED/60_BUNDLES/BUNDLE_SUPPORT_N1_UserSupport_V1.md|
|ROOT|BUNDLE_SUPPORT_Print_Diag_V1|IT-SHARED/60_BUNDLES/BUNDLE_SUPPORT_Print_Diag_V1.md|
|ROOT|BUNDLE — BUNDLE_INFRA_SERVER|IT-SHARED/60_BUNDLES/BUNDLE_SUPPORT_SERVER-AD.md|
|ROOT|BUNDLE_vs_AGENT — Par Agent|IT-SHARED/60_BUNDLES/BUNDLE_vs_AGENT_V3.2.md|
|KNOWLEDGEPACK|BUNDLE_KP — IT-FrontLine|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/99_ARCHIVE/BUNDLE_KP_AssistanTI-FrontLine_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_AssetMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_AssetMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_Assistant-N2_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_Assistant-N2_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_Assistant-N2_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_Assistant-N2_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_Assistant-N3_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_Assistant-N3_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_Assistant-N3_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_Assistant-N3_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_BackupDRMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_BackupDRMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_BackupDRMaster_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_BackupDRMaster_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_ClientDocMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_ClientDocMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_CloudMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_CloudMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_CloudMaster_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_CloudMaster_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_Commandare-Infra_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_Commandare-Infra_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_Commandare-NOC_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_Commandare-NOC_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_Commandare-OPR_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_Commandare-OPR_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_Commandare-TECH_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_Commandare-TECH_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP — IT-FrontLine|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_FrontLine_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_FrontLine_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_FrontLine_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_IT-MaintenanceMaster_V2 — KnowledgePack (Windows)|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_IT-MaintenanceMaster_V2__KnowledgePack.md|
|KNOWLEDGEPACK|BUNDLE_KP_IT-TicketOpsAI_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_IT-TicketOpsAI_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_IT-TicketOpsAI_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_IT-TicketOpsAI_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_KnowledgeKeeper_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_KnowledgeKeeper_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_MaintenanceMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_MaintenanceMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_IT-MaintenanceMaster_V2 — KnowledgePack (Windows)|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_MaintenanceMaster_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_MonitoringMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_MonitoringMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_NOCDispatcher_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_NOCDispatcher_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_NetworkMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_NetworkMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_ReportMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_ReportMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_ScriptMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_ScriptMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_SecurityMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_SecurityMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_SecurityMaster_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_SecurityMaster_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_SysAdmin_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_SysAdmin_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_SysAdmin_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_SysAdmin_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_TicketScribe_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_TicketScribe_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_TicketScribe_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_TicketScribe_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_UrgenceMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_UrgenceMaster_V1.md|
|KNOWLEDGEPACK|BUNDLE_KP_UrgenceMaster_V2|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_UrgenceMaster_V2.md|
|KNOWLEDGEPACK|BUNDLE_KP_VoIPMaster_V1|IT-SHARED/60_BUNDLES/KNOWLEDGEPACK/BUNDLE_KP_VoIPMaster_V1.md|

### Example

|category|title|path|
|---|---|---|
|99_ARCHIVE|KB — Veeam : Échecs récurrents "Failed to retrieve object hierarchy" — Probe RMM VMware|IT-SHARED/80_EXEMPLES/99_ARCHIVE/KB-VEEAM-001_Probe-RMM-VMware.md|
|99_ARCHIVE|KB — Windows Update Missing sur Domain Controller|IT-SHARED/80_EXEMPLES/99_ARCHIVE/KB-WU-001_Windows-Update-Missing-DC.md|
|99_ARCHIVE|TEMPLATE SPÉCIALISÉ — PENDING REBOOT / WINDOWS UPDATE|IT-SHARED/80_EXEMPLES/99_ARCHIVE/Pending_REBOT_OttoInc_002.agent.md|
|99_ARCHIVE|TEMPLATE MAÎTRE — INTERVENTION MSP COMPLÈTE|IT-SHARED/80_EXEMPLES/99_ARCHIVE/TEMPLATE_Perfrormance-PREMIUM.md|
|99_ARCHIVE|TEMPLATE MAÎTRE — INTERVENTION MSP COMPLÈTE|IT-SHARED/80_EXEMPLES/99_ARCHIVE/TEMPLATE_Perfrormance-STD.md|
|ROOT|EXEMPLES_CLOSE_CW_REFERENCE.md|IT-SHARED/80_EXEMPLES/EXEMPLES_CLOSE_CW_REFERENCE.md|
|ROOT|Exemple d’intervention — Windows Update Missing / Patchs “Under review” dans RMM|IT-SHARED/80_EXEMPLES/EXEMPLE_INTERVENTION_WindowsUpdateMissing_UnderReview_RMM.md|
|ROOT|EXEMPLE — Intervention Pending Reboot sur serveur de fichiers Windows|IT-SHARED/80_EXEMPLES/EXEMPLE_Intervention_PendingReboot_FileServer_Windows.md|
|ROOT|EXEMPLE DE RÉFÉRENCE — P1 Site Down récurrent / Hyper-V / MegaRAID Fatal Firmware Error|IT-SHARED/80_EXEMPLES/EXEMPLE_P1_HyperV_MegaRAID_FatalFirmwareError.md|
|ROOT|Cas de référence — Alerte DHCP capacité élevée / BAD_ADDRESS récurrents|IT-SHARED/80_EXEMPLES/EXEMPLE_Reference_Intervention_DHCP_CRITIQUE.md|
|ROOT|O 7@%N&|IT-SHARED/80_EXEMPLES/EXEMPLE_Reference_MSP_DHCP_Scope_Sature.docx|
|ROOT|EXEMPLE DE RÉFÉRENCE — INTERVENTION MSP|IT-SHARED/80_EXEMPLES/EXEMPLE_Reference_MSP_DHCP_Scope_Sature.md|
|ROOT|Fichier de référence — Cas stabilité EDR / serveur critique|IT-SHARED/80_EXEMPLES/EXEMPLE_SECURITY_REFERENCE_CAS_STABILITE_EDR_SERVEUR_CRITIQUE.md|
|ROOT|══════════════════════════════════════════════════════|IT-SHARED/80_EXEMPLES/EXEMPLE_kb_brief_1683171.yaml|
|ROOT|Fichier exemple — Intervention Veeam — Repository plein / espace insuffisant|IT-SHARED/80_EXEMPLES/Exemple_Intervention_Veeam_Repository_Plein_OttoInc.md|
|ROOT|Exemple reference Intervention SYSVOL DFSR DC Unique|IT-SHARED/80_EXEMPLES/Exemple_reference_Intervention_SYSVOL_DFSR_DC_Unique.docx|
|ROOT|KB — Datto : Échecs Agentless VMware “AgentlessProxyApi initialization timeout / Could not update agent metadata / VMware task still running” — VSS writers + pression mémoire + Sen|IT-SHARED/80_EXEMPLES/KB-DATTO-001_Probe-RMM-VMware.md|
|ROOT|80_EXEMPLES — Exemples de sorties réelles|IT-SHARED/80_EXEMPLES/README.md|
|TEMPLATE_CONCEPT|BRIEF — Complétion d’un cas d’intervention MSP|IT-SHARED/80_EXEMPLES/TEMPLATE_CONCEPT/00_BRIEF_AGENT_COMPLETION.md|
|TEMPLATE_CONCEPT|EXEMPLE DE RÉFÉRENCE — INTERVENTION MSP|IT-SHARED/80_EXEMPLES/TEMPLATE_CONCEPT/01_TEMPLATE_Reference_Intervention_MSP.md|
|TEMPLATE_CONCEPT|EAIA / MSP Intelligence IT — Cas démonstrateur|IT-SHARED/80_EXEMPLES/TEMPLATE_CONCEPT/03_TEMPLATE_Page_Demo_MSP.html|
|TEMPLATE_CONCEPT|`00_BRIEF_AGENT_COMPLETION.md`|IT-SHARED/80_EXEMPLES/TEMPLATE_CONCEPT/04_TEMPLATE_FULL.md|
|TEMPLATE_CONCEPT|EAIA / MSP Intelligence IT — Cas réplication Active Directory / SYSVOL sur RODC|IT-SHARED/80_EXEMPLES/TEMPLATE_CONCEPT/exemple_case.html|
|TEMPLATE_CONCEPT|EAIA / MSP Intelligence IT — Cas démonstrateur|IT-SHARED/80_EXEMPLES/TEMPLATE_CONCEPT/preview_case-name.html|
|ROOT|TEMPLATE PENDINGREBOOT|IT-SHARED/80_EXEMPLES/TEMPLATE_PENDINGREBOOT.md|
|ROOT|Exemple d’intervention — Stabilité EDR sur serveur de fichiers critique|IT-SHARED/80_EXEMPLES/exemple_intervention_stabilite_edr_serveur_fichiers.md|

### KB

|category|title|path|
|---|---|---|
|ROOT|KB — Veeam : Échecs récurrents "Failed to retrieve object hierarchy" — Probe RMM VMware|IT-SHARED/90_KB/KB-VEEAM-001_Probe-RMM-VMware.md|
|ROOT|KB — Windows Update Missing sur Domain Controller|IT-SHARED/90_KB/KB-WU-001_Windows-Update-Missing-DC.md|
|ROOT|KB INTERNE — NOC / DHCP Scope Saturé (Analyse structurée MSP)|IT-SHARED/90_KB/KB_DHCP_DIAG|

## 10. Pages de cas / preuves de terrain

Le dossier `msp.zip` contient des pages de démonstration/cas anonymisés. Elles doivent servir de preuves centrales pendant le lancement : elles vendent mieux qu’une promesse abstraite.

|title|path|
|---|---|
|EAIA / MSP Intelligence IT — Cas de réplication Active Directory / SYSVOL multisite|cases/eaia_case_ad_replication_sysvol_launch_anonymized.html|
|EAIA / MSP Intelligence IT — Cas réplication Active Directory / SYSVOL sur RODC|cases/eaia_case_ad_replication_sysvol_rodc.html|
|EAIA / MSP Intelligence IT — Cas réplication Active Directory / SYSVOL sur RODC|cases/eaia_case_adws_sysvol_single_dc_launch.html|
|EAIA / MSP Intelligence IT — Cas de surcharge CPU prolongée sur serveur|cases/eaia_case_cpu_server_premium.html|
|EAIA / MSP Intelligence IT — Cas de récupération documentaire zéro ko|cases/eaia_case_document_recovery_zero_byte.html|
|EAIA / MSP Intelligence IT — Cas stabilité EDR sur serveur critique|cases/eaia_case_edr_stabilite_serveur_critique.html|
|EAIA / MSP Intelligence IT — Cas de stabilité EDR sur serveur de fichiers|cases/eaia_case_edr_stabilite_serveur_fichiers_anonymise.html|
|EAIA / MSP Intelligence IT — Cas d’alerte matérielle iDRAC / PERC|cases/eaia_case_idrac_perc_warning.html|
|EAIA / MSP Intelligence IT — Cas multi-serveurs hors ligne / Auvik / ESXi / WatchGuard|cases/eaia_case_msp_lancement_anonymise.html|
|EAIA / MSP Intelligence IT — Cas double redémarrage contrôlé sur contrôleur de domaine|cases/eaia_case_msp_lancement_dc_anonymise.html|
|EAIA / MSP Intelligence IT — Cas réplication Active Directory / SYSVOL sur RODC|cases/eaia_case_msp_launch_adws_sysvol_anonymise.html|
|EAIA / MSP Intelligence IT — Cas de réplication Active Directory multisites|cases/eaia_case_msp_launch_anonymized_ad_replication.html|
|EAIA / MSP Intelligence IT — Cas Auvik / ESXi / perte de visibilité supervision|cases/eaia_case_msp_site_lancement_anonymise.html|
|EAIA / MSP Intelligence IT — Cas d’alerte NTFS corrélée à la sauvegarde|cases/eaia_case_ntfs_datto_backup_transient.html|
|EAIA / MSP Intelligence IT — Cas NTFS sur serveur de sauvegarde Veeam|cases/eaia_case_ntfs_veeam_bdr.html|
|EAIA / MSP Intelligence IT — Cas P1 Hyper-V & contrôleur RAID critique|cases/eaia_case_p1_hyperv_megaraid_public.html|
|EAIA / MSP Intelligence IT — Cas de validation de pending reboot sur contrôleur de domaine|cases/eaia_case_pending_reboot_dc.html|
|EAIA / MSP Intelligence IT — Cas de mise à jour bloquée par pending reboot|cases/eaia_case_pending_reboot_maintenance_window.html|
|EAIA / MSP Intelligence IT — Cas pending reboot sur serveur de sauvegarde|cases/eaia_case_pending_reboot_public_anonymized.html|
|EAIA / MSP Intelligence IT — Cas de site down et rétablissement Hyper-V|cases/eaia_case_site_down_hyperv.html|
|EAIA / MSP Intelligence IT — Cas stabilité EDR sur serveur critique|cases/eaia_case_stabilite_edr_serveur_critique.html|
|EAIA / MSP Intelligence IT — Cas Veeam : échec VSS / SQLWriter sur contrôleur de domaine|cases/eaia_case_veeam_backup_vss_sqlwriter.html|
|EAIA / MSP Intelligence IT — Cas de restauration Veeam Management Agent|cases/eaia_case_veeam_management_agent.html|
|EAIA / MSP Intelligence IT — Cas Veeam pending reboot Windows Update|cases/eaia_case_veeam_pending_reboot_site_lancement.html|
|EAIA / MSP Intelligence IT — Cas Veeam repository plein / espace insuffisant|cases/eaia_case_veeam_repository_plein.html|
|EAIA / MSP Intelligence IT — Cas VMware ESXi / alerte stockage sur ancien hôte|cases/eaia_case_vmware_legacy_esxi_storage.html|
|EAIA / MSP Intelligence IT — Cas Windows Update sur serveur critique mixte DC + SQL|cases/eaia_case_windows_update_dc_sql.html|
|EAIA / MSP Intelligence IT — Cas de réplication Active Directory multisites|cases/eaia_case_windows_update_legacy_sbs2011.html|
|EAIA / MSP Intelligence IT — Cas de pending reboot Windows Update sur serveur de fichiers|cases/eaia_case_windows_update_pending_reboot.html|
|EAIA / MSP Intelligence IT — Cas AD intersites|cases/eaia_casepage_ad_replication_public.html|
|EAIA / MSP Intelligence IT — Cas réel anonymisé : incident serveur critique et corrélation EDR|cases/eaia_casepage_incident_serveur_critique_anonymise.html|
|EAIA / MSP Intelligence IT — Cas FILE-01 · pending reboot maîtrisé|cases/eaia_casepage_pending_reboot_fileserver_launch_anonymized_v2.html|
|EAIA / MSP Intelligence IT — Cas pending reboot sur serveur de fichiers|cases/eaia_cassepage._template_pour _autres_cas.html|
|EA/IA — Démonstrateur MSP / Cas DHCP saturé|cases/msp-cas-dhcp-anonymise-lancement.html|
|EA/IA — Démonstration MSP / Résolution guidée d’un incident pending reboot|msp-case-demo.html|
|MSP Intelligence IT — Démonstrateurs|msp-demos.html|
|EA/IA — MSP Intelligence IT|msp-preview.html|

## 11. Lecture stratégique

**Forces majeures :**
- Profondeur MSP réelle : ConnectWise, N-able, Veeam, Datto, Hudu, AD, M365, Azure, RMM, backup, NOC, sécurité.
- Structure industrialisable : agents + playbooks + dispatch + templates + scripts + cas.
- Valeur mesurable : temps de documentation, standardisation, qualité de clôture, réduction d’erreurs, capitalisation KB.
- Histoire fondatrice puissante : 25 ans de terrain et 164 formations cristallisés en système.

**Risques à cadrer :**
- Ne pas promettre “remplacement technicien”; promettre augmentation, standardisation et documentation.
- Éviter les claims non prouvés comme ROI garanti; utiliser des hypothèses.
- Prévoir une page de limites : validation humaine, données sensibles, aucun credential, anonymisation, changement/reboot avec autorisation.

## 12. Recommandation de lancement

1. **Preuve** : page vitrine + cas réels anonymisés + démo vidéo TicketOps.
2. **Conversion** : séquence courriel aux MSP Québec/Canada + LinkedIn ciblé + offre pilote.
3. **Expansion** : webinaire, pack partenaire, agent demo public, retargeting contenu.