--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-06-18 00:17:59

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
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 205 (class 1255 OID 17930)
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
-- TOC entry 173 (class 1259 OID 17823)
-- Name: Agency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Agency" (
    "IdAgency" integer NOT NULL,
    "Name" character varying(150) NOT NULL
);


ALTER TABLE "Agency" OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 17826)
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
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 174
-- Name: Agency_IdAgency_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Agency_IdAgency_seq" OWNED BY "Agency"."IdAgency";


--
-- TOC entry 175 (class 1259 OID 17828)
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
-- TOC entry 176 (class 1259 OID 17834)
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
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 176
-- Name: Category_IdCategory_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Category_IdCategory_seq" OWNED BY "Category"."IdCategory";


--
-- TOC entry 177 (class 1259 OID 17836)
-- Name: DetailOrder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "DetailOrder" (
    "IdDetail" integer NOT NULL,
    "IdProduct" integer NOT NULL,
    "IdSauce" integer NOT NULL,
    "IdSpicy" integer NOT NULL,
    "Quantity" integer NOT NULL,
    "UnitPrice" double precision NOT NULL,
    "IdOrder" integer NOT NULL
);


ALTER TABLE "DetailOrder" OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 17839)
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
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 178
-- Name: DetailOrder_IdDetail_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "DetailOrder_IdDetail_seq" OWNED BY "DetailOrder"."IdDetail";


--
-- TOC entry 179 (class 1259 OID 17841)
-- Name: Empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Empresas" (
    "IdEmpresa" integer NOT NULL,
    "Nombre" character varying(60) NOT NULL,
    "BDName" character varying(30)
);


ALTER TABLE "Empresas" OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 17844)
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
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 180
-- Name: Empresas_IdEmpresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Empresas_IdEmpresa_seq" OWNED BY "Empresas"."IdEmpresa";


--
-- TOC entry 181 (class 1259 OID 17846)
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
    "Total" double precision
);


ALTER TABLE "Order" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 17852)
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
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 182
-- Name: Order_IdOrder_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Order_IdOrder_seq" OWNED BY "Order"."IdOrder";


--
-- TOC entry 183 (class 1259 OID 17854)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Products" (
    "IdProduct" integer NOT NULL,
    "NameProduct" character varying NOT NULL,
    "Dscription" character varying NOT NULL,
    "Type" integer NOT NULL,
    "Sauce" boolean NOT NULL,
    "Price" double precision NOT NULL,
    "IdCategory" integer NOT NULL
);


ALTER TABLE "Products" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 17860)
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
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 184
-- Name: Products_IdProduct_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Products_IdProduct_seq" OWNED BY "Products"."IdProduct";


--
-- TOC entry 185 (class 1259 OID 17862)
-- Name: Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Rol" (
    "IdRol" integer NOT NULL,
    "RolName" character varying(25) NOT NULL
);


ALTER TABLE "Rol" OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 17865)
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
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 186
-- Name: Rol_IdRol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Rol_IdRol_seq" OWNED BY "Rol"."IdRol";


--
-- TOC entry 187 (class 1259 OID 17867)
-- Name: Sauce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Sauce" (
    "IdSauce" integer NOT NULL,
    "NameSauce" character varying NOT NULL
);


ALTER TABLE "Sauce" OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 17873)
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
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 188
-- Name: Sauce_IdSauce_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sauce_IdSauce_seq" OWNED BY "Sauce"."IdSauce";


--
-- TOC entry 189 (class 1259 OID 17875)
-- Name: Spicy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Spicy" (
    "IdSpicy" integer NOT NULL,
    "NameSpicy" character varying NOT NULL
);


ALTER TABLE "Spicy" OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 17881)
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
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 190
-- Name: Spicy_IdSpicy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Spicy_IdSpicy_seq" OWNED BY "Spicy"."IdSpicy";


--
-- TOC entry 191 (class 1259 OID 17883)
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
-- TOC entry 192 (class 1259 OID 17886)
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
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 192
-- Name: Usuarios_IdUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Usuarios_IdUsuario_seq" OWNED BY "Usuarios"."IdUsuario";


--
-- TOC entry 1941 (class 2604 OID 17918)
-- Name: IdAgency; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Agency" ALTER COLUMN "IdAgency" SET DEFAULT nextval('"Agency_IdAgency_seq"'::regclass);


--
-- TOC entry 1942 (class 2604 OID 17919)
-- Name: IdCategory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Category" ALTER COLUMN "IdCategory" SET DEFAULT nextval('"Category_IdCategory_seq"'::regclass);


--
-- TOC entry 1943 (class 2604 OID 17920)
-- Name: IdDetail; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DetailOrder" ALTER COLUMN "IdDetail" SET DEFAULT nextval('"DetailOrder_IdDetail_seq"'::regclass);


--
-- TOC entry 1944 (class 2604 OID 17921)
-- Name: IdEmpresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Empresas" ALTER COLUMN "IdEmpresa" SET DEFAULT nextval('"Empresas_IdEmpresa_seq"'::regclass);


--
-- TOC entry 1945 (class 2604 OID 17922)
-- Name: IdOrder; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Order" ALTER COLUMN "IdOrder" SET DEFAULT nextval('"Order_IdOrder_seq"'::regclass);


--
-- TOC entry 1946 (class 2604 OID 17923)
-- Name: IdProduct; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Products" ALTER COLUMN "IdProduct" SET DEFAULT nextval('"Products_IdProduct_seq"'::regclass);


--
-- TOC entry 1947 (class 2604 OID 17924)
-- Name: IdRol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Rol" ALTER COLUMN "IdRol" SET DEFAULT nextval('"Rol_IdRol_seq"'::regclass);


--
-- TOC entry 1948 (class 2604 OID 17925)
-- Name: IdSauce; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sauce" ALTER COLUMN "IdSauce" SET DEFAULT nextval('"Sauce_IdSauce_seq"'::regclass);


--
-- TOC entry 1949 (class 2604 OID 17926)
-- Name: IdSpicy; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Spicy" ALTER COLUMN "IdSpicy" SET DEFAULT nextval('"Spicy_IdSpicy_seq"'::regclass);


--
-- TOC entry 1950 (class 2604 OID 17927)
-- Name: IdUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Usuarios" ALTER COLUMN "IdUsuario" SET DEFAULT nextval('"Usuarios_IdUsuario_seq"'::regclass);


--
-- TOC entry 2080 (class 0 OID 17823)
-- Dependencies: 173
-- Data for Name: Agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Agency" ("IdAgency", "Name") FROM stdin;
1	Delivery Masferrer
2	Delivery Multiplaza
3	Delivery Las Palmas
\.


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 174
-- Name: Agency_IdAgency_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Agency_IdAgency_seq"', 4, true);


--
-- TOC entry 2082 (class 0 OID 17828)
-- Dependencies: 175
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Category" ("IdCategory", "NameCategory", "Bunch", "SortIndex") FROM stdin;
1	Promociones	f	1
3	Extras	f	99
4	Wings	t	2
5	Chunks	t	3
\.


--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 176
-- Name: Category_IdCategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Category_IdCategory_seq"', 5, true);


--
-- TOC entry 2084 (class 0 OID 17836)
-- Dependencies: 177
-- Data for Name: DetailOrder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "DetailOrder" ("IdDetail", "IdProduct", "IdSauce", "IdSpicy", "Quantity", "UnitPrice", "IdOrder") FROM stdin;
5	8	1	1	1	10.550000000000001	2
6	5	1	1	1	7.9500000000000002	2
7	6	1	1	1	15.699999999999999	2
8	14	0	0	1	2.25	2
9	8	1	1	1	10.550000000000001	3
10	1	1	1	1	7.9500000000000002	3
11	2	1	1	1	15.699999999999999	3
12	6	1	1	1	15.699999999999999	3
13	1	1	1	1	7.9500000000000002	4
14	5	1	1	3	7.9500000000000002	4
15	14	0	0	1	2.25	4
16	12	0	0	1	0.75	4
17	8	1	1	1	10.550000000000001	5
18	5	1	1	1	7.9500000000000002	5
19	4	1	1	1	23.449999999999999	5
20	8	1	1	1	10.550000000000001	6
21	8	1	1	1	10.550000000000001	7
22	1	1	1	1	7.9500000000000002	7
23	2	1	1	1	15.699999999999999	7
24	2	1	1	1	15.699999999999999	8
25	8	1	1	1	10.550000000000001	9
26	1	1	1	1	7.9500000000000002	10
27	8	1	1	1	10.550000000000001	11
28	2	1	1	1	15.699999999999999	11
29	8	4	3	1	10.550000000000001	12
30	2	11	5	1	15.699999999999999	12
31	8	1	1	1	10.550000000000001	13
32	1	6	4	3	7.9500000000000002	13
33	5	3	3	1	7.9500000000000002	13
34	8	3	4	1	10.550000000000001	14
35	1	12	2	2	7.9500000000000002	14
36	14	0	0	1	2.25	14
37	8	2	3	1	10.550000000000001	15
38	1	3	3	2	7.9500000000000002	15
39	14	0	0	1	2.25	15
40	8	1	1	1	10.550000000000001	16
41	1	1	1	1	7.9500000000000002	16
42	1	3	4	3	7.9500000000000002	16
\.


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 178
-- Name: DetailOrder_IdDetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DetailOrder_IdDetail_seq"', 42, true);


--
-- TOC entry 2086 (class 0 OID 17841)
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
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 180
-- Name: Empresas_IdEmpresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Empresas_IdEmpresa_seq"', 4, true);


--
-- TOC entry 2088 (class 0 OID 17846)
-- Dependencies: 181
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Order" ("IdOrder", "NumberClient", "NameClient", "DirectionClient", "Comments", "IdAgency", "CreationDate", "Status", "CreationTime", "DispatchTime", "Total") FROM stdin;
11	24861230	Johana Caceres	Chalchuapa	TEST	1	2016-06-17	1	12:32:05	\N	0
12	24414545	Maynor Lopez	Residencial Arizon	TEST	1	2016-06-17	1	16:01:52	\N	0
15	24414545	Maynor Jimenez	Residencial Arizon	TEST	1	2016-06-17	1	16:37:34	\N	28.699999999999999
14	24414545	Maynor Jimenez	Residencial Arizon	TEST	1	2016-06-17	1	16:36:03	\N	0
13	24414545	Maynor Jimenez	Residencial Arizon	TEST	1	2016-06-17	1	16:33:50	\N	0
16	24414545	Maynor Jimenez	Col. Rio Zarco	TEST	2	2016-06-18	1	21:27:09	\N	42.350000000000001
2	24414545	Maynor Lopez	Residencial Arizon	TEST	1	2016-06-16	2	10:22:25	22:54:46	0
3	24869012	Sergio Martinez	TEST	TEST	2	2016-06-16	2	15:35:55	22:55:18	0
4	78514963	Diana Linares	Col. Trebol	TEST	1	2016-06-16	2	15:36:59	22:55:22	0
5	24861230	Johana Caceres	Chalchuapa	TEST	2	2016-06-17	2	17:45:02	22:55:25	0
6	244000001	Maynor Lopez Jimenez	TEST	TEST	1	2016-06-17	2	11:31:17	22:55:29	0
7	78514963	Diana Linares	Col. Trebol	TEST	1	2016-06-17	2	11:56:04	22:55:33	0
8	78514963	Diana Linares	Col. Trebol	TEST	1	2016-06-17	2	11:56:25	22:55:36	0
9	78514963	Diana Figueroa	Col. Trebol	TEST	1	2016-06-17	2	12:06:06	22:55:40	0
10	78514963	Diana Lopez	Col. Trebol	TEST	1	2016-06-17	2	12:07:49	23:41:44	0
\.


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 182
-- Name: Order_IdOrder_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Order_IdOrder_seq"', 16, true);


--
-- TOC entry 2090 (class 0 OID 17854)
-- Dependencies: 183
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Products" ("IdProduct", "NameProduct", "Dscription", "Type", "Sauce", "Price", "IdCategory") FROM stdin;
8	Crazy Bowl	7 alas y 7 chunks	2	t	10.550000000000001	1
9	Extra Salsa	Salsa Extra	2	t	0.84999999999999998	3
14	Orden de Vegetales	Orden Extra de Vegetales	2	f	2.25	3
12	Extra Ranch	Salsa Ranch Extra	2	f	0.75	3
13	Extra Queso	Queso Extra	2	f	0.75	3
1	Wings Sencillas	Combo de 10 alitas de pollo con hueso	1	t	7.9500000000000002	4
2	Wings Dobles	Combo de 20 alitas de pollo con hueso	1	t	15.699999999999999	4
4	Wings Triples	Combo de 30 alitas de pollo con hueso	1	t	23.449999999999999	4
5	Chunks Sencillas	Combo de 10 Boneless Wings (100% pechuga de pollo)	1	t	7.9500000000000002	5
6	Chunks Dobles	Combo de 20 Boneless Wings (100% pechuga de pollo)	1	t	15.699999999999999	5
7	Chunks Triples	Combo de 30 Boneless Wings (100% pechuga de pollo)	1	t	23.449999999999999	5
\.


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 184
-- Name: Products_IdProduct_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Products_IdProduct_seq"', 14, true);


--
-- TOC entry 2092 (class 0 OID 17862)
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
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 186
-- Name: Rol_IdRol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Rol_IdRol_seq"', 4, true);


--
-- TOC entry 2094 (class 0 OID 17867)
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
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 188
-- Name: Sauce_IdSauce_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sauce_IdSauce_seq"', 12, true);


--
-- TOC entry 2096 (class 0 OID 17875)
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
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 190
-- Name: Spicy_IdSpicy_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Spicy_IdSpicy_seq"', 5, true);


--
-- TOC entry 2098 (class 0 OID 17883)
-- Dependencies: 191
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Usuarios" ("IdUsuario", "Nombre", "Alias", "Password", "IdRol", "IdAgency") FROM stdin;
1	Maynor Lopez	mlopez	Sistema1608.	1	1
2	Immer Rojas	irojas	1234	2	1
3	Ademir Arevalo	aarevalo	1234	3	1
\.


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 192
-- Name: Usuarios_IdUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Usuarios_IdUsuario_seq"', 3, true);


--
-- TOC entry 1958 (class 2606 OID 17899)
-- Name: PK-Empresa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Empresas"
    ADD CONSTRAINT "PK-Empresa" PRIMARY KEY ("IdEmpresa");


--
-- TOC entry 1952 (class 2606 OID 17901)
-- Name: PK_Agency; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Agency"
    ADD CONSTRAINT "PK_Agency" PRIMARY KEY ("IdAgency");


--
-- TOC entry 1954 (class 2606 OID 17903)
-- Name: PK_Category; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Category"
    ADD CONSTRAINT "PK_Category" PRIMARY KEY ("IdCategory");


--
-- TOC entry 1956 (class 2606 OID 17905)
-- Name: PK_DetailOrder; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DetailOrder"
    ADD CONSTRAINT "PK_DetailOrder" PRIMARY KEY ("IdDetail");


--
-- TOC entry 1960 (class 2606 OID 17907)
-- Name: PK_ORDER; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Order"
    ADD CONSTRAINT "PK_ORDER" PRIMARY KEY ("IdOrder");


--
-- TOC entry 1962 (class 2606 OID 17909)
-- Name: PK_Products; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Products"
    ADD CONSTRAINT "PK_Products" PRIMARY KEY ("IdProduct");


--
-- TOC entry 1964 (class 2606 OID 17911)
-- Name: PK_Rol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Rol"
    ADD CONSTRAINT "PK_Rol" PRIMARY KEY ("IdRol");


--
-- TOC entry 1966 (class 2606 OID 17913)
-- Name: PK_Sauce; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sauce"
    ADD CONSTRAINT "PK_Sauce" PRIMARY KEY ("IdSauce");


--
-- TOC entry 1968 (class 2606 OID 17915)
-- Name: PK_Spicy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Spicy"
    ADD CONSTRAINT "PK_Spicy" PRIMARY KEY ("IdSpicy");


--
-- TOC entry 1970 (class 2606 OID 17917)
-- Name: PK_Usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Usuarios"
    ADD CONSTRAINT "PK_Usuarios" PRIMARY KEY ("IdUsuario");


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-06-18 00:18:00

--
-- PostgreSQL database dump complete
--

