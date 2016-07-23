--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-07-22 16:41:27

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
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 213 (class 1255 OID 16710)
-- Name: getdetailorder(numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION getdetailorder(codigo numeric) RETURNS TABLE(iddetail integer, nameproduct character varying, dscription character varying, namesauce character varying, namespicy character varying, quantity integer, unitprice double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
 RETURN QUERY SELECT  
  "T0"."IdDetail",
  (SELECT "T1"."NameProduct" FROM "Products" "T1" WHERE "T1"."IdProduct" = "T0"."IdProduct") AS "NameProduct",
  (SELECT "T1"."Dscription" FROM "Products" "T1" WHERE "T1"."IdProduct" = "T0"."IdProduct") AS "Dscription",
  (SELECT COALESCE("T2"."NameSauce",'') FROM "Sauce" "T2" WHERE "T2"."IdSauce" = "T0"."IdSauce") AS "NameSauce",
  (SELECT COALESCE("T3"."NameSpicy",'') FROM "Spicy" "T3" WHERE "T3"."IdSpicy" = "T0"."IdSpicy") AS "NameSpicy",
  "T0"."Quantity", 
  "T0"."UnitPrice"
FROM 
  "DetailOrder" "T0"
WHERE "T0"."IdOrder" = codigo;
END; $$;


ALTER FUNCTION public.getdetailorder(codigo numeric) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 16711)
-- Name: Agency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Agency" (
    "IdAgency" integer NOT NULL,
    "Name" character varying(150) NOT NULL
);


ALTER TABLE "Agency" OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16714)
-- Name: Agency_IdAgency_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Agency_IdAgency_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Agency_IdAgency_seq" OWNER TO postgres;

--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 174
-- Name: Agency_IdAgency_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Agency_IdAgency_seq" OWNED BY "Agency"."IdAgency";


--
-- TOC entry 175 (class 1259 OID 16716)
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Category" (
    "IdCategory" integer NOT NULL,
    "NameCategory" character varying NOT NULL,
    "Bunch" boolean NOT NULL,
    "SortIndex" integer NOT NULL
);


ALTER TABLE "Category" OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16722)
-- Name: Category_IdCategory_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Category_IdCategory_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Category_IdCategory_seq" OWNER TO postgres;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 176
-- Name: Category_IdCategory_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Category_IdCategory_seq" OWNED BY "Category"."IdCategory";


--
-- TOC entry 196 (class 1259 OID 17243)
-- Name: Coverage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Coverage" (
    "IdCoverage" integer NOT NULL,
    "Name" character varying(200) NOT NULL,
    "IdAgency" integer NOT NULL
);


ALTER TABLE "Coverage" OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 17241)
-- Name: Coverage_IdCoverage_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Coverage_IdCoverage_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Coverage_IdCoverage_seq" OWNER TO postgres;

--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 195
-- Name: Coverage_IdCoverage_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Coverage_IdCoverage_seq" OWNED BY "Coverage"."IdCoverage";


--
-- TOC entry 177 (class 1259 OID 16724)
-- Name: DetailOrder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "DetailOrder" (
    "IdDetail" integer NOT NULL,
    "IdProduct" integer NOT NULL,
    "Quantity" integer NOT NULL,
    "UnitPrice" double precision NOT NULL,
    "IdOrder" integer NOT NULL,
    "Comment" character varying(30)
);


ALTER TABLE "DetailOrder" OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16727)
-- Name: DetailOrder_IdDetail_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DetailOrder_IdDetail_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DetailOrder_IdDetail_seq" OWNER TO postgres;

--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 178
-- Name: DetailOrder_IdDetail_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "DetailOrder_IdDetail_seq" OWNED BY "DetailOrder"."IdDetail";


--
-- TOC entry 194 (class 1259 OID 17235)
-- Name: DetailSauces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "DetailSauces" (
    "IdDSauces" integer NOT NULL,
    "IdDetail" integer NOT NULL,
    "IdSauce" integer NOT NULL,
    "IdSpicy" integer
);


ALTER TABLE "DetailSauces" OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 17233)
-- Name: DetailSauces_IdDSauces_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "DetailSauces_IdDSauces_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DetailSauces_IdDSauces_seq" OWNER TO postgres;

--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 193
-- Name: DetailSauces_IdDSauces_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "DetailSauces_IdDSauces_seq" OWNED BY "DetailSauces"."IdDSauces";


--
-- TOC entry 179 (class 1259 OID 16729)
-- Name: Empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Empresas" (
    "IdEmpresa" integer NOT NULL,
    "Nombre" character varying(60) NOT NULL,
    "BDName" character varying(30)
);


ALTER TABLE "Empresas" OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16732)
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
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 180
-- Name: Empresas_IdEmpresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Empresas_IdEmpresa_seq" OWNED BY "Empresas"."IdEmpresa";


--
-- TOC entry 198 (class 1259 OID 17259)
-- Name: Motorizados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Motorizados" (
    "IdMotorizado" integer NOT NULL,
    "Nombre" character varying(100) NOT NULL,
    "IdAgency" integer NOT NULL
);


ALTER TABLE "Motorizados" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17257)
-- Name: Motorizados_IdMotorizado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Motorizados_IdMotorizado_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Motorizados_IdMotorizado_seq" OWNER TO postgres;

--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 197
-- Name: Motorizados_IdMotorizado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Motorizados_IdMotorizado_seq" OWNED BY "Motorizados"."IdMotorizado";


--
-- TOC entry 181 (class 1259 OID 16734)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Order" (
    "IdOrder" integer NOT NULL,
    "NumberClient" character varying(9) NOT NULL,
    "NameClient" character varying(50) NOT NULL,
    "DirectionClient" character varying(300) NOT NULL,
    "Comments" character varying(500),
    "IdAgency" integer,
    "CreationDate" date NOT NULL,
    "Status" integer NOT NULL,
    "CreationTime" time without time zone NOT NULL,
    "DispatchTime" time without time zone,
    "Total" double precision,
    "IdUsuario" integer,
    "NumRef" character varying(50),
    "IdMotorizado" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "Order" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16740)
-- Name: Order_IdOrder_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Order_IdOrder_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Order_IdOrder_seq" OWNER TO postgres;

--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 182
-- Name: Order_IdOrder_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Order_IdOrder_seq" OWNED BY "Order"."IdOrder";


--
-- TOC entry 183 (class 1259 OID 16742)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Products" (
    "IdProduct" integer NOT NULL,
    "NameProduct" character varying NOT NULL,
    "Dscription" character varying NOT NULL,
    "Type" integer NOT NULL,
    "Sauce" boolean NOT NULL,
    "Price" double precision NOT NULL,
    "IdCategory" integer NOT NULL,
    "State" integer,
    "Garniture" boolean DEFAULT false NOT NULL,
    "SauceQuantity" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "Products" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16748)
-- Name: Products_IdProduct_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Products_IdProduct_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Products_IdProduct_seq" OWNER TO postgres;

--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 184
-- Name: Products_IdProduct_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Products_IdProduct_seq" OWNED BY "Products"."IdProduct";


--
-- TOC entry 185 (class 1259 OID 16750)
-- Name: Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Rol" (
    "IdRol" integer NOT NULL,
    "RolName" character varying(25) NOT NULL
);


ALTER TABLE "Rol" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16753)
-- Name: Rol_IdRol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Rol_IdRol_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Rol_IdRol_seq" OWNER TO postgres;

--
-- TOC entry 2165 (class 0 OID 0)
-- Dependencies: 186
-- Name: Rol_IdRol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Rol_IdRol_seq" OWNED BY "Rol"."IdRol";


--
-- TOC entry 187 (class 1259 OID 16755)
-- Name: Sauce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Sauce" (
    "IdSauce" integer NOT NULL,
    "NameSauce" character varying NOT NULL
);


ALTER TABLE "Sauce" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16761)
-- Name: Sauce_IdSauce_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sauce_IdSauce_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Sauce_IdSauce_seq" OWNER TO postgres;

--
-- TOC entry 2166 (class 0 OID 0)
-- Dependencies: 188
-- Name: Sauce_IdSauce_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sauce_IdSauce_seq" OWNED BY "Sauce"."IdSauce";


--
-- TOC entry 189 (class 1259 OID 16763)
-- Name: Spicy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Spicy" (
    "IdSpicy" integer NOT NULL,
    "NameSpicy" character varying NOT NULL
);


ALTER TABLE "Spicy" OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16769)
-- Name: Spicy_IdSpicy_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Spicy_IdSpicy_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Spicy_IdSpicy_seq" OWNER TO postgres;

--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 190
-- Name: Spicy_IdSpicy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Spicy_IdSpicy_seq" OWNED BY "Spicy"."IdSpicy";


--
-- TOC entry 200 (class 1259 OID 17267)
-- Name: Status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Status" (
    "IdStatus" integer NOT NULL,
    "StatusDescription" character varying NOT NULL
);


ALTER TABLE "Status" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 17265)
-- Name: Status_IdStatus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Status_IdStatus_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Status_IdStatus_seq" OWNER TO postgres;

--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 199
-- Name: Status_IdStatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Status_IdStatus_seq" OWNED BY "Status"."IdStatus";


--
-- TOC entry 191 (class 1259 OID 16771)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Usuarios" (
    "IdUsuario" integer NOT NULL,
    "Nombre" character varying(30) NOT NULL,
    "Alias" character varying(15) NOT NULL,
    "Password" character varying(15),
    "IdRol" integer NOT NULL,
    "IdAgency" integer
);


ALTER TABLE "Usuarios" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16774)
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
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 192
-- Name: Usuarios_IdUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Usuarios_IdUsuario_seq" OWNED BY "Usuarios"."IdUsuario";


--
-- TOC entry 1966 (class 2604 OID 16776)
-- Name: IdAgency; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Agency" ALTER COLUMN "IdAgency" SET DEFAULT nextval('"Agency_IdAgency_seq"'::regclass);


--
-- TOC entry 1967 (class 2604 OID 16777)
-- Name: IdCategory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Category" ALTER COLUMN "IdCategory" SET DEFAULT nextval('"Category_IdCategory_seq"'::regclass);


--
-- TOC entry 1980 (class 2604 OID 17246)
-- Name: IdCoverage; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Coverage" ALTER COLUMN "IdCoverage" SET DEFAULT nextval('"Coverage_IdCoverage_seq"'::regclass);


--
-- TOC entry 1968 (class 2604 OID 16778)
-- Name: IdDetail; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DetailOrder" ALTER COLUMN "IdDetail" SET DEFAULT nextval('"DetailOrder_IdDetail_seq"'::regclass);


--
-- TOC entry 1979 (class 2604 OID 17238)
-- Name: IdDSauces; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DetailSauces" ALTER COLUMN "IdDSauces" SET DEFAULT nextval('"DetailSauces_IdDSauces_seq"'::regclass);


--
-- TOC entry 1969 (class 2604 OID 16779)
-- Name: IdEmpresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Empresas" ALTER COLUMN "IdEmpresa" SET DEFAULT nextval('"Empresas_IdEmpresa_seq"'::regclass);


--
-- TOC entry 1981 (class 2604 OID 17262)
-- Name: IdMotorizado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Motorizados" ALTER COLUMN "IdMotorizado" SET DEFAULT nextval('"Motorizados_IdMotorizado_seq"'::regclass);


--
-- TOC entry 1970 (class 2604 OID 16780)
-- Name: IdOrder; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Order" ALTER COLUMN "IdOrder" SET DEFAULT nextval('"Order_IdOrder_seq"'::regclass);


--
-- TOC entry 1972 (class 2604 OID 16781)
-- Name: IdProduct; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Products" ALTER COLUMN "IdProduct" SET DEFAULT nextval('"Products_IdProduct_seq"'::regclass);


--
-- TOC entry 1975 (class 2604 OID 16782)
-- Name: IdRol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Rol" ALTER COLUMN "IdRol" SET DEFAULT nextval('"Rol_IdRol_seq"'::regclass);


--
-- TOC entry 1976 (class 2604 OID 16783)
-- Name: IdSauce; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sauce" ALTER COLUMN "IdSauce" SET DEFAULT nextval('"Sauce_IdSauce_seq"'::regclass);


--
-- TOC entry 1977 (class 2604 OID 16784)
-- Name: IdSpicy; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Spicy" ALTER COLUMN "IdSpicy" SET DEFAULT nextval('"Spicy_IdSpicy_seq"'::regclass);


--
-- TOC entry 1982 (class 2604 OID 17270)
-- Name: IdStatus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Status" ALTER COLUMN "IdStatus" SET DEFAULT nextval('"Status_IdStatus_seq"'::regclass);


--
-- TOC entry 1978 (class 2604 OID 16785)
-- Name: IdUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Usuarios" ALTER COLUMN "IdUsuario" SET DEFAULT nextval('"Usuarios_IdUsuario_seq"'::regclass);


--
-- TOC entry 2120 (class 0 OID 16711)
-- Dependencies: 173
-- Data for Name: Agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Agency" ("IdAgency", "Name") FROM stdin;
1	Delivery Masferrer
2	Delivery Multiplaza
3	Delivery Las Palmas
\.


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 174
-- Name: Agency_IdAgency_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Agency_IdAgency_seq"', 4, true);


--
-- TOC entry 2122 (class 0 OID 16716)
-- Dependencies: 175
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Category" ("IdCategory", "NameCategory", "Bunch", "SortIndex") FROM stdin;
1	Promociones	f	1
3	Extras	f	99
4	Wings	f	2
5	Chunks	f	3
6	Papas	f	4
7	Ensaladas	f	5
8	Hamburguesas	f	6
9	Postres	f	7
10	A picar	f	8
11	Combos	f	9
12	Favoritos	f	10
\.


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 176
-- Name: Category_IdCategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Category_IdCategory_seq"', 12, true);


--
-- TOC entry 2143 (class 0 OID 17243)
-- Dependencies: 196
-- Data for Name: Coverage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Coverage" ("IdCoverage", "Name", "IdAgency") FROM stdin;
1	RES. MONTES VERDES	2
2	ALAMEDA MANUEL ENRIQUE ARAUJO	2
3	ALTOS DE SAN FRANCISCO	2
4	ANTIGUO CUSCATLAN	2
5	ARCOS DE SANTA ELENA	2
6	ARCOS DE SANTA ELENA SEGUNDA ETAPA	2
7	ARCOS DEL CARMEN (STA TECLA)	2
8	AVENIDA LAS DALIAS	2
9	BOSQUES  DE SANTA ELENA I 	2
10	BOSQUES DE CUSCATLAN	2
11	BOSQUES DE SANTA ELENA	2
12	BOSQUES DE SANTA ELENA II	2
13	BOSQUES DE SANTA ELENA SUR	2
14	BOULEVARD ORDEN DE MALTA	2
15	BOULEVARD SANTA ELENA	2
16	BRISAS DE SANTA TERESA	2
17	CALLE EL PEDREGAL	2
19	CALLE MANUEL ENRIQUE ARAUJO	2
20	CARRETERA AL PUERTO DE LA LIBERTAD	2
21	CARRETERA AL PUERTO DESVIO ANTIGUO CUSCATLAN	2
22	CARRETERA PANAMERICANA	2
23	CENTRO COMERCIAL LA GRAN VIA	2
24	CENTRO COMERCIAL MULTIPLAZA	2
25	CIFCO	2
26	COLINAS DE SAN FRANCISCO	2
27	COLONIA ALTAMIRA 	2
28	COLONIA ALTOS DE GUADALUPE	2
29	COLONIA JARDINES DE LA LIBERTAD	2
30	COLONIA JARDINES DE MERLIOT	2
31	COLONIA LA SABANA	2
32	COLONIA LA SULTANA	2
33	COLONIA LA SULTANA II	2
34	COLONIA LA SULTANA III	2
35	COLONIA LAS MERCEDES	2
36	COLONIA MANUEL JOSE ARCE	2
37	COLONIA MAQUILISHUAT  	2
38	COLONIA SAN BENITO	2
39	COLONIA SAN FARNCISCO COLONIAL	2
40	COLONIA SAN FRANCISCO	2
41	COLONIA SAN IGNACIO DE LOYOLA	2
42	COMPLEJO RESIDENCIAL ANDA LUCIA	2
43	COND. RES LA REFORMA	2
44	CONDADO SANTA ELENA	2
46	CONDOMINIO LA CEIBA	2
47	CONDOMINIO LAS TERRAZAS	2
48	CONDOMINIO VILLAS DE LA LOMA	2
49	CONDOMINIOS LA CASTELLANA	2
50	CUMBRES DE CUSCATLAN	2
51	CUMBRES DE CUSCATLAN I	2
52	CUMBRES DE CUSCATLAN II	2
53	CUMBRES DE CUSCATLAN III	2
54	CUMBRES DE MADRE SELVA	2
55	CUMBRES DE SAN FRANCISCO	2
56	EDF. EX-INCATEL	2
57	FINCA  DE ASTURIAS NORTE	2
58	FINCA DE ASTURIAS SUR	2
59	HIPER MALL LAS CASCADAS	2
60	HOTEL HILTON PRINCESS	2
61	INSTITUTO BETHANIA	2
62	JARDINES DE CUSCATLAN	2
63	PARQUE INDUSTRIAL SANTA ELENA	2
64	PLAN DE LA LAGUNA	2
65	PLAZA MERLIOT	2
66	PORTONES MADRE SELVA	2
67	RES. ALQUERIAS	2
69	RES. DELUXE SANTA ELENA	2
71	RES. LAS NUBES	2
72	RES. PIEDRAS VERDES (CERCA DE LA UCA)	2
73	RES. PLAZA MERLIOT	2
74	RES. PUERTA COLINA	2
75	RES. SANTA ELENA II	2
76	RES. VILLA MARIA	2
77	RES. VILLAS DE SANTA ELENA DELUXE	2
78	RESIDENCIAL ALBERT EINSTEIN	2
79	RESIDENCIAL ALCAZAR DE MADRE SELVA	2
80	RESIDENCIAL ALTOS DE LA SULTANA	2
81	RESIDENCIAL ALTOS DE SANTA TERESA	2
82	RESIDENCIAL ANDREA	2
83	RESIDENCIAL BOSQUES DE SAN FRANCISCO	2
84	RESIDENCIAL BOSQUES DE SANTA TERESA	2
85	RESIDENCIAL BRITANICA	2
86	RESIDENCIAL CONDADOS DE SANTA ELENA	2
87	RESIDENCIAL CUMBRES DE LA ESMERALDA	2
88	RESIDENCIAL EL CARMEN	2
89	RESIDENCIAL EL ESPINO	2
90	RESIDENCIAL GUADALUPE	2
91	RESIDENCIAL JARDINES DE GUADALUPE	2
92	RESIDENCIAL JARDINES DE LA LIBERTAD	2
93	RESIDENCIAL JARDINES DE MERLIOT	2
94	RESIDENCIAL JARDINES DE SANTA TERESA	2
95	RESIDENCIAL JUAN MANUEL JOSE ARCE	2
97	RESIDENCIAL LA CEIBA	2
98	RESIDENCIAL LA SULTANA	2
99	RESIDENCIAL LAS HORTENCIAS	2
100	RESIDENCIAL LAS LOMAS II	2
101	RESIDENCIAL LAS NUBES	2
103	RESIDENCIAL LOS CIPRESES	2
104	RESIDENCIAL MADRE SELVA I	2
105	RESIDENCIAL MADRE SELVA I 	2
106	RESIDENCIAL MADRE SELVA II	2
107	RESIDENCIAL MADRE SELVA III	2
108	RESIDENCIAL MADRE SELVA IV	2
109	RESIDENCIAL MIRAFLORES	2
110	RESIDENCIAL NEQUEPIO	2
111	RESIDENCIAL PALERMO	2
112	RESIDENCIAL PASO FRESCO	2
113	RESIDENCIAL PINARES DE SAN FRANCISCO II	2
114	RESIDENCIAL PLAZA MERLIOT	2
115	RESIDENCIAL PUEBLO ESCONDIDO	2
116	RESIDENCIAL QUETZALCOATH	2
117	RESIDENCIAL SAN BENITO	2
118	RESIDENCIAL SAN FRANCISCO DE ASIS	2
119	RESIDENCIAL SANTA ELENA	2
120	RESIDENCIAL SANTA ELENA II	2
121	RESIDENCIAL SANTA ELENA SUR	2
122	RESIDENCIAL SANTA TERESA	2
123	RESIDENCIAL SANTA TERESA BELLA VISTA	2
124	RESIDENCIAL VALLE DORADO	2
125	RESIDENCIAL VILLA LINDA	2
45	CONDOMINIO SIENA	2
68	RES. BOSQUES DE CUSCATLAN	2
70	RES. JOYAS DE LA MONTAÑA	2
96	RESIDENCIAL LA CAÑADA	2
126	RESIDENCIAL VILLAS DE CUSCATLAN	2
127	RESIDENCIAL VILLAS DE SANTA ELENA  	2
128	RESIDENCIAL VILLAS DE SANTA ELENA II	2
129	RESIDENCIAL VILLAS DE SANTA TERESA	2
130	RESIDENICAL CUMBRES DE SAN FRANCISCO	2
131	SANTA TERESA	2
132	SIERRA SANTA ELENA 	2
133	STREAM SALVADOR DEL MUNDO	2
134	TELEPERFORMA	2
135	TELEPERFORMANCE	2
136	TERRA ALTA	2
137	TORRE TELEFONICA	2
138	UNIVERSIDAD ALBERT EINSTEIN	2
139	UNIVERSIDAD MATIAS	2
140	URBANIZACION JARDINES DE LA HACIENDA I	2
141	URBANIZACION JARDINES DE LA HACIENDA I , II , III	2
142	URBANIZACION JARDINES DE LA HACIENDA II	2
143	URBANIZACION JARDINES DE LA HACIENDA III	2
144	URBANIZACION JARDINES DE LA SABANA I	2
145	URBANIZACION JARDINES DE LA SABANA I , II 	2
146	URBANIZACION JARDINES DE LA SABANA II	2
147	URBANIZACION JARDINES DE LA SABANA III	2
148	URBANIZACION JARDINES DE LA SABANA IIII	2
149	URBANIZACION JARDINES DEL VOLCAN I	2
151	URBANIZACION JARDINES DEL VOLCAN II	2
152	URBANIZACION MADRE SELVA	2
153	URBANIZACION SANTA ELENA	2
154	VIAS DE MAQUILISHUAT	2
155	VILLAS DE MIRAFLORES	2
156	VILLAS DEL ARBOL	2
157	CONDOMINIO RESIDENCIAL PINAR ALTO	1
158	RESIDENCIAL AMBROGI 	1
160	RESIDENCIAL LA PAZ	1
161	RESIDENCIAL CUMBRES DE AMBROGI	1
162	CONDOMINIO RESIDENCIAL ANDALUCÖA 	1
165	RESIDENCIAL EL PEDREGAL 	1
166	CONDOMINIO EL PEDREGAL 	1
167	CONDOMINIO RESIDENCIAL MIRAMONTE	1
171	COLONIA CAMPESTRE I 	1
172	COLONIA CAMPESTRE	1
173	CONDOMINIO RESIDENCIAL CAMPESTRE	1
174	CONDOMINIO RESIDENCIAL LOS LAURELES	1
176	COLONIA MAQUILISHUAT 	1
178	RESIDENCIAL VILLAS DEL ARBOL 	1
179	CONDOMINIO RESIDENCIAL CASA BLANCA	1
181	COLONIA DORDELLY	1
183	RESIDENCIAL PLAZA FUNTAIN BLUE	1
184	RESIDENCIAL EL AMANECER	1
185	RESIDENCIAL LA HACIENDA	1
186	RESIDENCIAL SAN JOS 	1
189	RESIDENCIAL SAN BERNARDO	1
190	APARTAMENTOS NONUALCO	1
191	RESIDENCIAL SAUSALITO 	1
193	RESIDENCIAL QUINTAS PALERMO	1
194	CONDOMINIO RESIDENCIAL VILLAS DE PALERMO	1
198	CONDOMINIO QUINTA REAL 	1
212	RESIDENCIAL MELISA 	1
213	CONDOMINIO RESIDENCIAL MELISA II 	1
220	RESIDENCIAL CLAUDIA 	1
221	RESIDENCIAL JUAN PABLO II 	1
222	RESIDENCIAL ESCALONIA 	1
223	COLONIA TAZUMAL 	1
224	REPARTO MONTEFRESCO	1
225	RESIDENCIA SAN ANTONIO 	1
226	RESIDENCIAL MONTEFRESCO 	1
229	RESIDENCIAL SAN JOS 	1
230	COLONIA LOMAS DE MIRAMONTE	1
231	CONDOMINIO VILLA MIRAMONTE 	1
232	URBANIZACION TOLUCA SUR 	1
233	RESIDENCIAL ALTOS DE MIRAMONTE 	1
234	URBANIZACION ALTOS DE MIRAMONTE 	1
235	COLONIA LISBOA 	1
238	CONDOMINIO RESIDENCIAL VILLAS DE MIRALVALLE 	1
239	RESIDENCIAL UTILA	3
240	COLONIA UTILA	3
241	RESIDENCIAL JARDINES DE UTILA I-II	3
242	RESIDENCIAL SAN RAFAEL 	3
243	RESIDENCIAL ALTOS DE UTILA 	3
244	RESIDENCIAL LA MISION	3
159	URBANIIZACION LA MONTA¥A	1
163	URBANIZACION ESCALON 2000 II	1
164	RESIDENCIAL ESCALON 2000	1
168	URBANIZACION MONTEALTO	1
175	URBANIZACION MAQUILISHUAT 	1
169	URBANIZACION CUMBRES DE LA ESCALON II 	1
170	URBANIZACION ALPES DE LA ESCALON II 	1
177	URBANIZACION LA MASCOTA 	1
180	COLONIA ESCALON	1
182	CONDOMINIO RESIDENCIAL ESCALON	1
187	RESIDENCIAL BRUMAS DE LA ESCALON	1
188	CONDOMINIO QUINTAS DE LA ESCALON	1
192	URBANIZACION CAPISTRANO 	1
195	CONDOMINIO RESIDENCIAL MONACO II	1
196	RESIDENCIAL MONACO	1
199	CONDOMINIO EL CARMEN 	1
197	CONDOMINIO JARDINES DE LA ESCALON	1
200	RESIDENCIAL ALTURAS DE LA ESCALON	1
201	RESIDENCIAL ARCOS DEL CARMEN 	1
202	CONDOMINIO EL CARMEN 	1
204	URBANIZACION PINARES DE LA ESCALON	1
203	URBANIZACION CUMBRES DE LA ESCALON	1
205	CONDOMINIO BRISAS DEL VOLCAN	1
206	RESIDENCIAL JARDIN ALTO 	1
208	CONDOMINIO RESIDENCIAL EL CARMEN	1
210	RESIDENCIAL VERONICA 	1
209	RESIDENCIAL JARDIN 	1
214	RESIDENCIAL VILLAS DE LA ESCALON	1
215	RESIDENCIAL JARDINES DE LA ESCALON	1
216	URBANIZACION JARDINES DE LA ESCALON	1
211	RESIDENCIAL NOBLES DE LA ESCALON	1
217	RESIDENCIAL VILLA JARDIN	1
218	RESIDENCIAL ESCALON NORPONIENTE 	1
219	RESIDENCIAL ESCALON NORTE 	1
227	URBANIZACION CAMPOS ELISEOS 	1
228	COLONIA ESCALON NORTE 	1
236	COLONIA TEHUACAN	1
237	URBANIZACION MADRESELVA 	1
245	RESINDECIAL VILLAS DE UTILA	3
246	RESIDENCIAL UTILA COLONIAL	3
247	RESIDENCIAL ARCOS DE UTILA	3
248	RESIDENCIAL JAIME JOSE	3
249	PARQUE RESIDENCIAL PRIMAVERA I Y II	3
250	RESIDENCIAL BETHANIA	3
251	RESIDENCIAL UTILA PLACE	3
252	RESIDENCIAL LOMAS DE UTILA II	3
253	RESIDENCIAL QUINTA DE UTILA NIZA	3
254	RESIDENCIAL ALCALA	3
255	RESIDENCIAL SANTA ROSA	3
256	RESIDENCIAL DON BOSCO	3
257	COLONIAS LAS DELICIAS	3
258	RESIDENCIAL PINARES DE SUIZA	3
259	APARTAMENTOS DEVON	3
260	RESIDENCIAL VILLA CAMILA	3
261	APARTAMENTOS OSMA	3
262	APARTAMENTOS MARGOTH	3
263	RESIDENCIAL XIOMARA	3
264	APARTAMENTOS VERSALLES	3
265	APARTAMENTOS SAN VALENTIN	3
266	RESIDENCIAL MAQUILISHUAT	3
267	CONDOMINIOS REFORMA 	3
268	REPARTO GUERRERO	3
269	APARTAMENTOS MARTEL	3
270	APARTAMENTOS SAN DIONISIO	3
271	RESIDENCIAL COLICEO	3
272	CONDOMINIO NATALIA	3
273	RESIDENCIAL VILLAS DE SANTA TERESA	3
274	APARTAMENTOS PAULINA 	3
275	APARTAMENTOS COALFA	3
276	APARTAMENTOS OCHOA	3
277	CONDOMINIOS ATLANTIC	3
278	CALLES Y AVENIDAS DE CENTRO HISTORICO DE SANTA TECLA	3
279	APATAMENTOS LA FAVORITA 	3
280	CONDOMINIOS SAN MARTIN	3
281	BARRIO EL CALVARIO	3
282	CONDOMINIOS LA OCTAVA	3
283	CODOMIO LOS GIRASOLES	3
285	RESID. ALTOS DE  SAN ANTONIO LAS PALMERAS	3
286	URBANIZACION SAN ANTONIO LAS PALMERAS	3
287	RESIDENCIAL LOS CIPRECES I-II-III	3
288	RESIDENCIAL LAS COLINAS I-II	3
289	PARQUES RESIDENCIAL VILLAS DE FRANCIA I-II	3
290	RESIDENCIAL MONTESION I-II	3
291	RESIDENCIAL LAS TRES GARCIAS I-II	3
292	CONDOMINIO SAN ANTONIO LAS PALMERAS	3
293	CONDOMINIO EL PROGRESO 	3
294	RESIDENCIAL VILLA DE SUIZA 	3
295	RESIDENCIAL SEVILLA	3
296	APARTAMENTOS TRES DE MAYO	3
297	APARTAMENTOS ESCOBAR 	3
298	RESIDENCIAL EL CARMEN	3
299	RESIDENCIAL SAN RAFAEL	3
300	APARTAMENTOS PALOMO	3
301	REPARTO EL CARMEN	3
302	URBANIZACION EL PARAISO	3
303	RESIDENCIAL CIMA DEL PARAISO	3
304	COLONIA ALEMANIA	3
305	COLONIA SAN JOSE LAS FLORES	3
306	APARTAMENTOS SAN FRANCISCO	3
307	REPARTO MOLINA	3
308	RESIDENCIAL BARILOCHE	3
309	RESIDENCIAL LA PROVIDENCIA	3
310	BARRIO SAN ANTONIO	3
311	CONDOMINIO ROMA	3
312	APARTAMENTO CORRALES	3
313	APARTAMENTO MOLINA	3
314	APARTAMENTO GUMERO	3
315	COLONIA LA RREYNAGA	3
316	RESIDENCIAL FLORENCIA	3
317	RESIDENCIAL VILLA CAMILA	3
318	RESIDENCIAL SAN MARINO	3
319	COLONIA JARDINES DEL REY	3
320	RESIDENCIAL BOSQUES DE SUIZA	3
321	RESIDENCIAL ALTOS DE SANTA MONICA	3
322	URBANIZACION SANTA MONICA	3
323	COLONIA SANTA MONICA	3
324	RESIDENCIAL QUINTA DE SANTA ELENA	3
325	NUEVO CUSCATLAN	3
326	RESIDENCIAL PALMIRA	3
327	RECIDNECIAL LAS PILETAS I , II Y II	3
329	RECIENCIAL VILLAS DEL MAR	3
330	RESIDENCIAL ALTURAS DE TENERIFE	3
331	RESIDENCIAL TUSCANIA	3
332	RESIDENCIAL MIRAMAR	3
333	RESIDENCIAL LAS NUVES	3
334	RECIENCIAL VILLA BOSQUES	3
335	RESIDENCIAL FLORIDA	3
336	RESIDENCIAL PALO ALTO	3
18	CALLE LOS CASTAÑOS	2
102	RESIDENCIAL LOMAS DE SAN FRANCISCO (CALLE CIRCUNVA)	2
150	URBANIZACION JARDINES DEL VOLCAN I , II , III	2
207	RESIDENCIAL BOSQUES DE LA ESCALON	1
284	RESIDENCIAL PEÑA BLANCA 	3
328	RESIDENCIAL LOS SUEÑOS	3
\.


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 195
-- Name: Coverage_IdCoverage_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Coverage_IdCoverage_seq"', 336, true);


--
-- TOC entry 2124 (class 0 OID 16724)
-- Dependencies: 177
-- Data for Name: DetailOrder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "DetailOrder" ("IdDetail", "IdProduct", "Quantity", "UnitPrice", "IdOrder", "Comment") FROM stdin;
5	8	1	10.550000000000001	2	\N
6	5	1	7.9500000000000002	2	\N
7	6	1	15.699999999999999	2	\N
8	14	1	2.25	2	\N
9	8	1	10.550000000000001	3	\N
10	1	1	7.9500000000000002	3	\N
11	2	1	15.699999999999999	3	\N
12	6	1	15.699999999999999	3	\N
13	1	1	7.9500000000000002	4	\N
14	5	3	7.9500000000000002	4	\N
15	14	1	2.25	4	\N
16	12	1	0.75	4	\N
17	8	1	10.550000000000001	5	\N
18	5	1	7.9500000000000002	5	\N
19	4	1	23.449999999999999	5	\N
20	8	1	10.550000000000001	6	\N
21	8	1	10.550000000000001	7	\N
22	1	1	7.9500000000000002	7	\N
23	2	1	15.699999999999999	7	\N
24	2	1	15.699999999999999	8	\N
25	8	1	10.550000000000001	9	\N
26	1	1	7.9500000000000002	10	\N
27	8	1	10.550000000000001	11	\N
28	2	1	15.699999999999999	11	\N
29	8	1	10.550000000000001	12	\N
30	2	1	15.699999999999999	12	\N
31	8	1	10.550000000000001	13	\N
32	1	3	7.9500000000000002	13	\N
33	5	1	7.9500000000000002	13	\N
34	8	1	10.550000000000001	14	\N
35	1	2	7.9500000000000002	14	\N
36	14	1	2.25	14	\N
37	8	1	10.550000000000001	15	\N
38	1	2	7.9500000000000002	15	\N
39	14	1	2.25	15	\N
40	8	1	10.550000000000001	16	\N
41	1	1	7.9500000000000002	16	\N
42	1	3	7.9500000000000002	16	\N
43	8	2	10.550000000000001	17	\N
44	1	1	7.9500000000000002	18	\N
45	2	1	15.699999999999999	19	\N
46	8	1	10.550000000000001	20	\N
47	2	1	15.699999999999999	20	\N
48	1	1	7.9500000000000002	21	\N
49	2	1	15.699999999999999	21	\N
50	8	1	10.550000000000001	22	\N
51	8	1	10.550000000000001	23	\N
52	2	1	15.699999999999999	23	\N
53	14	1	2.25	23	\N
54	8	1	10.550000000000001	24	\N
55	8	1	10.550000000000001	25	\N
56	5	1	7.9500000000000002	25	\N
57	1	1	7.9500000000000002	26	\N
58	2	1	15.699999999999999	26	\N
59	14	1	2.25	26	\N
60	8	1	10.550000000000001	27	\N
61	5	1	7.9500000000000002	27	\N
62	1	1	7.9500000000000002	28	\N
63	8	1	10.550000000000001	28	\N
64	14	1	2.25	28	\N
65	2	2	15.699999999999999	30	solo apio, salsas aparte
66	35	1	3.9900000000000002	30	
\.


--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 178
-- Name: DetailOrder_IdDetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DetailOrder_IdDetail_seq"', 66, true);


--
-- TOC entry 2141 (class 0 OID 17235)
-- Dependencies: 194
-- Data for Name: DetailSauces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "DetailSauces" ("IdDSauces", "IdDetail", "IdSauce", "IdSpicy") FROM stdin;
1	65	4	3
2	65	7	4
\.


--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 193
-- Name: DetailSauces_IdDSauces_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DetailSauces_IdDSauces_seq"', 2, true);


--
-- TOC entry 2126 (class 0 OID 16729)
-- Dependencies: 179
-- Data for Name: Empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Empresas" ("IdEmpresa", "Nombre", "BDName") FROM stdin;
2	Pizza Hut	PizzaHut
1	Buffalo Wings	BuffaloWings
3	China Wok	ChinaWok
4	Burger King	BurgerKing
\.


--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 180
-- Name: Empresas_IdEmpresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Empresas_IdEmpresa_seq"', 4, true);


--
-- TOC entry 2145 (class 0 OID 17259)
-- Dependencies: 198
-- Data for Name: Motorizados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Motorizados" ("IdMotorizado", "Nombre", "IdAgency") FROM stdin;
0	-Ninguno-	0
1	Hiro Nakamura	1
2	Jon Snow	1
3	Walter White	2
4	Jessee Pinkman	2
5	Saul Goodman	3
6	Steve Jobs	1
7	Denisse Richie	2
\.


--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 197
-- Name: Motorizados_IdMotorizado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Motorizados_IdMotorizado_seq"', 7, true);


--
-- TOC entry 2128 (class 0 OID 16734)
-- Dependencies: 181
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Order" ("IdOrder", "NumberClient", "NameClient", "DirectionClient", "Comments", "IdAgency", "CreationDate", "Status", "CreationTime", "DispatchTime", "Total", "IdUsuario", "NumRef", "IdMotorizado") FROM stdin;
15	24414545	Maynor Jimenez	Residencial Arizon	TEST	1	2016-06-17	1	16:37:34	\N	28.699999999999999	\N	\N	0
14	24414545	Maynor Jimenez	Residencial Arizon	TEST	1	2016-06-17	1	16:36:03	\N	0	\N	\N	0
13	24414545	Maynor Jimenez	Residencial Arizon	TEST	1	2016-06-17	1	16:33:50	\N	0	\N	\N	0
16	24414545	Maynor Jimenez	Col. Rio Zarco	TEST	2	2016-06-18	1	21:27:09	\N	42.350000000000001	\N	\N	0
2	24414545	Maynor Lopez	Residencial Arizon	TEST	1	2016-06-16	2	10:22:25	22:54:46	0	\N	\N	0
3	24869012	Sergio Martinez	TEST	TEST	2	2016-06-16	2	15:35:55	22:55:18	0	\N	\N	0
4	78514963	Diana Linares	Col. Trebol	TEST	1	2016-06-16	2	15:36:59	22:55:22	0	\N	\N	0
5	24861230	Johana Caceres	Chalchuapa	TEST	2	2016-06-17	2	17:45:02	22:55:25	0	\N	\N	0
6	244000001	Maynor Lopez Jimenez	TEST	TEST	1	2016-06-17	2	11:31:17	22:55:29	0	\N	\N	0
7	78514963	Diana Linares	Col. Trebol	TEST	1	2016-06-17	2	11:56:04	22:55:33	0	\N	\N	0
8	78514963	Diana Linares	Col. Trebol	TEST	1	2016-06-17	2	11:56:25	22:55:36	0	\N	\N	0
9	78514963	Diana Figueroa	Col. Trebol	TEST	1	2016-06-17	2	12:06:06	22:55:40	0	\N	\N	0
10	78514963	Diana Lopez	Col. Trebol	TEST	1	2016-06-17	2	12:07:49	23:41:44	0	\N	\N	0
11	24861230	Johana Caceres	Chalchuapa	TEST	1	2016-06-17	2	12:32:05	08:12:06	0	\N	\N	0
12	24414545	Maynor Lopez	Residencial Arizon	TEST	1	2016-06-17	2	16:01:52	10:15:26	0	\N	\N	0
17	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-18	2	10:16:50	10:25:28	21.100000000000001	\N	\N	0
18	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-18	1	10:33:03	\N	7.9500000000000002	\N	\N	0
19	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-18	1	10:33:46	\N	15.699999999999999	\N	\N	0
20	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-18	1	10:35:39	\N	26.25	\N	\N	0
21	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-18	1	10:36:23	\N	23.649999999999999	\N	\N	0
23	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-20	1	08:41:24	\N	28.5	\N	\N	0
24	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-20	1	09:17:57	\N	\N	\N	\N	0
25	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-20	1	14:27:52	\N	\N	\N	\N	0
22	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-20	2	10:36:40	14:30:34	10.550000000000001	\N	\N	0
26	24414545	Maynor Jimenez	Residencial Arizona	TEST	1	2016-06-20	1	14:47:43	\N	\N	2	\N	0
27	24414545	Maynor Lopez	Residencial Arizona	TEST	1	2016-06-21	1	10:58:28	\N	\N	2	\N	0
28	24414545	Maynor Lopez	Residencial Arizona	TEST	1	2016-06-21	1	11:02:51	\N	\N	2	\N	0
29	24414545	Maynor Lopez	Residencial Arizona	cambio de 35 USD	1	2016-07-21	1	16:45:46	\N	40.890000000000001	2		0
30	24454789	Gabriel Lopez	Col. Villanueva		1	2016-07-22	1	11:51:27	\N	35.390000000000001	2	134	0
\.


--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 182
-- Name: Order_IdOrder_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Order_IdOrder_seq"', 30, true);


--
-- TOC entry 2130 (class 0 OID 16742)
-- Dependencies: 183
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Products" ("IdProduct", "NameProduct", "Dscription", "Type", "Sauce", "Price", "IdCategory", "State", "Garniture", "SauceQuantity") FROM stdin;
24	Papas fritas	Las muy papas.	2	f	3.6499999999999999	6	0	f	0
22	Papas Buffalo	Papas fritas con queso liquido y un toque de picante.	2	f	4.3499999999999996	6	0	f	0
23	Papas con queso	Papas fritas con queso liquido.	2	f	4.3499999999999996	6	0	f	0
14	Orden de Vegetales	Orden Extra de Vegetales.	2	f	2.25	3	0	f	0
13	Extra Queso	Queso Extra.	2	f	0.75	3	0	f	0
12	Extra Ranch	Salsa Ranch Extra.	2	f	0.75	3	0	f	0
27	La Clasica	Jugosa Carne de res, aderezo de la casa, queso americano, rodajas de tomate y cebolla en aros.	2	f	6.5	8	0	t	0
28	Quesoburguesa	Jugosa carne de res, aderezo especial y queso.	2	f	4.9500000000000002	8	0	t	0
43	BW Quesadilla	Trozos de pechuga de pollo a la plancha, queso americano derretido, cebolla y salsa blanca, envuelto en una tortilla de harina. Viene con chirmol.	2	t	7.5	12	0	f	0
35	El otro	Brownie de chocolate con 2 bolas de sorbete de vainilla y chocolate.	2	f	3.9900000000000002	9	0	f	0
36	El Unico	¿Que es? No sabemos. No es cheese cake ni flan de queso. Viene bañado en cajeta que no es cajeta.	2	f	3.9900000000000002	9	0	f	0
37	El montado	El sueño hecho realidad, el unico y el otro se unen en esta maravilla.	2	f	4.5	9	0	f	0
38	El metido	Volcan caliente de chocolate, relleno de chocolate derretido, acompañado de sorbete de vainilla y chocolate liquido.	2	f	5.5	9	0	f	0
39	El Ahogado	Porcion de Brownie con triple bola de sorbete de chocolate bañado en chocolate liquido.	2	f	3.9900000000000002	9	0	f	0
17	Nachos Mounstruosos	Orden doble de nachos.	2	f	7.9900000000000002	10	0	f	0
44	Cheese Dog	Super salchicha, tortilla frita y cubierto con queso	2	f	4.9500000000000002	12	0	f	0
46	Chili Dog	Super salchicha, tortilla frita en tiras, cubierto con nuestro exquisito chili con carne, queso cheddar y jalapeños.	2	f	5.25	12	0	f	0
15	Nachos	Tortillas de nachos bañadas en chili con carne, lechuga, cebolla,tomate, queso liquido, crema y jalapeños.	2	f	5.25	10	0	f	0
18	Rollers	Taquitos de harina rellenos de pollo y una mezcla de quesos cheddar, mozzarella, queso crema, aguacate y tocino. Acompañados de salsa ajo parmesano.	2	f	4.9500000000000002	10	0	f	0
20	Queyuca Bites	Bolitas de yuca empanizadas rellenas de queso y trocitos de jalapeño, para sumergirlas en tu salsa favorita.	2	t	3.6499999999999999	10	0	f	0
1	Wings Sencillas	Combo de 10 alitas de pollo con hueso	1	t	7.9500000000000002	4	0	f	1
2	Wings Dobles	Combo de 20 alitas de pollo con hueso	1	t	15.699999999999999	4	0	f	2
4	Wings Triples	Combo de 30 alitas de pollo con hueso	1	t	23.449999999999999	4	0	f	3
5	Chunks Sencillas	Combo de 10 Boneless Wings (100% pechuga de pollo)	1	t	7.9500000000000002	5	0	f	1
6	Chunks Dobles	Combo de 20 Boneless Wings (100% pechuga de pollo)	1	t	15.699999999999999	5	0	f	2
7	Chunks Triples	Combo de 30 Boneless Wings (100% pechuga de pollo)	1	t	23.449999999999999	5	0	f	3
16	Onion Mush	Enredo de cebolla empanizada acompañada de la salsa de tu eleccion.	2	t	3.9500000000000002	10	0	f	1
21	Papa Bites	Suaves boltias de papa acompañadas de cualquiera de nuestras salsas y nivel de picante que elijas.	2	t	3.6499999999999999	10	0	f	1
8	Crazy Bowl	7 alas y 7 chunks.	2	t	10.550000000000001	1	0	f	1
9	Extra Salsa	Salsa Extra.	2	t	0.84999999999999998	3	0	f	1
29	Inferno Burger	Rellena de pollo en trozos, bañada en la salsa de tu eleccion, queso derretido, aderezo ranch, tocino, jalapeño en rodajas y aros de cebolla.	2	t	7.5	8	0	t	1
30	Chicken Burger	Pechuga de pollo a la plancha bañada de cualquiera de nuestras exquisitas salsas, queso, tomate, cebolla, lechuga y tortilla frita en tiras.	2	t	7.5	8	0	t	1
42	BW Wrap	Trozos de pechuga de pollo a la plancha, lechuga, cebolla y tomate, bañado con tu salsa favorita y envuelto en una tortilla especial de harina.	2	t	7.5	12	0	f	1
25	Chili Fries	Papas fritas con doble porcion de nuestro chili con carne original + queso liquido.	2	f	5.3499999999999996	6	0	f	0
26	La poderosa	1/2 libra de jugosa carne de res, aderezo de la casa, queso americano, lascas de tocino, fresca lechuga, rodajas de tomate y aros de cebolla.	2	f	8.5	8	0	t	0
40	El Sampler	50 alas o chunks para que probes todas nuestras salsas. Escoge alas o chunks.	2	t	37.5	11	0	t	5
41	El Azafaton	Escoge 4 entre alas, chunks, costillas, camarones y strippers.	2	t	38.5	11	0	t	4
34	Tacondieta Mega	Mezcla de  crujiente lechuga, zanahoria rayada, chirmol, maiz dulce, frijol borracho, tortilla en tiras y jalapeño.	2	f	6.9000000000000004	7	0	f	0
33	Tacondieta Normal	Mezcla de  crujiente lechuga, zanahoria rayada, chirmol, maiz dulce, frijol borracho, tortilla en tiras y jalapeño.	2	f	4.9900000000000002	7	0	f	0
32	Ribaja la Biola Mega	Mezcla de crujiente lechuga, pechuga de pollo a la plancha o empanizada en tiras, cebolla, zanahoria fresca queso mozzarella y crotones.	2	f	6.9000000000000004	7	0	f	0
31	Ribaja la Biola Normal	Mezcla de crujiente lechuga, pechuga de pollo a la plancha o empanizada en tiras, cebolla, zanahoria fresca queso mozzarella y crotones.	2	f	4.9900000000000002	7	0	f	0
\.


--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 184
-- Name: Products_IdProduct_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Products_IdProduct_seq"', 46, true);


--
-- TOC entry 2132 (class 0 OID 16750)
-- Dependencies: 185
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Rol" ("IdRol", "RolName") FROM stdin;
1	Admin
2	Call Center
3	Dispatcher
4	Supervisor
\.


--
-- TOC entry 2179 (class 0 OID 0)
-- Dependencies: 186
-- Name: Rol_IdRol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Rol_IdRol_seq"', 4, true);


--
-- TOC entry 2134 (class 0 OID 16755)
-- Dependencies: 187
-- Data for Name: Sauce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Sauce" ("IdSauce", "NameSauce") FROM stdin;
1	Buffalo Original
2	BBQ Ahumada
3	BBQ Melt
4	Sesamo Ajonjoli
5	Teriyaki
6	Ajo Parmesano
7	Thai
8	Chipotle Tropical
9	Buffalo Louisiana
10	La Hawaiana
11	Mostaza Miel
12	Wok Plum
\.


--
-- TOC entry 2180 (class 0 OID 0)
-- Dependencies: 188
-- Name: Sauce_IdSauce_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sauce_IdSauce_seq"', 12, true);


--
-- TOC entry 2136 (class 0 OID 16763)
-- Dependencies: 189
-- Data for Name: Spicy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Spicy" ("IdSpicy", "NameSpicy") FROM stdin;
1	La que no pica
2	La picante
3	La suicida
4	La atomica
5	La 911
\.


--
-- TOC entry 2181 (class 0 OID 0)
-- Dependencies: 190
-- Name: Spicy_IdSpicy_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Spicy_IdSpicy_seq"', 5, true);


--
-- TOC entry 2147 (class 0 OID 17267)
-- Dependencies: 200
-- Data for Name: Status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Status" ("IdStatus", "StatusDescription") FROM stdin;
1	Impresion
2	Elaboracion
3	Ruta
4	Entregado
\.


--
-- TOC entry 2182 (class 0 OID 0)
-- Dependencies: 199
-- Name: Status_IdStatus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Status_IdStatus_seq"', 4, true);


--
-- TOC entry 2138 (class 0 OID 16771)
-- Dependencies: 191
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Usuarios" ("IdUsuario", "Nombre", "Alias", "Password", "IdRol", "IdAgency") FROM stdin;
1	Maynor Lopez	mlopez	Sistema1608.	1	1
2	Immer Rojas	irojas	1234	2	1
3	Ademir Arevalo	aarevalo	1234	3	1
4	Call Center 1	callc1	callcbw1	2	1
5	Delivery Masferrer	dmas	delmasfe	3	1
\.


--
-- TOC entry 2183 (class 0 OID 0)
-- Dependencies: 192
-- Name: Usuarios_IdUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Usuarios_IdUsuario_seq"', 5, true);


--
-- TOC entry 1990 (class 2606 OID 16787)
-- Name: PK-Empresa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Empresas"
    ADD CONSTRAINT "PK-Empresa" PRIMARY KEY ("IdEmpresa");


--
-- TOC entry 1984 (class 2606 OID 16789)
-- Name: PK_Agency; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Agency"
    ADD CONSTRAINT "PK_Agency" PRIMARY KEY ("IdAgency");


--
-- TOC entry 1986 (class 2606 OID 16791)
-- Name: PK_Category; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Category"
    ADD CONSTRAINT "PK_Category" PRIMARY KEY ("IdCategory");


--
-- TOC entry 1988 (class 2606 OID 16793)
-- Name: PK_DetailOrder; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DetailOrder"
    ADD CONSTRAINT "PK_DetailOrder" PRIMARY KEY ("IdDetail");


--
-- TOC entry 1992 (class 2606 OID 16795)
-- Name: PK_ORDER; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Order"
    ADD CONSTRAINT "PK_ORDER" PRIMARY KEY ("IdOrder");


--
-- TOC entry 1994 (class 2606 OID 16797)
-- Name: PK_Products; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Products"
    ADD CONSTRAINT "PK_Products" PRIMARY KEY ("IdProduct");


--
-- TOC entry 1996 (class 2606 OID 16799)
-- Name: PK_Rol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Rol"
    ADD CONSTRAINT "PK_Rol" PRIMARY KEY ("IdRol");


--
-- TOC entry 1998 (class 2606 OID 16801)
-- Name: PK_Sauce; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sauce"
    ADD CONSTRAINT "PK_Sauce" PRIMARY KEY ("IdSauce");


--
-- TOC entry 2000 (class 2606 OID 16803)
-- Name: PK_Spicy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Spicy"
    ADD CONSTRAINT "PK_Spicy" PRIMARY KEY ("IdSpicy");


--
-- TOC entry 2002 (class 2606 OID 16805)
-- Name: PK_Usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Usuarios"
    ADD CONSTRAINT "PK_Usuarios" PRIMARY KEY ("IdUsuario");


--
-- TOC entry 2006 (class 2606 OID 17248)
-- Name: pk_Coverage; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Coverage"
    ADD CONSTRAINT "pk_Coverage" PRIMARY KEY ("IdCoverage");


--
-- TOC entry 2004 (class 2606 OID 17240)
-- Name: pk_DSauces; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DetailSauces"
    ADD CONSTRAINT "pk_DSauces" PRIMARY KEY ("IdDSauces");


--
-- TOC entry 2008 (class 2606 OID 17264)
-- Name: pk_Motorizados; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Motorizados"
    ADD CONSTRAINT "pk_Motorizados" PRIMARY KEY ("IdMotorizado");


--
-- TOC entry 2010 (class 2606 OID 17275)
-- Name: pk_status; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Status"
    ADD CONSTRAINT pk_status PRIMARY KEY ("IdStatus");


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-07-22 16:41:29

--
-- PostgreSQL database dump complete
--

