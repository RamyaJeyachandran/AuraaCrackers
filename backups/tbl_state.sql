--
-- PostgreSQL database dump
--

\restrict wd7eBRrLNMx4RWsowyQwhbE3bTlbgzwbkxYCfEDkPV5T5A36PEIFq4pZCfLjk3P

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
-- Name: tbl_state id; Type: DEFAULT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_state ALTER COLUMN id SET DEFAULT nextval('public.tbl_state_id_seq'::regclass);


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
-- Name: tbl_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: auraauser
--

SELECT pg_catalog.setval('public.tbl_state_id_seq', 36, true);


--
-- Name: tbl_state tbl_state_pkey; Type: CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_state
    ADD CONSTRAINT tbl_state_pkey PRIMARY KEY (id);


--
-- Name: tbl_state tbl_state_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: auraauser
--

ALTER TABLE ONLY public.tbl_state
    ADD CONSTRAINT tbl_state_countryid_fkey FOREIGN KEY ("countryId") REFERENCES public.tbl_country(id);


--
-- PostgreSQL database dump complete
--

\unrestrict wd7eBRrLNMx4RWsowyQwhbE3bTlbgzwbkxYCfEDkPV5T5A36PEIFq4pZCfLjk3P

