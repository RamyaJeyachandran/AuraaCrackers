--
-- PostgreSQL database dump
--

\restrict lUN9fsBQeZzJFX7A9nzTwMTNAwf9DNCciGTyw7fzQlzhd5O7ES7I7WazcQd2lzi

-- Dumped from database version 15.17 (Debian 15.17-1.pgdg13+1)
-- Dumped by pg_dump version 15.17 (Debian 15.17-1.pgdg13+1)

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
-- Name: tbl_city; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_city (
    id integer NOT NULL,
    "stateId" integer,
    name character varying(100),
    code character varying(10),
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: tbl_city_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbl_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_city_id_seq OWNED BY public.tbl_city.id;


--
-- Name: tbl_country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_country (
    id integer NOT NULL,
    name character varying(100),
    code character varying(10),
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: tbl_country_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbl_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_country_id_seq OWNED BY public.tbl_country.id;


--
-- Name: tbl_pricelist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_pricelist (
    id integer NOT NULL,
    "listName" character varying(150),
    "listDesc" text,
    "companyId" integer,
    "branchId" integer,
    "isActive" integer DEFAULT 1,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


--
-- Name: tbl_pricelist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_pricelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbl_pricelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_pricelist_id_seq OWNED BY public.tbl_pricelist.id;


--
-- Name: tbl_pricelist_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_pricelist_items (
    id integer NOT NULL,
    "pricelistId" integer,
    "itemId" integer,
    unit character varying(50),
    "purchaseRate" numeric(15,2) DEFAULT 0.00,
    "purchaseRateInc" numeric(15,2) DEFAULT 0.00,
    "sellingPrice" numeric(15,2) DEFAULT 0.00,
    "customerSp" numeric(15,2) DEFAULT 0.00,
    "shownValues" numeric(15,2) DEFAULT 0.00,
    "shownValueDisc" numeric(5,2) DEFAULT 0.00,
    "salesCost" numeric(15,2) DEFAULT 0.00,
    "companyId" integer,
    "branchId" integer,
    "isActive" integer DEFAULT 1,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


--
-- Name: tbl_pricelist_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_pricelist_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbl_pricelist_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_pricelist_items_id_seq OWNED BY public.tbl_pricelist_items.id;


--
-- Name: tbl_serialno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_serialno (
    id integer NOT NULL,
    "tableName" character varying(100),
    "prefixNo" character varying(20),
    "nextNo" integer DEFAULT 1,
    "suffixNo" character varying(20),
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer,
    "sequenceNo" integer DEFAULT 1
);


--
-- Name: tbl_serialno_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_serialno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbl_serialno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_serialno_id_seq OWNED BY public.tbl_serialno.id;


--
-- Name: tbl_state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_state (
    id integer NOT NULL,
    "countryId" integer,
    name character varying(100),
    code character varying(10),
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: tbl_state_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbl_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_state_id_seq OWNED BY public.tbl_state.id;


--
-- Name: tbl_websitelist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tbl_websitelist (
    id integer NOT NULL,
    "websiteName" character varying(255),
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: tbl_websitelist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tbl_websitelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tbl_websitelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tbl_websitelist_id_seq OWNED BY public.tbl_websitelist.id;


--
-- Name: tbl_city id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_city ALTER COLUMN id SET DEFAULT nextval('public.tbl_city_id_seq'::regclass);


--
-- Name: tbl_country id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_country ALTER COLUMN id SET DEFAULT nextval('public.tbl_country_id_seq'::regclass);


--
-- Name: tbl_pricelist id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist ALTER COLUMN id SET DEFAULT nextval('public.tbl_pricelist_id_seq'::regclass);


--
-- Name: tbl_pricelist_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist_items ALTER COLUMN id SET DEFAULT nextval('public.tbl_pricelist_items_id_seq'::regclass);


--
-- Name: tbl_serialno id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_serialno ALTER COLUMN id SET DEFAULT nextval('public.tbl_serialno_id_seq'::regclass);


--
-- Name: tbl_state id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_state ALTER COLUMN id SET DEFAULT nextval('public.tbl_state_id_seq'::regclass);


--
-- Name: tbl_websitelist id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_websitelist ALTER COLUMN id SET DEFAULT nextval('public.tbl_websitelist_id_seq'::regclass);


--
-- Name: tbl_city tbl_city_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_city
    ADD CONSTRAINT tbl_city_pkey PRIMARY KEY (id);


--
-- Name: tbl_country tbl_country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_country
    ADD CONSTRAINT tbl_country_pkey PRIMARY KEY (id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_pkey PRIMARY KEY (id);


--
-- Name: tbl_pricelist tbl_pricelist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist
    ADD CONSTRAINT tbl_pricelist_pkey PRIMARY KEY (id);


--
-- Name: tbl_serialno tbl_serialno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_serialno
    ADD CONSTRAINT tbl_serialno_pkey PRIMARY KEY (id);


--
-- Name: tbl_state tbl_state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_state
    ADD CONSTRAINT tbl_state_pkey PRIMARY KEY (id);


--
-- Name: tbl_websitelist tbl_websitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_websitelist
    ADD CONSTRAINT tbl_websitelist_pkey PRIMARY KEY (id);


--
-- Name: tbl_city tbl_city_stateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_city
    ADD CONSTRAINT tbl_city_stateid_fkey FOREIGN KEY ("stateId") REFERENCES public.tbl_state(id);


--
-- Name: tbl_pricelist tbl_pricelist_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist
    ADD CONSTRAINT tbl_pricelist_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_pricelist tbl_pricelist_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist
    ADD CONSTRAINT tbl_pricelist_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_itemid_fkey FOREIGN KEY ("itemId") REFERENCES public.tbl_items(id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_pricelistid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_pricelistid_fkey FOREIGN KEY ("pricelistId") REFERENCES public.tbl_pricelist(id);


--
-- Name: tbl_serialno tbl_serialno_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_serialno
    ADD CONSTRAINT tbl_serialno_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_serialno tbl_serialno_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_serialno
    ADD CONSTRAINT tbl_serialno_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_state tbl_state_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_state
    ADD CONSTRAINT tbl_state_countryid_fkey FOREIGN KEY ("countryId") REFERENCES public.tbl_country(id);


--
-- Name: tbl_websitelist tbl_websitelist_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_websitelist
    ADD CONSTRAINT tbl_websitelist_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_websitelist tbl_websitelist_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tbl_websitelist
    ADD CONSTRAINT tbl_websitelist_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- PostgreSQL database dump complete
--

\unrestrict lUN9fsBQeZzJFX7A9nzTwMTNAwf9DNCciGTyw7fzQlzhd5O7ES7I7WazcQd2lzi

--
-- PostgreSQL database dump
--

\restrict KtULw2lfdkN5UhQgLg93bmk5Ng7wS1DEQhfuQk9DEbcV1m5Tud5Z9XHwvyETSUe

-- Dumped from database version 15.17 (Debian 15.17-1.pgdg13+1)
-- Dumped by pg_dump version 15.17 (Debian 15.17-1.pgdg13+1)

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

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'users', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'crackers', 'category');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'crackers', 'product');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'users', 'role');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'crackers', 'unit');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'crackers', 'cartitem');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'crackers', 'customer');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'crackers', 'onlinesales');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (14, 'crackers', 'onlinesalesitem');


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add user', 5, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change user', 5, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete user', 5, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view user', 5, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add category', 6, 'add_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change category', 6, 'change_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete category', 6, 'delete_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view category', 6, 'view_category');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add product', 7, 'add_product');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change product', 7, 'change_product');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete product', 7, 'delete_product');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view product', 7, 'view_product');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add session', 8, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change session', 8, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete session', 8, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view session', 8, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add role', 9, 'add_role');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change role', 9, 'change_role');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete role', 9, 'delete_role');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view role', 9, 'view_role');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add unit', 10, 'add_unit');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change unit', 10, 'change_unit');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete unit', 10, 'delete_unit');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view unit', 10, 'view_unit');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add cart item', 11, 'add_cartitem');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change cart item', 11, 'change_cartitem');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete cart item', 11, 'delete_cartitem');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view cart item', 11, 'view_cartitem');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add customer', 12, 'add_customer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change customer', 12, 'change_customer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete customer', 12, 'delete_customer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view customer', 12, 'view_customer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add online sales', 13, 'add_onlinesales');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change online sales', 13, 'change_onlinesales');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete online sales', 13, 'delete_onlinesales');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view online sales', 13, 'view_onlinesales');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can add online sales item', 14, 'add_onlinesalesitem');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can change online sales item', 14, 'change_onlinesalesitem');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can delete online sales item', 14, 'delete_onlinesalesitem');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can view online sales item', 14, 'view_onlinesalesitem');


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2026-03-20 19:27:52.808885+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2026-03-20 19:27:52.860127+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2026-03-20 19:27:53.077399+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2026-03-20 19:27:53.093315+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2026-03-20 19:27:53.104256+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2026-03-20 19:27:53.119999+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2026-03-20 19:27:53.137772+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2026-03-20 19:27:53.151659+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2026-03-20 19:27:53.174551+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0008_alter_user_username_max_length', '2026-03-20 19:27:53.197432+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2026-03-20 19:27:53.224568+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0010_alter_group_name_max_length', '2026-03-20 19:27:53.257001+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0011_update_proxy_permissions', '2026-03-20 19:27:53.279201+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2026-03-20 19:27:53.304469+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'users', '0001_initial', '2026-03-20 19:27:53.52075+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'admin', '0001_initial', '2026-03-20 19:27:53.611201+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2026-03-20 19:27:53.636673+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2026-03-20 19:27:53.663057+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'crackers', '0001_initial', '2026-03-20 19:27:53.904642+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'crackers', '0002_category_is_active_category_order', '2026-03-20 19:27:53.961415+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'sessions', '0001_initial', '2026-03-20 19:28:33.366933+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'crackers', '0003_rename_products_name_a9a494_idx_tbl_items_itemnam_f84e7b_idx_and_more', '2026-03-20 19:30:10.185348+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'crackers', '0004_units', '2026-03-20 19:30:10.209298+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'crackers', '0005_rename_units_unit_product_outbook_item_id_and_more', '2026-03-20 19:30:10.223756+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'crackers', '0006_alter_category_name', '2026-03-20 19:30:10.236119+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'crackers', '0007_cartitem', '2026-03-20 19:30:10.247512+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (27, 'crackers', '0008_remove_product_unit_id_product_unit_and_more', '2026-03-20 19:30:10.260169+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (28, 'crackers', '0009_product_is_disabled', '2026-03-20 19:30:10.273579+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (29, 'crackers', '0010_customer_onlinesales_onlinesalesitem', '2026-03-20 19:30:10.289114+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (30, 'users', '0002_role_and_more', '2026-03-20 19:30:10.314631+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (31, 'users', '0003_user_address_user_city_user_full_name_and_more', '2026-03-20 19:30:10.340361+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (32, 'users', '0004_user_online_customer', '2026-03-20 19:30:10.36664+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (33, 'users', '0005_auto_20260319_0102', '2026-03-20 19:30:10.384339+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (34, 'users', '0006_user_user_name', '2026-03-20 19:30:10.408021+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (35, 'crackers', '0011_coupon', '2026-03-20 19:30:17.975036+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (36, 'crackers', '0012_coupon_percentage', '2026-03-20 19:30:18.005474+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (37, 'crackers', '0013_customeraddress', '2026-03-20 19:30:18.047896+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (38, 'crackers', '0014_onlinesales_customer_address', '2026-03-20 19:30:18.065859+00');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (39, 'crackers', '0015_onlinesales_payment_method_and_more', '2026-03-20 19:30:18.100692+00');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('gz7fsw0b8z3r4yze0gfb2mpwilcr3x8p', '.eJxVi70OwiAQgN-F2ZDe0RNwdPcZyHEcodFoI3Yyvrtt0kHX7-dtEi-vlpauzzQVczJgDr8ss1z1vgme52431u0Ou7088nTT8978jY17W69aglAEhuiP5LMjPzIWLVBBMKJXVFqdCLkxRiwQqJJAzq4GHnAwny_t3jSD:1w3fXA:OFY0-nGh0woTbn1wGdmBfRvqPChfKtQ04iv7_lE0_Po', '2026-03-20 19:59:24.555624+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('nd8lkpa6itgjk1ximhpsm9rv3ey9r6mc', '.eJxVjsEOwiAQRP-FsyFly0Lw6N1vIAssgWi0cdt4MP67relBr2_mTealIi1zi4vwI_aijgrU4Zclyhe-bQFNk-iNid6h6PM99Suf9s6f2EjaajEjO0fGFAQbcsnJeDRIhMMYLJlxqNVAYAK0XFz2qdgKiDVUBOf8OvrkJH3m7z14fwA9cznV:1w3uCK:BYZRDBZS7YmzQBm_31iz_95z-I2cy1Kv6oz4AufcKEY', '2026-03-21 11:38:52.58529+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('bx28p15edln3xq9x8x9mqp3lbpyb56h6', 'eyJ3ZWJzaXRlX2lkIjoyfQ:1w48iA:euF9vuw6ySjtx2PmMHI4Esb4uu5Bz-cuKyYPL0jvHQA', '2026-03-22 03:08:42.399201+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('9pn74yrwb33fdf2q9sbihcddee6le2bk', 'eyJ3ZWJzaXRlX2lkIjoyfQ:1w4D1w:dDpTzmBphOjC8Dq-f1UMBH30YPaipF2g4JcV2jobykY', '2026-03-22 07:45:24.051631+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('iqtjhyhz81oyl6599aw5ntckgz4i7mxj', '.eJxVzk0KwyAQBeC7uC6ixjGYZbvuGWTUEaU_hpjQRendm5RQyPZ78x7zZi_yrczkSmSDOjGHy5zd0mj6CVPsYB7DjZ5bgOPY-GaN79j4tfpyp_N-cyhmbHltEQEZg1JGUNqGGLzsQQIiiM5qlJ1ISSpLqEBTNKH3UScFkGwCZUy_jo5TfVQXaqTtPaHMJZf57yNNbJCCi88XpZhGeA:1w3whl:78yc6wvYC9LZ9Mw5m6rm5xTGuZeNKJR9kLeZonY6ZHw', '2026-03-21 14:19:29.481104+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('aavawbcfuujlip5ovcy9tqs3ctrouy2s', 'eyJ3ZWJzaXRlX2lkIjoyfQ:1w4Fql:fWdZYI3Z8aECApRWEL1JnEOtwQmtUNEY7inaEwXlhw0', '2026-03-22 10:46:03.518955+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('fmb67h3b141g2uwesobdxj1ctweiwevb', 'eyJ3ZWJzaXRlX2lkIjoyfQ:1w4L9K:az4ElZW2lD2NQ3kAiU06CAxwI_XwwJRae7ZqQ6ZyQBw', '2026-03-22 16:25:34.338709+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('o9s903dquwtsc59q8bou8svb2743vna1', 'eyJ3ZWJzaXRlX2lkIjoyfQ:1w4LAa:MVcfGDBYTfqtPsJCWZP976vJmSKZ6UwYm4EVU0oufsE', '2026-03-22 16:26:52.36421+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('jnyrm86kr0vidgmff8z12todm06p7tvy', 'eyJ3ZWJzaXRlX2lkIjoyfQ:1w4MZF:rCOELp87CrB7WocZ9F5vWbrAj5p4p5WczYyVwKWw-kM', '2026-03-22 17:56:25.494868+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('ub0rajohk4i2jnt240gz739t6fzvvayf', '.eJxVyzEOwjAMheG7ZEZR7caJwsjOGSIncZQKBBWmE-LutFKHsn7v_R-TeHn3tKi80lTN2aA5HS1zucljG3ie1W6mdke112ee7nLZP39hZ-1rJULiPQNUQhdLLRkCATHTMEbHMA6tAUZhJCfVl5Cra0jUYiP0PpjvD_3nNNo:1w3pTx:SYepEuukqC9K34onkZWAHHPqlTL70TCfWm0NCx5BBzA', '2026-03-21 06:36:45.318845+00');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('yvyz19a5a538o5j3xvmyti21zh0h0xw5', '.eJxVzk0KwyAQBeC7uC6ixjGYZbvuGWTUEaU_hpjQRendm5RQyPZ78x7zZi_yrczkSmSDOjGHy5zd0mj6CVPsYB7DjZ5bgOPY-GaN79j4tfpyp_N-cyhmbHltEQEZg1JGUNqGGLzsQQIiiM5qlJ1ISSpLqEBTNKH3UScFkGwCZUy_jo5TfVQXaqTtPaHMJZf57yNNbJCCi88XpZhGeA:1w3wvI:qLhGs1HYhMMrc_qd0pkgGC62Lzt5zmevU23r9hCHiB4', '2026-03-21 14:33:28.898682+00');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_country; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_country (id, name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (1, 'India', 'IN', true, 1, '2026-03-21 04:08:42.258506+00', '2026-03-21 04:08:42.259091+00');


--
-- Data for Name: tbl_state; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (1, 1, 'Andhra Pradesh', NULL, true, 1, '2026-03-21 04:08:42.292853+00', '2026-03-21 04:08:42.292871+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (2, 1, 'Arunachal Pradesh', NULL, true, 1, '2026-03-21 04:08:42.342775+00', '2026-03-21 04:08:42.342793+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (3, 1, 'Assam', NULL, true, 1, '2026-03-21 04:08:42.36672+00', '2026-03-21 04:08:42.366733+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (4, 1, 'Bihar', NULL, true, 1, '2026-03-21 04:08:42.392253+00', '2026-03-21 04:08:42.392266+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (5, 1, 'Chhattisgarh', NULL, true, 1, '2026-03-21 04:08:42.417808+00', '2026-03-21 04:08:42.417821+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (6, 1, 'Goa', NULL, true, 1, '2026-03-21 04:08:42.443839+00', '2026-03-21 04:08:42.443872+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (7, 1, 'Gujarat', NULL, true, 1, '2026-03-21 04:08:42.466408+00', '2026-03-21 04:08:42.466425+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (8, 1, 'Haryana', NULL, true, 1, '2026-03-21 04:08:42.499332+00', '2026-03-21 04:08:42.49935+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (9, 1, 'Himachal Pradesh', NULL, true, 1, '2026-03-21 04:08:42.515534+00', '2026-03-21 04:08:42.515543+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (10, 1, 'Jharkhand', NULL, true, 1, '2026-03-21 04:08:42.53065+00', '2026-03-21 04:08:42.530665+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (11, 1, 'Karnataka', NULL, true, 1, '2026-03-21 04:08:42.549901+00', '2026-03-21 04:08:42.549913+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (12, 1, 'Kerala', NULL, true, 1, '2026-03-21 04:08:42.572433+00', '2026-03-21 04:08:42.572445+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (13, 1, 'Madhya Pradesh', NULL, true, 1, '2026-03-21 04:08:42.593046+00', '2026-03-21 04:08:42.593057+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (14, 1, 'Maharashtra', NULL, true, 1, '2026-03-21 04:08:42.616948+00', '2026-03-21 04:08:42.616961+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (15, 1, 'Manipur', NULL, true, 1, '2026-03-21 04:08:42.646843+00', '2026-03-21 04:08:42.646857+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (16, 1, 'Meghalaya', NULL, true, 1, '2026-03-21 04:08:42.657688+00', '2026-03-21 04:08:42.657699+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (17, 1, 'Mizoram', NULL, true, 1, '2026-03-21 04:08:42.667763+00', '2026-03-21 04:08:42.667775+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (18, 1, 'Nagaland', NULL, true, 1, '2026-03-21 04:08:42.683246+00', '2026-03-21 04:08:42.683273+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (19, 1, 'Odisha', NULL, true, 1, '2026-03-21 04:08:42.706389+00', '2026-03-21 04:08:42.706402+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (20, 1, 'Punjab', NULL, true, 1, '2026-03-21 04:08:42.752347+00', '2026-03-21 04:08:42.752387+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (21, 1, 'Rajasthan', NULL, true, 1, '2026-03-21 04:08:42.795591+00', '2026-03-21 04:08:42.795604+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (22, 1, 'Sikkim', NULL, true, 1, '2026-03-21 04:08:42.858307+00', '2026-03-21 04:08:42.858347+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (23, 1, 'Tamil Nadu', NULL, true, 1, '2026-03-21 04:08:42.883127+00', '2026-03-21 04:08:42.883167+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (24, 1, 'Telangana', NULL, true, 1, '2026-03-21 04:08:42.974458+00', '2026-03-21 04:08:42.974487+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (25, 1, 'Tripura', NULL, true, 1, '2026-03-21 04:08:43.008317+00', '2026-03-21 04:08:43.00835+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (26, 1, 'Uttar Pradesh', NULL, true, 1, '2026-03-21 04:08:43.025434+00', '2026-03-21 04:08:43.025461+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (27, 1, 'Uttarakhand', NULL, true, 1, '2026-03-21 04:08:43.089455+00', '2026-03-21 04:08:43.08948+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (28, 1, 'West Bengal', NULL, true, 1, '2026-03-21 04:08:43.120195+00', '2026-03-21 04:08:43.120207+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (29, 1, 'Delhi', NULL, true, 1, '2026-03-21 04:08:43.146669+00', '2026-03-21 04:08:43.146684+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (30, 1, 'Chandigarh', NULL, true, 1, '2026-03-21 04:08:43.164944+00', '2026-03-21 04:08:43.164955+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (31, 1, 'Puducherry', NULL, true, 1, '2026-03-21 04:08:43.176274+00', '2026-03-21 04:08:43.176289+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (32, 1, 'Jammu and Kashmir', NULL, true, 1, '2026-03-21 04:08:43.205519+00', '2026-03-21 04:08:43.205559+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (33, 1, 'Ladakh', NULL, true, 1, '2026-03-21 04:08:43.225298+00', '2026-03-21 04:08:43.225315+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (34, 1, 'Andaman and Nicobar Islands', NULL, true, 1, '2026-03-21 04:08:43.244742+00', '2026-03-21 04:08:43.244759+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (35, 1, 'Lakshadweep', NULL, true, 1, '2026-03-21 04:08:43.256099+00', '2026-03-21 04:08:43.256109+00');
INSERT INTO public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (36, 1, 'Dadra and Nagar Haveli and Daman and Diu', NULL, true, 1, '2026-03-21 04:08:43.26808+00', '2026-03-21 04:08:43.268093+00');


--
-- Data for Name: tbl_city; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (1, 1, 'Visakhapatnam', NULL, true, 1, '2026-03-21 04:08:42.306525+00', '2026-03-21 04:08:42.306547+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (2, 1, 'Vijayawada', NULL, true, 1, '2026-03-21 04:08:42.315975+00', '2026-03-21 04:08:42.315999+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (3, 1, 'Guntur', NULL, true, 1, '2026-03-21 04:08:42.322959+00', '2026-03-21 04:08:42.323025+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (4, 1, 'Nellore', NULL, true, 1, '2026-03-21 04:08:42.330102+00', '2026-03-21 04:08:42.330123+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (5, 1, 'Kurnool', NULL, true, 1, '2026-03-21 04:08:42.336496+00', '2026-03-21 04:08:42.336517+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (6, 2, 'Itanagar', NULL, true, 1, '2026-03-21 04:08:42.349908+00', '2026-03-21 04:08:42.349927+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (7, 2, 'Tawang', NULL, true, 1, '2026-03-21 04:08:42.356278+00', '2026-03-21 04:08:42.3563+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (8, 2, 'Ziro', NULL, true, 1, '2026-03-21 04:08:42.360446+00', '2026-03-21 04:08:42.360457+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (9, 3, 'Guwahati', NULL, true, 1, '2026-03-21 04:08:42.371341+00', '2026-03-21 04:08:42.371358+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (10, 3, 'Silchar', NULL, true, 1, '2026-03-21 04:08:42.380121+00', '2026-03-21 04:08:42.380136+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (11, 3, 'Dibrugarh', NULL, true, 1, '2026-03-21 04:08:42.384018+00', '2026-03-21 04:08:42.38403+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (12, 3, 'Jorhat', NULL, true, 1, '2026-03-21 04:08:42.388283+00', '2026-03-21 04:08:42.388303+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (13, 4, 'Patna', NULL, true, 1, '2026-03-21 04:08:42.396951+00', '2026-03-21 04:08:42.396988+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (14, 4, 'Gaya', NULL, true, 1, '2026-03-21 04:08:42.403901+00', '2026-03-21 04:08:42.403921+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (15, 4, 'Bhagalpur', NULL, true, 1, '2026-03-21 04:08:42.408836+00', '2026-03-21 04:08:42.408848+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (16, 4, 'Muzaffarpur', NULL, true, 1, '2026-03-21 04:08:42.413778+00', '2026-03-21 04:08:42.413792+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (17, 5, 'Raipur', NULL, true, 1, '2026-03-21 04:08:42.423658+00', '2026-03-21 04:08:42.423676+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (18, 5, 'Bhilai', NULL, true, 1, '2026-03-21 04:08:42.43178+00', '2026-03-21 04:08:42.431794+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (19, 5, 'Bilaspur', NULL, true, 1, '2026-03-21 04:08:42.435231+00', '2026-03-21 04:08:42.435242+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (20, 5, 'Korba', NULL, true, 1, '2026-03-21 04:08:42.43941+00', '2026-03-21 04:08:42.439429+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (21, 6, 'Panaji', NULL, true, 1, '2026-03-21 04:08:42.451002+00', '2026-03-21 04:08:42.451026+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (22, 6, 'Margao', NULL, true, 1, '2026-03-21 04:08:42.457244+00', '2026-03-21 04:08:42.457259+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (23, 6, 'Vasco da Gama', NULL, true, 1, '2026-03-21 04:08:42.46155+00', '2026-03-21 04:08:42.461562+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (24, 7, 'Ahmedabad', NULL, true, 1, '2026-03-21 04:08:42.472434+00', '2026-03-21 04:08:42.472456+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (25, 7, 'Surat', NULL, true, 1, '2026-03-21 04:08:42.479391+00', '2026-03-21 04:08:42.479405+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (26, 7, 'Vadodara', NULL, true, 1, '2026-03-21 04:08:42.48499+00', '2026-03-21 04:08:42.485012+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (27, 7, 'Rajkot', NULL, true, 1, '2026-03-21 04:08:42.489394+00', '2026-03-21 04:08:42.489407+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (28, 7, 'Gandhinagar', NULL, true, 1, '2026-03-21 04:08:42.49368+00', '2026-03-21 04:08:42.493698+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (29, 8, 'Faridabad', NULL, true, 1, '2026-03-21 04:08:42.50435+00', '2026-03-21 04:08:42.504362+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (30, 8, 'Gurgaon', NULL, true, 1, '2026-03-21 04:08:42.507622+00', '2026-03-21 04:08:42.507633+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (31, 8, 'Panipat', NULL, true, 1, '2026-03-21 04:08:42.510118+00', '2026-03-21 04:08:42.510127+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (32, 8, 'Ambala', NULL, true, 1, '2026-03-21 04:08:42.51301+00', '2026-03-21 04:08:42.513021+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (33, 9, 'Shimla', NULL, true, 1, '2026-03-21 04:08:42.518464+00', '2026-03-21 04:08:42.518474+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (34, 9, 'Dharamshala', NULL, true, 1, '2026-03-21 04:08:42.522607+00', '2026-03-21 04:08:42.522619+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (35, 9, 'Solan', NULL, true, 1, '2026-03-21 04:08:42.526836+00', '2026-03-21 04:08:42.526849+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (36, 10, 'Ranchi', NULL, true, 1, '2026-03-21 04:08:42.534125+00', '2026-03-21 04:08:42.534139+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (37, 10, 'Jamshedpur', NULL, true, 1, '2026-03-21 04:08:42.537801+00', '2026-03-21 04:08:42.537814+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (38, 10, 'Dhanbad', NULL, true, 1, '2026-03-21 04:08:42.54248+00', '2026-03-21 04:08:42.542504+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (39, 10, 'Bokaro', NULL, true, 1, '2026-03-21 04:08:42.546568+00', '2026-03-21 04:08:42.546582+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (40, 11, 'Bangalore', NULL, true, 1, '2026-03-21 04:08:42.55262+00', '2026-03-21 04:08:42.552636+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (41, 11, 'Mysore', NULL, true, 1, '2026-03-21 04:08:42.556665+00', '2026-03-21 04:08:42.556678+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (42, 11, 'Hubli', NULL, true, 1, '2026-03-21 04:08:42.560746+00', '2026-03-21 04:08:42.560757+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (43, 11, 'Mangalore', NULL, true, 1, '2026-03-21 04:08:42.564844+00', '2026-03-21 04:08:42.564857+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (44, 11, 'Belgaum', NULL, true, 1, '2026-03-21 04:08:42.568654+00', '2026-03-21 04:08:42.568665+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (45, 12, 'Thiruvananthapuram', NULL, true, 1, '2026-03-21 04:08:42.577298+00', '2026-03-21 04:08:42.577319+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (46, 12, 'Kochi', NULL, true, 1, '2026-03-21 04:08:42.581284+00', '2026-03-21 04:08:42.581298+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (47, 12, 'Kozhikode', NULL, true, 1, '2026-03-21 04:08:42.584853+00', '2026-03-21 04:08:42.584864+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (48, 12, 'Thrissur', NULL, true, 1, '2026-03-21 04:08:42.588709+00', '2026-03-21 04:08:42.588728+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (49, 13, 'Bhopal', NULL, true, 1, '2026-03-21 04:08:42.596704+00', '2026-03-21 04:08:42.596715+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (50, 13, 'Indore', NULL, true, 1, '2026-03-21 04:08:42.600926+00', '2026-03-21 04:08:42.600939+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (51, 13, 'Gwalior', NULL, true, 1, '2026-03-21 04:08:42.604731+00', '2026-03-21 04:08:42.604744+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (52, 13, 'Jabalpur', NULL, true, 1, '2026-03-21 04:08:42.608785+00', '2026-03-21 04:08:42.608797+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (53, 13, 'Ujjain', NULL, true, 1, '2026-03-21 04:08:42.612723+00', '2026-03-21 04:08:42.612738+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (54, 14, 'Mumbai', NULL, true, 1, '2026-03-21 04:08:42.620247+00', '2026-03-21 04:08:42.620264+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (55, 14, 'Pune', NULL, true, 1, '2026-03-21 04:08:42.626265+00', '2026-03-21 04:08:42.626277+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (56, 14, 'Nagpur', NULL, true, 1, '2026-03-21 04:08:42.630591+00', '2026-03-21 04:08:42.630613+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (57, 14, 'Thane', NULL, true, 1, '2026-03-21 04:08:42.634288+00', '2026-03-21 04:08:42.6343+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (58, 14, 'Nashik', NULL, true, 1, '2026-03-21 04:08:42.638045+00', '2026-03-21 04:08:42.638058+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (59, 14, 'Aurangabad', NULL, true, 1, '2026-03-21 04:08:42.642273+00', '2026-03-21 04:08:42.642286+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (60, 15, 'Imphal', NULL, true, 1, '2026-03-21 04:08:42.65248+00', '2026-03-21 04:08:42.652508+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (61, 16, 'Shillong', NULL, true, 1, '2026-03-21 04:08:42.662516+00', '2026-03-21 04:08:42.662543+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (62, 17, 'Aizawl', NULL, true, 1, '2026-03-21 04:08:42.672684+00', '2026-03-21 04:08:42.672699+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (63, 18, 'Kohima', NULL, true, 1, '2026-03-21 04:08:42.691906+00', '2026-03-21 04:08:42.691944+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (64, 18, 'Dimapur', NULL, true, 1, '2026-03-21 04:08:42.700715+00', '2026-03-21 04:08:42.700727+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (65, 19, 'Bhubaneswar', NULL, true, 1, '2026-03-21 04:08:42.711696+00', '2026-03-21 04:08:42.711724+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (66, 19, 'Cuttack', NULL, true, 1, '2026-03-21 04:08:42.720262+00', '2026-03-21 04:08:42.720288+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (67, 19, 'Rourkela', NULL, true, 1, '2026-03-21 04:08:42.730197+00', '2026-03-21 04:08:42.730223+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (68, 19, 'Berhampur', NULL, true, 1, '2026-03-21 04:08:42.741514+00', '2026-03-21 04:08:42.741556+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (69, 20, 'Ludhiana', NULL, true, 1, '2026-03-21 04:08:42.760095+00', '2026-03-21 04:08:42.760119+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (70, 20, 'Amritsar', NULL, true, 1, '2026-03-21 04:08:42.768784+00', '2026-03-21 04:08:42.768808+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (71, 20, 'Jalandhar', NULL, true, 1, '2026-03-21 04:08:42.776082+00', '2026-03-21 04:08:42.776102+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (72, 20, 'Patiala', NULL, true, 1, '2026-03-21 04:08:42.784464+00', '2026-03-21 04:08:42.784488+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (73, 20, 'Bathinda', NULL, true, 1, '2026-03-21 04:08:42.790831+00', '2026-03-21 04:08:42.790845+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (74, 21, 'Jaipur', NULL, true, 1, '2026-03-21 04:08:42.801761+00', '2026-03-21 04:08:42.801787+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (75, 21, 'Jodhpur', NULL, true, 1, '2026-03-21 04:08:42.809839+00', '2026-03-21 04:08:42.80987+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (76, 21, 'Udaipur', NULL, true, 1, '2026-03-21 04:08:42.821688+00', '2026-03-21 04:08:42.821781+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (77, 21, 'Kota', NULL, true, 1, '2026-03-21 04:08:42.833472+00', '2026-03-21 04:08:42.833517+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (78, 21, 'Ajmer', NULL, true, 1, '2026-03-21 04:08:42.846218+00', '2026-03-21 04:08:42.846255+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (79, 22, 'Gangtok', NULL, true, 1, '2026-03-21 04:08:42.868869+00', '2026-03-21 04:08:42.868907+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (80, 23, 'Chennai', NULL, true, 1, '2026-03-21 04:08:42.897397+00', '2026-03-21 04:08:42.897436+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (81, 23, 'Coimbatore', NULL, true, 1, '2026-03-21 04:08:42.908911+00', '2026-03-21 04:08:42.908943+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (82, 23, 'Madurai', NULL, true, 1, '2026-03-21 04:08:42.91975+00', '2026-03-21 04:08:42.919791+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (83, 23, 'Trichy', NULL, true, 1, '2026-03-21 04:08:42.931149+00', '2026-03-21 04:08:42.931184+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (84, 23, 'Salem', NULL, true, 1, '2026-03-21 04:08:42.942309+00', '2026-03-21 04:08:42.942332+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (85, 23, 'Tiruppur', NULL, true, 1, '2026-03-21 04:08:42.955115+00', '2026-03-21 04:08:42.955141+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (86, 23, 'Erode', NULL, true, 1, '2026-03-21 04:08:42.964403+00', '2026-03-21 04:08:42.964433+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (87, 24, 'Hyderabad', NULL, true, 1, '2026-03-21 04:08:42.981792+00', '2026-03-21 04:08:42.981912+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (88, 24, 'Warangal', NULL, true, 1, '2026-03-21 04:08:42.989521+00', '2026-03-21 04:08:42.989539+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (89, 24, 'Nizamabad', NULL, true, 1, '2026-03-21 04:08:42.995255+00', '2026-03-21 04:08:42.995284+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (90, 24, 'Karimnagar', NULL, true, 1, '2026-03-21 04:08:43.001552+00', '2026-03-21 04:08:43.00158+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (91, 25, 'Agartala', NULL, true, 1, '2026-03-21 04:08:43.018415+00', '2026-03-21 04:08:43.018437+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (92, 26, 'Lucknow', NULL, true, 1, '2026-03-21 04:08:43.032352+00', '2026-03-21 04:08:43.032377+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (93, 26, 'Kanpur', NULL, true, 1, '2026-03-21 04:08:43.038868+00', '2026-03-21 04:08:43.038889+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (94, 26, 'Agra', NULL, true, 1, '2026-03-21 04:08:43.046465+00', '2026-03-21 04:08:43.046486+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (95, 26, 'Varanasi', NULL, true, 1, '2026-03-21 04:08:43.063106+00', '2026-03-21 04:08:43.063133+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (96, 26, 'Meerut', NULL, true, 1, '2026-03-21 04:08:43.069742+00', '2026-03-21 04:08:43.069772+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (97, 26, 'Prayagraj', NULL, true, 1, '2026-03-21 04:08:43.076068+00', '2026-03-21 04:08:43.076082+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (98, 26, 'Ghaziabad', NULL, true, 1, '2026-03-21 04:08:43.083609+00', '2026-03-21 04:08:43.083624+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (99, 27, 'Dehradun', NULL, true, 1, '2026-03-21 04:08:43.095635+00', '2026-03-21 04:08:43.09566+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (100, 27, 'Haridwar', NULL, true, 1, '2026-03-21 04:08:43.102813+00', '2026-03-21 04:08:43.102856+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (101, 27, 'Roorkee', NULL, true, 1, '2026-03-21 04:08:43.111014+00', '2026-03-21 04:08:43.111034+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (102, 27, 'Haldwani', NULL, true, 1, '2026-03-21 04:08:43.115936+00', '2026-03-21 04:08:43.115947+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (103, 28, 'Kolkata', NULL, true, 1, '2026-03-21 04:08:43.124236+00', '2026-03-21 04:08:43.124256+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (104, 28, 'Howrah', NULL, true, 1, '2026-03-21 04:08:43.128789+00', '2026-03-21 04:08:43.128804+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (105, 28, 'Darjeeling', NULL, true, 1, '2026-03-21 04:08:43.132931+00', '2026-03-21 04:08:43.132941+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (106, 28, 'Siliguri', NULL, true, 1, '2026-03-21 04:08:43.137271+00', '2026-03-21 04:08:43.137291+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (107, 28, 'Asansol', NULL, true, 1, '2026-03-21 04:08:43.141714+00', '2026-03-21 04:08:43.141725+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (108, 29, 'New Delhi', NULL, true, 1, '2026-03-21 04:08:43.151297+00', '2026-03-21 04:08:43.151314+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (109, 29, 'North Delhi', NULL, true, 1, '2026-03-21 04:08:43.156437+00', '2026-03-21 04:08:43.156451+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (110, 29, 'South Delhi', NULL, true, 1, '2026-03-21 04:08:43.161343+00', '2026-03-21 04:08:43.161366+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (111, 30, 'Chandigarh', NULL, true, 1, '2026-03-21 04:08:43.170578+00', '2026-03-21 04:08:43.170606+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (112, 31, 'Puducherry', NULL, true, 1, '2026-03-21 04:08:43.183752+00', '2026-03-21 04:08:43.183783+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (113, 31, 'Karaikal', NULL, true, 1, '2026-03-21 04:08:43.190024+00', '2026-03-21 04:08:43.190041+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (114, 31, 'Mahe', NULL, true, 1, '2026-03-21 04:08:43.197003+00', '2026-03-21 04:08:43.197024+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (115, 32, 'Srinagar', NULL, true, 1, '2026-03-21 04:08:43.212929+00', '2026-03-21 04:08:43.212958+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (116, 32, 'Jammu', NULL, true, 1, '2026-03-21 04:08:43.219845+00', '2026-03-21 04:08:43.219859+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (117, 33, 'Leh', NULL, true, 1, '2026-03-21 04:08:43.234944+00', '2026-03-21 04:08:43.234974+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (118, 33, 'Kargil', NULL, true, 1, '2026-03-21 04:08:43.240916+00', '2026-03-21 04:08:43.240928+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (119, 34, 'Port Blair', NULL, true, 1, '2026-03-21 04:08:43.25054+00', '2026-03-21 04:08:43.250559+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (120, 35, 'Kavaratti', NULL, true, 1, '2026-03-21 04:08:43.260461+00', '2026-03-21 04:08:43.260473+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (121, 36, 'Daman', NULL, true, 1, '2026-03-21 04:08:43.271946+00', '2026-03-21 04:08:43.271974+00');
INSERT INTO public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") VALUES (122, 36, 'Silvassa', NULL, true, 1, '2026-03-21 04:08:43.279094+00', '2026-03-21 04:08:43.279129+00');


--
-- Data for Name: tbl_company; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_company (id, logo, name, "shortName", address1, address2, "countryId", "stateId", "cityId", "emailId", "mobileNo", "whatsappNo", currency, "fyStart", "appDateFormat", "appColorCode", "branchLimit", "userLimit", isseparatedb, dbname, "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (1, NULL, 'Auraa Zen AI', 'Auraa', NULL, NULL, NULL, NULL, NULL, NULL, '7358377381', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, 1, '2026-03-20 18:13:02.125927+00', '2026-03-20 18:13:02.125927+00', NULL);


--
-- Data for Name: tbl_branch; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_branch (id, logo, name, "shortName", address1, address2, "countryId", "stateId", "cityId", "emailId", "mobileNo", "whatsappNo", currency, "fyStart", "appDateFormat", "appColorCode", "companyId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (1, NULL, 'Auraa Crackers', 'Auraa', NULL, NULL, NULL, NULL, NULL, NULL, '7358377381', NULL, NULL, NULL, NULL, NULL, NULL, true, 1, '2026-03-20 18:14:29.277424+00', '2026-03-20 18:14:29.277424+00', NULL);


--
-- Data for Name: tbl_category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (1, 'SPARKLER', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (4, 'TWINKLING', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (5, 'ENJOY PENCIL', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (8, 'ROCKETS', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (10, 'ELECTRIC LAR CRACKERS', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (11, 'na', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (12, 'BABY FANCY NOVELTIES', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (13, 'COCKTAIL FANCY', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (14, 'COLOUR RIDER SHOTS', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (15, 'MULTI COLOUR SHOT', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (16, 'MINI AERIAL CHOTTA FANCY', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (17, 'MEGA DISPLAY', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (18, 'GUJARATH FLOWER POTS', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (19, '2 ┬╝ COLOUR FOUNTAIN', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (20, '4\" WONDER COLOR FOUNTAIN', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (21, 'TWIN COLOR FOUNTAINS', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (22, 'COLOUR FOUNTAIN', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (23, 'PEACOCK FOUNTAIN ', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (24, 'COLOUR MATCHES', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (25, 'Special Items', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (26, '                                                                       GIFT BOX', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (27, 'NEW PRODUCTS', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (28, 'EXTRA', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (29, 'GARLAND (Classic/PRIME)', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (30, 'STANDARD ITEMS', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (31, 'FAMILY PACK', '', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (39, 'MULTI SOUND CRACKERS', '/static/images/categories/multi-sound.png', 1, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (7, 'BIJILI', '/static/images/categories/bijili.png', 1, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (40, 'BIJILI', '/static/images/categories/bijili.png', 1, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (41, 'BRAND BIJILI', '/static/images/categories/bijili.png', 1, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (9, 'BOMB', '/static/images/categories/bomb.png', 1, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (42, 'BOMB', '/static/images/categories/bomb.png', 1, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (43, 'POWER DELUXE', '/static/images/categories/power-deluxe.png', 1, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (6, 'ONE SOUND CRACKERS', '/static/images/categories/one-sound.png', 1, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (38, 'ONE SOUND CRACKERS', '/static/images/categories/one-sound.png', 1, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (44, 'CELEBRATION GARLAND', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (45, 'GARLAND PRIME', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (46, 'ROCKETS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (47, 'PEACOCK FOUNTAINS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (48, 'SIREN', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (49, 'BABY FANCY NOVELTIES', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (50, 'COLOR RIDER SHOTS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (51, 'MULTI COLOUR SHOTS (Sky Blasters)', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (52, 'MULTI COLOUR SHOTS BRAND', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (53, 'AERIAL CHOTTA FANCY', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (54, 'GALAXY SHOW', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (55, 'GUJARATH FLOWER POTS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (56, 'SKY DANCERS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (36, 'TWINKLING STAR (Glow Show)', '/static/images/categories/twinkling-star.png', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (2, 'FLOWER POTS', '/static/images/categories/flower-pots.png', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (3, 'CHAKKARS', '/static/images/categories/chakkars.png', 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (57, 'MAGIC MOMENTS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (58, 'COCKTAIL FANCY', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (59, 'PAPER BOMBS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (60, 'SPECIAL FOUNTAINS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (61, 'MINI COLOR CRACKLING FOUNTAIN', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (62, '2\"  COLOUR FOUNTAINS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (63, '4\" COLOR FOUNTAINS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (64, 'COLOR MATCHES', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (65, 'FAMILY PACKS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (66, 'GIFT BOXES', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (67, 'NEW PRODUCTS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (68, 'STANDARD ITEMS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (69, 'FLOWER POT', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (70, 'CHAKRAS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (71, 'TWINKLING', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (72, 'ELECTRIC LAR CRACKERS', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (73, 'GARLAND (CLASSIC)', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (74, 'PAPER BOMB', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (75, 'COLOR RIDER SHOT', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (76, 'MULTI COLOR SHOT', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (77, 'MINI ARIAL CHOTO FANCY', '', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (33, 'FLOWER POTS', '/static/images/categories/flower-pots.png', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (34, 'SPECIAL FLOWER POTS', '/static/images/categories/special-flower-pots.png', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (35, 'CHAKKARS', '/static/images/categories/chakkars.png', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (32, 'SPARKLERS', '/static/images/categories/sparklers.png', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (37, 'TWINKLE PENCILS', '/static/images/categories/twinkle-pencils.png', 100, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);


--
-- Data for Name: tbl_websitelist; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_websitelist (id, "websiteName", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedBy", "updatedDt") VALUES (1, 'AuraaBooks', 1, 1, true, 1, '2026-03-20 18:16:29.29733+00', NULL, '2026-03-20 18:16:29.29733+00');
INSERT INTO public.tbl_websitelist (id, "websiteName", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedBy", "updatedDt") VALUES (2, 'AuraaCrackers', 1, 1, true, 1, '2026-03-20 18:16:29.29733+00', NULL, '2026-03-20 18:16:29.29733+00');


--
-- Data for Name: tbl_customer; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_units; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (1, 32, '1', '7 CM ELCECTRIC SPARKLER', 'https://auraacrackers.com/images/upload/img_99291569618_09_2025.jpg', 'G', NULL, 1, 6.00, NULL, 12.00, 12.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (2, 32, '2', '7 CM COLOR SPARKLER', 'https://auraacrackers.com/images/upload/img_69593685801_09_2025.jpg', 'G', NULL, 1, 6.00, NULL, 12.00, 12.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (3, 32, '3', '7 CM GREEN SPARKLER', 'https://auraacrackers.com/images/upload/img_110764772701_09_2025.jpg', 'G', NULL, 1, 7.00, NULL, 14.00, 14.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (4, 32, '4', '7 CM RED SPARKLER', 'https://auraacrackers.com/images/upload/img_209873051720_08_2025.jpg', 'G', NULL, 1, 8.00, NULL, 16.00, 16.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (5, 32, '5', '10 CM ELECTRIC SPARKLER', 'https://auraacrackers.com/images/upload/img_204413476720_08_2025.jpg', 'G', NULL, 1, 10.00, NULL, 20.00, 20.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (6, 32, '6', '10 CM COLOUR SPARKLER', 'https://auraacrackers.com/images/upload/img_191171162720_08_2025.jpg', 'G', NULL, 1, 12.00, NULL, 24.00, 24.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (7, 32, '7', '10 CM GREEN SPARKLER', 'https://auraacrackers.com/images/upload/img_2707655420_08_2025.jpg', 'G', NULL, 1, 13.00, NULL, 26.00, 26.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (8, 32, '8', '10 CM RED SPARKLER', 'https://auraacrackers.com/images/upload/img_75210337418_09_2025.jpg', 'G', NULL, 1, 15.00, NULL, 30.00, 30.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (9, 32, '9', '12 CM ELECTRIC SPARKLER', 'https://auraacrackers.com/images/upload/img_21542314118_09_2025.jpg', 'G', NULL, 1, 14.00, NULL, 28.00, 28.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (10, 32, '10', '12 CM COLOR SPARKLER', 'https://auraacrackers.com/images/upload/img_32178997320_08_2025.jpg', 'G', NULL, 1, 15.00, NULL, 30.00, 30.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (11, 32, '11', '12 CM GREEN SPARKLER', 'https://auraacrackers.com/images/upload/img_28606882018_09_2025.jpg', 'G', NULL, 1, 16.00, NULL, 32.00, 32.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (12, 32, '12', '12 CM RED SPARKLER', 'https://auraacrackers.com/images/upload/img_54948171901_09_2025.jpg', 'G', NULL, 1, 17.00, NULL, 34.00, 34.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (13, 32, '13', '15 CM ELECTRIC SPARKLER', 'https://auraacrackers.com/images/upload/img_89947300418_09_2025.jpg', 'G', NULL, 1, 24.00, NULL, 48.00, 48.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (14, 32, '14', '15 CM COLOR SPARKLER', 'https://auraacrackers.com/images/upload/img_4426861918_09_2025.jpg', 'G', NULL, 1, 26.00, NULL, 52.00, 52.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (15, 32, '15', '15 CM GREEN SPARKLER', 'https://auraacrackers.com/images/upload/img_96052581418_09_2025.jpg', 'G', NULL, 1, 28.00, NULL, 56.00, 56.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (16, 32, '16', '15 CM RED SPARKLER', 'https://auraacrackers.com/images/upload/img_91424910518_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (17, 32, '18', '30 CM COLOUR SPARKLER', 'https://auraacrackers.com/images/upload/img_160261898218_09_2025.jpg', 'G', NULL, 1, 26.00, NULL, 52.00, 52.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (18, 32, '17', '30 CM ELECTRIC SPARKLER', 'https://auraacrackers.com/images/upload/img_14512714718_09_2025.jpg', 'G', NULL, 1, 24.00, NULL, 48.00, 48.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (19, 32, '19', '30 CM GREEN SPARKLER', 'https://auraacrackers.com/images/upload/img_11971183018_09_2025.jpg', 'G', NULL, 1, 28.00, NULL, 56.00, 56.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (20, 32, '20', '30 CM RED SPARKLER', 'https://auraacrackers.com/images/upload/img_48284719318_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (21, 32, '21', '50 CM ELECTRIC SPARKLER', 'https://auraacrackers.com/images/upload/img_31194980220_08_2025.jpg', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (22, 32, '22', '50 CM COLOUR SPARKLER', 'https://auraacrackers.com/images/upload/img_34837202020_08_2025.jpg', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (23, 33, '26', 'FLOWER POT SMALL', 'https://auraacrackers.com/images/upload/img_168471976920_08_2025.jpg', 'G', NULL, 1, 50.00, NULL, 100.00, 100.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (24, 33, '27', 'FLOWER POT BIG (UV BOX)', 'https://auraacrackers.com/images/upload/img_143037112721_08_2025.jpg', 'G', NULL, 1, 60.00, NULL, 120.00, 120.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (25, 33, '28', 'FLOWER POT SPECIAL', 'https://auraacrackers.com/images/upload/img_98846912021_08_2025.jpg', 'G', NULL, 1, 70.00, NULL, 140.00, 140.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (26, 33, '29', 'FLOWER POT ASHOKA (UV BOX)', 'https://auraacrackers.com/images/upload/img_188789715921_08_2025.jpg', 'G', NULL, 1, 95.00, NULL, 190.00, 190.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (27, 33, '30', 'COLOR KOTI (UV BOX)', 'https://auraacrackers.com/images/upload/img_67626778720_08_2025.jpg', 'G', NULL, 1, 160.00, NULL, 280.00, 280.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (28, 34, '34', 'GYPSY (SUYRAKALAA)', 'https://auraacrackers.com/images/upload/img_198351252917_09_2025.jpg', 'G', NULL, 1, 140.00, NULL, 280.00, 280.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (29, 34, '35', 'TRI COLOUR FOUNTAINS', 'https://auraacrackers.com/images/upload/img_134854636220_08_2025.jpg', 'G', NULL, 1, 225.00, NULL, 450.00, 450.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (30, 34, '36', 'JOLLY TRAIN', 'https://auraacrackers.com/images/upload/img_11528369720_08_2025.jpg', 'G', NULL, 1, 220.00, NULL, 440.00, 440.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (31, 34, '31', 'FLOWER POT DELUXE (5 Pieces)', 'https://auraacrackers.com/images/upload/img_55188359201_09_2025.jpg', 'G', NULL, 1, 140.00, NULL, 280.00, 280.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (32, 34, '32', 'FLOWER POT DELUXE (10 Pieces)', 'https://auraacrackers.com/images/upload/img_139145351901_09_2025.jpg', 'G', NULL, 1, 270.00, NULL, 540.00, 540.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (33, 35, '41', 'GROUND CHAKKARS BIG', 'https://auraacrackers.com/images/upload/img_10296023001_09_2025.jpg', 'G', NULL, 1, 50.00, NULL, 100.00, 100.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (34, 35, '42', 'GROUND CHAKKARS SPECIAL', 'https://auraacrackers.com/images/upload/img_131297680901_09_2025.jpg', 'G', NULL, 1, 70.00, NULL, 120.00, 120.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (35, 35, '43', 'GROUND CHAKKARS DELUXE', 'https://auraacrackers.com/images/upload/img_136709995601_09_2025.jpg', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (36, 3, '36', 'DISCO WHEEL (5 Pieces)', 'https://auraacrackers.com/images/upload/img_194369494901_09_2025.jpg', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (37, 35, '45', 'WIRE CHAKKARAS', 'https://auraacrackers.com/images/upload/img_206856065401_09_2025.jpg', 'G', NULL, 1, 160.00, NULL, 320.00, 320.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (38, 4, '38', '1 1/2 TWINKLING STAR', 'https://auraacrackers.com/images/upload/img_121119220120_08_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (39, 36, '52', '4 TWINKLING STAR DELUXE', 'https://auraacrackers.com/images/upload/img_40721885001_09_2025.jpg', 'G', NULL, 1, 65.00, NULL, 130.00, 130.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (40, 37, '55', 'FLUTE (HAND TORCH 3 PCS)', '', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (41, 57, '176', 'SELFI STICK (3 PCS)', 'https://auraacrackers.com/images/upload/img_191365291001_09_2025.jpg', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (42, 37, '54', ' 12\" PENCIL - SILVER TORCHES', 'https://auraacrackers.com/images/upload/img_143469502821_09_2025.jpg', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (43, 37, '57', 'COLOUR CRUSH PENCIL', 'https://auraacrackers.com/images/upload/img_55415737818_09_2025.jpg', 'G', NULL, 1, 130.00, NULL, 260.00, 260.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (44, 37, '56', '12\" DELUXE PENCIL - KARTHIKA', '', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (46, 38, '61', '3 1/2 MEDIUM LAXMI (3 ROLE)', 'https://auraacrackers.com/images/upload/img_189502417224_09_2025.jpg', 'G', NULL, 1, 12.00, NULL, 24.00, 24.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (47, 38, '62', '4\" LAXMI CRACKERS (6 ROLE)', 'https://auraacrackers.com/images/upload/img_72414993124_09_2025.jpg', 'G', NULL, 1, 14.00, NULL, 28.00, 28.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (48, 6, '48', 'HULK/DELUXE LAXMI', '', 'G', NULL, 1, 22.00, NULL, 44.00, 44.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (49, 6, '49', 'JALLIKATTU / BAHUBALI', 'https://auraacrackers.com/images/upload/img_96944462724_08_2025.jpg', 'G', NULL, 1, 40.00, NULL, 80.00, 80.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (50, 38, '69', 'LION KING (25 ROLE)', 'https://auraacrackers.com/images/upload/img_138511851024_08_2025.jpg', 'G', NULL, 1, 60.00, NULL, 120.00, 120.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (51, 38, '70', 'GOLD LAKSHMI', 'https://auraacrackers.com/images/upload/img_82777363424_09_2025.jpg', 'G', NULL, 1, 38.00, NULL, 76.00, 76.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (52, 40, '74', 'RED BIJILI (50 PCS)', 'https://auraacrackers.com/images/upload/img_127372385719_09_2025.jpg', 'G', NULL, 1, 15.00, NULL, 30.00, 30.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (54, 41, '80', 'VARI BIJILI(50 PCS) BRAND', '', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (55, 40, '77', 'VARI BIJILI(100 PCS)', '', 'G', NULL, 1, 35.00, NULL, 70.00, 70.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (56, 41, '78', 'RED BIJILI (50 PCS) BRAND', '', 'G', NULL, 1, 25.00, NULL, 50.00, 50.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (58, 41, '81', 'VARI BIJILI(100 PCS) BRAND', 'https://auraacrackers.com/images/upload/img_63532642019_09_2025.jpg', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (59, 46, '109', 'ROCKET BOMB', '', 'G', NULL, 1, 70.00, NULL, 140.00, 140.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (60, 46, '110', 'LUNIK ROCKET', '', 'G', NULL, 1, 110.00, NULL, 190.00, 190.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (61, 46, '111', '2 SOUND ROCKET', '', 'G', NULL, 1, 130.00, NULL, 260.00, 260.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (62, 46, '113', 'COLOUR ROCKET (Suryakala)', '', 'G', NULL, 1, 90.00, NULL, 160.00, 160.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (63, 46, '114', 'WHISTLING/MUSICAL ROCKET', 'https://auraacrackers.com/images/upload/img_159311758001_09_2025.jpg', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (64, 42, '83', 'BULLET BOMB', 'https://auraacrackers.com/images/upload/img_107567927121_09_2025.jpg', 'G', NULL, 1, 45.00, NULL, 90.00, 90.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (65, 42, '84', 'HYDRO BOMB', 'https://auraacrackers.com/images/upload/img_147512279720_08_2025.jpg', 'G', NULL, 1, 65.00, NULL, 130.00, 130.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (66, 42, '85', 'KING OF KING BOMB - JUG MUG 3000', '', 'G', NULL, 1, 75.00, NULL, 150.00, 150.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (67, 42, '86', 'CLASSIC BOMB / JUG MUG 5000', 'https://auraacrackers.com/images/upload/img_36023176320_08_2025.jpg', 'G', NULL, 1, 85.00, NULL, 170.00, 170.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (68, 42, '68', 'MEGA RIDER / DINOSAUR', 'https://auraacrackers.com/images/upload/img_103380931922_09_2025.jpg', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (69, 9, '69', 'AGNI / DIGITAL BOMB / DINOSAUR ', 'https://auraacrackers.com/images/upload/img_202872061620_08_2025.jpg', 'G', NULL, 1, 155.00, NULL, 310.00, 310.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (70, 43, '93', '28 GAINT CRACKERS', '', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (71, 43, '94', '56 GAINT CRACKERS', '', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (72, 43, '95', '24 DELUXE CRACKERS', 'https://auraacrackers.com/images/upload/img_191501219624_09_2025.jpg', 'G', NULL, 1, 45.00, NULL, 90.00, 90.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (73, 43, '96', '50 DELUXE CRACKERS', '', 'G', NULL, 1, 85.00, NULL, 170.00, 170.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (74, 43, '97', '100 DELUXE CRACKERS', 'https://auraacrackers.com/images/upload/img_64969320924_09_2025.jpg', 'G', NULL, 1, 165.00, NULL, 330.00, 330.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (75, 60, '197', 'Sing pop', 'https://auraacrackers.com/images/upload/img_92497142401_09_2025.jpg', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (76, 25, '76', 'AK_DRONE', 'https://auraacrackers.com/images/upload/img_112006819501_09_2025.jpg', 'G', NULL, 1, 160.00, NULL, 320.00, 320.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (77, 60, '198', 'Fox star', 'https://auraacrackers.com/images/upload/img_173434188901_09_2025.jpg', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (78, 11, '78', 'na', '', 'G', NULL, 1, 0.00, NULL, 0.00, 0.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (79, 49, '122', 'ELETRIC STONE', 'https://auraacrackers.com/images/upload/img_115340003301_09_2025.jpg', 'G', NULL, 1, 12.00, NULL, 12.00, 12.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (53, 40, '75', 'RED BIJILI (100 PCS)', '', 'G', NULL, 1, 30.00, NULL, 44.00, 44.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-22 01:22:21.735902+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (57, 41, '79', 'RED BIJILI (100 PCS) BRAND', 'https://auraacrackers.com/images/upload/img_23472063101_09_2025.jpg', 'G', NULL, 1, 45.00, NULL, 90.00, 90.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 1, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-22 01:29:04.112191+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (80, 49, '123', 'MAGIC POP', 'https://auraacrackers.com/images/upload/img_43165617201_09_2025.jpg', 'G', NULL, 1, 10.00, NULL, 20.00, 20.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (81, 49, '124', 'KITKAT', 'https://auraacrackers.com/images/upload/img_154490726001_09_2025.jpg', 'G', NULL, 1, 25.00, NULL, 50.00, 50.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (82, 49, '125', 'CRAZY TOONS (CARTOON)', 'https://auraacrackers.com/images/upload/img_34303998120_08_2025.jpg', 'G', NULL, 1, 25.00, NULL, 50.00, 50.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (83, 49, '127', 'SNAKE EGG BIG / ZEE BOOM BAA (10 Pouch)', 'https://auraacrackers.com/images/upload/img_97124699619_09_2025.jpg', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (84, 58, '178', 'TIN Majesty', 'https://auraacrackers.com/images/upload/img_94972666801_09_2025.jpg', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (85, 58, '179', 'TIN', '', 'G', NULL, 1, 90.00, NULL, 180.00, 180.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (86, 58, '183', 'BLACK MONEY / WHITE MONEY', 'https://auraacrackers.com/images/upload/img_173450326618_09_2025.jpg', 'G', NULL, 1, 25.00, NULL, 50.00, 50.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (87, 48, '119', 'MEGA SIREN', '', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (88, 48, '120', 'MINI SIREN', '', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (89, 57, '174', 'PHOTO FLASH', 'https://auraacrackers.com/images/upload/img_22415737301_09_2025.jpg', 'G', NULL, 1, 70.00, NULL, 140.00, 140.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (90, 13, '90', 'PAW PATROL (BRAND HELICOPTER)', '', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (91, 13, '91', 'HELICOPTER / DRONE', 'https://auraacrackers.com/images/upload/img_171539578520_08_2025.jpg', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (92, 56, '171', 'BUTTERFLY (COLOR CHANGING)', 'https://auraacrackers.com/images/upload/img_60398206501_09_2025.jpg', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (93, 58, '181', '6\" FOUNTAIN (TIN)', '', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (94, 58, '182', 'MONEY IN THE BANK (STARVELL)', '', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (95, 58, '180', '6\" WATER QUEEN (STARVELL)', '', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (96, 35, '46', '4 X 4 WHEEL', 'https://auraacrackers.com/images/upload/img_161031884724_08_2025.jpg', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (97, 39, '73', '90 WATTS', 'https://auraacrackers.com/images/upload/img_188313975218_09_2025.jpg', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (98, 59, '187', 'Beat IT v1.0', 'https://auraacrackers.com/images/upload/img_126850570301_09_2025.jpg', 'G', NULL, 1, 45.00, NULL, 90.00, 90.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (99, 59, '188', 'Beat IT v2.0', 'https://auraacrackers.com/images/upload/img_191368986301_09_2025.jpg', 'G', NULL, 1, 90.00, NULL, 180.00, 180.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (100, 59, '189', 'Beat IT v3.0', 'https://auraacrackers.com/images/upload/img_8827009301_09_2025.jpg', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (101, 57, '175', 'COLOUR SMOKE(RAINBOW)', '', 'G', NULL, 1, 145.00, NULL, 290.00, 290.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (102, 51, '133', '6 SHOT MULTI-COLOUR', '', 'G', NULL, 1, 95.00, NULL, 190.00, 190.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (103, 50, '128', '7 SHOT COLOUR', 'https://auraacrackers.com/images/upload/img_15288083101_09_2025.jpg', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (104, 50, '129', '12 SHOT COLOUR RIDER', 'https://auraacrackers.com/images/upload/img_128687006917_09_2025.jpg', 'G', NULL, 1, 160.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (105, 51, '135', '30 SHOT MULTI COLOUR (UV BOX)', 'https://auraacrackers.com/images/upload/img_7449794524_09_2025.jpg', 'G', NULL, 1, 350.00, NULL, 700.00, 700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (106, 51, '136', '60 SHOT MULTI COLOUR', '', 'G', NULL, 1, 700.00, NULL, 1400.00, 1400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (107, 51, '137', '120 SHOT MULTI COLOUR', 'https://auraacrackers.com/images/upload/img_112627266124_09_2025.jpg', 'G', NULL, 1, 1400.00, NULL, 2800.00, 2800.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (108, 51, '138', '240 SHOT MULTI COLOUR', '', 'G', NULL, 1, 2400.00, NULL, 4800.00, 4800.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (109, 52, '142', '60 SHOT MULTI COLOUR(BRAND)', '', 'G', NULL, 1, 850.00, NULL, 1700.00, 1700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (110, 52, '143', '120 SHOT MULTI COLOUR(BRAND)', '', 'G', NULL, 1, 1700.00, NULL, 6400.00, 6400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (111, 52, '145', '240 SHOT MULTI COLOUR(BRAND)', '', 'G', NULL, 1, 3400.00, NULL, 6800.00, 6800.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (112, 53, '146', '1 1/4 CHOTA FANCY', '', 'G', NULL, 1, 45.00, NULL, 90.00, 90.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (113, 53, '147', '2\" ARIAL FANCY (1Pc)', '', 'G', NULL, 1, 95.00, NULL, 190.00, 190.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (114, 17, '114', '2\" ARIAL FANCY PIPE', '', 'G', NULL, 1, 95.00, NULL, 180.00, 180.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (115, 17, '115', '2\" ARIAL FANCY PIPE', '', 'G', NULL, 1, 95.00, NULL, 180.00, 180.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (116, 17, '116', '2\" ARIAL FANCY PIPE', '', 'G', NULL, 1, 95.00, NULL, 180.00, 180.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (117, 54, '148', '2\" ARIAL FANCY PIPE (3 PCS)', '', 'G', NULL, 1, 230.00, NULL, 460.00, 460.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (118, 54, '149', '2\" ARIAL FANCY PIPE (3 PCS) AK BRAND', '', 'G', NULL, 1, 250.00, NULL, 500.00, 500.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (119, 54, '150', '3 1/2\" ARIAL FANCY PIPE (CANDY CRUSH)', 'https://auraacrackers.com/images/upload/img_150351493610_10_2025.png', 'G', NULL, 1, 250.00, NULL, 500.00, 500.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (120, 54, '155', '4\" ARIAL FANCY DOUBLE BALL', '', 'G', NULL, 1, 495.00, NULL, 990.00, 990.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (121, 17, '121', '3 1/2\" ARIAL FANCY MIXED(SURIYAKALAA)', '', 'G', NULL, 1, 250.00, NULL, 500.00, 500.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (122, 54, '151', '4\" ARIAL FANCY (OREO)', 'https://auraacrackers.com/images/upload/img_78570253210_10_2025.png', 'G', NULL, 1, 280.00, NULL, 560.00, 560.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (123, 17, '124', '4\" ARIAL FANCY DOUBLE BALL (SURIYAKALAA)', '', 'G', NULL, 1, 420.00, NULL, 840.00, 840.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (124, 17, '125', '4\" ARIAL FANCY HD SHOW', '', 'G', NULL, 1, 380.00, NULL, 760.00, 760.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (125, 17, '126', '3/2ΓÇ¥NAYAGARA DOUBLE PIECE (SURIYAKALAA)', '', 'G', NULL, 1, 500.00, NULL, 1000.00, 1000.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (126, 55, '163', 'MINI PEARL', '', 'G', NULL, 1, 220.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (127, 55, '165', 'LITTLE STAR(2 IN 1)', '', 'G', NULL, 1, 320.00, NULL, 640.00, 640.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (128, 55, '166', 'JASMIN COLOUR CHANGING/ GOLDEN STAR', '', 'G', NULL, 1, 420.00, NULL, 780.00, 780.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (129, 55, '168', 'GUDIYA MEGA DELUXE', '', 'G', NULL, 1, 550.00, NULL, 1040.00, 1040.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (130, 19, '131', 'CHOTA BHEEM RED', '', 'G', NULL, 1, 28.00, NULL, 56.00, 56.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (131, 19, '132', 'CHOTA BHEEM GREEN', '', 'G', NULL, 1, 28.00, NULL, 56.00, 56.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (132, 19, '133', 'CHOTA BHEEM GOLD', '', 'G', NULL, 1, 28.00, NULL, 56.00, 56.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (133, 19, '134', 'CHOTA BHEEM SILVER', '', 'G', NULL, 1, 28.00, NULL, 56.00, 56.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (134, 19, '135', 'CHOTA BHEEM RED & GREEN', '', 'G', NULL, 1, 28.00, NULL, 56.00, 56.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (135, 20, '136', 'WONDER/ MOTU PATLU RED', '', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (136, 20, '137', 'WONDER/ MOTU PATLU GREEN', '', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (137, 20, '138', 'WONDER/ MOTU PATLU GOLD', '', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (138, 20, '139', 'WONDER/ MOTU PATLU SILVER', '', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (139, 20, '140', 'WONDER/ MOTU PATLU RED & GREEN', '', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (140, 60, '190', 'PLUM  (CRACKLING AND SILVER)', '', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (141, 60, '191', 'APPLE ( (CRACKLING AND SILVER PEACOCK FEATHER)', '', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (142, 60, '193', 'ORANGE ( (CRACKLING AND GOLDEN PEACOCK FEATHER))', '', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (143, 60, '192', 'POMEGRANATE (WATER FALLS)', 'https://auraacrackers.com/images/upload/img_81442455020_08_2025.jpg', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (144, 22, '145', 'Frank flower(5pcs)', '', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (145, 35, '47', 'SPINNER SPECIAL', 'https://auraacrackers.com/images/upload/img_68781627618_09_2025.jpg', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (146, 60, '194', 'TANGO SHOWER (5 IN 1)', '', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (147, 22, '148', 'Colour cruch pencil', '', 'G', NULL, 1, 130.00, NULL, 260.00, 260.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (148, 22, '149', 'Colour┬ábutterfly', '', 'G', NULL, 1, 95.00, NULL, 190.00, 190.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (149, 47, '115', 'PEACOCK FEATHER', '', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (150, 47, '116', 'ROYAL PEACOCK/DANCING PEACOCK', '', 'G', NULL, 1, 160.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (151, 47, '117', 'BADA PEACOCK FOUNTAIN', 'https://auraacrackers.com/images/upload/img_121210570918_09_2025.jpg', 'G', NULL, 1, 350.00, NULL, 700.00, 700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (152, 64, '220', 'BABY STAR MATCHES', '', 'G', NULL, 1, 25.00, NULL, 50.00, 50.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (153, 64, '221', 'FLASH MATCHES', 'https://auraacrackers.com/images/upload/img_145755301618_09_2025.jpg', 'G', NULL, 1, 80.00, NULL, 160.00, 160.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (154, 64, '222', 'SUPER DELUXE', '', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (155, 64, '223', 'POKEMON (MINI-LAPTOP)', 'https://auraacrackers.com/images/upload/img_40226043418_09_2025.jpg', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (156, 64, '224', 'MEGA LAPTOP', 'https://auraacrackers.com/images/upload/img_34386032218_09_2025.jpg', 'G', NULL, 1, 220.00, NULL, 440.00, 440.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (157, 60, '196', 'ISON', '', 'G', NULL, 1, 70.00, NULL, 140.00, 140.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (158, 60, '199', 'ELITE MAGICAL MIX(5PCS)( COKE)', 'https://auraacrackers.com/images/upload/img_119318463320_08_2025.jpg', 'G', NULL, 1, 130.00, NULL, 260.00, 260.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (159, 25, '160', 'JOLLY TRAIN', 'https://auraacrackers.com/images/upload/img_152151013620_08_2025.jpg', 'G', NULL, 1, 220.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (160, 60, '161', '6 Shots Summer Time (BRAND)', 'https://auraacrackers.com/images/upload/img_199653872618_09_2025.jpg', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (161, 25, '162', '', '', 'G', NULL, 1, 0.00, NULL, 0.00, 0.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (162, 66, '230', '25 ITEMS-GIFT BOX', '', 'G', NULL, 1, 325.00, NULL, 650.00, 650.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (163, 66, '231', '30 ITEMS-GIFT BOX', '', 'G', NULL, 1, 420.00, NULL, 840.00, 840.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (164, 66, '232', '35 ITEMS-GIFT BOX', '', 'G', NULL, 1, 500.00, NULL, 1000.00, 1000.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (165, 66, '233', '40 ITEMS-GIFT BOX', '', 'G', NULL, 1, 650.00, NULL, 1300.00, 1300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (166, 66, '234', '50 ITEMS-GIFT BOX', '', 'G', NULL, 1, 800.00, NULL, 1600.00, 1600.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (167, 67, '237', 'VIOLIN', '', 'G', NULL, 1, 200.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (168, 67, '236', 'COCOMELON WHEEL ON THE BOX', 'https://auraacrackers.com/images/upload/img_87077316518_09_2025.jpg', 'G', NULL, 1, 200.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (169, 27, '170', 'PANDA', '', 'G', NULL, 1, 1.00, NULL, 1.00, 1.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (170, 48, '121', 'DORA (5 Pieces)', '', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (171, 27, '172', 'DARBIC', '', 'G', NULL, 1, 1.00, NULL, 1.00, 1.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (172, 31, '173', '3000 COMBO PACK', 'https://auraacrackers.com/images/upload/img_57464502224_08_2025.jpg', 'G', NULL, 1, 3000.00, NULL, 7000.00, 7000.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (173, 65, '227', '5K FAMILY COMBO PACK', 'https://auraacrackers.com/images/upload/img_148552598724_08_2025.jpg', 'G', NULL, 1, 5000.00, NULL, 10000.00, 10000.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (174, 28, '175', '', '', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (175, 29, '177', '1000', '', 'G', NULL, 1, 135.00, NULL, 270.00, 270.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (176, 29, '178', '2000', '', 'G', NULL, 1, 270.00, NULL, 540.00, 540.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (177, 29, '179', '5000', '', 'G', NULL, 1, 675.00, NULL, 1350.00, 1350.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (178, 29, '180', '10000', '', 'G', NULL, 1, 1350.00, NULL, 2700.00, 2700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (179, 45, '104', '1K PRIME', '', 'G', NULL, 1, 270.00, NULL, 540.00, 540.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (180, 45, '105', '2K PRIME', '', 'G', NULL, 1, 340.00, NULL, 680.00, 680.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (181, 45, '106', '5K PRIME', '', 'G', NULL, 1, 1350.00, NULL, 2700.00, 2700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (182, 45, '107', '10K PRIME', '', 'G', NULL, 1, 2700.00, NULL, 5400.00, 5400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (183, 29, '185', '100', '', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (184, 68, '508', 'CHAKKARA AHSOKA', '', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (185, 68, '520', 'JET FOUNTAIN(10PCS)', '', 'G', NULL, 1, 135.00, NULL, 270.00, 270.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (186, 68, '516', 'FLOWER POT SMALL (STD)', '', 'G', NULL, 1, 95.00, NULL, 190.00, 190.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (187, 68, '517', 'FLOWER POT SPECIAL (STD)', '', 'G', NULL, 1, 210.00, NULL, 420.00, 420.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (188, 68, '515', 'FLOWER POT GAINT', '', 'G', NULL, 1, 430.00, NULL, 860.00, 860.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (189, 68, '523', 'MINI FOUTAIN RED', '', 'G', NULL, 1, 50.00, NULL, 100.00, 100.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (190, 68, '501', '12 CM JIMMIMG CRACKLING', '', 'G', NULL, 1, 45.00, NULL, 90.00, 90.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (191, 68, '505', '30 CM GOLD SPARKLES', '', 'G', NULL, 1, 75.00, NULL, 150.00, 150.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (192, 68, '504', '30 CM CRACKLING', '', 'G', NULL, 1, 85.00, NULL, 170.00, 170.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (193, 30, '195', '30 CM EXPORT GOLD', '', 'G', NULL, 1, 50.00, NULL, 100.00, 100.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (194, 68, '506', '4 COLOR SPARKLER MIXED', '', 'G', NULL, 1, 50.00, NULL, 100.00, 100.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (195, 68, '519', 'HYDRO BOMB GREEN', '', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (196, 68, '511', 'FAT BOY', '', 'G', NULL, 1, 60.00, NULL, 120.00, 120.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (197, 68, '507', 'BULLET BOMB STD', '', 'G', NULL, 1, 50.00, NULL, 100.00, 100.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (198, 68, '526', 'THUNDER BOMB', '', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (199, 68, '528', 'TWINKLE STAR', '', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (200, 68, '525', 'SNOW VALLEY', '', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (201, 68, '514', 'FLOWER POT DELUXE', '', 'G', NULL, 1, 280.00, NULL, 560.00, 560.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (202, 68, '510', 'COLOR FLASH (HOLI)', '', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (203, 68, '524', 'PANDAV', '', 'G', NULL, 1, 190.00, NULL, 380.00, 380.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (204, 68, '512', 'FLIPPER', '', 'G', NULL, 1, 190.00, NULL, 380.00, 380.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (205, 68, '513', 'FLOWER BOMB', '', 'G', NULL, 1, 170.00, NULL, 340.00, 340.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (206, 30, '208', '3\" PIPE COLOR CHANGE(1000GEM IN THE SKY)\n', '', 'G', NULL, 1, 255.00, NULL, 510.00, 510.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (207, 68, '509', 'CHAKKARA BIG', '', 'G', NULL, 1, 135.00, NULL, 270.00, 270.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (208, 68, '527', 'TWIN SPIN', '', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (209, 68, '518', 'GOLDEN WHISTLE SMALL', '', 'G', NULL, 1, 200.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (210, 68, '522', 'MINI FOUTAIN GOLD', '', 'G', NULL, 1, 45.00, NULL, 90.00, 90.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (211, 68, '521', 'MINI FOUNTAIN SILVER', '', 'G', NULL, 1, 52.00, NULL, 104.00, 104.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (212, 34, '33', 'FRANKE FLOWER POT 5PC', '', 'G', NULL, 1, 100.00, NULL, 200.00, 200.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (213, 35, '44', 'MOON/DISCO WHEEL (5 Pieces)', 'https://auraacrackers.com/images/upload/img_19084704018_09_2025.jpg', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (214, 35, '48', 'SPINNER DELUXE', '', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (215, 36, '51', '1.5 TWINKLING STAR', 'https://auraacrackers.com/images/upload/img_45048679718_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (216, 36, '53', 'JIL JIL', '', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (217, 38, '63', 'DELUXE LAXMI (10 ROLE)', '', 'G', NULL, 1, 22.00, NULL, 44.00, 44.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (218, 38, '64', 'HULK / SINGAM (6 ROLE)', 'https://auraacrackers.com/images/upload/img_167792454322_09_2025.jpg', 'G', NULL, 1, 22.00, NULL, 44.00, 44.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (219, 38, '65', 'KUMKI (12 ROLE)', 'https://auraacrackers.com/images/upload/img_94926652924_09_2025.jpg', 'G', NULL, 1, 28.00, NULL, 56.00, 56.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (220, 38, '66', 'BAHUBALI (16 ROLE)', 'https://auraacrackers.com/images/upload/img_18562251022_09_2025.jpg', 'G', NULL, 1, 40.00, NULL, 80.00, 80.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (221, 38, '67', 'JALLIKATTU (20 ROLE)', 'https://auraacrackers.com/images/upload/img_161318227922_09_2025.jpg', 'G', NULL, 1, 50.00, NULL, 100.00, 100.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (222, 39, '71', '2 SOUND', '', 'G', NULL, 1, 38.00, NULL, 76.00, 76.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (223, 39, '72', '3 SOUND', '', 'G', NULL, 1, 45.00, NULL, 90.00, 90.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (224, 40, '76', 'VARI BIJILI (50 PCS)', 'https://auraacrackers.com/images/upload/img_98020747819_09_2025.jpg', 'G', NULL, 1, 20.00, NULL, 40.00, 40.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (225, 42, '82', 'ATOM BOMB', '', 'G', NULL, 1, 35.00, NULL, 70.00, 70.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (226, 42, '87', 'DINOSAUR', 'https://auraacrackers.com/images/upload/img_94872912222_09_2025.jpg', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (227, 42, '88', 'AGNI / DTS BOMB - 9ply', '', 'G', NULL, 1, 190.00, NULL, 390.00, 390.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (228, 42, '89', '555 BOMB', '', 'G', NULL, 1, 95.00, NULL, 190.00, 190.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (229, 43, '92', '28 CHORSA', '', 'G', NULL, 1, 22.00, NULL, 44.00, 44.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (230, 44, '98', '100 Wala', '', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (231, 44, '99', '200 Wala', '', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (232, 44, '100', '1000 Wala', '', 'G', NULL, 1, 135.00, NULL, 270.00, 270.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (233, 44, '101', '2000 Wala', '', 'G', NULL, 1, 270.00, NULL, 540.00, 540.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (234, 44, '102', '5000 Wala', '', 'G', NULL, 1, 675.00, NULL, 1350.00, 1350.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (235, 44, '103', '10000 Wala', '', 'G', NULL, 1, 1350.00, NULL, 2700.00, 2700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (236, 46, '108', 'FANCY ROCKET', '', 'G', NULL, 1, 60.00, NULL, 120.00, 120.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (237, 46, '112', '3 SOUND ROCKET', '', 'G', NULL, 1, 160.00, NULL, 320.00, 320.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (238, 47, '118', 'SENSU (UV BOX)', '', 'G', NULL, 1, 200.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (239, 49, '126', 'SNAKE CARTOON', 'https://auraacrackers.com/images/upload/img_182383899519_09_2025.jpg', 'G', NULL, 1, 50.00, NULL, 100.00, 100.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (240, 50, '130', '25 SHOT COLOUR RIDER', '', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (241, 51, '134', '12 SHOT MULTI COLOUR', 'https://auraacrackers.com/images/upload/img_197570843917_09_2025.jpg', 'G', NULL, 1, 220.00, NULL, 440.00, 440.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (242, 51, '139', '500 SHOT MULTI COLOUR', '', 'G', NULL, 1, 4800.00, NULL, 9600.00, 9600.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (243, 52, '141', '30 SHOT MULTI COLOUR(BRAND)', '', 'G', NULL, 1, 450.00, NULL, 900.00, 900.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (244, 54, '152', '4\" ARIAL FANCY (JAZZ 21\")', '', 'G', NULL, 1, 280.00, NULL, 560.00, 560.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (245, 54, '154', '2 1/2\" ARIAL FANCY 3 STEP', '', 'G', NULL, 1, 250.00, NULL, 500.00, 500.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (246, 54, '156', '4\" NAYAGARA DOUBLE PIECE (Phoenix)', '', 'G', NULL, 1, 900.00, NULL, 1600.00, 1600.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (247, 55, '164', 'TIM TIM', '', 'G', NULL, 1, 220.00, NULL, 440.00, 440.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (248, 55, '167', 'ASHRAFI', '', 'G', NULL, 1, 320.00, NULL, 640.00, 640.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (249, 56, '169', 'HELICOPTER', '', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (250, 56, '170', 'DRONE', '', 'G', NULL, 1, 160.00, NULL, 320.00, 320.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (251, 56, '172', 'BAMBARAM', '', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (252, 61, '205', 'GOOGLY RED', 'https://auraacrackers.com/images/upload/img_64782316317_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (253, 61, '206', 'GOOGLY GREEN', 'https://auraacrackers.com/images/upload/img_119693142117_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (254, 61, '207', 'GOOGLY SILVER', 'https://auraacrackers.com/images/upload/img_11874451717_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (255, 61, '208', 'GOOGLY GOLD', 'https://auraacrackers.com/images/upload/img_119096176917_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (256, 61, '209', 'GOOGLY RED & GREEN', 'https://auraacrackers.com/images/upload/img_179701720518_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (257, 62, '210', 'TOM & JERRY RED', 'https://auraacrackers.com/images/upload/img_135462735817_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (258, 62, '211', 'TOM & JERRY GREEN', 'https://auraacrackers.com/images/upload/img_27346017717_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (259, 62, '212', 'TOM & JERRY WHITE', 'https://auraacrackers.com/images/upload/img_191000304918_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (260, 62, '213', 'TOM & JERRY GOLD', 'https://auraacrackers.com/images/upload/img_200353452917_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (261, 62, '214', 'TOM & JERRY RED & GREEN', 'https://auraacrackers.com/images/upload/img_133615217717_09_2025.jpg', 'G', NULL, 1, 30.00, NULL, 60.00, 60.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (262, 63, '215', 'WONDER/ SCOOBY RED', 'https://auraacrackers.com/images/upload/img_212633408317_09_2025.jpg', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (263, 63, '216', 'WONDER/ SCOOBY GREEN', 'https://auraacrackers.com/images/upload/img_132362768117_09_2025.jpg', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (264, 63, '217', 'WONDER/ SCOOBY WHITE', 'https://auraacrackers.com/images/upload/img_113140336218_09_2025.jpg', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (265, 63, '218', 'WONDER/ SCOOBY GOLD', 'https://auraacrackers.com/images/upload/img_149407039618_09_2025.jpg', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (266, 63, '219', 'WONDER/ SCOOBY RED & GREEN', 'https://auraacrackers.com/images/upload/img_58641721518_09_2025.jpg', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (267, 65, '226', '3K FAMILY COMBO PACK', 'https://auraacrackers.com/images/upload/img_111317437618_09_2025.jpg', 'G', NULL, 1, 3000.00, NULL, 6000.00, 6000.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (268, 66, '235', '60 ITEMS-GIFT BOX', '', 'G', NULL, 1, 1200.00, NULL, 2400.00, 2400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (269, 68, '502', '20 CM EXPORT GOLD', '', 'G', NULL, 1, 50.00, NULL, 100.00, 100.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (270, 68, '503', '3\" PIPE COLOR CHANGE(1000GEM IN THE SKY)', '', 'G', NULL, 1, 255.00, NULL, 510.00, 510.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (271, 54, '153', '3 1/2\" ARIAL FANCY(NAYAGARA FALLS) ', '', 'G', NULL, 1, 350.00, NULL, 700.00, 700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (272, 54, '157', 'VADIVEL DOUBLE PIECE', '', 'G', NULL, 1, 850.00, NULL, 1700.00, 1700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (273, 39, '71', '2 SOUND', '', 'G', NULL, 1, 35.00, NULL, 70.00, 70.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (274, 39, '72', '3 SOUND', '', 'G', NULL, 1, 45.00, NULL, 90.00, 90.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (275, 47, '115', 'PEACOCK FEATHER', '', 'G', NULL, 1, 120.00, NULL, 240.00, 240.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (276, 47, '116', 'ROYAL PEACOCK/DANCING PEACOCK', '', 'G', NULL, 1, 160.00, NULL, 320.00, 320.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (277, 47, '118', 'SENSU (UV BOX)', '', 'G', NULL, 1, 200.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (278, 37, '55', 'FLUTE (HAND TORCH 3 PCS)', '', 'G', NULL, 1, 180.00, NULL, 360.00, 360.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (279, 48, '120', 'MINI SIREN', '', 'G', NULL, 1, 150.00, NULL, 300.00, 300.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (280, 46, '111', '2 SOUND ROCKET', '', 'G', NULL, 1, 130.00, NULL, 260.00, 260.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (281, 46, '112', '3 SOUND ROCKET', '', 'G', NULL, 1, 160.00, NULL, 320.00, 320.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (282, 37, '56', '12\" DELUXE PENCIL', '', 'G', NULL, 1, 110.00, NULL, 220.00, 220.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (283, 37, '58', 'SMALL PENCIL [10 PCS]', '', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (284, 34, '37', 'FLOWER POTS SUPER DLX (2 PCS)', '', 'G', NULL, 1, 350.00, NULL, 700.00, 700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (285, 42, '89', '555 BOMB', '', 'G', NULL, 1, 95.00, NULL, 190.00, 190.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (286, 67, '237', 'VIOLIN ', '', 'G', NULL, 1, 200.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (287, 67, '238', 'KADAM ', '', 'G', NULL, 1, 200.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (288, 67, '239', 'DRAGON ', '', 'G', NULL, 1, 165.00, NULL, 330.00, 330.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (289, 67, '240', '16 SHOTS', '', 'G', NULL, 1, 280.00, NULL, 560.00, 560.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (290, 67, '241', 'CYLINDER (SMOKE WITH BOMB)', '', 'G', NULL, 1, 220.00, NULL, 440.00, 440.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (291, 42, '85', 'KING OF KING BOMB - JUG MUG 3000', '', 'G', NULL, 1, 75.00, NULL, 150.00, 150.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (292, 42, '88', 'DIGITAL BOMB 9PLY', '', 'G', NULL, 1, 190.00, NULL, 380.00, 380.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (293, 67, '242', 'BAD BOY', '', 'G', NULL, 1, 250.00, NULL, 500.00, 500.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (294, 54, '157', 'VADIVEL DOUBLE PIECE', '', 'G', NULL, 1, 850.00, NULL, 1700.00, 1700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (295, 54, '158', '3 1/2\" ARIAL FANCY(POPCORN) Karthiga', '', 'G', NULL, 1, 350.00, NULL, 700.00, 700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (296, 54, '159', '4\" ARIAL FANCY DOUBLE BALL (WOW)', '', 'G', NULL, 1, 520.00, NULL, 1040.00, 1040.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (297, 54, '157', 'VADIVEL DOUBLE PIECE', '', 'G', NULL, 1, 850.00, NULL, 1700.00, 1700.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (298, 34, '37', 'FLOWER POTS SUPER DLX (2 PCS)', '', 'G', NULL, 1, 200.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (299, 37, '58', 'SMALL PENCIL (10 PCS) - KARTHIKA', '', 'G', NULL, 1, 55.00, NULL, 110.00, 110.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (300, 67, '238', 'KADAM', '', 'G', NULL, 1, 200.00, NULL, 400.00, 400.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (301, 67, '239', 'DRAGON', '', 'G', NULL, 1, 165.00, NULL, 370.00, 370.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (302, 67, '240', '16 SHOT', '', 'G', NULL, 1, 280.00, NULL, 560.00, 560.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (303, 67, '241', 'CYLINDER (SMOKE WITH BOMB)', '', 'G', NULL, 1, 220.00, NULL, 440.00, 440.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (304, 67, '242', 'BAD BOX', '', 'G', NULL, 1, 250.00, NULL, 500.00, 500.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (305, 51, '140', '16 SHOT MULTI COLOUR (SPLASH)', '', 'G', NULL, 1, 250.00, NULL, 500.00, 500.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (306, 60, '200', 'X - MAS', '', 'G', NULL, 1, 130.00, NULL, 260.00, 260.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (307, 54, '153', '4\" WEDDING SPECIAL ARIAL FANCY (7 STEPS)', '', 'G', NULL, 1, 450.00, NULL, 800.00, 800.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (308, 54, '160', '4\" ARIAL NAYAGARA DOUBLE PIECE (DUKE)', '', 'G', NULL, 1, 750.00, NULL, 1500.00, 1500.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (309, 67, '243', 'HAND SHOT (18 SHOT)', '', 'G', NULL, 1, 280.00, NULL, 600.00, 600.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, true, 1, '2026-03-20 18:21:51.631513+00', '2026-03-20 18:21:51.631513+00', NULL);
INSERT INTO public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (45, 38, '60', '2 3/4\" KURUVI CRACKERS', 'https://auraacrackers.com/images/upload/img_86979105818_09_2025.jpg', 'G', NULL, 1, 7.00, NULL, 14.00, 14.00, NULL, NULL, 0.000, 0.00, 0.00, 0.000, NULL, 0.000, 0, 0, 1, 1, false, 1, '2026-03-20 18:21:51.631513+00', '2026-03-22 01:20:01.484098+00', NULL);


--
-- Data for Name: tbl_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_role (id, name, descr, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (1, 'Super Admin', NULL, 1, 1, true, NULL, '2026-03-20 18:16:29.30569+00', '2026-03-20 18:16:29.30569+00', NULL);
INSERT INTO public.tbl_role (id, name, descr, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (2, 'Admin', NULL, 1, 1, true, NULL, '2026-03-20 18:16:29.30569+00', '2026-03-20 18:16:29.30569+00', NULL);
INSERT INTO public.tbl_role (id, name, descr, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (3, 'Online Customers', NULL, 1, 1, true, NULL, '2026-03-20 18:16:29.30569+00', '2026-03-20 18:16:29.30569+00', NULL);
INSERT INTO public.tbl_role (id, name, descr, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") VALUES (4, 'Users', NULL, 1, 1, true, NULL, '2026-03-20 18:16:29.30569+00', '2026-03-20 18:16:29.30569+00', NULL);


--
-- Data for Name: tbl_users; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_cart; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_coupons; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_coupons (id, "couponName", "couponCode", "couponPer", description, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy", "websiteId") VALUES (1, 'AuraaChit', '2026Chit', 10.00, NULL, 1, 1, false, NULL, '2026-03-21 10:49:34.010862+00', '2026-03-22 01:17:26.747384+00', NULL, 2);


--
-- Data for Name: tbl_customer_addr; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_online_sales; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_onlinesales_items; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_pricelist; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_pricelist_items; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: tbl_serialno; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tbl_serialno (id, "tableName", "prefixNo", "nextNo", "suffixNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy", "sequenceNo") VALUES (1, 'tbl_online_sales', 'SO', 202600, NULL, 1, 1, true, NULL, '2026-03-20 18:16:29.302391+00', '2026-03-22 00:54:12.446177+00', NULL, 2);


--
-- Data for Name: tbl_users_addr; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: users_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: tbl_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_branch_id_seq', 1, true);


--
-- Name: tbl_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_cart_id_seq', 1, false);


--
-- Name: tbl_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_category_id_seq', 1, false);


--
-- Name: tbl_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_city_id_seq', 122, true);


--
-- Name: tbl_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_company_id_seq', 1, true);


--
-- Name: tbl_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_country_id_seq', 1, true);


--
-- Name: tbl_coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_coupons_id_seq', 1, true);


--
-- Name: tbl_customer_addr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_customer_addr_id_seq', 1, false);


--
-- Name: tbl_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_customer_id_seq', 1, false);


--
-- Name: tbl_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_items_id_seq', 1, false);


--
-- Name: tbl_online_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_online_sales_id_seq', 1, false);


--
-- Name: tbl_onlinesales_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_onlinesales_items_id_seq', 1, false);


--
-- Name: tbl_pricelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_pricelist_id_seq', 1, false);


--
-- Name: tbl_pricelist_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_pricelist_items_id_seq', 1, false);


--
-- Name: tbl_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_role_id_seq', 4, true);


--
-- Name: tbl_serialno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_serialno_id_seq', 1, true);


--
-- Name: tbl_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_state_id_seq', 36, true);


--
-- Name: tbl_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_units_id_seq', 1, false);


--
-- Name: tbl_users_addr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_users_addr_id_seq', 1, false);


--
-- Name: tbl_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_users_id_seq', 1, false);


--
-- Name: tbl_websitelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tbl_websitelist_id_seq', 2, true);


--
-- Name: users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_groups_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: users_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_permissions_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict KtULw2lfdkN5UhQgLg93bmk5Ng7wS1DEQhfuQk9DEbcV1m5Tud5Z9XHwvyETSUe

