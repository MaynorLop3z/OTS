--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-05-11 23:11:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2013 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 16786)
-- Name: Empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Empresas" (
    "IdEmpresa" integer NOT NULL,
    "Nombre" character varying(60) NOT NULL,
    "BDName" character varying(30)
);


ALTER TABLE "Empresas" OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16789)
-- Name: Empresas_IdEmpresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Empresas_IdEmpresa_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Empresas_IdEmpresa_seq" OWNER TO postgres;

--
-- TOC entry 2014 (class 0 OID 0)
-- Dependencies: 174
-- Name: Empresas_IdEmpresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Empresas_IdEmpresa_seq" OWNED BY "Empresas"."IdEmpresa";


--
-- TOC entry 176 (class 1259 OID 16796)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Usuarios" (
    "IdUsuario" integer NOT NULL,
    "Nombre" character varying(30) NOT NULL,
    "Alias" character varying(15) NOT NULL,
    "Password" character varying(15)
);


ALTER TABLE "Usuarios" OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16794)
-- Name: Usuarios_IdUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Usuarios_IdUsuario_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Usuarios_IdUsuario_seq" OWNER TO postgres;

--
-- TOC entry 2015 (class 0 OID 0)
-- Dependencies: 175
-- Name: Usuarios_IdUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Usuarios_IdUsuario_seq" OWNED BY "Usuarios"."IdUsuario";


--
-- TOC entry 1887 (class 2604 OID 16791)
-- Name: IdEmpresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Empresas" ALTER COLUMN "IdEmpresa" SET DEFAULT nextval('"Empresas_IdEmpresa_seq"'::regclass);


--
-- TOC entry 1888 (class 2604 OID 16799)
-- Name: IdUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Usuarios" ALTER COLUMN "IdUsuario" SET DEFAULT nextval('"Usuarios_IdUsuario_seq"'::regclass);


--
-- TOC entry 2002 (class 0 OID 16786)
-- Dependencies: 173
-- Data for Name: Empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Empresas" ("IdEmpresa", "Nombre", "BDName") FROM stdin;
2	Pizza Hut	PizzaHut
1	Buffalo Wings	BuffaloWings
3	China Wok	ChinaWok
4	Burger King	BurgerKing
\.


--
-- TOC entry 2016 (class 0 OID 0)
-- Dependencies: 174
-- Name: Empresas_IdEmpresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Empresas_IdEmpresa_seq"', 4, true);


--
-- TOC entry 2005 (class 0 OID 16796)
-- Dependencies: 176
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Usuarios" ("IdUsuario", "Nombre", "Alias", "Password") FROM stdin;
1	Maynor Lopez	mlopez	d3m3nc14
2	Immer Rojas	irojas	1234
\.


--
-- TOC entry 2017 (class 0 OID 0)
-- Dependencies: 175
-- Name: Usuarios_IdUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Usuarios_IdUsuario_seq"', 2, true);


--
-- TOC entry 1890 (class 2606 OID 16793)
-- Name: PK-Empresa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Empresas"
    ADD CONSTRAINT "PK-Empresa" PRIMARY KEY ("IdEmpresa");


--
-- TOC entry 1892 (class 2606 OID 16801)
-- Name: PK_Usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Usuarios"
    ADD CONSTRAINT "PK_Usuarios" PRIMARY KEY ("IdUsuario");


--
-- TOC entry 2012 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-05-11 23:11:58

--
-- PostgreSQL database dump complete
--

