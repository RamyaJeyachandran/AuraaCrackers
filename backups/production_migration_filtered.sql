--
-- PostgreSQL database dump
--

\restrict 8h0Z6xNVCa25caUERWw7xh1j7BJWB1gthFA501OzeCbEbDoSsJEgLAKXYmr3WmQ

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

\unrestrict 8h0Z6xNVCa25caUERWw7xh1j7BJWB1gthFA501OzeCbEbDoSsJEgLAKXYmr3WmQ

--
-- PostgreSQL database dump
--

\restrict wzCP3RbuFSTHCwhZGyciqzKlUag1N8rOVt9Ob731PKwTVjW9wM6UbcKqfgpbdsk

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

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	users	user
6	crackers	category
7	crackers	product
8	sessions	session
9	users	role
10	crackers	unit
11	crackers	cartitem
12	crackers	customer
13	crackers	onlinesales
14	crackers	onlinesalesitem
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add user	5	add_user
18	Can change user	5	change_user
19	Can delete user	5	delete_user
20	Can view user	5	view_user
21	Can add category	6	add_category
22	Can change category	6	change_category
23	Can delete category	6	delete_category
24	Can view category	6	view_category
25	Can add product	7	add_product
26	Can change product	7	change_product
27	Can delete product	7	delete_product
28	Can view product	7	view_product
29	Can add session	8	add_session
30	Can change session	8	change_session
31	Can delete session	8	delete_session
32	Can view session	8	view_session
33	Can add role	9	add_role
34	Can change role	9	change_role
35	Can delete role	9	delete_role
36	Can view role	9	view_role
37	Can add unit	10	add_unit
38	Can change unit	10	change_unit
39	Can delete unit	10	delete_unit
40	Can view unit	10	view_unit
41	Can add cart item	11	add_cartitem
42	Can change cart item	11	change_cartitem
43	Can delete cart item	11	delete_cartitem
44	Can view cart item	11	view_cartitem
45	Can add customer	12	add_customer
46	Can change customer	12	change_customer
47	Can delete customer	12	delete_customer
48	Can view customer	12	view_customer
49	Can add online sales	13	add_onlinesales
50	Can change online sales	13	change_onlinesales
51	Can delete online sales	13	delete_onlinesales
52	Can view online sales	13	view_onlinesales
53	Can add online sales item	14	add_onlinesalesitem
54	Can change online sales item	14	change_onlinesalesitem
55	Can delete online sales item	14	delete_onlinesalesitem
56	Can view online sales item	14	view_onlinesalesitem
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, image, description, created_at, updated_at, is_active, "order") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, phone, address) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-03-20 19:27:52.808885+00
2	contenttypes	0002_remove_content_type_name	2026-03-20 19:27:52.860127+00
3	auth	0001_initial	2026-03-20 19:27:53.077399+00
4	auth	0002_alter_permission_name_max_length	2026-03-20 19:27:53.093315+00
5	auth	0003_alter_user_email_max_length	2026-03-20 19:27:53.104256+00
6	auth	0004_alter_user_username_opts	2026-03-20 19:27:53.119999+00
7	auth	0005_alter_user_last_login_null	2026-03-20 19:27:53.137772+00
8	auth	0006_require_contenttypes_0002	2026-03-20 19:27:53.151659+00
9	auth	0007_alter_validators_add_error_messages	2026-03-20 19:27:53.174551+00
10	auth	0008_alter_user_username_max_length	2026-03-20 19:27:53.197432+00
11	auth	0009_alter_user_last_name_max_length	2026-03-20 19:27:53.224568+00
12	auth	0010_alter_group_name_max_length	2026-03-20 19:27:53.257001+00
13	auth	0011_update_proxy_permissions	2026-03-20 19:27:53.279201+00
14	auth	0012_alter_user_first_name_max_length	2026-03-20 19:27:53.304469+00
15	users	0001_initial	2026-03-20 19:27:53.52075+00
16	admin	0001_initial	2026-03-20 19:27:53.611201+00
17	admin	0002_logentry_remove_auto_add	2026-03-20 19:27:53.636673+00
18	admin	0003_logentry_add_action_flag_choices	2026-03-20 19:27:53.663057+00
19	crackers	0001_initial	2026-03-20 19:27:53.904642+00
20	crackers	0002_category_is_active_category_order	2026-03-20 19:27:53.961415+00
21	sessions	0001_initial	2026-03-20 19:28:33.366933+00
22	crackers	0003_rename_products_name_a9a494_idx_tbl_items_itemnam_f84e7b_idx_and_more	2026-03-20 19:30:10.185348+00
23	crackers	0004_units	2026-03-20 19:30:10.209298+00
24	crackers	0005_rename_units_unit_product_outbook_item_id_and_more	2026-03-20 19:30:10.223756+00
25	crackers	0006_alter_category_name	2026-03-20 19:30:10.236119+00
26	crackers	0007_cartitem	2026-03-20 19:30:10.247512+00
27	crackers	0008_remove_product_unit_id_product_unit_and_more	2026-03-20 19:30:10.260169+00
28	crackers	0009_product_is_disabled	2026-03-20 19:30:10.273579+00
29	crackers	0010_customer_onlinesales_onlinesalesitem	2026-03-20 19:30:10.289114+00
30	users	0002_role_and_more	2026-03-20 19:30:10.314631+00
31	users	0003_user_address_user_city_user_full_name_and_more	2026-03-20 19:30:10.340361+00
32	users	0004_user_online_customer	2026-03-20 19:30:10.36664+00
33	users	0005_auto_20260319_0102	2026-03-20 19:30:10.384339+00
34	users	0006_user_user_name	2026-03-20 19:30:10.408021+00
35	crackers	0011_coupon	2026-03-20 19:30:17.975036+00
36	crackers	0012_coupon_percentage	2026-03-20 19:30:18.005474+00
37	crackers	0013_customeraddress	2026-03-20 19:30:18.047896+00
38	crackers	0014_onlinesales_customer_address	2026-03-20 19:30:18.065859+00
39	crackers	0015_onlinesales_payment_method_and_more	2026-03-20 19:30:18.100692+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
gz7fsw0b8z3r4yze0gfb2mpwilcr3x8p	.eJxVi70OwiAQgN-F2ZDe0RNwdPcZyHEcodFoI3Yyvrtt0kHX7-dtEi-vlpauzzQVczJgDr8ss1z1vgme52431u0Ou7088nTT8978jY17W69aglAEhuiP5LMjPzIWLVBBMKJXVFqdCLkxRiwQqJJAzq4GHnAwny_t3jSD:1w3fXA:OFY0-nGh0woTbn1wGdmBfRvqPChfKtQ04iv7_lE0_Po	2026-03-20 19:59:24.555624+00
nd8lkpa6itgjk1ximhpsm9rv3ey9r6mc	.eJxVjsEOwiAQRP-FsyFly0Lw6N1vIAssgWi0cdt4MP67relBr2_mTealIi1zi4vwI_aijgrU4Zclyhe-bQFNk-iNid6h6PM99Suf9s6f2EjaajEjO0fGFAQbcsnJeDRIhMMYLJlxqNVAYAK0XFz2qdgKiDVUBOf8OvrkJH3m7z14fwA9cznV:1w3uCK:BYZRDBZS7YmzQBm_31iz_95z-I2cy1Kv6oz4AufcKEY	2026-03-21 11:38:52.58529+00
bx28p15edln3xq9x8x9mqp3lbpyb56h6	eyJ3ZWJzaXRlX2lkIjoyfQ:1w48iA:euF9vuw6ySjtx2PmMHI4Esb4uu5Bz-cuKyYPL0jvHQA	2026-03-22 03:08:42.399201+00
9pn74yrwb33fdf2q9sbihcddee6le2bk	eyJ3ZWJzaXRlX2lkIjoyfQ:1w4D1w:dDpTzmBphOjC8Dq-f1UMBH30YPaipF2g4JcV2jobykY	2026-03-22 07:45:24.051631+00
iqtjhyhz81oyl6599aw5ntckgz4i7mxj	.eJxVzk0KwyAQBeC7uC6ixjGYZbvuGWTUEaU_hpjQRendm5RQyPZ78x7zZi_yrczkSmSDOjGHy5zd0mj6CVPsYB7DjZ5bgOPY-GaN79j4tfpyp_N-cyhmbHltEQEZg1JGUNqGGLzsQQIiiM5qlJ1ISSpLqEBTNKH3UScFkGwCZUy_jo5TfVQXaqTtPaHMJZf57yNNbJCCi88XpZhGeA:1w3whl:78yc6wvYC9LZ9Mw5m6rm5xTGuZeNKJR9kLeZonY6ZHw	2026-03-21 14:19:29.481104+00
aavawbcfuujlip5ovcy9tqs3ctrouy2s	eyJ3ZWJzaXRlX2lkIjoyfQ:1w4Fql:fWdZYI3Z8aECApRWEL1JnEOtwQmtUNEY7inaEwXlhw0	2026-03-22 10:46:03.518955+00
fmb67h3b141g2uwesobdxj1ctweiwevb	eyJ3ZWJzaXRlX2lkIjoyfQ:1w4L9K:az4ElZW2lD2NQ3kAiU06CAxwI_XwwJRae7ZqQ6ZyQBw	2026-03-22 16:25:34.338709+00
o9s903dquwtsc59q8bou8svb2743vna1	eyJ3ZWJzaXRlX2lkIjoyfQ:1w4LAa:MVcfGDBYTfqtPsJCWZP976vJmSKZ6UwYm4EVU0oufsE	2026-03-22 16:26:52.36421+00
jnyrm86kr0vidgmff8z12todm06p7tvy	eyJ3ZWJzaXRlX2lkIjoyfQ:1w4MZF:rCOELp87CrB7WocZ9F5vWbrAj5p4p5WczYyVwKWw-kM	2026-03-22 17:56:25.494868+00
ub0rajohk4i2jnt240gz739t6fzvvayf	.eJxVyzEOwjAMheG7ZEZR7caJwsjOGSIncZQKBBWmE-LutFKHsn7v_R-TeHn3tKi80lTN2aA5HS1zucljG3ie1W6mdke112ee7nLZP39hZ-1rJULiPQNUQhdLLRkCATHTMEbHMA6tAUZhJCfVl5Cra0jUYiP0PpjvD_3nNNo:1w3pTx:SYepEuukqC9K34onkZWAHHPqlTL70TCfWm0NCx5BBzA	2026-03-21 06:36:45.318845+00
yvyz19a5a538o5j3xvmyti21zh0h0xw5	.eJxVzk0KwyAQBeC7uC6ixjGYZbvuGWTUEaU_hpjQRendm5RQyPZ78x7zZi_yrczkSmSDOjGHy5zd0mj6CVPsYB7DjZ5bgOPY-GaN79j4tfpyp_N-cyhmbHltEQEZg1JGUNqGGLzsQQIiiM5qlJ1ISSpLqEBTNKH3UScFkGwCZUy_jo5TfVQXaqTtPaHMJZf57yNNbJCCi88XpZhGeA:1w3wvI:qLhGs1HYhMMrc_qd0pkgGC62Lzt5zmevU23r9hCHiB4	2026-03-21 14:33:28.898682+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, code, price, original_price, image, description, content, qty, is_active, created_at, updated_at, category_id) FROM stdin;
\.


--
-- Data for Name: tbl_country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_country (id, name, code, "isActive", "createdBy", "createdDt", "updatedDt") FROM stdin;
1	India	IN	t	1	2026-03-21 04:08:42.258506+00	2026-03-21 04:08:42.259091+00
\.


--
-- Data for Name: tbl_state; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_state (id, "countryId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") FROM stdin;
1	1	Andhra Pradesh	\N	t	1	2026-03-21 04:08:42.292853+00	2026-03-21 04:08:42.292871+00
2	1	Arunachal Pradesh	\N	t	1	2026-03-21 04:08:42.342775+00	2026-03-21 04:08:42.342793+00
3	1	Assam	\N	t	1	2026-03-21 04:08:42.36672+00	2026-03-21 04:08:42.366733+00
4	1	Bihar	\N	t	1	2026-03-21 04:08:42.392253+00	2026-03-21 04:08:42.392266+00
5	1	Chhattisgarh	\N	t	1	2026-03-21 04:08:42.417808+00	2026-03-21 04:08:42.417821+00
6	1	Goa	\N	t	1	2026-03-21 04:08:42.443839+00	2026-03-21 04:08:42.443872+00
7	1	Gujarat	\N	t	1	2026-03-21 04:08:42.466408+00	2026-03-21 04:08:42.466425+00
8	1	Haryana	\N	t	1	2026-03-21 04:08:42.499332+00	2026-03-21 04:08:42.49935+00
9	1	Himachal Pradesh	\N	t	1	2026-03-21 04:08:42.515534+00	2026-03-21 04:08:42.515543+00
10	1	Jharkhand	\N	t	1	2026-03-21 04:08:42.53065+00	2026-03-21 04:08:42.530665+00
11	1	Karnataka	\N	t	1	2026-03-21 04:08:42.549901+00	2026-03-21 04:08:42.549913+00
12	1	Kerala	\N	t	1	2026-03-21 04:08:42.572433+00	2026-03-21 04:08:42.572445+00
13	1	Madhya Pradesh	\N	t	1	2026-03-21 04:08:42.593046+00	2026-03-21 04:08:42.593057+00
14	1	Maharashtra	\N	t	1	2026-03-21 04:08:42.616948+00	2026-03-21 04:08:42.616961+00
15	1	Manipur	\N	t	1	2026-03-21 04:08:42.646843+00	2026-03-21 04:08:42.646857+00
16	1	Meghalaya	\N	t	1	2026-03-21 04:08:42.657688+00	2026-03-21 04:08:42.657699+00
17	1	Mizoram	\N	t	1	2026-03-21 04:08:42.667763+00	2026-03-21 04:08:42.667775+00
18	1	Nagaland	\N	t	1	2026-03-21 04:08:42.683246+00	2026-03-21 04:08:42.683273+00
19	1	Odisha	\N	t	1	2026-03-21 04:08:42.706389+00	2026-03-21 04:08:42.706402+00
20	1	Punjab	\N	t	1	2026-03-21 04:08:42.752347+00	2026-03-21 04:08:42.752387+00
21	1	Rajasthan	\N	t	1	2026-03-21 04:08:42.795591+00	2026-03-21 04:08:42.795604+00
22	1	Sikkim	\N	t	1	2026-03-21 04:08:42.858307+00	2026-03-21 04:08:42.858347+00
23	1	Tamil Nadu	\N	t	1	2026-03-21 04:08:42.883127+00	2026-03-21 04:08:42.883167+00
24	1	Telangana	\N	t	1	2026-03-21 04:08:42.974458+00	2026-03-21 04:08:42.974487+00
25	1	Tripura	\N	t	1	2026-03-21 04:08:43.008317+00	2026-03-21 04:08:43.00835+00
26	1	Uttar Pradesh	\N	t	1	2026-03-21 04:08:43.025434+00	2026-03-21 04:08:43.025461+00
27	1	Uttarakhand	\N	t	1	2026-03-21 04:08:43.089455+00	2026-03-21 04:08:43.08948+00
28	1	West Bengal	\N	t	1	2026-03-21 04:08:43.120195+00	2026-03-21 04:08:43.120207+00
29	1	Delhi	\N	t	1	2026-03-21 04:08:43.146669+00	2026-03-21 04:08:43.146684+00
30	1	Chandigarh	\N	t	1	2026-03-21 04:08:43.164944+00	2026-03-21 04:08:43.164955+00
31	1	Puducherry	\N	t	1	2026-03-21 04:08:43.176274+00	2026-03-21 04:08:43.176289+00
32	1	Jammu and Kashmir	\N	t	1	2026-03-21 04:08:43.205519+00	2026-03-21 04:08:43.205559+00
33	1	Ladakh	\N	t	1	2026-03-21 04:08:43.225298+00	2026-03-21 04:08:43.225315+00
34	1	Andaman and Nicobar Islands	\N	t	1	2026-03-21 04:08:43.244742+00	2026-03-21 04:08:43.244759+00
35	1	Lakshadweep	\N	t	1	2026-03-21 04:08:43.256099+00	2026-03-21 04:08:43.256109+00
36	1	Dadra and Nagar Haveli and Daman and Diu	\N	t	1	2026-03-21 04:08:43.26808+00	2026-03-21 04:08:43.268093+00
\.


--
-- Data for Name: tbl_city; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_city (id, "stateId", name, code, "isActive", "createdBy", "createdDt", "updatedDt") FROM stdin;
1	1	Visakhapatnam	\N	t	1	2026-03-21 04:08:42.306525+00	2026-03-21 04:08:42.306547+00
2	1	Vijayawada	\N	t	1	2026-03-21 04:08:42.315975+00	2026-03-21 04:08:42.315999+00
3	1	Guntur	\N	t	1	2026-03-21 04:08:42.322959+00	2026-03-21 04:08:42.323025+00
4	1	Nellore	\N	t	1	2026-03-21 04:08:42.330102+00	2026-03-21 04:08:42.330123+00
5	1	Kurnool	\N	t	1	2026-03-21 04:08:42.336496+00	2026-03-21 04:08:42.336517+00
6	2	Itanagar	\N	t	1	2026-03-21 04:08:42.349908+00	2026-03-21 04:08:42.349927+00
7	2	Tawang	\N	t	1	2026-03-21 04:08:42.356278+00	2026-03-21 04:08:42.3563+00
8	2	Ziro	\N	t	1	2026-03-21 04:08:42.360446+00	2026-03-21 04:08:42.360457+00
9	3	Guwahati	\N	t	1	2026-03-21 04:08:42.371341+00	2026-03-21 04:08:42.371358+00
10	3	Silchar	\N	t	1	2026-03-21 04:08:42.380121+00	2026-03-21 04:08:42.380136+00
11	3	Dibrugarh	\N	t	1	2026-03-21 04:08:42.384018+00	2026-03-21 04:08:42.38403+00
12	3	Jorhat	\N	t	1	2026-03-21 04:08:42.388283+00	2026-03-21 04:08:42.388303+00
13	4	Patna	\N	t	1	2026-03-21 04:08:42.396951+00	2026-03-21 04:08:42.396988+00
14	4	Gaya	\N	t	1	2026-03-21 04:08:42.403901+00	2026-03-21 04:08:42.403921+00
15	4	Bhagalpur	\N	t	1	2026-03-21 04:08:42.408836+00	2026-03-21 04:08:42.408848+00
16	4	Muzaffarpur	\N	t	1	2026-03-21 04:08:42.413778+00	2026-03-21 04:08:42.413792+00
17	5	Raipur	\N	t	1	2026-03-21 04:08:42.423658+00	2026-03-21 04:08:42.423676+00
18	5	Bhilai	\N	t	1	2026-03-21 04:08:42.43178+00	2026-03-21 04:08:42.431794+00
19	5	Bilaspur	\N	t	1	2026-03-21 04:08:42.435231+00	2026-03-21 04:08:42.435242+00
20	5	Korba	\N	t	1	2026-03-21 04:08:42.43941+00	2026-03-21 04:08:42.439429+00
21	6	Panaji	\N	t	1	2026-03-21 04:08:42.451002+00	2026-03-21 04:08:42.451026+00
22	6	Margao	\N	t	1	2026-03-21 04:08:42.457244+00	2026-03-21 04:08:42.457259+00
23	6	Vasco da Gama	\N	t	1	2026-03-21 04:08:42.46155+00	2026-03-21 04:08:42.461562+00
24	7	Ahmedabad	\N	t	1	2026-03-21 04:08:42.472434+00	2026-03-21 04:08:42.472456+00
25	7	Surat	\N	t	1	2026-03-21 04:08:42.479391+00	2026-03-21 04:08:42.479405+00
26	7	Vadodara	\N	t	1	2026-03-21 04:08:42.48499+00	2026-03-21 04:08:42.485012+00
27	7	Rajkot	\N	t	1	2026-03-21 04:08:42.489394+00	2026-03-21 04:08:42.489407+00
28	7	Gandhinagar	\N	t	1	2026-03-21 04:08:42.49368+00	2026-03-21 04:08:42.493698+00
29	8	Faridabad	\N	t	1	2026-03-21 04:08:42.50435+00	2026-03-21 04:08:42.504362+00
30	8	Gurgaon	\N	t	1	2026-03-21 04:08:42.507622+00	2026-03-21 04:08:42.507633+00
31	8	Panipat	\N	t	1	2026-03-21 04:08:42.510118+00	2026-03-21 04:08:42.510127+00
32	8	Ambala	\N	t	1	2026-03-21 04:08:42.51301+00	2026-03-21 04:08:42.513021+00
33	9	Shimla	\N	t	1	2026-03-21 04:08:42.518464+00	2026-03-21 04:08:42.518474+00
34	9	Dharamshala	\N	t	1	2026-03-21 04:08:42.522607+00	2026-03-21 04:08:42.522619+00
35	9	Solan	\N	t	1	2026-03-21 04:08:42.526836+00	2026-03-21 04:08:42.526849+00
36	10	Ranchi	\N	t	1	2026-03-21 04:08:42.534125+00	2026-03-21 04:08:42.534139+00
37	10	Jamshedpur	\N	t	1	2026-03-21 04:08:42.537801+00	2026-03-21 04:08:42.537814+00
38	10	Dhanbad	\N	t	1	2026-03-21 04:08:42.54248+00	2026-03-21 04:08:42.542504+00
39	10	Bokaro	\N	t	1	2026-03-21 04:08:42.546568+00	2026-03-21 04:08:42.546582+00
40	11	Bangalore	\N	t	1	2026-03-21 04:08:42.55262+00	2026-03-21 04:08:42.552636+00
41	11	Mysore	\N	t	1	2026-03-21 04:08:42.556665+00	2026-03-21 04:08:42.556678+00
42	11	Hubli	\N	t	1	2026-03-21 04:08:42.560746+00	2026-03-21 04:08:42.560757+00
43	11	Mangalore	\N	t	1	2026-03-21 04:08:42.564844+00	2026-03-21 04:08:42.564857+00
44	11	Belgaum	\N	t	1	2026-03-21 04:08:42.568654+00	2026-03-21 04:08:42.568665+00
45	12	Thiruvananthapuram	\N	t	1	2026-03-21 04:08:42.577298+00	2026-03-21 04:08:42.577319+00
46	12	Kochi	\N	t	1	2026-03-21 04:08:42.581284+00	2026-03-21 04:08:42.581298+00
47	12	Kozhikode	\N	t	1	2026-03-21 04:08:42.584853+00	2026-03-21 04:08:42.584864+00
48	12	Thrissur	\N	t	1	2026-03-21 04:08:42.588709+00	2026-03-21 04:08:42.588728+00
49	13	Bhopal	\N	t	1	2026-03-21 04:08:42.596704+00	2026-03-21 04:08:42.596715+00
50	13	Indore	\N	t	1	2026-03-21 04:08:42.600926+00	2026-03-21 04:08:42.600939+00
51	13	Gwalior	\N	t	1	2026-03-21 04:08:42.604731+00	2026-03-21 04:08:42.604744+00
52	13	Jabalpur	\N	t	1	2026-03-21 04:08:42.608785+00	2026-03-21 04:08:42.608797+00
53	13	Ujjain	\N	t	1	2026-03-21 04:08:42.612723+00	2026-03-21 04:08:42.612738+00
54	14	Mumbai	\N	t	1	2026-03-21 04:08:42.620247+00	2026-03-21 04:08:42.620264+00
55	14	Pune	\N	t	1	2026-03-21 04:08:42.626265+00	2026-03-21 04:08:42.626277+00
56	14	Nagpur	\N	t	1	2026-03-21 04:08:42.630591+00	2026-03-21 04:08:42.630613+00
57	14	Thane	\N	t	1	2026-03-21 04:08:42.634288+00	2026-03-21 04:08:42.6343+00
58	14	Nashik	\N	t	1	2026-03-21 04:08:42.638045+00	2026-03-21 04:08:42.638058+00
59	14	Aurangabad	\N	t	1	2026-03-21 04:08:42.642273+00	2026-03-21 04:08:42.642286+00
60	15	Imphal	\N	t	1	2026-03-21 04:08:42.65248+00	2026-03-21 04:08:42.652508+00
61	16	Shillong	\N	t	1	2026-03-21 04:08:42.662516+00	2026-03-21 04:08:42.662543+00
62	17	Aizawl	\N	t	1	2026-03-21 04:08:42.672684+00	2026-03-21 04:08:42.672699+00
63	18	Kohima	\N	t	1	2026-03-21 04:08:42.691906+00	2026-03-21 04:08:42.691944+00
64	18	Dimapur	\N	t	1	2026-03-21 04:08:42.700715+00	2026-03-21 04:08:42.700727+00
65	19	Bhubaneswar	\N	t	1	2026-03-21 04:08:42.711696+00	2026-03-21 04:08:42.711724+00
66	19	Cuttack	\N	t	1	2026-03-21 04:08:42.720262+00	2026-03-21 04:08:42.720288+00
67	19	Rourkela	\N	t	1	2026-03-21 04:08:42.730197+00	2026-03-21 04:08:42.730223+00
68	19	Berhampur	\N	t	1	2026-03-21 04:08:42.741514+00	2026-03-21 04:08:42.741556+00
69	20	Ludhiana	\N	t	1	2026-03-21 04:08:42.760095+00	2026-03-21 04:08:42.760119+00
70	20	Amritsar	\N	t	1	2026-03-21 04:08:42.768784+00	2026-03-21 04:08:42.768808+00
71	20	Jalandhar	\N	t	1	2026-03-21 04:08:42.776082+00	2026-03-21 04:08:42.776102+00
72	20	Patiala	\N	t	1	2026-03-21 04:08:42.784464+00	2026-03-21 04:08:42.784488+00
73	20	Bathinda	\N	t	1	2026-03-21 04:08:42.790831+00	2026-03-21 04:08:42.790845+00
74	21	Jaipur	\N	t	1	2026-03-21 04:08:42.801761+00	2026-03-21 04:08:42.801787+00
75	21	Jodhpur	\N	t	1	2026-03-21 04:08:42.809839+00	2026-03-21 04:08:42.80987+00
76	21	Udaipur	\N	t	1	2026-03-21 04:08:42.821688+00	2026-03-21 04:08:42.821781+00
77	21	Kota	\N	t	1	2026-03-21 04:08:42.833472+00	2026-03-21 04:08:42.833517+00
78	21	Ajmer	\N	t	1	2026-03-21 04:08:42.846218+00	2026-03-21 04:08:42.846255+00
79	22	Gangtok	\N	t	1	2026-03-21 04:08:42.868869+00	2026-03-21 04:08:42.868907+00
80	23	Chennai	\N	t	1	2026-03-21 04:08:42.897397+00	2026-03-21 04:08:42.897436+00
81	23	Coimbatore	\N	t	1	2026-03-21 04:08:42.908911+00	2026-03-21 04:08:42.908943+00
82	23	Madurai	\N	t	1	2026-03-21 04:08:42.91975+00	2026-03-21 04:08:42.919791+00
83	23	Trichy	\N	t	1	2026-03-21 04:08:42.931149+00	2026-03-21 04:08:42.931184+00
84	23	Salem	\N	t	1	2026-03-21 04:08:42.942309+00	2026-03-21 04:08:42.942332+00
85	23	Tiruppur	\N	t	1	2026-03-21 04:08:42.955115+00	2026-03-21 04:08:42.955141+00
86	23	Erode	\N	t	1	2026-03-21 04:08:42.964403+00	2026-03-21 04:08:42.964433+00
87	24	Hyderabad	\N	t	1	2026-03-21 04:08:42.981792+00	2026-03-21 04:08:42.981912+00
88	24	Warangal	\N	t	1	2026-03-21 04:08:42.989521+00	2026-03-21 04:08:42.989539+00
89	24	Nizamabad	\N	t	1	2026-03-21 04:08:42.995255+00	2026-03-21 04:08:42.995284+00
90	24	Karimnagar	\N	t	1	2026-03-21 04:08:43.001552+00	2026-03-21 04:08:43.00158+00
91	25	Agartala	\N	t	1	2026-03-21 04:08:43.018415+00	2026-03-21 04:08:43.018437+00
92	26	Lucknow	\N	t	1	2026-03-21 04:08:43.032352+00	2026-03-21 04:08:43.032377+00
93	26	Kanpur	\N	t	1	2026-03-21 04:08:43.038868+00	2026-03-21 04:08:43.038889+00
94	26	Agra	\N	t	1	2026-03-21 04:08:43.046465+00	2026-03-21 04:08:43.046486+00
95	26	Varanasi	\N	t	1	2026-03-21 04:08:43.063106+00	2026-03-21 04:08:43.063133+00
96	26	Meerut	\N	t	1	2026-03-21 04:08:43.069742+00	2026-03-21 04:08:43.069772+00
97	26	Prayagraj	\N	t	1	2026-03-21 04:08:43.076068+00	2026-03-21 04:08:43.076082+00
98	26	Ghaziabad	\N	t	1	2026-03-21 04:08:43.083609+00	2026-03-21 04:08:43.083624+00
99	27	Dehradun	\N	t	1	2026-03-21 04:08:43.095635+00	2026-03-21 04:08:43.09566+00
100	27	Haridwar	\N	t	1	2026-03-21 04:08:43.102813+00	2026-03-21 04:08:43.102856+00
101	27	Roorkee	\N	t	1	2026-03-21 04:08:43.111014+00	2026-03-21 04:08:43.111034+00
102	27	Haldwani	\N	t	1	2026-03-21 04:08:43.115936+00	2026-03-21 04:08:43.115947+00
103	28	Kolkata	\N	t	1	2026-03-21 04:08:43.124236+00	2026-03-21 04:08:43.124256+00
104	28	Howrah	\N	t	1	2026-03-21 04:08:43.128789+00	2026-03-21 04:08:43.128804+00
105	28	Darjeeling	\N	t	1	2026-03-21 04:08:43.132931+00	2026-03-21 04:08:43.132941+00
106	28	Siliguri	\N	t	1	2026-03-21 04:08:43.137271+00	2026-03-21 04:08:43.137291+00
107	28	Asansol	\N	t	1	2026-03-21 04:08:43.141714+00	2026-03-21 04:08:43.141725+00
108	29	New Delhi	\N	t	1	2026-03-21 04:08:43.151297+00	2026-03-21 04:08:43.151314+00
109	29	North Delhi	\N	t	1	2026-03-21 04:08:43.156437+00	2026-03-21 04:08:43.156451+00
110	29	South Delhi	\N	t	1	2026-03-21 04:08:43.161343+00	2026-03-21 04:08:43.161366+00
111	30	Chandigarh	\N	t	1	2026-03-21 04:08:43.170578+00	2026-03-21 04:08:43.170606+00
112	31	Puducherry	\N	t	1	2026-03-21 04:08:43.183752+00	2026-03-21 04:08:43.183783+00
113	31	Karaikal	\N	t	1	2026-03-21 04:08:43.190024+00	2026-03-21 04:08:43.190041+00
114	31	Mahe	\N	t	1	2026-03-21 04:08:43.197003+00	2026-03-21 04:08:43.197024+00
115	32	Srinagar	\N	t	1	2026-03-21 04:08:43.212929+00	2026-03-21 04:08:43.212958+00
116	32	Jammu	\N	t	1	2026-03-21 04:08:43.219845+00	2026-03-21 04:08:43.219859+00
117	33	Leh	\N	t	1	2026-03-21 04:08:43.234944+00	2026-03-21 04:08:43.234974+00
118	33	Kargil	\N	t	1	2026-03-21 04:08:43.240916+00	2026-03-21 04:08:43.240928+00
119	34	Port Blair	\N	t	1	2026-03-21 04:08:43.25054+00	2026-03-21 04:08:43.250559+00
120	35	Kavaratti	\N	t	1	2026-03-21 04:08:43.260461+00	2026-03-21 04:08:43.260473+00
121	36	Daman	\N	t	1	2026-03-21 04:08:43.271946+00	2026-03-21 04:08:43.271974+00
122	36	Silvassa	\N	t	1	2026-03-21 04:08:43.279094+00	2026-03-21 04:08:43.279129+00
\.


--
-- Data for Name: tbl_company; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_company (id, logo, name, "shortName", address1, address2, countryid, stateid, cityid, "emailId", "mobileNo", "whatsappNo", currency, "fyStart", "appDateFormat", "appColorCode", "branchLimit", "userLimit", isseparatedb, dbname, "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
1	\N	Auraa Zen AI	Auraa	\N	\N	\N	\N	\N	\N	7358377381	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	1	2026-03-20 18:13:02.125927+00	2026-03-20 18:13:02.125927+00	\N
\.


--
-- Data for Name: tbl_branch; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_branch (id, logo, name, "shortName", address1, address2, countryid, stateid, cityid, "emailId", "mobileNo", "whatsappNo", currency, "fyStart", "appDateFormat", "appColorCode", "companyId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
1	\N	Auraa Crackers	Auraa	\N	\N	\N	\N	\N	\N	7358377381	\N	\N	\N	\N	\N	\N	t	1	2026-03-20 18:14:29.277424+00	2026-03-20 18:14:29.277424+00	\N
\.


--
-- Data for Name: tbl_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_category (id, "categoryName", "categoryImage", "sortNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
1	SPARKLER		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
4	TWINKLING		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
5	ENJOY PENCIL		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
8	ROCKETS		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
10	ELECTRIC LAR CRACKERS		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
11	na		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
12	BABY FANCY NOVELTIES		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
13	COCKTAIL FANCY		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
14	COLOUR RIDER SHOTS		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
15	MULTI COLOUR SHOT		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
16	MINI AERIAL CHOTTA FANCY		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
17	MEGA DISPLAY		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
18	GUJARATH FLOWER POTS		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
19	2 ┬╝ COLOUR FOUNTAIN		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
20	4\\" WONDER COLOR FOUNTAIN		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
21	TWIN COLOR FOUNTAINS		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
22	COLOUR FOUNTAIN		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
23	PEACOCK FOUNTAIN 		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
24	COLOUR MATCHES		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
25	Special Items		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
26	                                                                       GIFT BOX		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
27	NEW PRODUCTS		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
28	EXTRA		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
29	GARLAND (Classic/PRIME)		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
30	STANDARD ITEMS		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
31	FAMILY PACK		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
39	MULTI SOUND CRACKERS	/static/images/categories/multi-sound.png	1	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
7	BIJILI	/static/images/categories/bijili.png	1	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
40	BIJILI	/static/images/categories/bijili.png	1	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
41	BRAND BIJILI	/static/images/categories/bijili.png	1	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
9	BOMB	/static/images/categories/bomb.png	1	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
42	BOMB	/static/images/categories/bomb.png	1	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
43	POWER DELUXE	/static/images/categories/power-deluxe.png	1	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
6	ONE SOUND CRACKERS	/static/images/categories/one-sound.png	1	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
38	ONE SOUND CRACKERS	/static/images/categories/one-sound.png	1	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
44	CELEBRATION GARLAND		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
45	GARLAND PRIME		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
46	ROCKETS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
47	PEACOCK FOUNTAINS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
48	SIREN		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
49	BABY FANCY NOVELTIES		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
50	COLOR RIDER SHOTS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
51	MULTI COLOUR SHOTS (Sky Blasters)		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
52	MULTI COLOUR SHOTS BRAND		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
53	AERIAL CHOTTA FANCY		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
54	GALAXY SHOW		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
55	GUJARATH FLOWER POTS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
56	SKY DANCERS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
36	TWINKLING STAR (Glow Show)	/static/images/categories/twinkling-star.png	100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
2	FLOWER POTS	/static/images/categories/flower-pots.png	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
3	CHAKKARS	/static/images/categories/chakkars.png	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
57	MAGIC MOMENTS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
58	COCKTAIL FANCY		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
59	PAPER BOMBS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
60	SPECIAL FOUNTAINS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
61	MINI COLOR CRACKLING FOUNTAIN		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
62	2\\"  COLOUR FOUNTAINS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
63	4\\" COLOR FOUNTAINS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
64	COLOR MATCHES		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
65	FAMILY PACKS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
66	GIFT BOXES		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
67	NEW PRODUCTS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
68	STANDARD ITEMS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
69	FLOWER POT		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
70	CHAKRAS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
71	TWINKLING		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
72	ELECTRIC LAR CRACKERS		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
73	GARLAND (CLASSIC)		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
74	PAPER BOMB		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
75	COLOR RIDER SHOT		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
76	MULTI COLOR SHOT		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
77	MINI ARIAL CHOTO FANCY		100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
33	FLOWER POTS	/static/images/categories/flower-pots.png	100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
34	SPECIAL FLOWER POTS	/static/images/categories/special-flower-pots.png	100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
35	CHAKKARS	/static/images/categories/chakkars.png	100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
32	SPARKLERS	/static/images/categories/sparklers.png	100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
37	TWINKLE PENCILS	/static/images/categories/twinkle-pencils.png	100	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
\.


--
-- Data for Name: tbl_websitelist; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_websitelist (id, "websiteName", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedBy", "updatedDt") FROM stdin;
1	AuraaBooks	1	1	t	1	2026-03-20 18:16:29.29733+00	\N	2026-03-20 18:16:29.29733+00
2	AuraaCrackers	1	1	t	1	2026-03-20 18:16:29.29733+00	\N	2026-03-20 18:16:29.29733+00
\.


--
-- Data for Name: tbl_customer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_customer (id, name, company, "contactPerson", "contactPersonNo", "accountId", balance, "taxId", "isOnline", "websiteId", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_units; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_units (id, name, code, descr, "convFactor", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
1	32	1	7 CM ELCECTRIC SPARKLER	https://auraacrackers.com/images/upload/img_99291569618_09_2025.jpg	G	\N	1	6.00	\N	12.00	12.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
2	32	2	7 CM COLOR SPARKLER	https://auraacrackers.com/images/upload/img_69593685801_09_2025.jpg	G	\N	1	6.00	\N	12.00	12.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
3	32	3	7 CM GREEN SPARKLER	https://auraacrackers.com/images/upload/img_110764772701_09_2025.jpg	G	\N	1	7.00	\N	14.00	14.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
4	32	4	7 CM RED SPARKLER	https://auraacrackers.com/images/upload/img_209873051720_08_2025.jpg	G	\N	1	8.00	\N	16.00	16.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
5	32	5	10 CM ELECTRIC SPARKLER	https://auraacrackers.com/images/upload/img_204413476720_08_2025.jpg	G	\N	1	10.00	\N	20.00	20.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
6	32	6	10 CM COLOUR SPARKLER	https://auraacrackers.com/images/upload/img_191171162720_08_2025.jpg	G	\N	1	12.00	\N	24.00	24.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
7	32	7	10 CM GREEN SPARKLER	https://auraacrackers.com/images/upload/img_2707655420_08_2025.jpg	G	\N	1	13.00	\N	26.00	26.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
8	32	8	10 CM RED SPARKLER	https://auraacrackers.com/images/upload/img_75210337418_09_2025.jpg	G	\N	1	15.00	\N	30.00	30.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
9	32	9	12 CM ELECTRIC SPARKLER	https://auraacrackers.com/images/upload/img_21542314118_09_2025.jpg	G	\N	1	14.00	\N	28.00	28.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
10	32	10	12 CM COLOR SPARKLER	https://auraacrackers.com/images/upload/img_32178997320_08_2025.jpg	G	\N	1	15.00	\N	30.00	30.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
11	32	11	12 CM GREEN SPARKLER	https://auraacrackers.com/images/upload/img_28606882018_09_2025.jpg	G	\N	1	16.00	\N	32.00	32.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
12	32	12	12 CM RED SPARKLER	https://auraacrackers.com/images/upload/img_54948171901_09_2025.jpg	G	\N	1	17.00	\N	34.00	34.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
13	32	13	15 CM ELECTRIC SPARKLER	https://auraacrackers.com/images/upload/img_89947300418_09_2025.jpg	G	\N	1	24.00	\N	48.00	48.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
14	32	14	15 CM COLOR SPARKLER	https://auraacrackers.com/images/upload/img_4426861918_09_2025.jpg	G	\N	1	26.00	\N	52.00	52.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
15	32	15	15 CM GREEN SPARKLER	https://auraacrackers.com/images/upload/img_96052581418_09_2025.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
16	32	16	15 CM RED SPARKLER	https://auraacrackers.com/images/upload/img_91424910518_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
17	32	18	30 CM COLOUR SPARKLER	https://auraacrackers.com/images/upload/img_160261898218_09_2025.jpg	G	\N	1	26.00	\N	52.00	52.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
18	32	17	30 CM ELECTRIC SPARKLER	https://auraacrackers.com/images/upload/img_14512714718_09_2025.jpg	G	\N	1	24.00	\N	48.00	48.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
19	32	19	30 CM GREEN SPARKLER	https://auraacrackers.com/images/upload/img_11971183018_09_2025.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
20	32	20	30 CM RED SPARKLER	https://auraacrackers.com/images/upload/img_48284719318_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
21	32	21	50 CM ELECTRIC SPARKLER	https://auraacrackers.com/images/upload/img_31194980220_08_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
22	32	22	50 CM COLOUR SPARKLER	https://auraacrackers.com/images/upload/img_34837202020_08_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
23	33	26	FLOWER POT SMALL	https://auraacrackers.com/images/upload/img_168471976920_08_2025.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
24	33	27	FLOWER POT BIG (UV BOX)	https://auraacrackers.com/images/upload/img_143037112721_08_2025.jpg	G	\N	1	60.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
25	33	28	FLOWER POT SPECIAL	https://auraacrackers.com/images/upload/img_98846912021_08_2025.jpg	G	\N	1	70.00	\N	140.00	140.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
26	33	29	FLOWER POT ASHOKA (UV BOX)	https://auraacrackers.com/images/upload/img_188789715921_08_2025.jpg	G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
27	33	30	COLOR KOTI (UV BOX)	https://auraacrackers.com/images/upload/img_67626778720_08_2025.jpg	G	\N	1	160.00	\N	280.00	280.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
28	34	34	GYPSY (SUYRAKALAA)	https://auraacrackers.com/images/upload/img_198351252917_09_2025.jpg	G	\N	1	140.00	\N	280.00	280.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
29	34	35	TRI COLOUR FOUNTAINS	https://auraacrackers.com/images/upload/img_134854636220_08_2025.jpg	G	\N	1	225.00	\N	450.00	450.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
30	34	36	JOLLY TRAIN	https://auraacrackers.com/images/upload/img_11528369720_08_2025.jpg	G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
31	34	31	FLOWER POT DELUXE (5 Pieces)	https://auraacrackers.com/images/upload/img_55188359201_09_2025.jpg	G	\N	1	140.00	\N	280.00	280.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
32	34	32	FLOWER POT DELUXE (10 Pieces)	https://auraacrackers.com/images/upload/img_139145351901_09_2025.jpg	G	\N	1	270.00	\N	540.00	540.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
33	35	41	GROUND CHAKKARS BIG	https://auraacrackers.com/images/upload/img_10296023001_09_2025.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
34	35	42	GROUND CHAKKARS SPECIAL	https://auraacrackers.com/images/upload/img_131297680901_09_2025.jpg	G	\N	1	70.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
35	35	43	GROUND CHAKKARS DELUXE	https://auraacrackers.com/images/upload/img_136709995601_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
36	3	36	DISCO WHEEL (5 Pieces)	https://auraacrackers.com/images/upload/img_194369494901_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
37	35	45	WIRE CHAKKARAS	https://auraacrackers.com/images/upload/img_206856065401_09_2025.jpg	G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
38	4	38	1 1/2 TWINKLING STAR	https://auraacrackers.com/images/upload/img_121119220120_08_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
39	36	52	4 TWINKLING STAR DELUXE	https://auraacrackers.com/images/upload/img_40721885001_09_2025.jpg	G	\N	1	65.00	\N	130.00	130.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
40	37	55	FLUTE (HAND TORCH 3 PCS)		G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
41	57	176	SELFI STICK (3 PCS)	https://auraacrackers.com/images/upload/img_191365291001_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
42	37	54	 12\\" PENCIL - SILVER TORCHES	https://auraacrackers.com/images/upload/img_143469502821_09_2025.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
43	37	57	COLOUR CRUSH PENCIL	https://auraacrackers.com/images/upload/img_55415737818_09_2025.jpg	G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
44	37	56	12\\" DELUXE PENCIL - KARTHIKA		G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
46	38	61	3 1/2 MEDIUM LAXMI (3 ROLE)	https://auraacrackers.com/images/upload/img_189502417224_09_2025.jpg	G	\N	1	12.00	\N	24.00	24.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
47	38	62	4\\" LAXMI CRACKERS (6 ROLE)	https://auraacrackers.com/images/upload/img_72414993124_09_2025.jpg	G	\N	1	14.00	\N	28.00	28.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
48	6	48	HULK/DELUXE LAXMI		G	\N	1	22.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
49	6	49	JALLIKATTU / BAHUBALI	https://auraacrackers.com/images/upload/img_96944462724_08_2025.jpg	G	\N	1	40.00	\N	80.00	80.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
50	38	69	LION KING (25 ROLE)	https://auraacrackers.com/images/upload/img_138511851024_08_2025.jpg	G	\N	1	60.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
51	38	70	GOLD LAKSHMI	https://auraacrackers.com/images/upload/img_82777363424_09_2025.jpg	G	\N	1	38.00	\N	76.00	76.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
52	40	74	RED BIJILI (50 PCS)	https://auraacrackers.com/images/upload/img_127372385719_09_2025.jpg	G	\N	1	15.00	\N	30.00	30.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
54	41	80	VARI BIJILI(50 PCS) BRAND		G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
55	40	77	VARI BIJILI(100 PCS)		G	\N	1	35.00	\N	70.00	70.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
56	41	78	RED BIJILI (50 PCS) BRAND		G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
58	41	81	VARI BIJILI(100 PCS) BRAND	https://auraacrackers.com/images/upload/img_63532642019_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
59	46	109	ROCKET BOMB		G	\N	1	70.00	\N	140.00	140.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
60	46	110	LUNIK ROCKET		G	\N	1	110.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
61	46	111	2 SOUND ROCKET		G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
62	46	113	COLOUR ROCKET (Suryakala)		G	\N	1	90.00	\N	160.00	160.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
63	46	114	WHISTLING/MUSICAL ROCKET	https://auraacrackers.com/images/upload/img_159311758001_09_2025.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
64	42	83	BULLET BOMB	https://auraacrackers.com/images/upload/img_107567927121_09_2025.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
65	42	84	HYDRO BOMB	https://auraacrackers.com/images/upload/img_147512279720_08_2025.jpg	G	\N	1	65.00	\N	130.00	130.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
66	42	85	KING OF KING BOMB - JUG MUG 3000		G	\N	1	75.00	\N	150.00	150.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
67	42	86	CLASSIC BOMB / JUG MUG 5000	https://auraacrackers.com/images/upload/img_36023176320_08_2025.jpg	G	\N	1	85.00	\N	170.00	170.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
68	42	68	MEGA RIDER / DINOSAUR	https://auraacrackers.com/images/upload/img_103380931922_09_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
69	9	69	AGNI / DIGITAL BOMB / DINOSAUR 	https://auraacrackers.com/images/upload/img_202872061620_08_2025.jpg	G	\N	1	155.00	\N	310.00	310.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
70	43	93	28 GAINT CRACKERS		G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
71	43	94	56 GAINT CRACKERS		G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
72	43	95	24 DELUXE CRACKERS	https://auraacrackers.com/images/upload/img_191501219624_09_2025.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
73	43	96	50 DELUXE CRACKERS		G	\N	1	85.00	\N	170.00	170.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
74	43	97	100 DELUXE CRACKERS	https://auraacrackers.com/images/upload/img_64969320924_09_2025.jpg	G	\N	1	165.00	\N	330.00	330.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
75	60	197	Sing pop	https://auraacrackers.com/images/upload/img_92497142401_09_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
76	25	76	AK_DRONE	https://auraacrackers.com/images/upload/img_112006819501_09_2025.jpg	G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
77	60	198	Fox star	https://auraacrackers.com/images/upload/img_173434188901_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
78	11	78	na		G	\N	1	0.00	\N	0.00	0.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
79	49	122	ELETRIC STONE	https://auraacrackers.com/images/upload/img_115340003301_09_2025.jpg	G	\N	1	12.00	\N	12.00	12.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
53	40	75	RED BIJILI (100 PCS)		G	\N	1	30.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 01:22:21.735902+00	\N
57	41	79	RED BIJILI (100 PCS) BRAND	https://auraacrackers.com/images/upload/img_23472063101_09_2025.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	1	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 01:29:04.112191+00	\N
80	49	123	MAGIC POP	https://auraacrackers.com/images/upload/img_43165617201_09_2025.jpg	G	\N	1	10.00	\N	20.00	20.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
81	49	124	KITKAT	https://auraacrackers.com/images/upload/img_154490726001_09_2025.jpg	G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
82	49	125	CRAZY TOONS (CARTOON)	https://auraacrackers.com/images/upload/img_34303998120_08_2025.jpg	G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
83	49	127	SNAKE EGG BIG / ZEE BOOM BAA (10 Pouch)	https://auraacrackers.com/images/upload/img_97124699619_09_2025.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
84	58	178	TIN Majesty	https://auraacrackers.com/images/upload/img_94972666801_09_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
85	58	179	TIN		G	\N	1	90.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
86	58	183	BLACK MONEY / WHITE MONEY	https://auraacrackers.com/images/upload/img_173450326618_09_2025.jpg	G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
87	48	119	MEGA SIREN		G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
88	48	120	MINI SIREN		G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
89	57	174	PHOTO FLASH	https://auraacrackers.com/images/upload/img_22415737301_09_2025.jpg	G	\N	1	70.00	\N	140.00	140.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
90	13	90	PAW PATROL (BRAND HELICOPTER)		G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
91	13	91	HELICOPTER / DRONE	https://auraacrackers.com/images/upload/img_171539578520_08_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
92	56	171	BUTTERFLY (COLOR CHANGING)	https://auraacrackers.com/images/upload/img_60398206501_09_2025.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
93	58	181	6\\" FOUNTAIN (TIN)		G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
94	58	182	MONEY IN THE BANK (STARVELL)		G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
95	58	180	6\\" WATER QUEEN (STARVELL)		G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
96	35	46	4 X 4 WHEEL	https://auraacrackers.com/images/upload/img_161031884724_08_2025.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
97	39	73	90 WATTS	https://auraacrackers.com/images/upload/img_188313975218_09_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
98	59	187	Beat IT v1.0	https://auraacrackers.com/images/upload/img_126850570301_09_2025.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
99	59	188	Beat IT v2.0	https://auraacrackers.com/images/upload/img_191368986301_09_2025.jpg	G	\N	1	90.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
100	59	189	Beat IT v3.0	https://auraacrackers.com/images/upload/img_8827009301_09_2025.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
101	57	175	COLOUR SMOKE(RAINBOW)		G	\N	1	145.00	\N	290.00	290.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
102	51	133	6 SHOT MULTI-COLOUR		G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
103	50	128	7 SHOT COLOUR	https://auraacrackers.com/images/upload/img_15288083101_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
104	50	129	12 SHOT COLOUR RIDER	https://auraacrackers.com/images/upload/img_128687006917_09_2025.jpg	G	\N	1	160.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
105	51	135	30 SHOT MULTI COLOUR (UV BOX)	https://auraacrackers.com/images/upload/img_7449794524_09_2025.jpg	G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
106	51	136	60 SHOT MULTI COLOUR		G	\N	1	700.00	\N	1400.00	1400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
107	51	137	120 SHOT MULTI COLOUR	https://auraacrackers.com/images/upload/img_112627266124_09_2025.jpg	G	\N	1	1400.00	\N	2800.00	2800.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
108	51	138	240 SHOT MULTI COLOUR		G	\N	1	2400.00	\N	4800.00	4800.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
109	52	142	60 SHOT MULTI COLOUR(BRAND)		G	\N	1	850.00	\N	1700.00	1700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
110	52	143	120 SHOT MULTI COLOUR(BRAND)		G	\N	1	1700.00	\N	6400.00	6400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
111	52	145	240 SHOT MULTI COLOUR(BRAND)		G	\N	1	3400.00	\N	6800.00	6800.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
112	53	146	1 1/4 CHOTA FANCY		G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
113	53	147	2\\" ARIAL FANCY (1Pc)		G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
114	17	114	2\\" ARIAL FANCY PIPE		G	\N	1	95.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
115	17	115	2\\" ARIAL FANCY PIPE		G	\N	1	95.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
116	17	116	2\\" ARIAL FANCY PIPE		G	\N	1	95.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
117	54	148	2\\" ARIAL FANCY PIPE (3 PCS)		G	\N	1	230.00	\N	460.00	460.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
118	54	149	2\\" ARIAL FANCY PIPE (3 PCS) AK BRAND		G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
119	54	150	3 1/2\\" ARIAL FANCY PIPE (CANDY CRUSH)	https://auraacrackers.com/images/upload/img_150351493610_10_2025.png	G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
120	54	155	4\\" ARIAL FANCY DOUBLE BALL		G	\N	1	495.00	\N	990.00	990.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
121	17	121	3 1/2\\" ARIAL FANCY MIXED(SURIYAKALAA)		G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
122	54	151	4\\" ARIAL FANCY (OREO)	https://auraacrackers.com/images/upload/img_78570253210_10_2025.png	G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
123	17	124	4\\" ARIAL FANCY DOUBLE BALL (SURIYAKALAA)		G	\N	1	420.00	\N	840.00	840.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
124	17	125	4\\" ARIAL FANCY HD SHOW		G	\N	1	380.00	\N	760.00	760.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
125	17	126	3/2ΓÇ¥NAYAGARA DOUBLE PIECE (SURIYAKALAA)		G	\N	1	500.00	\N	1000.00	1000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
126	55	163	MINI PEARL		G	\N	1	220.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
127	55	165	LITTLE STAR(2 IN 1)		G	\N	1	320.00	\N	640.00	640.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
128	55	166	JASMIN COLOUR CHANGING/ GOLDEN STAR		G	\N	1	420.00	\N	780.00	780.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
129	55	168	GUDIYA MEGA DELUXE		G	\N	1	550.00	\N	1040.00	1040.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
130	19	131	CHOTA BHEEM RED		G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
131	19	132	CHOTA BHEEM GREEN		G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
132	19	133	CHOTA BHEEM GOLD		G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
133	19	134	CHOTA BHEEM SILVER		G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
134	19	135	CHOTA BHEEM RED & GREEN		G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
135	20	136	WONDER/ MOTU PATLU RED		G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
136	20	137	WONDER/ MOTU PATLU GREEN		G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
137	20	138	WONDER/ MOTU PATLU GOLD		G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
138	20	139	WONDER/ MOTU PATLU SILVER		G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
139	20	140	WONDER/ MOTU PATLU RED & GREEN		G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
140	60	190	PLUM  (CRACKLING AND SILVER)		G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
141	60	191	APPLE ( (CRACKLING AND SILVER PEACOCK FEATHER)		G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
142	60	193	ORANGE ( (CRACKLING AND GOLDEN PEACOCK FEATHER))		G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
143	60	192	POMEGRANATE (WATER FALLS)	https://auraacrackers.com/images/upload/img_81442455020_08_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
144	22	145	Frank flower(5pcs)		G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
145	35	47	SPINNER SPECIAL	https://auraacrackers.com/images/upload/img_68781627618_09_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
146	60	194	TANGO SHOWER (5 IN 1)		G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
147	22	148	Colour cruch pencil		G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
148	22	149	Colour┬ábutterfly		G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
149	47	115	PEACOCK FEATHER		G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
150	47	116	ROYAL PEACOCK/DANCING PEACOCK		G	\N	1	160.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
151	47	117	BADA PEACOCK FOUNTAIN	https://auraacrackers.com/images/upload/img_121210570918_09_2025.jpg	G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
152	64	220	BABY STAR MATCHES		G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
153	64	221	FLASH MATCHES	https://auraacrackers.com/images/upload/img_145755301618_09_2025.jpg	G	\N	1	80.00	\N	160.00	160.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
154	64	222	SUPER DELUXE		G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
155	64	223	POKEMON (MINI-LAPTOP)	https://auraacrackers.com/images/upload/img_40226043418_09_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
156	64	224	MEGA LAPTOP	https://auraacrackers.com/images/upload/img_34386032218_09_2025.jpg	G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
157	60	196	ISON		G	\N	1	70.00	\N	140.00	140.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
158	60	199	ELITE MAGICAL MIX(5PCS)( COKE)	https://auraacrackers.com/images/upload/img_119318463320_08_2025.jpg	G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
159	25	160	JOLLY TRAIN	https://auraacrackers.com/images/upload/img_152151013620_08_2025.jpg	G	\N	1	220.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
160	60	161	6 Shots Summer Time (BRAND)	https://auraacrackers.com/images/upload/img_199653872618_09_2025.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
161	25	162			G	\N	1	0.00	\N	0.00	0.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
162	66	230	25 ITEMS-GIFT BOX		G	\N	1	325.00	\N	650.00	650.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
163	66	231	30 ITEMS-GIFT BOX		G	\N	1	420.00	\N	840.00	840.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
164	66	232	35 ITEMS-GIFT BOX		G	\N	1	500.00	\N	1000.00	1000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
165	66	233	40 ITEMS-GIFT BOX		G	\N	1	650.00	\N	1300.00	1300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
166	66	234	50 ITEMS-GIFT BOX		G	\N	1	800.00	\N	1600.00	1600.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
167	67	237	VIOLIN		G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
168	67	236	COCOMELON WHEEL ON THE BOX	https://auraacrackers.com/images/upload/img_87077316518_09_2025.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
169	27	170	PANDA		G	\N	1	1.00	\N	1.00	1.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
170	48	121	DORA (5 Pieces)		G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
171	27	172	DARBIC		G	\N	1	1.00	\N	1.00	1.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
172	31	173	3000 COMBO PACK	https://auraacrackers.com/images/upload/img_57464502224_08_2025.jpg	G	\N	1	3000.00	\N	7000.00	7000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
173	65	227	5K FAMILY COMBO PACK	https://auraacrackers.com/images/upload/img_148552598724_08_2025.jpg	G	\N	1	5000.00	\N	10000.00	10000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
174	28	175			G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
175	29	177	1000		G	\N	1	135.00	\N	270.00	270.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
176	29	178	2000		G	\N	1	270.00	\N	540.00	540.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
177	29	179	5000		G	\N	1	675.00	\N	1350.00	1350.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
178	29	180	10000		G	\N	1	1350.00	\N	2700.00	2700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
179	45	104	1K PRIME		G	\N	1	270.00	\N	540.00	540.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
180	45	105	2K PRIME		G	\N	1	340.00	\N	680.00	680.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
181	45	106	5K PRIME		G	\N	1	1350.00	\N	2700.00	2700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
182	45	107	10K PRIME		G	\N	1	2700.00	\N	5400.00	5400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
183	29	185	100		G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
184	68	508	CHAKKARA AHSOKA		G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
185	68	520	JET FOUNTAIN(10PCS)		G	\N	1	135.00	\N	270.00	270.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
186	68	516	FLOWER POT SMALL (STD)		G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
187	68	517	FLOWER POT SPECIAL (STD)		G	\N	1	210.00	\N	420.00	420.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
188	68	515	FLOWER POT GAINT		G	\N	1	430.00	\N	860.00	860.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
189	68	523	MINI FOUTAIN RED		G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
190	68	501	12 CM JIMMIMG CRACKLING		G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
191	68	505	30 CM GOLD SPARKLES		G	\N	1	75.00	\N	150.00	150.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
192	68	504	30 CM CRACKLING		G	\N	1	85.00	\N	170.00	170.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
193	30	195	30 CM EXPORT GOLD		G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
194	68	506	4 COLOR SPARKLER MIXED		G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
195	68	519	HYDRO BOMB GREEN		G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
196	68	511	FAT BOY		G	\N	1	60.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
197	68	507	BULLET BOMB STD		G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
198	68	526	THUNDER BOMB		G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
199	68	528	TWINKLE STAR		G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
200	68	525	SNOW VALLEY		G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
201	68	514	FLOWER POT DELUXE		G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
202	68	510	COLOR FLASH (HOLI)		G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
203	68	524	PANDAV		G	\N	1	190.00	\N	380.00	380.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
204	68	512	FLIPPER		G	\N	1	190.00	\N	380.00	380.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
205	68	513	FLOWER BOMB		G	\N	1	170.00	\N	340.00	340.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
206	30	208	3\\" PIPE COLOR CHANGE(1000GEM IN THE SKY)\\n		G	\N	1	255.00	\N	510.00	510.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
207	68	509	CHAKKARA BIG		G	\N	1	135.00	\N	270.00	270.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
208	68	527	TWIN SPIN		G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
209	68	518	GOLDEN WHISTLE SMALL		G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
210	68	522	MINI FOUTAIN GOLD		G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
211	68	521	MINI FOUNTAIN SILVER		G	\N	1	52.00	\N	104.00	104.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
212	34	33	FRANKE FLOWER POT 5PC		G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
213	35	44	MOON/DISCO WHEEL (5 Pieces)	https://auraacrackers.com/images/upload/img_19084704018_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
214	35	48	SPINNER DELUXE		G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
215	36	51	1.5 TWINKLING STAR	https://auraacrackers.com/images/upload/img_45048679718_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
216	36	53	JIL JIL		G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
217	38	63	DELUXE LAXMI (10 ROLE)		G	\N	1	22.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
218	38	64	HULK / SINGAM (6 ROLE)	https://auraacrackers.com/images/upload/img_167792454322_09_2025.jpg	G	\N	1	22.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
219	38	65	KUMKI (12 ROLE)	https://auraacrackers.com/images/upload/img_94926652924_09_2025.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
220	38	66	BAHUBALI (16 ROLE)	https://auraacrackers.com/images/upload/img_18562251022_09_2025.jpg	G	\N	1	40.00	\N	80.00	80.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
221	38	67	JALLIKATTU (20 ROLE)	https://auraacrackers.com/images/upload/img_161318227922_09_2025.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
222	39	71	2 SOUND		G	\N	1	38.00	\N	76.00	76.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
223	39	72	3 SOUND		G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
224	40	76	VARI BIJILI (50 PCS)	https://auraacrackers.com/images/upload/img_98020747819_09_2025.jpg	G	\N	1	20.00	\N	40.00	40.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
225	42	82	ATOM BOMB		G	\N	1	35.00	\N	70.00	70.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
226	42	87	DINOSAUR	https://auraacrackers.com/images/upload/img_94872912222_09_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
227	42	88	AGNI / DTS BOMB - 9ply		G	\N	1	190.00	\N	390.00	390.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
228	42	89	555 BOMB		G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
229	43	92	28 CHORSA		G	\N	1	22.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
230	44	98	100 Wala		G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
231	44	99	200 Wala		G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
232	44	100	1000 Wala		G	\N	1	135.00	\N	270.00	270.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
233	44	101	2000 Wala		G	\N	1	270.00	\N	540.00	540.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
234	44	102	5000 Wala		G	\N	1	675.00	\N	1350.00	1350.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
235	44	103	10000 Wala		G	\N	1	1350.00	\N	2700.00	2700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
236	46	108	FANCY ROCKET		G	\N	1	60.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
237	46	112	3 SOUND ROCKET		G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
238	47	118	SENSU (UV BOX)		G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
239	49	126	SNAKE CARTOON	https://auraacrackers.com/images/upload/img_182383899519_09_2025.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
240	50	130	25 SHOT COLOUR RIDER		G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
241	51	134	12 SHOT MULTI COLOUR	https://auraacrackers.com/images/upload/img_197570843917_09_2025.jpg	G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
242	51	139	500 SHOT MULTI COLOUR		G	\N	1	4800.00	\N	9600.00	9600.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
243	52	141	30 SHOT MULTI COLOUR(BRAND)		G	\N	1	450.00	\N	900.00	900.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
244	54	152	4\\" ARIAL FANCY (JAZZ 21\\")		G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
245	54	154	2 1/2\\" ARIAL FANCY 3 STEP		G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
246	54	156	4\\" NAYAGARA DOUBLE PIECE (Phoenix)		G	\N	1	900.00	\N	1600.00	1600.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
247	55	164	TIM TIM		G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
248	55	167	ASHRAFI		G	\N	1	320.00	\N	640.00	640.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
249	56	169	HELICOPTER		G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
250	56	170	DRONE		G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
251	56	172	BAMBARAM		G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
252	61	205	GOOGLY RED	https://auraacrackers.com/images/upload/img_64782316317_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
253	61	206	GOOGLY GREEN	https://auraacrackers.com/images/upload/img_119693142117_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
254	61	207	GOOGLY SILVER	https://auraacrackers.com/images/upload/img_11874451717_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
255	61	208	GOOGLY GOLD	https://auraacrackers.com/images/upload/img_119096176917_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
256	61	209	GOOGLY RED & GREEN	https://auraacrackers.com/images/upload/img_179701720518_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
257	62	210	TOM & JERRY RED	https://auraacrackers.com/images/upload/img_135462735817_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
258	62	211	TOM & JERRY GREEN	https://auraacrackers.com/images/upload/img_27346017717_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
259	62	212	TOM & JERRY WHITE	https://auraacrackers.com/images/upload/img_191000304918_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
260	62	213	TOM & JERRY GOLD	https://auraacrackers.com/images/upload/img_200353452917_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
261	62	214	TOM & JERRY RED & GREEN	https://auraacrackers.com/images/upload/img_133615217717_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
262	63	215	WONDER/ SCOOBY RED	https://auraacrackers.com/images/upload/img_212633408317_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
263	63	216	WONDER/ SCOOBY GREEN	https://auraacrackers.com/images/upload/img_132362768117_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
264	63	217	WONDER/ SCOOBY WHITE	https://auraacrackers.com/images/upload/img_113140336218_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
265	63	218	WONDER/ SCOOBY GOLD	https://auraacrackers.com/images/upload/img_149407039618_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
266	63	219	WONDER/ SCOOBY RED & GREEN	https://auraacrackers.com/images/upload/img_58641721518_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
267	65	226	3K FAMILY COMBO PACK	https://auraacrackers.com/images/upload/img_111317437618_09_2025.jpg	G	\N	1	3000.00	\N	6000.00	6000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
268	66	235	60 ITEMS-GIFT BOX		G	\N	1	1200.00	\N	2400.00	2400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
269	68	502	20 CM EXPORT GOLD		G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
270	68	503	3\\" PIPE COLOR CHANGE(1000GEM IN THE SKY)		G	\N	1	255.00	\N	510.00	510.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
271	54	153	3 1/2\\" ARIAL FANCY(NAYAGARA FALLS) 		G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
272	54	157	VADIVEL DOUBLE PIECE		G	\N	1	850.00	\N	1700.00	1700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
273	39	71	2 SOUND		G	\N	1	35.00	\N	70.00	70.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
274	39	72	3 SOUND		G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
275	47	115	PEACOCK FEATHER		G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
276	47	116	ROYAL PEACOCK/DANCING PEACOCK		G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
277	47	118	SENSU (UV BOX)		G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
278	37	55	FLUTE (HAND TORCH 3 PCS)		G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
279	48	120	MINI SIREN		G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
280	46	111	2 SOUND ROCKET		G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
281	46	112	3 SOUND ROCKET		G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
282	37	56	12\\" DELUXE PENCIL		G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
283	37	58	SMALL PENCIL [10 PCS]		G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
284	34	37	FLOWER POTS SUPER DLX (2 PCS)		G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
285	42	89	555 BOMB		G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
286	67	237	VIOLIN 		G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
287	67	238	KADAM 		G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
288	67	239	DRAGON 		G	\N	1	165.00	\N	330.00	330.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
289	67	240	16 SHOTS		G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
290	67	241	CYLINDER (SMOKE WITH BOMB)		G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
291	42	85	KING OF KING BOMB - JUG MUG 3000		G	\N	1	75.00	\N	150.00	150.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
292	42	88	DIGITAL BOMB 9PLY		G	\N	1	190.00	\N	380.00	380.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
293	67	242	BAD BOY		G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
294	54	157	VADIVEL DOUBLE PIECE		G	\N	1	850.00	\N	1700.00	1700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
295	54	158	3 1/2\\" ARIAL FANCY(POPCORN) Karthiga		G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
296	54	159	4\\" ARIAL FANCY DOUBLE BALL (WOW)		G	\N	1	520.00	\N	1040.00	1040.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
297	54	157	VADIVEL DOUBLE PIECE		G	\N	1	850.00	\N	1700.00	1700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
298	34	37	FLOWER POTS SUPER DLX (2 PCS)		G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
299	37	58	SMALL PENCIL (10 PCS) - KARTHIKA		G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
300	67	238	KADAM		G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
301	67	239	DRAGON		G	\N	1	165.00	\N	370.00	370.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
302	67	240	16 SHOT		G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
303	67	241	CYLINDER (SMOKE WITH BOMB)		G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
304	67	242	BAD BOX		G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
305	51	140	16 SHOT MULTI COLOUR (SPLASH)		G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
306	60	200	X - MAS		G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
307	54	153	4\\" WEDDING SPECIAL ARIAL FANCY (7 STEPS)		G	\N	1	450.00	\N	800.00	800.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
308	54	160	4\\" ARIAL NAYAGARA DOUBLE PIECE (DUKE)		G	\N	1	750.00	\N	1500.00	1500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
309	67	243	HAND SHOT (18 SHOT)		G	\N	1	280.00	\N	600.00	600.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
45	38	60	2 3/4\\" KURUVI CRACKERS	https://auraacrackers.com/images/upload/img_86979105818_09_2025.jpg	G	\N	1	7.00	\N	14.00	14.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 01:20:01.484098+00	\N
\.


--
-- Data for Name: tbl_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_role (id, name, descr, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
1	Super Admin	\N	1	1	t	\N	2026-03-20 18:16:29.30569+00	2026-03-20 18:16:29.30569+00	\N
2	Admin	\N	1	1	t	\N	2026-03-20 18:16:29.30569+00	2026-03-20 18:16:29.30569+00	\N
3	Online Customers	\N	1	1	t	\N	2026-03-20 18:16:29.30569+00	2026-03-20 18:16:29.30569+00	\N
4	Users	\N	1	1	t	\N	2026-03-20 18:16:29.30569+00	2026-03-20 18:16:29.30569+00	\N
\.


--
-- Data for Name: tbl_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_users (id, "userName", "fullName", "mobileNo", "emailId", password, "roleId", "companyId", "branchId", "lastLogin", "passwordResetToken", "onlineCustomerId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_cart; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_cart (id, "userId", "itemId", quantity, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_coupons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_coupons (id, "couponName", "couponCode", "couponPer", description, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy", "websiteId") FROM stdin;
1	AuraaChit	2026Chit	10.00	\N	1	1	f	\N	2026-03-21 10:49:34.010862+00	2026-03-22 01:17:26.747384+00	\N	2
\.


--
-- Data for Name: tbl_customer_addr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_customer_addr (id, "customerId", address1, address2, "countryId", "stateId", "cityId", pincode, phone, "emailId", "whatsappNo", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy", "companyId", "branchId", "isShippingDefault") FROM stdin;
\.


--
-- Data for Name: tbl_online_sales; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_online_sales (id, customerid, customeraddrid, "websiteId", transno, transdt, status, discountcode, discountper, discount, totalamt, roundamt, "grandAmt", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_onlinesales_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_onlinesales_items (id, "onlineSalesId", "itemId", "itemName", "itemCode", rate, mrp, qty, "freeQty", "discountPer", "discountAmt", unit, "taxPer", "taxName", "taxAmt", "itemTotal", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_pricelist; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_pricelist (id, "listName", "listDesc", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_pricelist_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_pricelist_items (id, "pricelistId", "itemId", unit, "purchaseRate", "purchaseRateInc", "sellingPrice", "customerSp", "shownValues", "shownValueDisc", "salesCost", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_serialno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_serialno (id, "tableName", "prefixNo", "nextNo", "suffixNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy", "sequenceNo") FROM stdin;
1	tbl_online_sales	SO	202600	\N	1	1	t	\N	2026-03-20 18:16:29.302391+00	2026-03-22 00:54:12.446177+00	\N	2
\.


--
-- Data for Name: tbl_users_addr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tbl_users_addr (id, userid, address, countryid, stateid, city, pincode, isactive, createdby, createddt, updateddt, updatedby) FROM stdin;
\.


--
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_user_permissions (id, user_id, permission_id) FROM stdin;
\.


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

\unrestrict wzCP3RbuFSTHCwhZGyciqzKlUag1N8rOVt9Ob731PKwTVjW9wM6UbcKqfgpbdsk

