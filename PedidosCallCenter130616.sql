--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-06-13 23:08:34

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
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 17677)
-- Name: Agency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Agency" (
    "IdAgency" integer NOT NULL,
    "Name" character varying(150) NOT NULL
);


ALTER TABLE "Agency" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 17675)
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
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 185
-- Name: Agency_IdAgency_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Agency_IdAgency_seq" OWNED BY "Agency"."IdAgency";


--
-- TOC entry 173 (class 1259 OID 17615)
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
-- TOC entry 174 (class 1259 OID 17621)
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
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 174
-- Name: Category_IdCategory_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Category_IdCategory_seq" OWNED BY "Category"."IdCategory";


--
-- TOC entry 190 (class 1259 OID 17708)
-- Name: DetailOrder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "DetailOrder" (
    "IdDetail" integer NOT NULL,
    "IdProduct" integer NOT NULL,
    "IdSauce" integer NOT NULL,
    "IdSpicy" integer NOT NULL,
    "Quantity" integer NOT NULL,
    "UnitPrice" double precision NOT NULL
);


ALTER TABLE "DetailOrder" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 17706)
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
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 189
-- Name: DetailOrder_IdDetail_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "DetailOrder_IdDetail_seq" OWNED BY "DetailOrder"."IdDetail";


--
-- TOC entry 175 (class 1259 OID 17623)
-- Name: Empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Empresas" (
    "IdEmpresa" integer NOT NULL,
    "Nombre" character varying(60) NOT NULL,
    "BDName" character varying(30)
);


ALTER TABLE "Empresas" OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 17626)
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
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 176
-- Name: Empresas_IdEmpresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Empresas_IdEmpresa_seq" OWNED BY "Empresas"."IdEmpresa";


--
-- TOC entry 188 (class 1259 OID 17685)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Order" (
    "IdOrder" integer NOT NULL,
    "NumberClient" character varying(9) NOT NULL,
    "NameClient" character varying(50) NOT NULL,
    "DirectionClient" character varying(300) NOT NULL,
    "Comments" character varying(500)
);


ALTER TABLE "Order" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 17683)
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
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 187
-- Name: Order_IdOrder_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Order_IdOrder_seq" OWNED BY "Order"."IdOrder";


--
-- TOC entry 177 (class 1259 OID 17628)
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
-- TOC entry 178 (class 1259 OID 17634)
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
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 178
-- Name: Products_IdProduct_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Products_IdProduct_seq" OWNED BY "Products"."IdProduct";


--
-- TOC entry 192 (class 1259 OID 17719)
-- Name: Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Rol" (
    "IdRol" integer NOT NULL,
    "RolName" character varying(25) NOT NULL
);


ALTER TABLE "Rol" OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 17717)
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
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 191
-- Name: Rol_IdRol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Rol_IdRol_seq" OWNED BY "Rol"."IdRol";


--
-- TOC entry 179 (class 1259 OID 17636)
-- Name: Sauce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Sauce" (
    "IdSauce" integer NOT NULL,
    "NameSauce" character varying NOT NULL
);


ALTER TABLE "Sauce" OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 17642)
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
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 180
-- Name: Sauce_IdSauce_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sauce_IdSauce_seq" OWNED BY "Sauce"."IdSauce";


--
-- TOC entry 181 (class 1259 OID 17644)
-- Name: Spicy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Spicy" (
    "IdSpicy" integer NOT NULL,
    "NameSpicy" character varying NOT NULL
);


ALTER TABLE "Spicy" OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 17650)
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
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 182
-- Name: Spicy_IdSpicy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Spicy_IdSpicy_seq" OWNED BY "Spicy"."IdSpicy";


--
-- TOC entry 183 (class 1259 OID 17652)
-- Name: Usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Usuarios" (
    "IdUsuario" integer NOT NULL,
    "Nombre" character varying(30) NOT NULL,
    "Alias" character varying(15) NOT NULL,
    "Password" character varying(15),
    "IdRol" integer NOT NULL
);


ALTER TABLE "Usuarios" OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 17655)
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
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 184
-- Name: Usuarios_IdUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Usuarios_IdUsuario_seq" OWNED BY "Usuarios"."IdUsuario";


--
-- TOC entry 1946 (class 2604 OID 17680)
-- Name: IdAgency; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Agency" ALTER COLUMN "IdAgency" SET DEFAULT nextval('"Agency_IdAgency_seq"'::regclass);


--
-- TOC entry 1940 (class 2604 OID 17657)
-- Name: IdCategory; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Category" ALTER COLUMN "IdCategory" SET DEFAULT nextval('"Category_IdCategory_seq"'::regclass);


--
-- TOC entry 1948 (class 2604 OID 17711)
-- Name: IdDetail; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DetailOrder" ALTER COLUMN "IdDetail" SET DEFAULT nextval('"DetailOrder_IdDetail_seq"'::regclass);


--
-- TOC entry 1941 (class 2604 OID 17658)
-- Name: IdEmpresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Empresas" ALTER COLUMN "IdEmpresa" SET DEFAULT nextval('"Empresas_IdEmpresa_seq"'::regclass);


--
-- TOC entry 1947 (class 2604 OID 17688)
-- Name: IdOrder; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Order" ALTER COLUMN "IdOrder" SET DEFAULT nextval('"Order_IdOrder_seq"'::regclass);


--
-- TOC entry 1942 (class 2604 OID 17659)
-- Name: IdProduct; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Products" ALTER COLUMN "IdProduct" SET DEFAULT nextval('"Products_IdProduct_seq"'::regclass);


--
-- TOC entry 1949 (class 2604 OID 17722)
-- Name: IdRol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Rol" ALTER COLUMN "IdRol" SET DEFAULT nextval('"Rol_IdRol_seq"'::regclass);


--
-- TOC entry 1943 (class 2604 OID 17660)
-- Name: IdSauce; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sauce" ALTER COLUMN "IdSauce" SET DEFAULT nextval('"Sauce_IdSauce_seq"'::regclass);


--
-- TOC entry 1944 (class 2604 OID 17661)
-- Name: IdSpicy; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Spicy" ALTER COLUMN "IdSpicy" SET DEFAULT nextval('"Spicy_IdSpicy_seq"'::regclass);


--
-- TOC entry 1945 (class 2604 OID 17662)
-- Name: IdUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Usuarios" ALTER COLUMN "IdUsuario" SET DEFAULT nextval('"Usuarios_IdUsuario_seq"'::regclass);


--
-- TOC entry 2092 (class 0 OID 17677)
-- Dependencies: 186
-- Data for Name: Agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Agency" ("IdAgency", "Name") FROM stdin;
1	Sucursal 1
2	Sucursal 2
3	Sucursal 3
4	Sucursal 4
\.


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 185
-- Name: Agency_IdAgency_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Agency_IdAgency_seq"', 4, true);


--
-- TOC entry 2079 (class 0 OID 17615)
-- Dependencies: 173
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Category" ("IdCategory", "NameCategory", "Bunch", "SortIndex") FROM stdin;
1	Promociones	f	1
3	Extras	f	99
4	Wings	t	2
5	Chunks	t	3
\.


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 174
-- Name: Category_IdCategory_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Category_IdCategory_seq"', 5, true);


--
-- TOC entry 2096 (class 0 OID 17708)
-- Dependencies: 190
-- Data for Name: DetailOrder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "DetailOrder" ("IdDetail", "IdProduct", "IdSauce", "IdSpicy", "Quantity", "UnitPrice") FROM stdin;
\.


--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 189
-- Name: DetailOrder_IdDetail_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"DetailOrder_IdDetail_seq"', 1, false);


--
-- TOC entry 2081 (class 0 OID 17623)
-- Dependencies: 175
-- Data for Name: Empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Empresas" ("IdEmpresa", "Nombre", "BDName") FROM stdin;
2	Pizza Hut	PizzaHut
1	Buffalo Wings	BuffaloWings
3	China Wok	ChinaWok
4	Burger King	BurgerKing
\.


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 176
-- Name: Empresas_IdEmpresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Empresas_IdEmpresa_seq"', 4, true);


--
-- TOC entry 2094 (class 0 OID 17685)
-- Dependencies: 188
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Order" ("IdOrder", "NumberClient", "NameClient", "DirectionClient", "Comments") FROM stdin;
\.


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 187
-- Name: Order_IdOrder_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Order_IdOrder_seq"', 1, false);


--
-- TOC entry 2083 (class 0 OID 17628)
-- Dependencies: 177
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Products" ("IdProduct", "NameProduct", "Dscription", "Type", "Sauce", "Price", "IdCategory") FROM stdin;
1	Sencillas (10)	Combo de 10 alitas de pollo con hueso	1	t	7.9500000000000002	4
4	Triples (30)	Combo de 30 alitas de pollo con hueso	1	t	23.449999999999999	4
2	Dobles (20)	Combo de 20 alitas de pollo con hueso	1	t	15.699999999999999	4
5	Sencillas (10)	Combo de 10 Boneless Wings (100% pechuga de pollo)	1	t	7.9500000000000002	5
6	Dobles (20)	Combo de 20 Boneless Wings (100% pechuga de pollo)	1	t	15.699999999999999	5
7	Triples (10)	Combo de 30 Boneless Wings (100% pechuga de pollo)	1	t	23.449999999999999	5
8	Crazy Bowl	7 alas y 7 chunks	2	t	10.550000000000001	1
9	Extra Salsa	Salsa Extra	2	t	0.84999999999999998	3
14	Orden de Vegetales	Orden Extra de Vegetales	2	f	2.25	3
12	Extra Ranch	Salsa Ranch Extra	2	f	0.75	3
13	Extra Queso	Queso Extra	2	f	0.75	3
\.


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 178
-- Name: Products_IdProduct_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Products_IdProduct_seq"', 14, true);


--
-- TOC entry 2098 (class 0 OID 17719)
-- Dependencies: 192
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Rol" ("IdRol", "RolName") FROM stdin;
1	Admin
2	Call Center
3	Dispatcher
4	Supervisor
\.


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 191
-- Name: Rol_IdRol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Rol_IdRol_seq"', 4, true);


--
-- TOC entry 2085 (class 0 OID 17636)
-- Dependencies: 179
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
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 180
-- Name: Sauce_IdSauce_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sauce_IdSauce_seq"', 12, true);


--
-- TOC entry 2087 (class 0 OID 17644)
-- Dependencies: 181
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
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 182
-- Name: Spicy_IdSpicy_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Spicy_IdSpicy_seq"', 5, true);


--
-- TOC entry 2089 (class 0 OID 17652)
-- Dependencies: 183
-- Data for Name: Usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Usuarios" ("IdUsuario", "Nombre", "Alias", "Password", "IdRol") FROM stdin;
1	Maynor Lopez	mlopez	Sistema1608.	1
2	Immer Rojas	irojas	1234	2
3	Ademir Arevalo	aarevalo	1234	3
\.


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 184
-- Name: Usuarios_IdUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Usuarios_IdUsuario_seq"', 3, true);


--
-- TOC entry 1953 (class 2606 OID 17664)
-- Name: PK-Empresa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Empresas"
    ADD CONSTRAINT "PK-Empresa" PRIMARY KEY ("IdEmpresa");


--
-- TOC entry 1963 (class 2606 OID 17682)
-- Name: PK_Agency; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Agency"
    ADD CONSTRAINT "PK_Agency" PRIMARY KEY ("IdAgency");


--
-- TOC entry 1951 (class 2606 OID 17666)
-- Name: PK_Category; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Category"
    ADD CONSTRAINT "PK_Category" PRIMARY KEY ("IdCategory");


--
-- TOC entry 1967 (class 2606 OID 17713)
-- Name: PK_DetailOrder; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "DetailOrder"
    ADD CONSTRAINT "PK_DetailOrder" PRIMARY KEY ("IdDetail");


--
-- TOC entry 1965 (class 2606 OID 17693)
-- Name: PK_ORDER; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Order"
    ADD CONSTRAINT "PK_ORDER" PRIMARY KEY ("IdOrder");


--
-- TOC entry 1955 (class 2606 OID 17668)
-- Name: PK_Products; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Products"
    ADD CONSTRAINT "PK_Products" PRIMARY KEY ("IdProduct");


--
-- TOC entry 1969 (class 2606 OID 17724)
-- Name: PK_Rol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Rol"
    ADD CONSTRAINT "PK_Rol" PRIMARY KEY ("IdRol");


--
-- TOC entry 1957 (class 2606 OID 17670)
-- Name: PK_Sauce; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sauce"
    ADD CONSTRAINT "PK_Sauce" PRIMARY KEY ("IdSauce");


--
-- TOC entry 1959 (class 2606 OID 17672)
-- Name: PK_Spicy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Spicy"
    ADD CONSTRAINT "PK_Spicy" PRIMARY KEY ("IdSpicy");


--
-- TOC entry 1961 (class 2606 OID 17674)
-- Name: PK_Usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Usuarios"
    ADD CONSTRAINT "PK_Usuarios" PRIMARY KEY ("IdUsuario");


--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-06-13 23:08:35

--
-- PostgreSQL database dump complete
--
