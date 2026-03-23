--
-- PostgreSQL database dump
--

\restrict 7crRILy7lrgU3dFzR0hYIfCOAzRM0Q82WODllsBYy1ItjdlI176mGINAJheDpPX

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

ALTER TABLE IF EXISTS ONLY public.users_user_permissions DROP CONSTRAINT IF EXISTS users_user_permissions_user_id_92473840_fk_users_id;
ALTER TABLE IF EXISTS ONLY public.users_user_permissions DROP CONSTRAINT IF EXISTS users_user_permissio_permission_id_6d08dcd2_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.users_groups DROP CONSTRAINT IF EXISTS users_groups_user_id_f500bee5_fk_users_id;
ALTER TABLE IF EXISTS ONLY public.users_groups DROP CONSTRAINT IF EXISTS users_groups_group_id_2f3517aa_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.tbl_websitelist DROP CONSTRAINT IF EXISTS tbl_websitelist_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_websitelist DROP CONSTRAINT IF EXISTS tbl_websitelist_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_users DROP CONSTRAINT IF EXISTS tbl_users_roleid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_users DROP CONSTRAINT IF EXISTS tbl_users_onlinecustomerid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_users DROP CONSTRAINT IF EXISTS tbl_users_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_users DROP CONSTRAINT IF EXISTS tbl_users_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_users_addr DROP CONSTRAINT IF EXISTS tbl_users_addr_userid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_users_addr DROP CONSTRAINT IF EXISTS tbl_users_addr_stateid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_users_addr DROP CONSTRAINT IF EXISTS tbl_users_addr_countryid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_units DROP CONSTRAINT IF EXISTS tbl_units_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_units DROP CONSTRAINT IF EXISTS tbl_units_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_state DROP CONSTRAINT IF EXISTS tbl_state_countryid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_serialno DROP CONSTRAINT IF EXISTS tbl_serialno_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_serialno DROP CONSTRAINT IF EXISTS tbl_serialno_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_role DROP CONSTRAINT IF EXISTS tbl_role_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_role DROP CONSTRAINT IF EXISTS tbl_role_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_pricelist_items DROP CONSTRAINT IF EXISTS tbl_pricelist_items_pricelistid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_pricelist_items DROP CONSTRAINT IF EXISTS tbl_pricelist_items_itemid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_pricelist_items DROP CONSTRAINT IF EXISTS tbl_pricelist_items_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_pricelist_items DROP CONSTRAINT IF EXISTS tbl_pricelist_items_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_pricelist DROP CONSTRAINT IF EXISTS tbl_pricelist_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_pricelist DROP CONSTRAINT IF EXISTS tbl_pricelist_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_onlinesales_items DROP CONSTRAINT IF EXISTS tbl_onlinesales_items_onlinesalesid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_onlinesales_items DROP CONSTRAINT IF EXISTS tbl_onlinesales_items_itemid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_onlinesales_items DROP CONSTRAINT IF EXISTS tbl_onlinesales_items_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_onlinesales_items DROP CONSTRAINT IF EXISTS tbl_onlinesales_items_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_online_sales DROP CONSTRAINT IF EXISTS tbl_online_sales_websiteid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_online_sales DROP CONSTRAINT IF EXISTS tbl_online_sales_customerid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_online_sales DROP CONSTRAINT IF EXISTS tbl_online_sales_customeraddrid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_online_sales DROP CONSTRAINT IF EXISTS tbl_online_sales_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_online_sales DROP CONSTRAINT IF EXISTS tbl_online_sales_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_items DROP CONSTRAINT IF EXISTS tbl_items_unitid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_items DROP CONSTRAINT IF EXISTS tbl_items_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_items DROP CONSTRAINT IF EXISTS tbl_items_categoryid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_items DROP CONSTRAINT IF EXISTS tbl_items_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_customer DROP CONSTRAINT IF EXISTS tbl_customer_websiteid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_customer DROP CONSTRAINT IF EXISTS tbl_customer_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_customer DROP CONSTRAINT IF EXISTS tbl_customer_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_customer_addr DROP CONSTRAINT IF EXISTS tbl_customer_addr_stateid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_customer_addr DROP CONSTRAINT IF EXISTS tbl_customer_addr_customerid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_customer_addr DROP CONSTRAINT IF EXISTS tbl_customer_addr_countryid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_customer_addr DROP CONSTRAINT IF EXISTS tbl_customer_addr_cityid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_coupons DROP CONSTRAINT IF EXISTS tbl_coupons_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_coupons DROP CONSTRAINT IF EXISTS tbl_coupons_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_company DROP CONSTRAINT IF EXISTS tbl_company_stateid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_company DROP CONSTRAINT IF EXISTS tbl_company_countryid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_company DROP CONSTRAINT IF EXISTS tbl_company_cityid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_city DROP CONSTRAINT IF EXISTS tbl_city_stateid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_category DROP CONSTRAINT IF EXISTS tbl_category_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_category DROP CONSTRAINT IF EXISTS tbl_category_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_cart DROP CONSTRAINT IF EXISTS tbl_cart_userid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_cart DROP CONSTRAINT IF EXISTS tbl_cart_itemid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_cart DROP CONSTRAINT IF EXISTS tbl_cart_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_cart DROP CONSTRAINT IF EXISTS tbl_cart_branchid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_branch DROP CONSTRAINT IF EXISTS tbl_branch_stateid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_branch DROP CONSTRAINT IF EXISTS tbl_branch_countryid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_branch DROP CONSTRAINT IF EXISTS tbl_branch_companyid_fkey;
ALTER TABLE IF EXISTS ONLY public.tbl_branch DROP CONSTRAINT IF EXISTS tbl_branch_cityid_fkey;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_category_id_a7a3a156_fk_categories_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_users_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX IF EXISTS public.users_username_e8658fc8_like;
DROP INDEX IF EXISTS public.users_usernam_baeb4b_idx;
DROP INDEX IF EXISTS public.users_user_permissions_user_id_92473840;
DROP INDEX IF EXISTS public.users_user_permissions_permission_id_6d08dcd2;
DROP INDEX IF EXISTS public.users_groups_user_id_f500bee5;
DROP INDEX IF EXISTS public.users_groups_group_id_2f3517aa;
DROP INDEX IF EXISTS public.users_email_4b85f2_idx;
DROP INDEX IF EXISTS public.products_price_2104b53c;
DROP INDEX IF EXISTS public.products_name_a9a494_idx;
DROP INDEX IF EXISTS public.products_name_4a89b61d_like;
DROP INDEX IF EXISTS public.products_name_4a89b61d;
DROP INDEX IF EXISTS public.products_is_active_4d0bbafa;
DROP INDEX IF EXISTS public.products_code_a66283f3_like;
DROP INDEX IF EXISTS public.products_code_a66283f3;
DROP INDEX IF EXISTS public.products_code_770e3a_idx;
DROP INDEX IF EXISTS public.products_category_id_a7a3a156;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.categories_order_3f1119ab;
DROP INDEX IF EXISTS public.categories_name_09afee77_like;
DROP INDEX IF EXISTS public.categories_is_active_59a0f5bd;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_username_key;
ALTER TABLE IF EXISTS ONLY public.users_user_permissions DROP CONSTRAINT IF EXISTS users_user_permissions_user_id_permission_id_3b86cbdf_uniq;
ALTER TABLE IF EXISTS ONLY public.users_user_permissions DROP CONSTRAINT IF EXISTS users_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.users_groups DROP CONSTRAINT IF EXISTS users_groups_user_id_group_id_fc7788e8_uniq;
ALTER TABLE IF EXISTS ONLY public.users_groups DROP CONSTRAINT IF EXISTS users_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_websitelist DROP CONSTRAINT IF EXISTS tbl_websitelist_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_users DROP CONSTRAINT IF EXISTS tbl_users_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_users_addr DROP CONSTRAINT IF EXISTS tbl_users_addr_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_units DROP CONSTRAINT IF EXISTS tbl_units_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_state DROP CONSTRAINT IF EXISTS tbl_state_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_serialno DROP CONSTRAINT IF EXISTS tbl_serialno_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_role DROP CONSTRAINT IF EXISTS tbl_role_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_pricelist DROP CONSTRAINT IF EXISTS tbl_pricelist_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_pricelist_items DROP CONSTRAINT IF EXISTS tbl_pricelist_items_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_onlinesales_items DROP CONSTRAINT IF EXISTS tbl_onlinesales_items_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_online_sales DROP CONSTRAINT IF EXISTS tbl_online_sales_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_items DROP CONSTRAINT IF EXISTS tbl_items_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_customer DROP CONSTRAINT IF EXISTS tbl_customer_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_customer_addr DROP CONSTRAINT IF EXISTS tbl_customer_addr_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_coupons DROP CONSTRAINT IF EXISTS tbl_coupons_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_country DROP CONSTRAINT IF EXISTS tbl_country_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_company DROP CONSTRAINT IF EXISTS tbl_company_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_city DROP CONSTRAINT IF EXISTS tbl_city_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_category DROP CONSTRAINT IF EXISTS tbl_category_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_cart DROP CONSTRAINT IF EXISTS tbl_cart_pkey;
ALTER TABLE IF EXISTS ONLY public.tbl_branch DROP CONSTRAINT IF EXISTS tbl_branch_pkey;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS categories_pkey;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS categories_name_key;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
ALTER TABLE IF EXISTS public.tbl_websitelist ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_users_addr ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_units ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_state ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_serialno ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_role ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_pricelist_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_pricelist ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_onlinesales_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_online_sales ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_customer_addr ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_customer ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_coupons ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_country ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_company ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_city ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_category ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_cart ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tbl_branch ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.users_user_permissions;
DROP TABLE IF EXISTS public.users_groups;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.tbl_websitelist_id_seq;
DROP TABLE IF EXISTS public.tbl_websitelist;
DROP SEQUENCE IF EXISTS public.tbl_users_id_seq;
DROP SEQUENCE IF EXISTS public.tbl_users_addr_id_seq;
DROP TABLE IF EXISTS public.tbl_users_addr;
DROP TABLE IF EXISTS public.tbl_users;
DROP SEQUENCE IF EXISTS public.tbl_units_id_seq;
DROP TABLE IF EXISTS public.tbl_units;
DROP SEQUENCE IF EXISTS public.tbl_state_id_seq;
DROP TABLE IF EXISTS public.tbl_state;
DROP SEQUENCE IF EXISTS public.tbl_serialno_id_seq;
DROP TABLE IF EXISTS public.tbl_serialno;
DROP SEQUENCE IF EXISTS public.tbl_role_id_seq;
DROP TABLE IF EXISTS public.tbl_role;
DROP SEQUENCE IF EXISTS public.tbl_pricelist_items_id_seq;
DROP TABLE IF EXISTS public.tbl_pricelist_items;
DROP SEQUENCE IF EXISTS public.tbl_pricelist_id_seq;
DROP TABLE IF EXISTS public.tbl_pricelist;
DROP SEQUENCE IF EXISTS public.tbl_onlinesales_items_id_seq;
DROP TABLE IF EXISTS public.tbl_onlinesales_items;
DROP SEQUENCE IF EXISTS public.tbl_online_sales_id_seq;
DROP TABLE IF EXISTS public.tbl_online_sales;
DROP SEQUENCE IF EXISTS public.tbl_items_id_seq;
DROP TABLE IF EXISTS public.tbl_items;
DROP SEQUENCE IF EXISTS public.tbl_customer_id_seq;
DROP SEQUENCE IF EXISTS public.tbl_customer_addr_id_seq;
DROP TABLE IF EXISTS public.tbl_customer_addr;
DROP TABLE IF EXISTS public.tbl_customer;
DROP SEQUENCE IF EXISTS public.tbl_coupons_id_seq;
DROP TABLE IF EXISTS public.tbl_coupons;
DROP SEQUENCE IF EXISTS public.tbl_country_id_seq;
DROP TABLE IF EXISTS public.tbl_country;
DROP SEQUENCE IF EXISTS public.tbl_company_id_seq;
DROP TABLE IF EXISTS public.tbl_company;
DROP SEQUENCE IF EXISTS public.tbl_city_id_seq;
DROP TABLE IF EXISTS public.tbl_city;
DROP SEQUENCE IF EXISTS public.tbl_category_id_seq;
DROP TABLE IF EXISTS public.tbl_category;
DROP SEQUENCE IF EXISTS public.tbl_cart_id_seq;
DROP TABLE IF EXISTS public.tbl_cart;
DROP SEQUENCE IF EXISTS public.tbl_branch_id_seq;
DROP TABLE IF EXISTS public.tbl_branch;
DROP TABLE IF EXISTS public.products;
DROP TABLE IF EXISTS public.django_session;
DROP TABLE IF EXISTS public.django_migrations;
DROP TABLE IF EXISTS public.django_content_type;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.categories;
DROP TABLE IF EXISTS public.auth_permission;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP TABLE IF EXISTS public.auth_group;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: auraauser
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO auraauser;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: auraauser
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO auraauser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO auraauser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO auraauser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(1000),
    description text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_active boolean NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.categories OWNER TO auraauser;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO auraauser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO auraauser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO auraauser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO auraauser;

--
-- Name: products; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(100),
    price numeric(12,2) NOT NULL,
    original_price numeric(12,2),
    image character varying(1000),
    description text,
    content text,
    qty character varying(100),
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.products OWNER TO auraauser;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tbl_branch; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_branch (
    id integer NOT NULL,
    logo text,
    name character varying(255),
    "shortName" character varying(50),
    address1 text,
    address2 text,
    "countryId" integer,
    "stateId" integer,
    "cityId" integer,
    "emailId" character varying(255),
    "mobileNo" character varying(20),
    "whatsappNo" character varying(20),
    currency character varying(10),
    "fyStart" date,
    "appDateFormat" character varying(50),
    "appColorCode" character varying(20),
    "companyId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_branch OWNER TO auraauser;

--
-- Name: tbl_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_branch_id_seq OWNER TO auraauser;

--
-- Name: tbl_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_branch_id_seq OWNED BY public.tbl_branch.id;


--
-- Name: tbl_cart; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_cart (
    id integer NOT NULL,
    "userId" integer,
    "itemId" integer,
    quantity integer DEFAULT 1,
    "companyId" integer,
    "branchId" integer,
    "isActive" integer DEFAULT 1,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_cart OWNER TO auraauser;

--
-- Name: tbl_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_cart_id_seq OWNER TO auraauser;

--
-- Name: tbl_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_cart_id_seq OWNED BY public.tbl_cart.id;


--
-- Name: tbl_category; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_category (
    id integer NOT NULL,
    "categoryName" character varying(150),
    "categoryImage" text,
    "sortNo" integer DEFAULT 0,
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_category OWNER TO auraauser;

--
-- Name: tbl_category_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_category_id_seq OWNER TO auraauser;

--
-- Name: tbl_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_category_id_seq OWNED BY public.tbl_category.id;


--
-- Name: tbl_city; Type: TABLE; Schema: public; Owner: auraauser
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


ALTER TABLE public.tbl_city OWNER TO auraauser;

--
-- Name: tbl_city_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_city_id_seq OWNER TO auraauser;

--
-- Name: tbl_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_city_id_seq OWNED BY public.tbl_city.id;


--
-- Name: tbl_company; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_company (
    id integer NOT NULL,
    logo text,
    name character varying(255),
    "shortName" character varying(50),
    address1 text,
    address2 text,
    "countryId" integer,
    "stateId" integer,
    "cityId" integer,
    "emailId" character varying(255),
    "mobileNo" character varying(20),
    "whatsappNo" character varying(20),
    currency character varying(10),
    "fyStart" date,
    "appDateFormat" character varying(50),
    "appColorCode" character varying(20),
    "branchLimit" integer,
    "userLimit" integer,
    isseparatedb boolean,
    dbname character varying(100),
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_company OWNER TO auraauser;

--
-- Name: tbl_company_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_company_id_seq OWNER TO auraauser;

--
-- Name: tbl_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_company_id_seq OWNED BY public.tbl_company.id;


--
-- Name: tbl_country; Type: TABLE; Schema: public; Owner: auraauser
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


ALTER TABLE public.tbl_country OWNER TO auraauser;

--
-- Name: tbl_country_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_country_id_seq OWNER TO auraauser;

--
-- Name: tbl_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_country_id_seq OWNED BY public.tbl_country.id;


--
-- Name: tbl_coupons; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_coupons (
    id integer NOT NULL,
    "couponName" character varying(150),
    "couponCode" character varying(50),
    "couponPer" numeric(5,2) DEFAULT 0.00,
    description text,
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer,
    "websiteId" integer DEFAULT 2
);


ALTER TABLE public.tbl_coupons OWNER TO auraauser;

--
-- Name: tbl_coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_coupons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_coupons_id_seq OWNER TO auraauser;

--
-- Name: tbl_coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_coupons_id_seq OWNED BY public.tbl_coupons.id;


--
-- Name: tbl_customer; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_customer (
    id integer NOT NULL,
    name character varying(255),
    company character varying(100),
    "contactPerson" character varying(150),
    "contactPersonNo" character varying(20),
    "accountId" integer,
    balance numeric(15,2) DEFAULT 0.00,
    "taxId" character varying(50),
    "isOnline" boolean DEFAULT true,
    "websiteId" integer,
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_customer OWNER TO auraauser;

--
-- Name: tbl_customer_addr; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_customer_addr (
    id integer NOT NULL,
    "customerId" integer,
    address1 text,
    address2 text,
    "countryId" integer,
    "stateId" integer,
    "cityId" integer,
    pincode character varying(20),
    phone character varying(20),
    "emailId" character varying(255),
    "whatsappNo" character varying(20),
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer,
    "companyId" integer DEFAULT 1,
    "branchId" integer DEFAULT 1,
    "isShippingDefault" boolean DEFAULT false
);


ALTER TABLE public.tbl_customer_addr OWNER TO auraauser;

--
-- Name: tbl_customer_addr_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_customer_addr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_customer_addr_id_seq OWNER TO auraauser;

--
-- Name: tbl_customer_addr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_customer_addr_id_seq OWNED BY public.tbl_customer_addr.id;


--
-- Name: tbl_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_customer_id_seq OWNER TO auraauser;

--
-- Name: tbl_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_customer_id_seq OWNED BY public.tbl_customer.id;


--
-- Name: tbl_items; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_items (
    id integer NOT NULL,
    "categoryId" integer,
    "itemCode" character varying(50),
    "itemName" character varying(255),
    "itemImage" text,
    "itemType" character varying(1) DEFAULT 'G'::character varying,
    "unitId" integer,
    "isSales" integer DEFAULT 1,
    "saleRate" numeric(15,2) DEFAULT 0.00,
    "saleDesc" text,
    "purchaseRate" numeric(15,2) DEFAULT 0.00,
    mrp numeric(15,2) DEFAULT 0.00,
    "taxId" integer,
    "accountId" integer,
    "minOrdQty" numeric(15,3) DEFAULT 0.00,
    "discountPer" numeric(5,2) DEFAULT 0.00,
    discount numeric(15,2) DEFAULT 0.00,
    "freeQty" numeric(15,3) DEFAULT 0.00,
    "locationId" integer,
    "openingQty" numeric(15,3) DEFAULT 0.00,
    "sortNo" integer DEFAULT 0,
    "isDisabled" integer DEFAULT 0,
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_items OWNER TO auraauser;

--
-- Name: tbl_items_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_items_id_seq OWNER TO auraauser;

--
-- Name: tbl_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_items_id_seq OWNED BY public.tbl_items.id;


--
-- Name: tbl_online_sales; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_online_sales (
    id integer NOT NULL,
    customerid integer,
    customeraddrid integer,
    "websiteId" integer,
    transno character varying(50),
    transdt timestamp with time zone,
    status character varying(20) DEFAULT 'New'::character varying,
    discountcode character varying(50),
    discountper numeric(5,2) DEFAULT 0.00,
    discount numeric(15,2) DEFAULT 0.00,
    totalamt numeric(15,2) DEFAULT 0.00,
    roundamt numeric(5,2) DEFAULT 0.00,
    "grandAmt" numeric(15,2) DEFAULT 0.00,
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_online_sales OWNER TO auraauser;

--
-- Name: tbl_online_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_online_sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_online_sales_id_seq OWNER TO auraauser;

--
-- Name: tbl_online_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_online_sales_id_seq OWNED BY public.tbl_online_sales.id;


--
-- Name: tbl_onlinesales_items; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_onlinesales_items (
    id integer NOT NULL,
    "onlineSalesId" integer,
    "itemId" integer,
    "itemName" character varying(255),
    "itemCode" character varying(50),
    rate numeric(15,2) DEFAULT 0.00,
    mrp numeric(15,2) DEFAULT 0.00,
    qty numeric(15,3),
    "freeQty" numeric(15,3) DEFAULT 0.00,
    "discountPer" numeric(5,2) DEFAULT 0.00,
    "discountAmt" numeric(15,2) DEFAULT 0.00,
    unit character varying(50),
    "taxPer" numeric(5,2) DEFAULT 0.00,
    "taxName" character varying(100),
    "taxAmt" numeric(15,2) DEFAULT 0.00,
    "itemTotal" numeric(15,2),
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_onlinesales_items OWNER TO auraauser;

--
-- Name: tbl_onlinesales_items_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_onlinesales_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_onlinesales_items_id_seq OWNER TO auraauser;

--
-- Name: tbl_onlinesales_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_onlinesales_items_id_seq OWNED BY public.tbl_onlinesales_items.id;


--
-- Name: tbl_pricelist; Type: TABLE; Schema: public; Owner: auraauser
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


ALTER TABLE public.tbl_pricelist OWNER TO auraauser;

--
-- Name: tbl_pricelist_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_pricelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_pricelist_id_seq OWNER TO auraauser;

--
-- Name: tbl_pricelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_pricelist_id_seq OWNED BY public.tbl_pricelist.id;


--
-- Name: tbl_pricelist_items; Type: TABLE; Schema: public; Owner: auraauser
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


ALTER TABLE public.tbl_pricelist_items OWNER TO auraauser;

--
-- Name: tbl_pricelist_items_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_pricelist_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_pricelist_items_id_seq OWNER TO auraauser;

--
-- Name: tbl_pricelist_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_pricelist_items_id_seq OWNED BY public.tbl_pricelist_items.id;


--
-- Name: tbl_role; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_role (
    id integer NOT NULL,
    name character varying(100),
    descr text,
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_role OWNER TO auraauser;

--
-- Name: tbl_role_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_role_id_seq OWNER TO auraauser;

--
-- Name: tbl_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_role_id_seq OWNED BY public.tbl_role.id;


--
-- Name: tbl_serialno; Type: TABLE; Schema: public; Owner: auraauser
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


ALTER TABLE public.tbl_serialno OWNER TO auraauser;

--
-- Name: tbl_serialno_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_serialno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_serialno_id_seq OWNER TO auraauser;

--
-- Name: tbl_serialno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_serialno_id_seq OWNED BY public.tbl_serialno.id;


--
-- Name: tbl_state; Type: TABLE; Schema: public; Owner: auraauser
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


ALTER TABLE public.tbl_state OWNER TO auraauser;

--
-- Name: tbl_state_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_state_id_seq OWNER TO auraauser;

--
-- Name: tbl_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_state_id_seq OWNED BY public.tbl_state.id;


--
-- Name: tbl_units; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_units (
    id integer NOT NULL,
    name character varying(100),
    code character varying(20),
    descr text,
    "convFactor" numeric(15,6) DEFAULT 1.00,
    "companyId" integer,
    "branchId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_units OWNER TO auraauser;

--
-- Name: tbl_units_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_units_id_seq OWNER TO auraauser;

--
-- Name: tbl_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_units_id_seq OWNED BY public.tbl_units.id;


--
-- Name: tbl_users; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_users (
    id integer NOT NULL,
    "userName" character varying(150),
    "fullName" character varying(255),
    "mobileNo" character varying(20),
    "emailId" character varying(255),
    password character varying(255),
    "roleId" integer,
    "companyId" integer,
    "branchId" integer,
    "lastLogin" timestamp with time zone,
    "passwordResetToken" character varying(255),
    "onlineCustomerId" integer,
    "isActive" boolean DEFAULT true,
    "createdBy" integer,
    "createdDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedDt" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" integer
);


ALTER TABLE public.tbl_users OWNER TO auraauser;

--
-- Name: tbl_users_addr; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.tbl_users_addr (
    id integer NOT NULL,
    userid integer,
    address text,
    countryid integer,
    stateid integer,
    city character varying(100),
    pincode character varying(20),
    isactive boolean DEFAULT true,
    createdby integer,
    createddt timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updateddt timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updatedby integer
);


ALTER TABLE public.tbl_users_addr OWNER TO auraauser;

--
-- Name: tbl_users_addr_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_users_addr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_users_addr_id_seq OWNER TO auraauser;

--
-- Name: tbl_users_addr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_users_addr_id_seq OWNED BY public.tbl_users_addr.id;


--
-- Name: tbl_users_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_users_id_seq OWNER TO auraauser;

--
-- Name: tbl_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_users_id_seq OWNED BY public.tbl_users.id;


--
-- Name: tbl_websitelist; Type: TABLE; Schema: public; Owner: auraauser
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


ALTER TABLE public.tbl_websitelist OWNER TO auraauser;

--
-- Name: tbl_websitelist_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

CREATE SEQUENCE public.tbl_websitelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_websitelist_id_seq OWNER TO auraauser;

--
-- Name: tbl_websitelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: auraauser
--

ALTER SEQUENCE public.tbl_websitelist_id_seq OWNED BY public.tbl_websitelist.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    phone character varying(15),
    address text
);


ALTER TABLE public.users OWNER TO auraauser;

--
-- Name: users_groups; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.users_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_groups OWNER TO auraauser;

--
-- Name: users_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.users_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_user_permissions; Type: TABLE; Schema: public; Owner: auraauser
--

CREATE TABLE public.users_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_permissions OWNER TO auraauser;

--
-- Name: users_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: auraauser
--

ALTER TABLE public.users_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tbl_branch id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_branch ALTER COLUMN id SET DEFAULT nextval('public.tbl_branch_id_seq'::regclass);


--
-- Name: tbl_cart id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_cart ALTER COLUMN id SET DEFAULT nextval('public.tbl_cart_id_seq'::regclass);


--
-- Name: tbl_category id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_category ALTER COLUMN id SET DEFAULT nextval('public.tbl_category_id_seq'::regclass);


--
-- Name: tbl_city id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_city ALTER COLUMN id SET DEFAULT nextval('public.tbl_city_id_seq'::regclass);


--
-- Name: tbl_company id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_company ALTER COLUMN id SET DEFAULT nextval('public.tbl_company_id_seq'::regclass);


--
-- Name: tbl_country id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_country ALTER COLUMN id SET DEFAULT nextval('public.tbl_country_id_seq'::regclass);


--
-- Name: tbl_coupons id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_coupons ALTER COLUMN id SET DEFAULT nextval('public.tbl_coupons_id_seq'::regclass);


--
-- Name: tbl_customer id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer ALTER COLUMN id SET DEFAULT nextval('public.tbl_customer_id_seq'::regclass);


--
-- Name: tbl_customer_addr id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer_addr ALTER COLUMN id SET DEFAULT nextval('public.tbl_customer_addr_id_seq'::regclass);


--
-- Name: tbl_items id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_items ALTER COLUMN id SET DEFAULT nextval('public.tbl_items_id_seq'::regclass);


--
-- Name: tbl_online_sales id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_online_sales ALTER COLUMN id SET DEFAULT nextval('public.tbl_online_sales_id_seq'::regclass);


--
-- Name: tbl_onlinesales_items id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_onlinesales_items ALTER COLUMN id SET DEFAULT nextval('public.tbl_onlinesales_items_id_seq'::regclass);


--
-- Name: tbl_pricelist id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist ALTER COLUMN id SET DEFAULT nextval('public.tbl_pricelist_id_seq'::regclass);


--
-- Name: tbl_pricelist_items id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist_items ALTER COLUMN id SET DEFAULT nextval('public.tbl_pricelist_items_id_seq'::regclass);


--
-- Name: tbl_role id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_role ALTER COLUMN id SET DEFAULT nextval('public.tbl_role_id_seq'::regclass);


--
-- Name: tbl_serialno id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_serialno ALTER COLUMN id SET DEFAULT nextval('public.tbl_serialno_id_seq'::regclass);


--
-- Name: tbl_state id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_state ALTER COLUMN id SET DEFAULT nextval('public.tbl_state_id_seq'::regclass);


--
-- Name: tbl_units id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_units ALTER COLUMN id SET DEFAULT nextval('public.tbl_units_id_seq'::regclass);


--
-- Name: tbl_users id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users ALTER COLUMN id SET DEFAULT nextval('public.tbl_users_id_seq'::regclass);


--
-- Name: tbl_users_addr id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users_addr ALTER COLUMN id SET DEFAULT nextval('public.tbl_users_addr_id_seq'::regclass);


--
-- Name: tbl_websitelist id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_websitelist ALTER COLUMN id SET DEFAULT nextval('public.tbl_websitelist_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: auraauser
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
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.categories (id, name, image, description, created_at, updated_at, is_active, "order") FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: auraauser
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
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: auraauser
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
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: auraauser
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
fkgzfslchkbjc2uuwbi9m94iv69wukcg	eyJ3ZWJzaXRlX2lkIjoyfQ:1w4NYj:kAN2Lj_LJ234PH38L0F7OTQ8dwGKKfaB4DaJ7Rz3nw8	2026-03-22 18:59:57.648474+00
ub0rajohk4i2jnt240gz739t6fzvvayf	.eJxVyzEOwjAMheG7ZEZR7caJwsjOGSIncZQKBBWmE-LutFKHsn7v_R-TeHn3tKi80lTN2aA5HS1zucljG3ie1W6mdke112ee7nLZP39hZ-1rJULiPQNUQhdLLRkCATHTMEbHMA6tAUZhJCfVl5Cra0jUYiP0PpjvD_3nNNo:1w3pTx:SYepEuukqC9K34onkZWAHHPqlTL70TCfWm0NCx5BBzA	2026-03-21 06:36:45.318845+00
yvyz19a5a538o5j3xvmyti21zh0h0xw5	.eJxVzk0KwyAQBeC7uC6ixjGYZbvuGWTUEaU_hpjQRendm5RQyPZ78x7zZi_yrczkSmSDOjGHy5zd0mj6CVPsYB7DjZ5bgOPY-GaN79j4tfpyp_N-cyhmbHltEQEZg1JGUNqGGLzsQQIiiM5qlJ1ISSpLqEBTNKH3UScFkGwCZUy_jo5TfVQXaqTtPaHMJZf57yNNbJCCi88XpZhGeA:1w3wvI:qLhGs1HYhMMrc_qd0pkgGC62Lzt5zmevU23r9hCHiB4	2026-03-21 14:33:28.898682+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.products (id, name, code, price, original_price, image, description, content, qty, is_active, created_at, updated_at, category_id) FROM stdin;
\.


--
-- Data for Name: tbl_branch; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_branch (id, logo, name, "shortName", address1, address2, "countryId", "stateId", "cityId", "emailId", "mobileNo", "whatsappNo", currency, "fyStart", "appDateFormat", "appColorCode", "companyId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
1	\N	Auraa Crackers	Auraa	\N	\N	\N	\N	\N	\N	7358377381	\N	\N	\N	\N	\N	\N	t	1	2026-03-20 18:14:29.277424+00	2026-03-20 18:14:29.277424+00	\N
\.


--
-- Data for Name: tbl_cart; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_cart (id, "userId", "itemId", quantity, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_category; Type: TABLE DATA; Schema: public; Owner: auraauser
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
19	2 ¼ COLOUR FOUNTAIN		0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-20 18:21:51.631513+00	\N
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
-- Data for Name: tbl_city; Type: TABLE DATA; Schema: public; Owner: auraauser
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
-- Data for Name: tbl_company; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_company (id, logo, name, "shortName", address1, address2, "countryId", "stateId", "cityId", "emailId", "mobileNo", "whatsappNo", currency, "fyStart", "appDateFormat", "appColorCode", "branchLimit", "userLimit", isseparatedb, dbname, "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
1	\N	Auraa Zen AI	Auraa	\N	\N	\N	\N	\N	\N	7358377381	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	1	2026-03-20 18:13:02.125927+00	2026-03-20 18:13:02.125927+00	\N
\.


--
-- Data for Name: tbl_country; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_country (id, name, code, "isActive", "createdBy", "createdDt", "updatedDt") FROM stdin;
1	India	IN	t	1	2026-03-21 04:08:42.258506+00	2026-03-21 04:08:42.259091+00
\.


--
-- Data for Name: tbl_coupons; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_coupons (id, "couponName", "couponCode", "couponPer", description, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy", "websiteId") FROM stdin;
1	AuraaChit	2026Chit	10.00	\N	1	1	f	\N	2026-03-21 10:49:34.010862+00	2026-03-22 01:17:26.747384+00	\N	2
\.


--
-- Data for Name: tbl_customer; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_customer (id, name, company, "contactPerson", "contactPersonNo", "accountId", balance, "taxId", "isOnline", "websiteId", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_customer_addr; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_customer_addr (id, "customerId", address1, address2, "countryId", "stateId", "cityId", pincode, phone, "emailId", "whatsappNo", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy", "companyId", "branchId", "isShippingDefault") FROM stdin;
\.


--
-- Data for Name: tbl_items; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_items (id, "categoryId", "itemCode", "itemName", "itemImage", "itemType", "unitId", "isSales", "saleRate", "saleDesc", "purchaseRate", mrp, "taxId", "accountId", "minOrdQty", "discountPer", discount, "freeQty", "locationId", "openingQty", "sortNo", "isDisabled", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
2	32	2	7 CM COLOR SPARKLER	/static/images/products/img_69593685801_09_2025.jpg	G	\N	1	6.00	\N	12.00	12.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.568898+00	\N
3	32	3	7 CM GREEN SPARKLER	/static/images/products/img_110764772701_09_2025.jpg	G	\N	1	7.00	\N	14.00	14.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.571697+00	\N
4	32	4	7 CM RED SPARKLER	/static/images/products/img_209873051720_08_2025.jpg	G	\N	1	8.00	\N	16.00	16.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.575654+00	\N
5	32	5	10 CM ELECTRIC SPARKLER	/static/images/products/img_204413476720_08_2025.jpg	G	\N	1	10.00	\N	20.00	20.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.57859+00	\N
6	32	6	10 CM COLOUR SPARKLER	/static/images/products/img_191171162720_08_2025.jpg	G	\N	1	12.00	\N	24.00	24.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.580228+00	\N
7	32	7	10 CM GREEN SPARKLER	/static/images/products/img_2707655420_08_2025.jpg	G	\N	1	13.00	\N	26.00	26.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.583443+00	\N
8	32	8	10 CM RED SPARKLER	/static/images/products/img_75210337418_09_2025.jpg	G	\N	1	15.00	\N	30.00	30.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.585759+00	\N
9	32	9	12 CM ELECTRIC SPARKLER	/static/images/products/img_21542314118_09_2025.jpg	G	\N	1	14.00	\N	28.00	28.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.588088+00	\N
10	32	10	12 CM COLOR SPARKLER	/static/images/products/img_32178997320_08_2025.jpg	G	\N	1	15.00	\N	30.00	30.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.590304+00	\N
11	32	11	12 CM GREEN SPARKLER	/static/images/products/img_28606882018_09_2025.jpg	G	\N	1	16.00	\N	32.00	32.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.593024+00	\N
12	32	12	12 CM RED SPARKLER	/static/images/products/img_54948171901_09_2025.jpg	G	\N	1	17.00	\N	34.00	34.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.595306+00	\N
13	32	13	15 CM ELECTRIC SPARKLER	/static/images/products/img_89947300418_09_2025.jpg	G	\N	1	24.00	\N	48.00	48.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.599328+00	\N
14	32	14	15 CM COLOR SPARKLER	/static/images/products/img_4426861918_09_2025.jpg	G	\N	1	26.00	\N	52.00	52.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.601539+00	\N
15	32	15	15 CM GREEN SPARKLER	/static/images/products/img_96052581418_09_2025.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.604+00	\N
16	32	16	15 CM RED SPARKLER	/static/images/products/img_91424910518_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.606238+00	\N
17	32	18	30 CM COLOUR SPARKLER	/static/images/products/img_160261898218_09_2025.jpg	G	\N	1	26.00	\N	52.00	52.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.610008+00	\N
18	32	17	30 CM ELECTRIC SPARKLER	/static/images/products/img_14512714718_09_2025.jpg	G	\N	1	24.00	\N	48.00	48.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.611521+00	\N
19	32	19	30 CM GREEN SPARKLER	/static/images/products/img_11971183018_09_2025.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.614903+00	\N
20	32	20	30 CM RED SPARKLER	/static/images/products/img_48284719318_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.617845+00	\N
21	32	21	50 CM ELECTRIC SPARKLER	/static/images/products/img_31194980220_08_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.620079+00	\N
22	32	22	50 CM COLOUR SPARKLER	/static/images/products/img_34837202020_08_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.622465+00	\N
23	33	26	FLOWER POT SMALL	/static/images/products/img_168471976920_08_2025.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.626488+00	\N
24	33	27	FLOWER POT BIG (UV BOX)	/static/images/products/img_143037112721_08_2025.jpg	G	\N	1	60.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.629446+00	\N
25	33	28	FLOWER POT SPECIAL	/static/images/products/img_98846912021_08_2025.jpg	G	\N	1	70.00	\N	140.00	140.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.63189+00	\N
26	33	29	FLOWER POT ASHOKA (UV BOX)	/static/images/products/img_188789715921_08_2025.jpg	G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.634435+00	\N
27	33	30	COLOR KOTI (UV BOX)	/static/images/products/img_67626778720_08_2025.jpg	G	\N	1	160.00	\N	280.00	280.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.636679+00	\N
28	34	34	GYPSY (SUYRAKALAA)	/static/images/products/img_198351252917_09_2025.jpg	G	\N	1	140.00	\N	280.00	280.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.639652+00	\N
29	34	35	TRI COLOUR FOUNTAINS	/static/images/products/img_134854636220_08_2025.jpg	G	\N	1	225.00	\N	450.00	450.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.642519+00	\N
30	34	36	JOLLY TRAIN	/static/images/products/img_11528369720_08_2025.jpg	G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.645941+00	\N
31	34	31	FLOWER POT DELUXE (5 Pieces)	/static/images/products/img_55188359201_09_2025.jpg	G	\N	1	140.00	\N	280.00	280.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.648686+00	\N
32	34	32	FLOWER POT DELUXE (10 Pieces)	/static/images/products/img_139145351901_09_2025.jpg	G	\N	1	270.00	\N	540.00	540.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.651452+00	\N
33	35	41	GROUND CHAKKARS BIG	/static/images/products/img_10296023001_09_2025.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.654414+00	\N
34	35	42	GROUND CHAKKARS SPECIAL	/static/images/products/img_131297680901_09_2025.jpg	G	\N	1	70.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.658148+00	\N
35	35	43	GROUND CHAKKARS DELUXE	/static/images/products/img_136709995601_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.662498+00	\N
36	3	36	DISCO WHEEL (5 Pieces)	/static/images/products/img_194369494901_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.666104+00	\N
37	35	45	WIRE CHAKKARAS	/static/images/products/img_206856065401_09_2025.jpg	G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.668804+00	\N
57	41	79	RED BIJILI (100 PCS) BRAND	/static/images/products/img_23472063101_09_2025.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	1	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.787081+00	\N
38	4	38	1 1/2 TWINKLING STAR	/static/images/products/img_121119220120_08_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.670933+00	\N
39	36	52	4 TWINKLING STAR DELUXE	/static/images/products/img_40721885001_09_2025.jpg	G	\N	1	65.00	\N	130.00	130.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.674124+00	\N
40	37	55	FLUTE (HAND TORCH 3 PCS)	/static/images/products/noimage.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.676531+00	\N
41	57	176	SELFI STICK (3 PCS)	/static/images/products/img_191365291001_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.678762+00	\N
42	37	54	 12\\" PENCIL - SILVER TORCHES	/static/images/products/img_143469502821_09_2025.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.68128+00	\N
43	37	57	COLOUR CRUSH PENCIL	/static/images/products/img_55415737818_09_2025.jpg	G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.683404+00	\N
44	37	56	12\\" DELUXE PENCIL - KARTHIKA	/static/images/products/noimage.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.686391+00	\N
46	38	61	3 1/2 MEDIUM LAXMI (3 ROLE)	/static/images/products/img_189502417224_09_2025.jpg	G	\N	1	12.00	\N	24.00	24.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.692294+00	\N
47	38	62	4\\" LAXMI CRACKERS (6 ROLE)	/static/images/products/img_72414993124_09_2025.jpg	G	\N	1	14.00	\N	28.00	28.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.698033+00	\N
48	6	48	HULK/DELUXE LAXMI	/static/images/products/noimage.jpg	G	\N	1	22.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.702746+00	\N
49	6	49	JALLIKATTU / BAHUBALI	/static/images/products/img_96944462724_08_2025.jpg	G	\N	1	40.00	\N	80.00	80.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.704267+00	\N
50	38	69	LION KING (25 ROLE)	/static/images/products/img_138511851024_08_2025.jpg	G	\N	1	60.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.708272+00	\N
51	38	70	GOLD LAKSHMI	/static/images/products/img_82777363424_09_2025.jpg	G	\N	1	38.00	\N	76.00	76.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.710432+00	\N
52	40	74	RED BIJILI (50 PCS)	/static/images/products/img_127372385719_09_2025.jpg	G	\N	1	15.00	\N	30.00	30.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.712071+00	\N
54	41	80	VARI BIJILI(50 PCS) BRAND	/static/images/products/noimage.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.714612+00	\N
55	40	77	VARI BIJILI(100 PCS)	/static/images/products/noimage.jpg	G	\N	1	35.00	\N	70.00	70.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.716796+00	\N
56	41	78	RED BIJILI (50 PCS) BRAND	/static/images/products/noimage.jpg	G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.719565+00	\N
58	41	81	VARI BIJILI(100 PCS) BRAND	/static/images/products/img_63532642019_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.722163+00	\N
59	46	109	ROCKET BOMB	/static/images/products/noimage.jpg	G	\N	1	70.00	\N	140.00	140.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.725186+00	\N
60	46	110	LUNIK ROCKET	/static/images/products/noimage.jpg	G	\N	1	110.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.728216+00	\N
62	46	113	COLOUR ROCKET (Suryakala)	/static/images/products/noimage.jpg	G	\N	1	90.00	\N	160.00	160.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.733053+00	\N
63	46	114	WHISTLING/MUSICAL ROCKET	/static/images/products/img_159311758001_09_2025.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.734649+00	\N
64	42	83	BULLET BOMB	/static/images/products/img_107567927121_09_2025.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.737339+00	\N
65	42	84	HYDRO BOMB	/static/images/products/img_147512279720_08_2025.jpg	G	\N	1	65.00	\N	130.00	130.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.739011+00	\N
66	42	85	KING OF KING BOMB - JUG MUG 3000	/static/images/products/noimage.jpg	G	\N	1	75.00	\N	150.00	150.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.741224+00	\N
67	42	86	CLASSIC BOMB / JUG MUG 5000	/static/images/products/img_36023176320_08_2025.jpg	G	\N	1	85.00	\N	170.00	170.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.743484+00	\N
68	42	68	MEGA RIDER / DINOSAUR	/static/images/products/img_103380931922_09_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.74579+00	\N
69	9	69	AGNI / DIGITAL BOMB / DINOSAUR 	/static/images/products/img_202872061620_08_2025.jpg	G	\N	1	155.00	\N	310.00	310.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.750034+00	\N
70	43	93	28 GAINT CRACKERS	/static/images/products/noimage.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.753708+00	\N
71	43	94	56 GAINT CRACKERS	/static/images/products/noimage.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.758105+00	\N
72	43	95	24 DELUXE CRACKERS	/static/images/products/img_191501219624_09_2025.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.760787+00	\N
73	43	96	50 DELUXE CRACKERS	/static/images/products/noimage.jpg	G	\N	1	85.00	\N	170.00	170.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.763003+00	\N
75	60	197	Sing pop	/static/images/products/img_92497142401_09_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.769327+00	\N
76	25	76	AK_DRONE	/static/images/products/img_112006819501_09_2025.jpg	G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.772641+00	\N
77	60	198	Fox star	/static/images/products/img_173434188901_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.775954+00	\N
78	11	78	na	/static/images/products/noimage.jpg	G	\N	1	0.00	\N	0.00	0.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.778296+00	\N
79	49	122	ELETRIC STONE	/static/images/products/img_115340003301_09_2025.jpg	G	\N	1	12.00	\N	12.00	12.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.781649+00	\N
53	40	75	RED BIJILI (100 PCS)	/static/images/products/noimage.jpg	G	\N	1	30.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.784283+00	\N
81	49	124	KITKAT	/static/images/products/img_154490726001_09_2025.jpg	G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.793343+00	\N
82	49	125	CRAZY TOONS (CARTOON)	/static/images/products/img_34303998120_08_2025.jpg	G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.79557+00	\N
83	49	127	SNAKE EGG BIG / ZEE BOOM BAA (10 Pouch)	/static/images/products/img_97124699619_09_2025.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.798325+00	\N
84	58	178	TIN Majesty	/static/images/products/img_94972666801_09_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.804627+00	\N
85	58	179	TIN	/static/images/products/noimage.jpg	G	\N	1	90.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.806758+00	\N
86	58	183	BLACK MONEY / WHITE MONEY	/static/images/products/img_173450326618_09_2025.jpg	G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.809456+00	\N
87	48	119	MEGA SIREN	/static/images/products/noimage.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.811604+00	\N
88	48	120	MINI SIREN	/static/images/products/noimage.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.813751+00	\N
89	57	174	PHOTO FLASH	/static/images/products/img_22415737301_09_2025.jpg	G	\N	1	70.00	\N	140.00	140.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.816396+00	\N
90	13	90	PAW PATROL (BRAND HELICOPTER)	/static/images/products/noimage.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.818584+00	\N
91	13	91	HELICOPTER / DRONE	/static/images/products/img_171539578520_08_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.820219+00	\N
92	56	171	BUTTERFLY (COLOR CHANGING)	/static/images/products/img_60398206501_09_2025.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.823202+00	\N
93	58	181	6\\" FOUNTAIN (TIN)	/static/images/products/noimage.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.82552+00	\N
94	58	182	MONEY IN THE BANK (STARVELL)	/static/images/products/noimage.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.827569+00	\N
96	35	46	4 X 4 WHEEL	/static/images/products/img_161031884724_08_2025.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.832401+00	\N
97	39	73	90 WATTS	/static/images/products/img_188313975218_09_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.834591+00	\N
98	59	187	Beat IT v1.0	/static/images/products/img_126850570301_09_2025.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.837451+00	\N
99	59	188	Beat IT v2.0	/static/images/products/img_191368986301_09_2025.jpg	G	\N	1	90.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.840142+00	\N
100	59	189	Beat IT v3.0	/static/images/products/img_8827009301_09_2025.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.84228+00	\N
101	57	175	COLOUR SMOKE(RAINBOW)	/static/images/products/noimage.jpg	G	\N	1	145.00	\N	290.00	290.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.844507+00	\N
102	51	133	6 SHOT MULTI-COLOUR	/static/images/products/noimage.jpg	G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.846691+00	\N
103	50	128	7 SHOT COLOUR	/static/images/products/img_15288083101_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.849483+00	\N
104	50	129	12 SHOT COLOUR RIDER	/static/images/products/img_128687006917_09_2025.jpg	G	\N	1	160.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.85193+00	\N
105	51	135	30 SHOT MULTI COLOUR (UV BOX)	/static/images/products/img_7449794524_09_2025.jpg	G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.854053+00	\N
106	51	136	60 SHOT MULTI COLOUR	/static/images/products/noimage.jpg	G	\N	1	700.00	\N	1400.00	1400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.856189+00	\N
107	51	137	120 SHOT MULTI COLOUR	/static/images/products/img_112627266124_09_2025.jpg	G	\N	1	1400.00	\N	2800.00	2800.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.857786+00	\N
108	51	138	240 SHOT MULTI COLOUR	/static/images/products/noimage.jpg	G	\N	1	2400.00	\N	4800.00	4800.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.860572+00	\N
109	52	142	60 SHOT MULTI COLOUR(BRAND)	/static/images/products/noimage.jpg	G	\N	1	850.00	\N	1700.00	1700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.863083+00	\N
110	52	143	120 SHOT MULTI COLOUR(BRAND)	/static/images/products/noimage.jpg	G	\N	1	1700.00	\N	6400.00	6400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.864153+00	\N
112	53	146	1 1/4 CHOTA FANCY	/static/images/products/noimage.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.869979+00	\N
113	53	147	2\\" ARIAL FANCY (1Pc)	/static/images/products/noimage.jpg	G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.872282+00	\N
114	17	114	2\\" ARIAL FANCY PIPE	/static/images/products/noimage.jpg	G	\N	1	95.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.874444+00	\N
115	17	115	2\\" ARIAL FANCY PIPE	/static/images/products/noimage.jpg	G	\N	1	95.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.876595+00	\N
117	54	148	2\\" ARIAL FANCY PIPE (3 PCS)	/static/images/products/noimage.jpg	G	\N	1	230.00	\N	460.00	460.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.880613+00	\N
118	54	149	2\\" ARIAL FANCY PIPE (3 PCS) AK BRAND	/static/images/products/noimage.jpg	G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.882801+00	\N
119	54	150	3 1/2\\" ARIAL FANCY PIPE (CANDY CRUSH)	/static/images/products/img_150351493610_10_2025.png	G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.885604+00	\N
120	54	155	4\\" ARIAL FANCY DOUBLE BALL	/static/images/products/noimage.jpg	G	\N	1	495.00	\N	990.00	990.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.887232+00	\N
121	17	121	3 1/2\\" ARIAL FANCY MIXED(SURIYAKALAA)	/static/images/products/noimage.jpg	G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.889773+00	\N
123	17	124	4\\" ARIAL FANCY DOUBLE BALL (SURIYAKALAA)	/static/images/products/noimage.jpg	G	\N	1	420.00	\N	840.00	840.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.89423+00	\N
126	55	163	MINI PEARL	/static/images/products/noimage.jpg	G	\N	1	220.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.90426+00	\N
127	55	165	LITTLE STAR(2 IN 1)	/static/images/products/noimage.jpg	G	\N	1	320.00	\N	640.00	640.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.906428+00	\N
128	55	166	JASMIN COLOUR CHANGING/ GOLDEN STAR	/static/images/products/noimage.jpg	G	\N	1	420.00	\N	780.00	780.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.908703+00	\N
129	55	168	GUDIYA MEGA DELUXE	/static/images/products/noimage.jpg	G	\N	1	550.00	\N	1040.00	1040.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.911529+00	\N
131	19	132	CHOTA BHEEM GREEN	/static/images/products/noimage.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.918791+00	\N
132	19	133	CHOTA BHEEM GOLD	/static/images/products/noimage.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.921012+00	\N
133	19	134	CHOTA BHEEM SILVER	/static/images/products/noimage.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.92362+00	\N
134	19	135	CHOTA BHEEM RED & GREEN	/static/images/products/noimage.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.92413+00	\N
136	20	137	WONDER/ MOTU PATLU GREEN	/static/images/products/noimage.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.931406+00	\N
137	20	138	WONDER/ MOTU PATLU GOLD	/static/images/products/noimage.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.933567+00	\N
138	20	139	WONDER/ MOTU PATLU SILVER	/static/images/products/noimage.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.936401+00	\N
139	20	140	WONDER/ MOTU PATLU RED & GREEN	/static/images/products/noimage.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.939366+00	\N
141	60	191	APPLE ( (CRACKLING AND SILVER PEACOCK FEATHER)	/static/images/products/noimage.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.944915+00	\N
142	60	193	ORANGE ( (CRACKLING AND GOLDEN PEACOCK FEATHER))	/static/images/products/noimage.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.94902+00	\N
143	60	192	POMEGRANATE (WATER FALLS)	/static/images/products/img_81442455020_08_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.952962+00	\N
144	22	145	Frank flower(5pcs)	/static/images/products/noimage.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.956103+00	\N
145	35	47	SPINNER SPECIAL	/static/images/products/img_68781627618_09_2025.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.960268+00	\N
146	60	194	TANGO SHOWER (5 IN 1)	/static/images/products/noimage.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.962044+00	\N
147	22	148	Colour cruch pencil	/static/images/products/noimage.jpg	G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.965383+00	\N
149	47	115	PEACOCK FEATHER	/static/images/products/noimage.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.970485+00	\N
150	47	116	ROYAL PEACOCK/DANCING PEACOCK	/static/images/products/noimage.jpg	G	\N	1	160.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.972662+00	\N
151	47	117	BADA PEACOCK FOUNTAIN	/static/images/products/img_121210570918_09_2025.jpg	G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.975483+00	\N
152	64	220	BABY STAR MATCHES	/static/images/products/noimage.jpg	G	\N	1	25.00	\N	50.00	50.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.977794+00	\N
154	64	222	SUPER DELUXE	/static/images/products/noimage.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.986817+00	\N
155	64	223	POKEMON (MINI-LAPTOP)	/static/images/products/img_40226043418_09_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.989735+00	\N
156	64	224	MEGA LAPTOP	/static/images/products/img_34386032218_09_2025.jpg	G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.992543+00	\N
157	60	196	ISON	/static/images/products/noimage.jpg	G	\N	1	70.00	\N	140.00	140.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.995381+00	\N
158	60	199	ELITE MAGICAL MIX(5PCS)( COKE)	/static/images/products/img_119318463320_08_2025.jpg	G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.998038+00	\N
159	25	160	JOLLY TRAIN	/static/images/products/img_152151013620_08_2025.jpg	G	\N	1	220.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.000576+00	\N
160	60	161	6 Shots Summer Time (BRAND)	/static/images/products/img_199653872618_09_2025.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.003549+00	\N
161	25	162		/static/images/products/noimage.jpg	G	\N	1	0.00	\N	0.00	0.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.005706+00	\N
162	66	230	25 ITEMS-GIFT BOX	/static/images/products/noimage.jpg	G	\N	1	325.00	\N	650.00	650.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.008399+00	\N
163	66	231	30 ITEMS-GIFT BOX	/static/images/products/noimage.jpg	G	\N	1	420.00	\N	840.00	840.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.011343+00	\N
164	66	232	35 ITEMS-GIFT BOX	/static/images/products/noimage.jpg	G	\N	1	500.00	\N	1000.00	1000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.012823+00	\N
165	66	233	40 ITEMS-GIFT BOX	/static/images/products/noimage.jpg	G	\N	1	650.00	\N	1300.00	1300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.01578+00	\N
166	66	234	50 ITEMS-GIFT BOX	/static/images/products/noimage.jpg	G	\N	1	800.00	\N	1600.00	1600.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.01839+00	\N
168	67	236	COCOMELON WHEEL ON THE BOX	/static/images/products/img_87077316518_09_2025.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.023756+00	\N
169	27	170	PANDA	/static/images/products/noimage.jpg	G	\N	1	1.00	\N	1.00	1.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.026638+00	\N
170	48	121	DORA (5 Pieces)	/static/images/products/noimage.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.029034+00	\N
171	27	172	DARBIC	/static/images/products/noimage.jpg	G	\N	1	1.00	\N	1.00	1.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.03169+00	\N
172	31	173	3000 COMBO PACK	/static/images/products/img_57464502224_08_2025.jpg	G	\N	1	3000.00	\N	7000.00	7000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.034672+00	\N
174	28	175		/static/images/products/noimage.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.03989+00	\N
175	29	177	1000	/static/images/products/noimage.jpg	G	\N	1	135.00	\N	270.00	270.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.043133+00	\N
176	29	178	2000	/static/images/products/noimage.jpg	G	\N	1	270.00	\N	540.00	540.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.04535+00	\N
178	29	180	10000	/static/images/products/noimage.jpg	G	\N	1	1350.00	\N	2700.00	2700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.049827+00	\N
179	45	104	1K PRIME	/static/images/products/noimage.jpg	G	\N	1	270.00	\N	540.00	540.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.052568+00	\N
180	45	105	2K PRIME	/static/images/products/noimage.jpg	G	\N	1	340.00	\N	680.00	680.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.054796+00	\N
181	45	106	5K PRIME	/static/images/products/noimage.jpg	G	\N	1	1350.00	\N	2700.00	2700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.057387+00	\N
183	29	185	100	/static/images/products/noimage.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.064149+00	\N
184	68	508	CHAKKARA AHSOKA	/static/images/products/noimage.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.067405+00	\N
185	68	520	JET FOUNTAIN(10PCS)	/static/images/products/noimage.jpg	G	\N	1	135.00	\N	270.00	270.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.07004+00	\N
187	68	517	FLOWER POT SPECIAL (STD)	/static/images/products/noimage.jpg	G	\N	1	210.00	\N	420.00	420.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.074938+00	\N
188	68	515	FLOWER POT GAINT	/static/images/products/noimage.jpg	G	\N	1	430.00	\N	860.00	860.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.076693+00	\N
189	68	523	MINI FOUTAIN RED	/static/images/products/noimage.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.078951+00	\N
190	68	501	12 CM JIMMIMG CRACKLING	/static/images/products/noimage.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.08101+00	\N
192	68	504	30 CM CRACKLING	/static/images/products/noimage.jpg	G	\N	1	85.00	\N	170.00	170.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.085817+00	\N
193	30	195	30 CM EXPORT GOLD	/static/images/products/noimage.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.088878+00	\N
194	68	506	4 COLOR SPARKLER MIXED	/static/images/products/noimage.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.091127+00	\N
195	68	519	HYDRO BOMB GREEN	/static/images/products/noimage.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.093404+00	\N
197	68	507	BULLET BOMB STD	/static/images/products/noimage.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.098243+00	\N
198	68	526	THUNDER BOMB	/static/images/products/noimage.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.101038+00	\N
199	68	528	TWINKLE STAR	/static/images/products/noimage.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.103877+00	\N
201	68	514	FLOWER POT DELUXE	/static/images/products/noimage.jpg	G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.108903+00	\N
202	68	510	COLOR FLASH (HOLI)	/static/images/products/noimage.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.111158+00	\N
203	68	524	PANDAV	/static/images/products/noimage.jpg	G	\N	1	190.00	\N	380.00	380.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.115506+00	\N
204	68	512	FLIPPER	/static/images/products/noimage.jpg	G	\N	1	190.00	\N	380.00	380.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.11833+00	\N
206	30	208	3\\" PIPE COLOR CHANGE(1000GEM IN THE SKY)\\n	/static/images/products/noimage.jpg	G	\N	1	255.00	\N	510.00	510.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.123732+00	\N
207	68	509	CHAKKARA BIG	/static/images/products/noimage.jpg	G	\N	1	135.00	\N	270.00	270.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.125225+00	\N
208	68	527	TWIN SPIN	/static/images/products/noimage.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.127888+00	\N
210	68	522	MINI FOUTAIN GOLD	/static/images/products/noimage.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.134324+00	\N
211	68	521	MINI FOUNTAIN SILVER	/static/images/products/noimage.jpg	G	\N	1	52.00	\N	104.00	104.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.136531+00	\N
212	34	33	FRANKE FLOWER POT 5PC	/static/images/products/noimage.jpg	G	\N	1	100.00	\N	200.00	200.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.138267+00	\N
214	35	48	SPINNER DELUXE	/static/images/products/noimage.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.144341+00	\N
215	36	51	1.5 TWINKLING STAR	/static/images/products/img_45048679718_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.14718+00	\N
216	36	53	JIL JIL	/static/images/products/noimage.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.150338+00	\N
217	38	63	DELUXE LAXMI (10 ROLE)	/static/images/products/noimage.jpg	G	\N	1	22.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.152792+00	\N
218	38	64	HULK / SINGAM (6 ROLE)	/static/images/products/img_167792454322_09_2025.jpg	G	\N	1	22.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.154867+00	\N
219	38	65	KUMKI (12 ROLE)	/static/images/products/img_94926652924_09_2025.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.157637+00	\N
220	38	66	BAHUBALI (16 ROLE)	/static/images/products/img_18562251022_09_2025.jpg	G	\N	1	40.00	\N	80.00	80.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.160768+00	\N
221	38	67	JALLIKATTU (20 ROLE)	/static/images/products/img_161318227922_09_2025.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.162988+00	\N
222	39	71	2 SOUND	/static/images/products/noimage.jpg	G	\N	1	38.00	\N	76.00	76.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.166142+00	\N
223	39	72	3 SOUND	/static/images/products/noimage.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.168514+00	\N
224	40	76	VARI BIJILI (50 PCS)	/static/images/products/img_98020747819_09_2025.jpg	G	\N	1	20.00	\N	40.00	40.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.170765+00	\N
226	42	87	DINOSAUR	/static/images/products/img_94872912222_09_2025.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.176755+00	\N
227	42	88	AGNI / DTS BOMB - 9ply	/static/images/products/noimage.jpg	G	\N	1	190.00	\N	390.00	390.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.178965+00	\N
228	42	89	555 BOMB	/static/images/products/noimage.jpg	G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.180682+00	\N
229	43	92	28 CHORSA	/static/images/products/noimage.jpg	G	\N	1	22.00	\N	44.00	44.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.183725+00	\N
231	44	99	200 Wala	/static/images/products/noimage.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.188327+00	\N
232	44	100	1000 Wala	/static/images/products/noimage.jpg	G	\N	1	135.00	\N	270.00	270.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.191326+00	\N
233	44	101	2000 Wala	/static/images/products/noimage.jpg	G	\N	1	270.00	\N	540.00	540.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.193589+00	\N
234	44	102	5000 Wala	/static/images/products/noimage.jpg	G	\N	1	675.00	\N	1350.00	1350.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.196915+00	\N
236	46	108	FANCY ROCKET	/static/images/products/noimage.jpg	G	\N	1	60.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.20444+00	\N
237	46	112	3 SOUND ROCKET	/static/images/products/noimage.jpg	G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.207435+00	\N
238	47	118	SENSU (UV BOX)	/static/images/products/noimage.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.210814+00	\N
240	50	130	25 SHOT COLOUR RIDER	/static/images/products/noimage.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.217623+00	\N
241	51	134	12 SHOT MULTI COLOUR	/static/images/products/img_197570843917_09_2025.jpg	G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.219919+00	\N
242	51	139	500 SHOT MULTI COLOUR	/static/images/products/noimage.jpg	G	\N	1	4800.00	\N	9600.00	9600.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.223668+00	\N
243	52	141	30 SHOT MULTI COLOUR(BRAND)	/static/images/products/noimage.jpg	G	\N	1	450.00	\N	900.00	900.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.226649+00	\N
244	54	152	4\\" ARIAL FANCY (JAZZ 21\\")	/static/images/products/noimage.jpg	G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.228885+00	\N
245	54	154	2 1/2\\" ARIAL FANCY 3 STEP	/static/images/products/noimage.jpg	G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.231493+00	\N
247	55	164	TIM TIM	/static/images/products/noimage.jpg	G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.237605+00	\N
248	55	167	ASHRAFI	/static/images/products/noimage.jpg	G	\N	1	320.00	\N	640.00	640.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.239759+00	\N
249	56	169	HELICOPTER	/static/images/products/noimage.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.242665+00	\N
250	56	170	DRONE	/static/images/products/noimage.jpg	G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.244858+00	\N
251	56	172	BAMBARAM	/static/images/products/noimage.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.247219+00	\N
253	61	206	GOOGLY GREEN	/static/images/products/img_119693142117_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.252372+00	\N
254	61	207	GOOGLY SILVER	/static/images/products/img_11874451717_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.254754+00	\N
255	61	208	GOOGLY GOLD	/static/images/products/img_119096176917_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.257011+00	\N
256	61	209	GOOGLY RED & GREEN	/static/images/products/img_179701720518_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.260399+00	\N
257	62	210	TOM & JERRY RED	/static/images/products/img_135462735817_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.262712+00	\N
258	62	211	TOM & JERRY GREEN	/static/images/products/img_27346017717_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.265476+00	\N
259	62	212	TOM & JERRY WHITE	/static/images/products/img_191000304918_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.268418+00	\N
260	62	213	TOM & JERRY GOLD	/static/images/products/img_200353452917_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.271244+00	\N
261	62	214	TOM & JERRY RED & GREEN	/static/images/products/img_133615217717_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.273801+00	\N
262	63	215	WONDER/ SCOOBY RED	/static/images/products/img_212633408317_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.277407+00	\N
263	63	216	WONDER/ SCOOBY GREEN	/static/images/products/img_132362768117_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.279156+00	\N
264	63	217	WONDER/ SCOOBY WHITE	/static/images/products/img_113140336218_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.28212+00	\N
265	63	218	WONDER/ SCOOBY GOLD	/static/images/products/img_149407039618_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.285267+00	\N
266	63	219	WONDER/ SCOOBY RED & GREEN	/static/images/products/img_58641721518_09_2025.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.287532+00	\N
267	65	226	3K FAMILY COMBO PACK	/static/images/products/img_111317437618_09_2025.jpg	G	\N	1	3000.00	\N	6000.00	6000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.289752+00	\N
268	66	235	60 ITEMS-GIFT BOX	/static/images/products/noimage.jpg	G	\N	1	1200.00	\N	2400.00	2400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.293294+00	\N
269	68	502	20 CM EXPORT GOLD	/static/images/products/noimage.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.295651+00	\N
270	68	503	3\\" PIPE COLOR CHANGE(1000GEM IN THE SKY)	/static/images/products/noimage.jpg	G	\N	1	255.00	\N	510.00	510.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.297882+00	\N
1	32	1	7 CM ELCECTRIC SPARKLER	/static/images/products/img_99291569618_09_2025.jpg	G	\N	1	6.00	\N	12.00	12.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.547067+00	\N
61	46	111	2 SOUND ROCKET	/static/images/products/noimage.jpg	G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.730307+00	\N
74	43	97	100 DELUXE CRACKERS	/static/images/products/img_64969320924_09_2025.jpg	G	\N	1	165.00	\N	330.00	330.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.766565+00	\N
80	49	123	MAGIC POP	/static/images/products/img_43165617201_09_2025.jpg	G	\N	1	10.00	\N	20.00	20.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.789929+00	\N
95	58	180	6\\" WATER QUEEN (STARVELL)	/static/images/products/noimage.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.829731+00	\N
111	52	145	240 SHOT MULTI COLOUR(BRAND)	/static/images/products/noimage.jpg	G	\N	1	3400.00	\N	6800.00	6800.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.86782+00	\N
116	17	116	2\\" ARIAL FANCY PIPE	/static/images/products/noimage.jpg	G	\N	1	95.00	\N	180.00	180.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.878913+00	\N
122	54	151	4\\" ARIAL FANCY (OREO)	/static/images/products/img_78570253210_10_2025.png	G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.891977+00	\N
124	17	125	4\\" ARIAL FANCY HD SHOW	/static/images/products/noimage.jpg	G	\N	1	380.00	\N	760.00	760.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.896458+00	\N
125	17	126	3/2”NAYAGARA DOUBLE PIECE (SURIYAKALAA)	/static/images/products/noimage.jpg	G	\N	1	500.00	\N	1000.00	1000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.901379+00	\N
272	54	157	VADIVEL DOUBLE PIECE	/static/images/products/noimage.jpg	G	\N	1	850.00	\N	1700.00	1700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.303635+00	\N
273	39	71	2 SOUND	/static/images/products/noimage.jpg	G	\N	1	35.00	\N	70.00	70.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.306342+00	\N
274	39	72	3 SOUND	/static/images/products/noimage.jpg	G	\N	1	45.00	\N	90.00	90.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.309246+00	\N
276	47	116	ROYAL PEACOCK/DANCING PEACOCK	/static/images/products/noimage.jpg	G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.312805+00	\N
277	47	118	SENSU (UV BOX)	/static/images/products/noimage.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.315375+00	\N
278	37	55	FLUTE (HAND TORCH 3 PCS)	/static/images/products/noimage.jpg	G	\N	1	180.00	\N	360.00	360.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.318258+00	\N
279	48	120	MINI SIREN	/static/images/products/noimage.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.320405+00	\N
281	46	112	3 SOUND ROCKET	/static/images/products/noimage.jpg	G	\N	1	160.00	\N	320.00	320.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.326089+00	\N
282	37	56	12\\" DELUXE PENCIL	/static/images/products/noimage.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.329412+00	\N
283	37	58	SMALL PENCIL [10 PCS]	/static/images/products/noimage.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.331908+00	\N
285	42	89	555 BOMB	/static/images/products/noimage.jpg	G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.337872+00	\N
286	67	237	VIOLIN 	/static/images/products/noimage.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.34029+00	\N
287	67	238	KADAM 	/static/images/products/noimage.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.342416+00	\N
288	67	239	DRAGON 	/static/images/products/noimage.jpg	G	\N	1	165.00	\N	330.00	330.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.345245+00	\N
289	67	240	16 SHOTS	/static/images/products/noimage.jpg	G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.348248+00	\N
291	42	85	KING OF KING BOMB - JUG MUG 3000	/static/images/products/noimage.jpg	G	\N	1	75.00	\N	150.00	150.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.355283+00	\N
292	42	88	DIGITAL BOMB 9PLY	/static/images/products/noimage.jpg	G	\N	1	190.00	\N	380.00	380.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.359139+00	\N
293	67	242	BAD BOY	/static/images/products/noimage.jpg	G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.361308+00	\N
294	54	157	VADIVEL DOUBLE PIECE	/static/images/products/noimage.jpg	G	\N	1	850.00	\N	1700.00	1700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.363714+00	\N
296	54	159	4\\" ARIAL FANCY DOUBLE BALL (WOW)	/static/images/products/noimage.jpg	G	\N	1	520.00	\N	1040.00	1040.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.369958+00	\N
297	54	157	VADIVEL DOUBLE PIECE	/static/images/products/noimage.jpg	G	\N	1	850.00	\N	1700.00	1700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.372271+00	\N
298	34	37	FLOWER POTS SUPER DLX (2 PCS)	/static/images/products/noimage.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.375512+00	\N
299	37	58	SMALL PENCIL (10 PCS) - KARTHIKA	/static/images/products/noimage.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.377764+00	\N
300	67	238	KADAM	/static/images/products/noimage.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.380249+00	\N
302	67	240	16 SHOT	/static/images/products/noimage.jpg	G	\N	1	280.00	\N	560.00	560.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.387464+00	\N
303	67	241	CYLINDER (SMOKE WITH BOMB)	/static/images/products/noimage.jpg	G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.391498+00	\N
304	67	242	BAD BOX	/static/images/products/noimage.jpg	G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.394153+00	\N
306	60	200	X - MAS	/static/images/products/noimage.jpg	G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.400147+00	\N
307	54	153	4\\" WEDDING SPECIAL ARIAL FANCY (7 STEPS)	/static/images/products/noimage.jpg	G	\N	1	450.00	\N	800.00	800.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.403435+00	\N
308	54	160	4\\" ARIAL NAYAGARA DOUBLE PIECE (DUKE)	/static/images/products/noimage.jpg	G	\N	1	750.00	\N	1500.00	1500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.406584+00	\N
309	67	243	HAND SHOT (18 SHOT)	/static/images/products/noimage.jpg	G	\N	1	280.00	\N	600.00	600.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.410152+00	\N
130	19	131	CHOTA BHEEM RED	/static/images/products/noimage.jpg	G	\N	1	28.00	\N	56.00	56.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.914205+00	\N
135	20	136	WONDER/ MOTU PATLU RED	/static/images/products/noimage.jpg	G	\N	1	55.00	\N	110.00	110.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.928819+00	\N
140	60	190	PLUM  (CRACKLING AND SILVER)	/static/images/products/noimage.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.942023+00	\N
148	22	149	Colour butterfly	/static/images/products/noimage.jpg	G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.968071+00	\N
153	64	221	FLASH MATCHES	/static/images/products/img_145755301618_09_2025.jpg	G	\N	1	80.00	\N	160.00	160.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:23.983658+00	\N
167	67	237	VIOLIN	/static/images/products/noimage.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.020478+00	\N
173	65	227	5K FAMILY COMBO PACK	/static/images/products/img_148552598724_08_2025.jpg	G	\N	1	5000.00	\N	10000.00	10000.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.036501+00	\N
177	29	179	5000	/static/images/products/noimage.jpg	G	\N	1	675.00	\N	1350.00	1350.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.047649+00	\N
182	45	107	10K PRIME	/static/images/products/noimage.jpg	G	\N	1	2700.00	\N	5400.00	5400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.061327+00	\N
186	68	516	FLOWER POT SMALL (STD)	/static/images/products/noimage.jpg	G	\N	1	95.00	\N	190.00	190.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.072279+00	\N
191	68	505	30 CM GOLD SPARKLES	/static/images/products/noimage.jpg	G	\N	1	75.00	\N	150.00	150.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.084112+00	\N
196	68	511	FAT BOY	/static/images/products/noimage.jpg	G	\N	1	60.00	\N	120.00	120.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.095718+00	\N
200	68	525	SNOW VALLEY	/static/images/products/noimage.jpg	G	\N	1	150.00	\N	300.00	300.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.106502+00	\N
205	68	513	FLOWER BOMB	/static/images/products/noimage.jpg	G	\N	1	170.00	\N	340.00	340.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.120811+00	\N
209	68	518	GOLDEN WHISTLE SMALL	/static/images/products/noimage.jpg	G	\N	1	200.00	\N	400.00	400.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.13045+00	\N
213	35	44	MOON/DISCO WHEEL (5 Pieces)	/static/images/products/img_19084704018_09_2025.jpg	G	\N	1	110.00	\N	220.00	220.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.141719+00	\N
225	42	82	ATOM BOMB	/static/images/products/noimage.jpg	G	\N	1	35.00	\N	70.00	70.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.173346+00	\N
230	44	98	100 Wala	/static/images/products/noimage.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.186061+00	\N
235	44	103	10000 Wala	/static/images/products/noimage.jpg	G	\N	1	1350.00	\N	2700.00	2700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.201024+00	\N
239	49	126	SNAKE CARTOON	/static/images/products/img_182383899519_09_2025.jpg	G	\N	1	50.00	\N	100.00	100.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.214044+00	\N
246	54	156	4\\" NAYAGARA DOUBLE PIECE (Phoenix)	/static/images/products/noimage.jpg	G	\N	1	900.00	\N	1600.00	1600.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.235042+00	\N
252	61	205	GOOGLY RED	/static/images/products/img_64782316317_09_2025.jpg	G	\N	1	30.00	\N	60.00	60.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.249923+00	\N
271	54	153	3 1/2\\" ARIAL FANCY(NAYAGARA FALLS) 	/static/images/products/noimage.jpg	G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.301464+00	\N
275	47	115	PEACOCK FEATHER	/static/images/products/noimage.jpg	G	\N	1	120.00	\N	240.00	240.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.31139+00	\N
280	46	111	2 SOUND ROCKET	/static/images/products/noimage.jpg	G	\N	1	130.00	\N	260.00	260.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.32288+00	\N
284	34	37	FLOWER POTS SUPER DLX (2 PCS)	/static/images/products/noimage.jpg	G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.334106+00	\N
290	67	241	CYLINDER (SMOKE WITH BOMB)	/static/images/products/noimage.jpg	G	\N	1	220.00	\N	440.00	440.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.352369+00	\N
295	54	158	3 1/2\\" ARIAL FANCY(POPCORN) Karthiga	/static/images/products/noimage.jpg	G	\N	1	350.00	\N	700.00	700.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.367232+00	\N
301	67	239	DRAGON	/static/images/products/noimage.jpg	G	\N	1	165.00	\N	370.00	370.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	t	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.38372+00	\N
305	51	140	16 SHOT MULTI COLOUR (SPLASH)	/static/images/products/noimage.jpg	G	\N	1	250.00	\N	500.00	500.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.397081+00	\N
45	38	60	2 3/4\\" KURUVI CRACKERS	/static/images/products/img_86979105818_09_2025.jpg	G	\N	1	7.00	\N	14.00	14.00	\N	\N	0.000	0.00	0.00	0.000	\N	0.000	0	0	1	1	f	1	2026-03-20 18:21:51.631513+00	2026-03-22 18:02:24.415307+00	\N
\.


--
-- Data for Name: tbl_online_sales; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_online_sales (id, customerid, customeraddrid, "websiteId", transno, transdt, status, discountcode, discountper, discount, totalamt, roundamt, "grandAmt", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_onlinesales_items; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_onlinesales_items (id, "onlineSalesId", "itemId", "itemName", "itemCode", rate, mrp, qty, "freeQty", "discountPer", "discountAmt", unit, "taxPer", "taxName", "taxAmt", "itemTotal", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_pricelist; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_pricelist (id, "listName", "listDesc", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_pricelist_items; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_pricelist_items (id, "pricelistId", "itemId", unit, "purchaseRate", "purchaseRateInc", "sellingPrice", "customerSp", "shownValues", "shownValueDisc", "salesCost", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_role; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_role (id, name, descr, "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
1	Super Admin	\N	1	1	t	\N	2026-03-20 18:16:29.30569+00	2026-03-20 18:16:29.30569+00	\N
2	Admin	\N	1	1	t	\N	2026-03-20 18:16:29.30569+00	2026-03-20 18:16:29.30569+00	\N
3	Online Customers	\N	1	1	t	\N	2026-03-20 18:16:29.30569+00	2026-03-20 18:16:29.30569+00	\N
4	Users	\N	1	1	t	\N	2026-03-20 18:16:29.30569+00	2026-03-20 18:16:29.30569+00	\N
\.


--
-- Data for Name: tbl_serialno; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_serialno (id, "tableName", "prefixNo", "nextNo", "suffixNo", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy", "sequenceNo") FROM stdin;
1	tbl_online_sales	SO	202600	\N	1	1	t	\N	2026-03-20 18:16:29.302391+00	2026-03-22 00:54:12.446177+00	\N	2
\.


--
-- Data for Name: tbl_state; Type: TABLE DATA; Schema: public; Owner: auraauser
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
-- Data for Name: tbl_units; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_units (id, name, code, descr, "convFactor", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_users; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_users (id, "userName", "fullName", "mobileNo", "emailId", password, "roleId", "companyId", "branchId", "lastLogin", "passwordResetToken", "onlineCustomerId", "isActive", "createdBy", "createdDt", "updatedDt", "updatedBy") FROM stdin;
\.


--
-- Data for Name: tbl_users_addr; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_users_addr (id, userid, address, countryid, stateid, city, pincode, isactive, createdby, createddt, updateddt, updatedby) FROM stdin;
\.


--
-- Data for Name: tbl_websitelist; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.tbl_websitelist (id, "websiteName", "companyId", "branchId", "isActive", "createdBy", "createdDt", "updatedBy", "updatedDt") FROM stdin;
1	AuraaBooks	1	1	t	1	2026-03-20 18:16:29.29733+00	\N	2026-03-20 18:16:29.29733+00
2	AuraaCrackers	1	1	t	1	2026-03-20 18:16:29.29733+00	\N	2026-03-20 18:16:29.29733+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.users (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, phone, address) FROM stdin;
\.


--
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.users_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_permissions; Type: TABLE DATA; Schema: public; Owner: auraauser
--

COPY public.users_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: tbl_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_branch_id_seq', 1, true);


--
-- Name: tbl_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_cart_id_seq', 1, false);


--
-- Name: tbl_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_category_id_seq', 1, false);


--
-- Name: tbl_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_city_id_seq', 122, true);


--
-- Name: tbl_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_company_id_seq', 1, true);


--
-- Name: tbl_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_country_id_seq', 1, true);


--
-- Name: tbl_coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_coupons_id_seq', 1, true);


--
-- Name: tbl_customer_addr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_customer_addr_id_seq', 1, false);


--
-- Name: tbl_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_customer_id_seq', 1, false);


--
-- Name: tbl_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_items_id_seq', 1, false);


--
-- Name: tbl_online_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_online_sales_id_seq', 1, false);


--
-- Name: tbl_onlinesales_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_onlinesales_items_id_seq', 1, false);


--
-- Name: tbl_pricelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_pricelist_id_seq', 1, false);


--
-- Name: tbl_pricelist_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_pricelist_items_id_seq', 1, false);


--
-- Name: tbl_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_role_id_seq', 4, true);


--
-- Name: tbl_serialno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_serialno_id_seq', 1, true);


--
-- Name: tbl_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_state_id_seq', 36, true);


--
-- Name: tbl_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_units_id_seq', 1, false);


--
-- Name: tbl_users_addr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_users_addr_id_seq', 1, false);


--
-- Name: tbl_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_users_id_seq', 1, false);


--
-- Name: tbl_websitelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_websitelist_id_seq', 2, true);


--
-- Name: users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.users_groups_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: users_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.users_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: tbl_branch tbl_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_branch
    ADD CONSTRAINT tbl_branch_pkey PRIMARY KEY (id);


--
-- Name: tbl_cart tbl_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_cart
    ADD CONSTRAINT tbl_cart_pkey PRIMARY KEY (id);


--
-- Name: tbl_category tbl_category_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_category
    ADD CONSTRAINT tbl_category_pkey PRIMARY KEY (id);


--
-- Name: tbl_city tbl_city_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_city
    ADD CONSTRAINT tbl_city_pkey PRIMARY KEY (id);


--
-- Name: tbl_company tbl_company_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_company
    ADD CONSTRAINT tbl_company_pkey PRIMARY KEY (id);


--
-- Name: tbl_country tbl_country_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_country
    ADD CONSTRAINT tbl_country_pkey PRIMARY KEY (id);


--
-- Name: tbl_coupons tbl_coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_coupons
    ADD CONSTRAINT tbl_coupons_pkey PRIMARY KEY (id);


--
-- Name: tbl_customer_addr tbl_customer_addr_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer_addr
    ADD CONSTRAINT tbl_customer_addr_pkey PRIMARY KEY (id);


--
-- Name: tbl_customer tbl_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer
    ADD CONSTRAINT tbl_customer_pkey PRIMARY KEY (id);


--
-- Name: tbl_items tbl_items_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT tbl_items_pkey PRIMARY KEY (id);


--
-- Name: tbl_online_sales tbl_online_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_online_sales
    ADD CONSTRAINT tbl_online_sales_pkey PRIMARY KEY (id);


--
-- Name: tbl_onlinesales_items tbl_onlinesales_items_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_onlinesales_items
    ADD CONSTRAINT tbl_onlinesales_items_pkey PRIMARY KEY (id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_pkey PRIMARY KEY (id);


--
-- Name: tbl_pricelist tbl_pricelist_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist
    ADD CONSTRAINT tbl_pricelist_pkey PRIMARY KEY (id);


--
-- Name: tbl_role tbl_role_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_role
    ADD CONSTRAINT tbl_role_pkey PRIMARY KEY (id);


--
-- Name: tbl_serialno tbl_serialno_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_serialno
    ADD CONSTRAINT tbl_serialno_pkey PRIMARY KEY (id);


--
-- Name: tbl_state tbl_state_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_state
    ADD CONSTRAINT tbl_state_pkey PRIMARY KEY (id);


--
-- Name: tbl_units tbl_units_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_units
    ADD CONSTRAINT tbl_units_pkey PRIMARY KEY (id);


--
-- Name: tbl_users_addr tbl_users_addr_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users_addr
    ADD CONSTRAINT tbl_users_addr_pkey PRIMARY KEY (id);


--
-- Name: tbl_users tbl_users_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (id);


--
-- Name: tbl_websitelist tbl_websitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_websitelist
    ADD CONSTRAINT tbl_websitelist_pkey PRIMARY KEY (id);


--
-- Name: users_groups users_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_pkey PRIMARY KEY (id);


--
-- Name: users_groups users_groups_user_id_group_id_fc7788e8_uniq; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_user_id_group_id_fc7788e8_uniq UNIQUE (user_id, group_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_user_permissions users_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users_user_permissions
    ADD CONSTRAINT users_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_permissions users_user_permissions_user_id_permission_id_3b86cbdf_uniq; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users_user_permissions
    ADD CONSTRAINT users_user_permissions_user_id_permission_id_3b86cbdf_uniq UNIQUE (user_id, permission_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: categories_is_active_59a0f5bd; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX categories_is_active_59a0f5bd ON public.categories USING btree (is_active);


--
-- Name: categories_name_09afee77_like; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX categories_name_09afee77_like ON public.categories USING btree (name varchar_pattern_ops);


--
-- Name: categories_order_3f1119ab; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX categories_order_3f1119ab ON public.categories USING btree ("order");


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: products_category_id_a7a3a156; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX products_category_id_a7a3a156 ON public.products USING btree (category_id);


--
-- Name: products_code_770e3a_idx; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX products_code_770e3a_idx ON public.products USING btree (code);


--
-- Name: products_code_a66283f3; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX products_code_a66283f3 ON public.products USING btree (code);


--
-- Name: products_code_a66283f3_like; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX products_code_a66283f3_like ON public.products USING btree (code varchar_pattern_ops);


--
-- Name: products_is_active_4d0bbafa; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX products_is_active_4d0bbafa ON public.products USING btree (is_active);


--
-- Name: products_name_4a89b61d; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX products_name_4a89b61d ON public.products USING btree (name);


--
-- Name: products_name_4a89b61d_like; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX products_name_4a89b61d_like ON public.products USING btree (name varchar_pattern_ops);


--
-- Name: products_name_a9a494_idx; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX products_name_a9a494_idx ON public.products USING btree (name, category_id);


--
-- Name: products_price_2104b53c; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX products_price_2104b53c ON public.products USING btree (price);


--
-- Name: users_email_4b85f2_idx; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX users_email_4b85f2_idx ON public.users USING btree (email);


--
-- Name: users_groups_group_id_2f3517aa; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX users_groups_group_id_2f3517aa ON public.users_groups USING btree (group_id);


--
-- Name: users_groups_user_id_f500bee5; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX users_groups_user_id_f500bee5 ON public.users_groups USING btree (user_id);


--
-- Name: users_user_permissions_permission_id_6d08dcd2; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX users_user_permissions_permission_id_6d08dcd2 ON public.users_user_permissions USING btree (permission_id);


--
-- Name: users_user_permissions_user_id_92473840; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX users_user_permissions_user_id_92473840 ON public.users_user_permissions USING btree (user_id);


--
-- Name: users_usernam_baeb4b_idx; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX users_usernam_baeb4b_idx ON public.users USING btree (username);


--
-- Name: users_username_e8658fc8_like; Type: INDEX; Schema: public; Owner: auraauser
--

CREATE INDEX users_username_e8658fc8_like ON public.users USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products products_category_id_a7a3a156_fk_categories_id; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_a7a3a156_fk_categories_id FOREIGN KEY (category_id) REFERENCES public.categories(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tbl_branch tbl_branch_cityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_branch
    ADD CONSTRAINT tbl_branch_cityid_fkey FOREIGN KEY ("cityId") REFERENCES public.tbl_city(id);


--
-- Name: tbl_branch tbl_branch_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_branch
    ADD CONSTRAINT tbl_branch_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_branch tbl_branch_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_branch
    ADD CONSTRAINT tbl_branch_countryid_fkey FOREIGN KEY ("countryId") REFERENCES public.tbl_country(id);


--
-- Name: tbl_branch tbl_branch_stateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_branch
    ADD CONSTRAINT tbl_branch_stateid_fkey FOREIGN KEY ("stateId") REFERENCES public.tbl_state(id);


--
-- Name: tbl_cart tbl_cart_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_cart
    ADD CONSTRAINT tbl_cart_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_cart tbl_cart_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_cart
    ADD CONSTRAINT tbl_cart_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_cart tbl_cart_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_cart
    ADD CONSTRAINT tbl_cart_itemid_fkey FOREIGN KEY ("itemId") REFERENCES public.tbl_items(id);


--
-- Name: tbl_cart tbl_cart_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_cart
    ADD CONSTRAINT tbl_cart_userid_fkey FOREIGN KEY ("userId") REFERENCES public.tbl_users(id);


--
-- Name: tbl_category tbl_category_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_category
    ADD CONSTRAINT tbl_category_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_category tbl_category_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_category
    ADD CONSTRAINT tbl_category_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_city tbl_city_stateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_city
    ADD CONSTRAINT tbl_city_stateid_fkey FOREIGN KEY ("stateId") REFERENCES public.tbl_state(id);


--
-- Name: tbl_company tbl_company_cityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_company
    ADD CONSTRAINT tbl_company_cityid_fkey FOREIGN KEY ("cityId") REFERENCES public.tbl_city(id);


--
-- Name: tbl_company tbl_company_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_company
    ADD CONSTRAINT tbl_company_countryid_fkey FOREIGN KEY ("countryId") REFERENCES public.tbl_country(id);


--
-- Name: tbl_company tbl_company_stateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_company
    ADD CONSTRAINT tbl_company_stateid_fkey FOREIGN KEY ("stateId") REFERENCES public.tbl_state(id);


--
-- Name: tbl_coupons tbl_coupons_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_coupons
    ADD CONSTRAINT tbl_coupons_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_coupons tbl_coupons_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_coupons
    ADD CONSTRAINT tbl_coupons_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_customer_addr tbl_customer_addr_cityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer_addr
    ADD CONSTRAINT tbl_customer_addr_cityid_fkey FOREIGN KEY ("cityId") REFERENCES public.tbl_city(id);


--
-- Name: tbl_customer_addr tbl_customer_addr_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer_addr
    ADD CONSTRAINT tbl_customer_addr_countryid_fkey FOREIGN KEY ("countryId") REFERENCES public.tbl_country(id);


--
-- Name: tbl_customer_addr tbl_customer_addr_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer_addr
    ADD CONSTRAINT tbl_customer_addr_customerid_fkey FOREIGN KEY ("customerId") REFERENCES public.tbl_customer(id);


--
-- Name: tbl_customer_addr tbl_customer_addr_stateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer_addr
    ADD CONSTRAINT tbl_customer_addr_stateid_fkey FOREIGN KEY ("stateId") REFERENCES public.tbl_state(id);


--
-- Name: tbl_customer tbl_customer_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer
    ADD CONSTRAINT tbl_customer_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_customer tbl_customer_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer
    ADD CONSTRAINT tbl_customer_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_customer tbl_customer_websiteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_customer
    ADD CONSTRAINT tbl_customer_websiteid_fkey FOREIGN KEY ("websiteId") REFERENCES public.tbl_websitelist(id);


--
-- Name: tbl_items tbl_items_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT tbl_items_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_items tbl_items_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT tbl_items_categoryid_fkey FOREIGN KEY ("categoryId") REFERENCES public.tbl_category(id);


--
-- Name: tbl_items tbl_items_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT tbl_items_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_items tbl_items_unitid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT tbl_items_unitid_fkey FOREIGN KEY ("unitId") REFERENCES public.tbl_units(id);


--
-- Name: tbl_online_sales tbl_online_sales_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_online_sales
    ADD CONSTRAINT tbl_online_sales_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_online_sales tbl_online_sales_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_online_sales
    ADD CONSTRAINT tbl_online_sales_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_online_sales tbl_online_sales_customeraddrid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_online_sales
    ADD CONSTRAINT tbl_online_sales_customeraddrid_fkey FOREIGN KEY (customeraddrid) REFERENCES public.tbl_customer_addr(id);


--
-- Name: tbl_online_sales tbl_online_sales_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_online_sales
    ADD CONSTRAINT tbl_online_sales_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.tbl_customer(id);


--
-- Name: tbl_online_sales tbl_online_sales_websiteid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_online_sales
    ADD CONSTRAINT tbl_online_sales_websiteid_fkey FOREIGN KEY ("websiteId") REFERENCES public.tbl_websitelist(id);


--
-- Name: tbl_onlinesales_items tbl_onlinesales_items_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_onlinesales_items
    ADD CONSTRAINT tbl_onlinesales_items_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_onlinesales_items tbl_onlinesales_items_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_onlinesales_items
    ADD CONSTRAINT tbl_onlinesales_items_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_onlinesales_items tbl_onlinesales_items_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_onlinesales_items
    ADD CONSTRAINT tbl_onlinesales_items_itemid_fkey FOREIGN KEY ("itemId") REFERENCES public.tbl_items(id);


--
-- Name: tbl_onlinesales_items tbl_onlinesales_items_onlinesalesid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_onlinesales_items
    ADD CONSTRAINT tbl_onlinesales_items_onlinesalesid_fkey FOREIGN KEY ("onlineSalesId") REFERENCES public.tbl_online_sales(id);


--
-- Name: tbl_pricelist tbl_pricelist_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist
    ADD CONSTRAINT tbl_pricelist_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_pricelist tbl_pricelist_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist
    ADD CONSTRAINT tbl_pricelist_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_itemid_fkey FOREIGN KEY ("itemId") REFERENCES public.tbl_items(id);


--
-- Name: tbl_pricelist_items tbl_pricelist_items_pricelistid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_pricelist_items
    ADD CONSTRAINT tbl_pricelist_items_pricelistid_fkey FOREIGN KEY ("pricelistId") REFERENCES public.tbl_pricelist(id);


--
-- Name: tbl_role tbl_role_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_role
    ADD CONSTRAINT tbl_role_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_role tbl_role_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_role
    ADD CONSTRAINT tbl_role_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_serialno tbl_serialno_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_serialno
    ADD CONSTRAINT tbl_serialno_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_serialno tbl_serialno_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_serialno
    ADD CONSTRAINT tbl_serialno_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_state tbl_state_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_state
    ADD CONSTRAINT tbl_state_countryid_fkey FOREIGN KEY ("countryId") REFERENCES public.tbl_country(id);


--
-- Name: tbl_units tbl_units_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_units
    ADD CONSTRAINT tbl_units_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_units tbl_units_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_units
    ADD CONSTRAINT tbl_units_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_users_addr tbl_users_addr_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users_addr
    ADD CONSTRAINT tbl_users_addr_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.tbl_country(id);


--
-- Name: tbl_users_addr tbl_users_addr_stateid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users_addr
    ADD CONSTRAINT tbl_users_addr_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.tbl_state(id);


--
-- Name: tbl_users_addr tbl_users_addr_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users_addr
    ADD CONSTRAINT tbl_users_addr_userid_fkey FOREIGN KEY (userid) REFERENCES public.tbl_users(id);


--
-- Name: tbl_users tbl_users_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_users tbl_users_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: tbl_users tbl_users_onlinecustomerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_onlinecustomerid_fkey FOREIGN KEY ("onlineCustomerId") REFERENCES public.tbl_customer(id);


--
-- Name: tbl_users tbl_users_roleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_roleid_fkey FOREIGN KEY ("roleId") REFERENCES public.tbl_role(id);


--
-- Name: tbl_websitelist tbl_websitelist_branchid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_websitelist
    ADD CONSTRAINT tbl_websitelist_branchid_fkey FOREIGN KEY ("branchId") REFERENCES public.tbl_branch(id);


--
-- Name: tbl_websitelist tbl_websitelist_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_websitelist
    ADD CONSTRAINT tbl_websitelist_companyid_fkey FOREIGN KEY ("companyId") REFERENCES public.tbl_company(id);


--
-- Name: users_groups users_groups_group_id_2f3517aa_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_group_id_2f3517aa_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_groups users_groups_user_id_f500bee5_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_user_id_f500bee5_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_permissions users_user_permissio_permission_id_6d08dcd2_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users_user_permissions
    ADD CONSTRAINT users_user_permissio_permission_id_6d08dcd2_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_permissions users_user_permissions_user_id_92473840_fk_users_id; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.users_user_permissions
    ADD CONSTRAINT users_user_permissions_user_id_92473840_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: auraauser
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict 7crRILy7lrgU3dFzR0hYIfCOAzRM0Q82WODllsBYy1ItjdlI176mGINAJheDpPX

