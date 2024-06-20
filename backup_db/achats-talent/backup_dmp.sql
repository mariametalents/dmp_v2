--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    numero_client character varying,
    agence character varying,
    civilite character varying,
    nom character varying,
    prenom character varying,
    profession character varying,
    adresse character varying,
    pays character varying,
    telephone character varying,
    email character varying,
    date_naissance character varying,
    lieu_naissance character varying,
    genre character varying,
    nationalite character varying,
    type_identification character varying,
    num_identification_national character varying,
    revenu_annuel character varying,
    numero_compte character varying,
    ville character varying
);


ALTER TABLE public.client OWNER TO jirauser;

--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (numero_client, agence, civilite, nom, prenom, profession, adresse, pays, telephone, email, date_naissance, lieu_naissance, genre, nationalite, type_identification, num_identification_national, revenu_annuel, numero_compte, ville) FROM stdin;
789013	Dakar	Mr	Diallo	Cherif	Developpeur	456 Avenue des Diomaye	Senegal	775265383	cherif.diallo@example.com	12/Oct/2024	Khombol	Homme	Senegalaise	Passeport	687654321	80000	1987654321	Dakar
789012	Dakar	Mme	Diallo	Khadija	Avocate	456 Avenue des Diomaye	Senegal	773265383	khadija.diallo@example.com	15/mai/24	Khombol	Femme	Senegalaise	Passeport	987654321	80000	0987654321	Dakar
\.


--
-- PostgreSQL database dump complete
--

