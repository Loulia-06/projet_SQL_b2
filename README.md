# projet_SQL_b2# Projet SQL B2 – Système de gestion de locations de véhicules électriques partagés

## Contexte : cIAra Mobility
cIAra Mobility est une start-up innovante spécialisée dans la mobilité urbaine durable. Elle propose un service moderne de location de véhicules électriques partagés, incluant **voitures, trottinettes, scooters et vélos électriques**.  

Face à une croissance rapide, l’entreprise a besoin d’une solution centralisée pour gérer :  
- La flotte de véhicules  
- Les utilisateurs (clients et techniciens)  
- Les stations et bornes de recharge  
- Les réservations et locations  
- Les paiements  
- Les interventions de maintenance  

Ce projet consiste à concevoir et implémenter une **base de données PostgreSQL complète**, capable de supporter toutes ces fonctionnalités.

---

## Objectifs du projet
1. Concevoir un système de gestion avec **Merise** (MCD et MLD).  
2. Créer la base de données sous **PostgreSQL** avec contraintes d’intégrité.  
3. Développer des requêtes SQL avancées, vues, fonctions et triggers.  
4. Travailler en **collaboration via GitHub** avec commits réguliers.  
5. Produire une **documentation professionnelle** et un README clair.

---

## Technologies et compétences
- **SGBD** : PostgreSQL (open-source, standard SQL, performant et robuste)  
- **SQL avancé** : SELECT, JOIN, sous-requêtes, agrégations, vues, triggers, fonctions  
- **Méthodologie** : Merise pour analyse et modélisation  
- **Collaboration** : GitHub pour la gestion de versions  
- **Compétences transférables** : data analyst, data engineer, développeur backend  

---

## Missions

### Mission 1 : Analyse et modélisation Merise
**Objectif** : Identifier les entités et relations principales.  
**Entités principales** :  
- Véhicules électriques (types, statuts, caractéristiques)  
- Stations et bornes de recharge  
- Clients et techniciens  
- Locations et réservations  
- Paiements et transactions  
- Interventions de maintenance  

**Livrable attendu** :  
- Document PDF contenant :  
  - MCD (Modèle Conceptuel de Données)  
  - MLD (Modèle Logique de Données)  
  - Dictionnaire de données complet  

---

### Mission 2 : Création de la base PostgreSQL
**Objectif** : Implémenter la structure selon le MLD validé.  
**Étapes** :  
1. Créer les tables avec **PRIMARY KEY, FOREIGN KEY, CHECK, NOT NULL**  
2. Importer les données depuis le CSV fourni  
3. Générer des données test pour validation  

**Livrable attendu** :  
- `create_tables.sql` incluant la structure et les données test

---

### Mission 3 : Requêtes SQL avancées
**Objectif** : Maîtriser les requêtes SQL complexes pour la gestion et l’analyse des données.  
**Exemples de fonctionnalités** :  
1. **Requêtes de base** : SELECT, WHERE, JOIN  
2. **Agrégations** : COUNT, AVG, MAX  
3. **Sous-requêtes** : requêtes imbriquées  
4. **Vues** : simplifier l’accès aux données  
5. **Triggers** : automatiser la mise à jour des statuts des véhicules  
6. **Fonctions** : calculer le coût total selon durée et type de véhicule  

**Livrable attendu** :  
- `queries.sql` contenant au minimum 10 requêtes documentées  

---

### Missions 4 & 5 : Gestion de versions et documentation
- **GitHub** : dépôt partagé, commits réguliers et messages clairs  
- **Documentation professionnelle** : README, instructions d’installation, schéma de la base  

---

## Instructions de lancement
1. Installer **PostgreSQL** sur votre machine  
2. Exécuter le script `create_tables.sql` pour créer la base et importer les données  
3. Lancer les requêtes depuis `queries.sql` pour tester le fonctionnement  
4. Consulter les vues et fonctions pour vérifier les automatisations  

---

## Livrables
- Lien GitHub avec historique des commits  
- PDF MCD / MLD / dictionnaire de données  
- Scripts SQL : `create_tables.sql` et `queries.sql`  
- Support de présentation pour la démonstration (slides ou live)  

---

## Modalités de rendu
- **Date limite** : Mercredi 7 janvier 2026 à 23h59  
  - Retard : -2 points par jour  
- **Présentation orale** : Jeudi 8 janvier 2026  
  - 5 minutes de présentation + 5 minutes de questions  

---

## Remarques
Ce projet permet de développer des compétences en **gestion de données à grande échelle, SQL avancé, mobilité électrique et IoT**, tout en appliquant les bonnes pratiques de collaboration et documentation professionnelle.



Contexte du projet 

Ce projet a été réalisé dans le cadre du module SQL B2. L’objectif est de concevoir une base de données relationnelle sous PostgreSQL pour un système de location de véhicules électriques. 

La base de données permet de gérer : 
les véhicules et leurs types 
les stations et bornes de recharge 
les clients 
les réservations et locations 
les paiements 
les opérations de maintenance 

Schéma de la base de données 
La base de données a été conçue en suivant la méthode Merise, avec la réalisation d’un MCD puis d’un MLD. 


Elle est composée de 10 tables : 
station 
type_vehicule 
vehicule 
borne_recharge 
client 
technicien 
reservation 
location 
paiement 
maintenance 

Les relations entre les tables sont assurées par des clés étrangères, permettant de garantir l’intégrité des données (ex : un véhicule appartient à un type, une réservation est liée à un client, etc.). 

 
Instructions de lancement 

1. Création de la base de données 
Ouvrir pgAdmin 4 
Créer une base de données PostgreSQL 
Ouvrir le Query Tool 
Exécuter le script create_tables.sql

3. Import des données 
Les données de test sont fournies sous forme de fichiers CSV. L’import est réalisé via l’option Import/Export Data de pgAdmin. 

Ordre d’import recommandé : 
station 
type_vehicule 
client 
technicien 
vehicule 
borne_recharge 
reservation 
location 
paiement 
maintenance 

3. Vérification 
Après l’import, les données peuvent être vérifiées à l’aide de requêtes SELECT ou via l’option View/Edit Data dans pgAdmin.
