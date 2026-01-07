# projet_SQL_b2

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
