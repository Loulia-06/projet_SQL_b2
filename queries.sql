Requêtes de base : 

SELECT v.marque, v.modele, v.numero_serie, s.ville  

FROM public.vehicule v 

JOIN public.station s ON v.id_station = s.id_station 

WHERE v.statut = 'disponible'; 

  

SELECT c.nom, c.prenom, r.date_heure_debut_prevue, v.modele AS voiture_reservee 

FROM public.client c 

JOIN public.reservation r ON c.id_client = r.id_client 

JOIN public.vehicule v ON r.id_vehicule = v.id_vehicule 

WHERE c.email = 'lucas.martin@email.com'; 

 

Agrégations 

 

SELECT s.ville, COUNT(v.id_vehicule) AS nombre_de_voitures 

FROM public.station s 

LEFT JOIN public.vehicule v ON s.id_station = v.id_station 

GROUP BY s.ville; 

  

SELECT AVG(cout_total) AS panier_moyen, MAX(cout_total) AS plus_grosse_location, SUM(cout_total) AS chiffre_affaires_total 

FROM public.location 

WHERE statut = 'terminee'; 

 

Sous-requêtes 

 

SELECT marque, modele, kilometrage_km  

FROM public.vehicule  

WHERE kilometrage_km > (SELECT AVG(kilometrage_km) FROM public.vehicule); 

  

SELECT nom, prenom, email  

FROM public.client  

WHERE id_client IN ( 

    SELECT id_client  

    FROM public.reservation  

    GROUP BY id_client  

    HAVING COUNT(id_reservation) > 1 

); 

 

 

Vues 

 

CREATE VIEW vue_etat_flotte AS 

SELECT s.ville, v.statut, COUNT(v.id_vehicule) as total 

FROM public.vehicule v 

JOIN public.station s ON v.id_station = s.id_station 

GROUP BY s.ville, v.statut; 

  

CREATE VIEW vue_resume_locations AS 

SELECT l.id_location, c.nom, v.modele, l.cout_total, l.statut 

FROM public.location l 

JOIN public.reservation r ON l.id_reservation = r.id_reservation 

JOIN public.client c ON r.id_client = c.id_client 

JOIN public.vehicule v ON r.id_vehicule = v.id_vehicule; 

 

 

 

 

 

 

 

 

 

 

Triggers 

 

CREATE OR REPLACE FUNCTION maj_statut_vehicule_disponible() 

RETURNS TRIGGER AS $$ 

BEGIN 

    UPDATE public.vehicule 

    SET statut = 'disponible' 

    WHERE id_vehicule = ( 

        SELECT id_vehicule  

        FROM public.reservation  

        WHERE id_reservation = NEW.id_reservation 

    ); 

    RETURN NEW; 

END; 

$$ LANGUAGE plpgsql; 

  

CREATE TRIGGER trigger_fin_location 

AFTER UPDATE OF statut ON public.location 

FOR EACH ROW 

WHEN (NEW.statut = 'terminee') 

EXECUTE FUNCTION maj_statut_vehicule_disponible(); 

 

 

Fonctions 

CREATE OR REPLACE FUNCTION calculer_cout_location(p_duree_min INT, p_id_type INT) 

RETURNS NUMERIC(10,2) AS $$ 

DECLARE 

    v_tarif_minute NUMERIC(10,2); 

BEGIN 

    SELECT tarif_minute INTO v_tarif_minute  

    FROM public.type_vehicule  

    WHERE id_type = p_id_type; 

  

    RETURN p_duree_min * v_tarif_minute; 

END; 

SELECT v.numero_serie, v.marque, v.modele
FROM vehicule v
JOIN station s ON v.id_station = s.id_station
WHERE s.ville = 'Lyon'
AND v.statut = 'disponible';

SELECT s.ville, COUNT(v.id_vehicule) AS nb_vehicules
FROM station s
LEFT JOIN vehicule v ON v.id_station = s.id_station
GROUP BY s.ville
ORDER BY nb_vehicules DESC;

SELECT
    s.ville,
    COUNT(DISTINCT v.id_vehicule) AS nb_vehicules,
    COUNT(r.id_reservation) AS nb_reservations
FROM station s
JOIN vehicule v ON v.id_station = s.id_station
LEFT JOIN reservation r ON r.id_vehicule = v.id_vehicule
GROUP BY s.ville
ORDER BY nb_reservations DESC;

SELECT
    s.ville,
    COUNT(*) AS nb_vehicules_disponibles
FROM vehicule v
JOIN station s ON s.id_station = v.id_station
WHERE v.etat = 'Disponible'
GROUP BY s.ville
ORDER BY nb_vehicules_disponibles DESC;


$$ LANGUAGE plpgsql; 
