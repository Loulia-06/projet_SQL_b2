
--
-- PostgreSQL database dump
--

\restrict FOzOPayPhz1E2JHxLkwu4QDCRmVc7ffX1gqpsPh8rKVB7a3dmLVjTcCs3XI2Ra0

-- Dumped from database version 18.1 (Postgres.app)
-- Dumped by pg_dump version 18.0

-- Started on 2026-01-07 16:20:29 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 18518)
-- Name: borne_recharge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.borne_recharge (
    id_borne integer NOT NULL,
    code_borne character varying(100) NOT NULL,
    puissance_kw integer,
    statut character varying(30) NOT NULL,
    id_station integer NOT NULL,
    CONSTRAINT ck_borne_recharge_puissance CHECK ((puissance_kw > 0)),
    CONSTRAINT ck_borne_recharge_statut CHECK (((statut)::text = ANY ((ARRAY['active'::character varying, 'hors_service'::character varying, 'en_maintenance'::character varying])::text[])))
);


ALTER TABLE public.borne_recharge OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18517)
-- Name: borne_recharge_id_borne_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.borne_recharge_id_borne_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.borne_recharge_id_borne_seq OWNER TO postgres;

--
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 229
-- Name: borne_recharge_id_borne_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.borne_recharge_id_borne_seq OWNED BY public.borne_recharge.id_borne;


--
-- TOC entry 226 (class 1259 OID 18498)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    telephone character varying(20),
    date_inscription date NOT NULL,
    statut_compte character varying(30) NOT NULL,
    permis_valide boolean NOT NULL,
    CONSTRAINT ck_client_statut_compte CHECK (((statut_compte)::text = ANY ((ARRAY['actif'::character varying, 'bloque'::character varying, 'supprime'::character varying])::text[])))
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18497)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_id_client_seq OWNER TO postgres;

--
-- TOC entry 3934 (class 0 OID 0)
-- Dependencies: 225
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 234 (class 1259 OID 18534)
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    id_location integer NOT NULL,
    date_heure_debut_reelle timestamp without time zone NOT NULL,
    date_heure_fin_reelle timestamp without time zone,
    duree_minutes integer,
    km_parcourus integer,
    cout_total numeric(10,2) NOT NULL,
    statut character varying(30),
    id_reservation integer NOT NULL,
    CONSTRAINT ck_location_cout CHECK ((cout_total >= (0)::numeric)),
    CONSTRAINT ck_location_duree CHECK ((duree_minutes >= 0)),
    CONSTRAINT ck_location_km CHECK ((km_parcourus >= 0)),
    CONSTRAINT ck_location_statut CHECK (((statut)::text = ANY ((ARRAY['en_cours'::character varying, 'terminee'::character varying, 'en_retard'::character varying])::text[])))
);


ALTER TABLE public.location OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18533)
-- Name: location_id_location_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_id_location_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.location_id_location_seq OWNER TO postgres;

--
-- TOC entry 3935 (class 0 OID 0)
-- Dependencies: 233
-- Name: location_id_location_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_id_location_seq OWNED BY public.location.id_location;


--
-- TOC entry 238 (class 1259 OID 18550)
-- Name: maintenance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintenance (
    id_maintenance integer NOT NULL,
    date_heure_debut timestamp without time zone NOT NULL,
    date_heure_fin timestamp without time zone NOT NULL,
    type_maintenance character varying(30),
    description text NOT NULL,
    cout_maintenance numeric(10,2) NOT NULL,
    statut character varying(30),
    id_vehicule integer,
    id_technicien integer,
    CONSTRAINT ck_maintenance_cout CHECK ((cout_maintenance >= (0)::numeric)),
    CONSTRAINT ck_maintenance_statut CHECK (((statut)::text = ANY ((ARRAY['planifiee'::character varying, 'en_cours'::character varying, 'terminee'::character varying])::text[]))),
    CONSTRAINT ck_maintenance_type CHECK (((type_maintenance)::text = ANY ((ARRAY['preventive'::character varying, 'corrective'::character varying])::text[])))
);


ALTER TABLE public.maintenance OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18549)
-- Name: maintenance_id_maintenance_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintenance_id_maintenance_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maintenance_id_maintenance_seq OWNER TO postgres;

--
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 237
-- Name: maintenance_id_maintenance_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_id_maintenance_seq OWNED BY public.maintenance.id_maintenance;


--
-- TOC entry 236 (class 1259 OID 18542)
-- Name: paiement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paiement (
    id_paiement integer NOT NULL,
    date_paiement timestamp without time zone NOT NULL,
    montant numeric(10,2),
    moyen_paiement character varying(30) NOT NULL,
    statut_paiement character varying(30) NOT NULL,
    id_location integer,
    CONSTRAINT ck_paiement_montant CHECK ((montant >= (0)::numeric)),
    CONSTRAINT ck_paiement_moyen CHECK (((moyen_paiement)::text = ANY ((ARRAY['cb'::character varying, 'paypal'::character varying])::text[]))),
    CONSTRAINT ck_paiement_statut CHECK (((statut_paiement)::text = ANY ((ARRAY['recu'::character varying, 'en_attente'::character varying, 'refuse'::character varying, 'rembourse'::character varying])::text[])))
);


ALTER TABLE public.paiement OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18541)
-- Name: paiement_id_paiement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paiement_id_paiement_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paiement_id_paiement_seq OWNER TO postgres;

--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 235
-- Name: paiement_id_paiement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paiement_id_paiement_seq OWNED BY public.paiement.id_paiement;


--
-- TOC entry 232 (class 1259 OID 18526)
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id_reservation integer NOT NULL,
    date_heure_debut_prevue timestamp without time zone NOT NULL,
    date_heure_fin_prevue timestamp without time zone NOT NULL,
    date_creation timestamp without time zone NOT NULL,
    statut character varying(30) NOT NULL,
    id_client integer,
    id_vehicule integer,
    CONSTRAINT ck_reservation_dates CHECK ((date_heure_fin_prevue > date_heure_debut_prevue)),
    CONSTRAINT ck_reservation_statut CHECK (((statut)::text = ANY ((ARRAY['en_attente'::character varying, 'confirmee'::character varying, 'annulee'::character varying, 'expiree'::character varying])::text[])))
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18525)
-- Name: reservation_id_reservation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_id_reservation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservation_id_reservation_seq OWNER TO postgres;

--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 231
-- Name: reservation_id_reservation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_id_reservation_seq OWNED BY public.reservation.id_reservation;


--
-- TOC entry 224 (class 1259 OID 18490)
-- Name: station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station (
    id_station integer NOT NULL,
    nom_station character varying(100) NOT NULL,
    adresse character varying(255) NOT NULL,
    ville character varying(100) NOT NULL
);


ALTER TABLE public.station OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18489)
-- Name: station_id_station_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.station_id_station_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.station_id_station_seq OWNER TO postgres;

--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 223
-- Name: station_id_station_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.station_id_station_seq OWNED BY public.station.id_station;


--
-- TOC entry 228 (class 1259 OID 18508)
-- Name: technicien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.technicien (
    id_technicien integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    telephone character varying(20),
    zone_intervention character varying(255)
);


ALTER TABLE public.technicien OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18507)
-- Name: technicien_id_technicien_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.technicien_id_technicien_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.technicien_id_technicien_seq OWNER TO postgres;

--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 227
-- Name: technicien_id_technicien_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.technicien_id_technicien_seq OWNED BY public.technicien.id_technicien;


--
-- TOC entry 222 (class 1259 OID 18481)
-- Name: type_vehicule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_vehicule (
    id_type integer NOT NULL,
    libelle character varying(50) NOT NULL,
    tarif_minute numeric(10,2),
    autonomie_theorique_km integer,
    CONSTRAINT ck_libelle CHECK (((libelle)::text = ANY ((ARRAY['voiture'::character varying, 'scooter'::character varying, 'trottinette'::character varying, 'vélo_électrique'::character varying])::text[]))),
    CONSTRAINT ck_type_vehicule_autonomie CHECK ((autonomie_theorique_km >= 0)),
    CONSTRAINT ck_type_vehicule_tarif_minute CHECK ((tarif_minute >= (0)::numeric))
);


ALTER TABLE public.type_vehicule OWNER TO postgres;

--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN type_vehicule.libelle; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.type_vehicule.libelle IS 'Nom du type de véhicule (ex : voiture, scooter, trottinette, vélo_électrique)';


--
-- TOC entry 221 (class 1259 OID 18480)
-- Name: type_vehicule_id_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_vehicule_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_vehicule_id_type_seq OWNER TO postgres;

--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 221
-- Name: type_vehicule_id_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_vehicule_id_type_seq OWNED BY public.type_vehicule.id_type;


--
-- TOC entry 220 (class 1259 OID 18472)
-- Name: vehicule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicule (
    id_vehicule integer NOT NULL,
    numero_serie character varying(100) NOT NULL,
    marque character varying(100) NOT NULL,
    modele character varying(100) NOT NULL,
    date_mise_en_service date NOT NULL,
    kilometrage_km integer NOT NULL,
    niveau_batterie_pct integer NOT NULL,
    statut character varying(50) NOT NULL,
    id_type integer,
    id_station integer,
    CONSTRAINT ck_niveau_batterie_pct CHECK (((niveau_batterie_pct >= 0) AND (niveau_batterie_pct <= 100))),
    CONSTRAINT ck_statut CHECK (((statut)::text = ANY ((ARRAY['disponible'::character varying, 'reserve'::character varying, 'en_location'::character varying, 'en_maintenance'::character varying, 'hors_service'::character varying])::text[]))),
    CONSTRAINT ck_vehicule_kilometrage CHECK ((kilometrage_km >= 0))
);


ALTER TABLE public.vehicule OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18471)
-- Name: vehicule_id_vehicule_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicule_id_vehicule_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicule_id_vehicule_seq OWNER TO postgres;

--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 219
-- Name: vehicule_id_vehicule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicule_id_vehicule_seq OWNED BY public.vehicule.id_vehicule;


--
-- TOC entry 3720 (class 2604 OID 18521)
-- Name: borne_recharge id_borne; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borne_recharge ALTER COLUMN id_borne SET DEFAULT nextval('public.borne_recharge_id_borne_seq'::regclass);


--
-- TOC entry 3718 (class 2604 OID 18501)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 3722 (class 2604 OID 18537)
-- Name: location id_location; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location ALTER COLUMN id_location SET DEFAULT nextval('public.location_id_location_seq'::regclass);


--
-- TOC entry 3724 (class 2604 OID 18553)
-- Name: maintenance id_maintenance; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance ALTER COLUMN id_maintenance SET DEFAULT nextval('public.maintenance_id_maintenance_seq'::regclass);


--
-- TOC entry 3723 (class 2604 OID 18545)
-- Name: paiement id_paiement; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement ALTER COLUMN id_paiement SET DEFAULT nextval('public.paiement_id_paiement_seq'::regclass);


--
-- TOC entry 3721 (class 2604 OID 18529)
-- Name: reservation id_reservation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation ALTER COLUMN id_reservation SET DEFAULT nextval('public.reservation_id_reservation_seq'::regclass);


--
-- TOC entry 3717 (class 2604 OID 18493)
-- Name: station id_station; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station ALTER COLUMN id_station SET DEFAULT nextval('public.station_id_station_seq'::regclass);


--
-- TOC entry 3719 (class 2604 OID 18511)
-- Name: technicien id_technicien; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technicien ALTER COLUMN id_technicien SET DEFAULT nextval('public.technicien_id_technicien_seq'::regclass);


--
-- TOC entry 3716 (class 2604 OID 18484)
-- Name: type_vehicule id_type; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_vehicule ALTER COLUMN id_type SET DEFAULT nextval('public.type_vehicule_id_type_seq'::regclass);


--
-- TOC entry 3715 (class 2604 OID 18475)
-- Name: vehicule id_vehicule; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule ALTER COLUMN id_vehicule SET DEFAULT nextval('public.vehicule_id_vehicule_seq'::regclass);


--
-- TOC entry 3753 (class 2606 OID 18506)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 3767 (class 2606 OID 18540)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id_location);


--
-- TOC entry 3771 (class 2606 OID 18558)
-- Name: maintenance maintenance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance
    ADD CONSTRAINT maintenance_pkey PRIMARY KEY (id_maintenance);


--
-- TOC entry 3769 (class 2606 OID 18548)
-- Name: paiement paiement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT paiement_pkey PRIMARY KEY (id_paiement);


--
-- TOC entry 3761 (class 2606 OID 18524)
-- Name: borne_recharge pk_borne_recharge; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borne_recharge
    ADD CONSTRAINT pk_borne_recharge PRIMARY KEY (id_borne);


--
-- TOC entry 3749 (class 2606 OID 18488)
-- Name: type_vehicule pk_type_vehicule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_vehicule
    ADD CONSTRAINT pk_type_vehicule PRIMARY KEY (id_type);


--
-- TOC entry 3747 (class 2606 OID 18478)
-- Name: vehicule pk_vehicule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT pk_vehicule PRIMARY KEY (id_vehicule);


--
-- TOC entry 3765 (class 2606 OID 18532)
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id_reservation);


--
-- TOC entry 3751 (class 2606 OID 18496)
-- Name: station station_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (id_station);


--
-- TOC entry 3757 (class 2606 OID 18611)
-- Name: technicien technicien_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technicien
    ADD CONSTRAINT technicien_email_unique UNIQUE (email);


--
-- TOC entry 3759 (class 2606 OID 18516)
-- Name: technicien technicien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technicien
    ADD CONSTRAINT technicien_pkey PRIMARY KEY (id_technicien);


--
-- TOC entry 3763 (class 2606 OID 18590)
-- Name: borne_recharge uq_borne_recharge_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borne_recharge
    ADD CONSTRAINT uq_borne_recharge_code UNIQUE (code_borne);


--
-- TOC entry 3755 (class 2606 OID 18605)
-- Name: client uq_client_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uq_client_email UNIQUE (email);


--
-- TOC entry 3775 (class 2606 OID 18664)
-- Name: reservation fk_id_client; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_id_client FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 3778 (class 2606 OID 18659)
-- Name: paiement fk_id_location; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paiement
    ADD CONSTRAINT fk_id_location FOREIGN KEY (id_location) REFERENCES public.location(id_location);


--
-- TOC entry 3777 (class 2606 OID 18654)
-- Name: location fk_id_reservation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT fk_id_reservation FOREIGN KEY (id_reservation) REFERENCES public.reservation(id_reservation);


--
-- TOC entry 3779 (class 2606 OID 18644)
-- Name: maintenance fk_id_technicien; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance
    ADD CONSTRAINT fk_id_technicien FOREIGN KEY (id_technicien) REFERENCES public.technicien(id_technicien);


--
-- TOC entry 3780 (class 2606 OID 18639)
-- Name: maintenance fk_id_vehicule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance
    ADD CONSTRAINT fk_id_vehicule FOREIGN KEY (id_vehicule) REFERENCES public.vehicule(id_vehicule);


--
-- TOC entry 3776 (class 2606 OID 18649)
-- Name: reservation fk_id_vehicule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_id_vehicule FOREIGN KEY (id_vehicule) REFERENCES public.vehicule(id_vehicule);


--
-- TOC entry 3772 (class 2606 OID 18575)
-- Name: vehicule fk_station; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT fk_station FOREIGN KEY (id_station) REFERENCES public.station(id_station);


--
-- TOC entry 3774 (class 2606 OID 18593)
-- Name: borne_recharge fk_station; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.borne_recharge
    ADD CONSTRAINT fk_station FOREIGN KEY (id_station) REFERENCES public.station(id_station);


--
-- TOC entry 3773 (class 2606 OID 18560)
-- Name: vehicule fk_vehicule_type; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT fk_vehicule_type FOREIGN KEY (id_type) REFERENCES public.type_vehicule(id_type);


-- Completed on 2026-01-07 16:20:29 CET

--
-- PostgreSQL database dump complete
--

\unrestrict FOzOPayPhz1E2JHxLkwu4QDCRmVc7ffX1gqpsPh8rKVB7a3dmLVjTcCs3XI2Ra0

