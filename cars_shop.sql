--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

-- Started on 2020-11-25 09:44:46 MSK

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

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 25061)
-- Name: buyer; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.buyer (
    id integer NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL
);


ALTER TABLE public.buyer OWNER TO test;

--
-- TOC entry 200 (class 1259 OID 25080)
-- Name: buyer_car; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.buyer_car (
    buyer_id integer NOT NULL,
    car_id integer NOT NULL
);


ALTER TABLE public.buyer_car OWNER TO test;

--
-- TOC entry 196 (class 1259 OID 25059)
-- Name: buyer_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.buyer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buyer_id_seq OWNER TO test;

--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 196
-- Name: buyer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.buyer_id_seq OWNED BY public.buyer.id;


--
-- TOC entry 199 (class 1259 OID 25070)
-- Name: car; Type: TABLE; Schema: public; Owner: test
--

CREATE TABLE public.car (
    id integer NOT NULL,
    model character varying NOT NULL
);


ALTER TABLE public.car OWNER TO test;

--
-- TOC entry 198 (class 1259 OID 25068)
-- Name: car_id_seq; Type: SEQUENCE; Schema: public; Owner: test
--

CREATE SEQUENCE public.car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_id_seq OWNER TO test;

--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 198
-- Name: car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test
--

ALTER SEQUENCE public.car_id_seq OWNED BY public.car.id;


--
-- TOC entry 3015 (class 2604 OID 25064)
-- Name: buyer id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.buyer ALTER COLUMN id SET DEFAULT nextval('public.buyer_id_seq'::regclass);


--
-- TOC entry 3016 (class 2604 OID 25073)
-- Name: car id; Type: DEFAULT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.car ALTER COLUMN id SET DEFAULT nextval('public.car_id_seq'::regclass);


--
-- TOC entry 3149 (class 0 OID 25061)
-- Dependencies: 197
-- Data for Name: buyer; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.buyer (id, first_name, last_name) FROM stdin;
1	Rex	Brown
2	Alex	Romat
\.


--
-- TOC entry 3152 (class 0 OID 25080)
-- Dependencies: 200
-- Data for Name: buyer_car; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.buyer_car (buyer_id, car_id) FROM stdin;
1	1
1	2
\.


--
-- TOC entry 3151 (class 0 OID 25070)
-- Dependencies: 199
-- Data for Name: car; Type: TABLE DATA; Schema: public; Owner: test
--

COPY public.car (id, model) FROM stdin;
1	MazdaX11
2	BMWX11GT
\.


--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 196
-- Name: buyer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.buyer_id_seq', 2, true);


--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 198
-- Name: car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: test
--

SELECT pg_catalog.setval('public.car_id_seq', 2, true);


--
-- TOC entry 3024 (class 2606 OID 25084)
-- Name: buyer_car buyer_car_pk; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.buyer_car
    ADD CONSTRAINT buyer_car_pk PRIMARY KEY (buyer_id, car_id);


--
-- TOC entry 3019 (class 2606 OID 25067)
-- Name: buyer buyer_pk; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_pk PRIMARY KEY (id);


--
-- TOC entry 3022 (class 2606 OID 25079)
-- Name: car car_pk; Type: CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pk PRIMARY KEY (id);


--
-- TOC entry 3017 (class 1259 OID 25065)
-- Name: buyer_id_uindex; Type: INDEX; Schema: public; Owner: test
--

CREATE UNIQUE INDEX buyer_id_uindex ON public.buyer USING btree (id);


--
-- TOC entry 3020 (class 1259 OID 25077)
-- Name: car_id_uindex; Type: INDEX; Schema: public; Owner: test
--

CREATE UNIQUE INDEX car_id_uindex ON public.car USING btree (id);


--
-- TOC entry 3025 (class 2606 OID 25085)
-- Name: buyer_car buyer_car_buyer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.buyer_car
    ADD CONSTRAINT buyer_car_buyer_id_fk FOREIGN KEY (buyer_id) REFERENCES public.buyer(id);


--
-- TOC entry 3026 (class 2606 OID 25090)
-- Name: buyer_car buyer_car_car_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: test
--

ALTER TABLE ONLY public.buyer_car
    ADD CONSTRAINT buyer_car_car_id_fk FOREIGN KEY (car_id) REFERENCES public.car(id);


-- Completed on 2020-11-25 09:44:46 MSK

--
-- PostgreSQL database dump complete
--

