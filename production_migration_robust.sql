-- Robust Sync Script
SET session_replication_role = 'replica';

DROP TABLE IF EXISTS public.tbl_country CASCADE;
DROP TABLE IF EXISTS public.tbl_state CASCADE;
DROP TABLE IF EXISTS public.tbl_city CASCADE;
DROP TABLE IF EXISTS public.tbl_websitelist CASCADE;
DROP TABLE IF EXISTS public.tbl_pricelist CASCADE;
DROP TABLE IF EXISTS public.tbl_pricelist_items CASCADE;
DROP TABLE IF EXISTS public.tbl_serialno CASCADE;

--
-- PostgreSQL database dump
--

\restrict cPWNdOKWTJ6TnxpCb4AAExUBIPPzO3g9ciY7xpASWtERXxXcJxCGnceevwYbA3l

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

\unrestrict cPWNdOKWTJ6TnxpCb4AAExUBIPPzO3g9ciY7xpASWtERXxXcJxCGnceevwYbA3l


TRUNCATE TABLE public.tbl_category CASCADE;
TRUNCATE TABLE public.tbl_items CASCADE;
TRUNCATE TABLE public.tbl_units CASCADE;
TRUNCATE TABLE public.tbl_cart CASCADE;
TRUNCATE TABLE public.tbl_customer CASCADE;
TRUNCATE TABLE public.tbl_customer_addr CASCADE;
TRUNCATE TABLE public.tbl_online_sales CASCADE;
TRUNCATE TABLE public.tbl_onlinesales_items CASCADE;
TRUNCATE TABLE public.tbl_coupons CASCADE;
TRUNCATE TABLE public.tbl_users CASCADE;
TRUNCATE TABLE public.tbl_role CASCADE;
TRUNCATE TABLE public.django_migrations CASCADE;
TRUNCATE TABLE public.django_content_type CASCADE;
TRUNCATE TABLE public.auth_group CASCADE;
TRUNCATE TABLE public.auth_permission CASCADE;


SET session_replication_role = 'origin';
