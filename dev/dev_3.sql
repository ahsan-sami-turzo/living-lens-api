--
-- PostgreSQL database dump
--

-- Dumped from database version 13.14
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-29 01:15:38 EEST

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- CREATE SCHEMA public;


--
-- TOC entry 4055 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 22425)
-- Name: category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.category (
    id integer NOT NULL,
    category_name character varying(50)
);


--
-- TOC entry 206 (class 1259 OID 22423)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4056 (class 0 OID 0)
-- Dependencies: 206
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 205 (class 1259 OID 22412)
-- Name: city; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city (
    id integer NOT NULL,
    city_name character varying(100),
    country_id_fk integer
);


--
-- TOC entry 204 (class 1259 OID 22410)
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4057 (class 0 OID 0)
-- Dependencies: 204
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- TOC entry 203 (class 1259 OID 22404)
-- Name: country; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country (
    id integer NOT NULL,
    country_name character varying(100)
);


--
-- TOC entry 202 (class 1259 OID 22402)
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4058 (class 0 OID 0)
-- Dependencies: 202
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- TOC entry 201 (class 1259 OID 22396)
-- Name: lifestyle; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lifestyle (
    id integer NOT NULL,
    lifestyle_category_name character varying(100)
);


--
-- TOC entry 200 (class 1259 OID 22394)
-- Name: lifestyle_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lifestyle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4059 (class 0 OID 0)
-- Dependencies: 200
-- Name: lifestyle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lifestyle_id_seq OWNED BY public.lifestyle.id;


--
-- TOC entry 211 (class 1259 OID 22446)
-- Name: price; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.price (
    id integer NOT NULL,
    city_id_fk integer,
    subcategory_id_fk integer,
    average_price double precision,
    min_price double precision,
    max_price double precision
);


--
-- TOC entry 210 (class 1259 OID 22444)
-- Name: price_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4060 (class 0 OID 0)
-- Dependencies: 210
-- Name: price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.price_id_seq OWNED BY public.price.id;


--
-- TOC entry 209 (class 1259 OID 22433)
-- Name: subcategory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subcategory (
    id integer NOT NULL,
    subcategory_name character varying(100),
    category_id_fk integer
);


--
-- TOC entry 208 (class 1259 OID 22431)
-- Name: subcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subcategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4061 (class 0 OID 0)
-- Dependencies: 208
-- Name: subcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subcategory_id_seq OWNED BY public.subcategory.id;


--
-- TOC entry 3889 (class 2604 OID 22428)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3888 (class 2604 OID 22415)
-- Name: city id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- TOC entry 3887 (class 2604 OID 22407)
-- Name: country id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- TOC entry 3886 (class 2604 OID 22399)
-- Name: lifestyle id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifestyle ALTER COLUMN id SET DEFAULT nextval('public.lifestyle_id_seq'::regclass);


--
-- TOC entry 3891 (class 2604 OID 22449)
-- Name: price id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price ALTER COLUMN id SET DEFAULT nextval('public.price_id_seq'::regclass);


--
-- TOC entry 3890 (class 2604 OID 22436)
-- Name: subcategory id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategory ALTER COLUMN id SET DEFAULT nextval('public.subcategory_id_seq'::regclass);


--
-- TOC entry 4045 (class 0 OID 22425)
-- Dependencies: 207
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.category VALUES (1, 'Restaurants');
INSERT INTO public.category VALUES (2, 'Markets');
INSERT INTO public.category VALUES (3, 'Transportation');
INSERT INTO public.category VALUES (4, 'Utilities (Monthly)');
INSERT INTO public.category VALUES (5, 'Sports And Leisure');
INSERT INTO public.category VALUES (6, 'Childcare');
INSERT INTO public.category VALUES (7, 'Clothing And Shoes');
INSERT INTO public.category VALUES (8, 'Rent Per Month');
INSERT INTO public.category VALUES (9, 'Buy Apartment Price');
INSERT INTO public.category VALUES (10, 'Salaries And Financing');


--
-- TOC entry 4043 (class 0 OID 22412)
-- Dependencies: 205
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.city VALUES (1, 'Berlin', 1);
INSERT INTO public.city VALUES (2, 'Frankfurt', 1);
INSERT INTO public.city VALUES (3, 'Münich', 1);
INSERT INTO public.city VALUES (4, 'Rome', 2);
INSERT INTO public.city VALUES (5, 'Venice', 2);
INSERT INTO public.city VALUES (6, 'Milan', 2);
INSERT INTO public.city VALUES (7, 'Helsinki', 3);
INSERT INTO public.city VALUES (8, 'Lappeenranta', 3);
INSERT INTO public.city VALUES (9, 'Lahti', 3);


--
-- TOC entry 4041 (class 0 OID 22404)
-- Dependencies: 203
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.country VALUES (1, 'Germany');
INSERT INTO public.country VALUES (2, 'Italy');
INSERT INTO public.country VALUES (3, 'Finland');


--
-- TOC entry 4039 (class 0 OID 22396)
-- Dependencies: 201
-- Data for Name: lifestyle; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.lifestyle VALUES (1, 'Gourmet Explorer Lifestyle');
INSERT INTO public.lifestyle VALUES (2, 'City Hustle Lifestyle');
INSERT INTO public.lifestyle VALUES (3, 'Entertainment Enthusiast Lifestyle');
INSERT INTO public.lifestyle VALUES (4, 'Thrifty Urbanite Lifestyle');
INSERT INTO public.lifestyle VALUES (5, 'Fashionista Lifestyle');
INSERT INTO public.lifestyle VALUES (6, 'Home Chef Lifestyle');
INSERT INTO public.lifestyle VALUES (7, 'Nature Lover Lifestyle');
INSERT INTO public.lifestyle VALUES (8, 'Jetsetter Lifestyle');
INSERT INTO public.lifestyle VALUES (9, 'Family Nest Lifestyle');
INSERT INTO public.lifestyle VALUES (10, 'Investor''s Delight Lifestyle');


--
-- TOC entry 4049 (class 0 OID 22446)
-- Dependencies: 211
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.price VALUES (1, 1, 1, 12, 8, 20);
INSERT INTO public.price VALUES (2, 1, 2, 62.5, 45, 100);
INSERT INTO public.price VALUES (3, 1, 3, 10, 9, 12);
INSERT INTO public.price VALUES (4, 1, 4, 4.5, 2.5, 5.5);
INSERT INTO public.price VALUES (5, 1, 5, 4, 3, 5);
INSERT INTO public.price VALUES (6, 1, 6, 3.52, 2, 5);
INSERT INTO public.price VALUES (7, 1, 7, 2.92, 2, 4);
INSERT INTO public.price VALUES (8, 1, 8, 2.62, 1.7, 4);
INSERT INTO public.price VALUES (9, 1, 9, 1.2, 0.95, 1.79);
INSERT INTO public.price VALUES (10, 1, 10, 2.01, 1, 4);
INSERT INTO public.price VALUES (11, 1, 11, 2.92, 1.5, 5);
INSERT INTO public.price VALUES (12, 1, 12, 3.33, 2.39, 5);
INSERT INTO public.price VALUES (13, 1, 13, 12.63, 7.48, 25);
INSERT INTO public.price VALUES (14, 1, 14, 12.94, 6, 18.6);
INSERT INTO public.price VALUES (15, 1, 15, 14.43, 9.5, 22.99);
INSERT INTO public.price VALUES (16, 1, 16, 2.59, 1, 3.7);
INSERT INTO public.price VALUES (17, 1, 17, 1.65, 1.2, 2.3);
INSERT INTO public.price VALUES (18, 1, 18, 2.29, 1.25, 4);
INSERT INTO public.price VALUES (19, 1, 19, 2.83, 1.29, 5.98);
INSERT INTO public.price VALUES (20, 1, 20, 1.78, 1, 3);
INSERT INTO public.price VALUES (21, 1, 21, 1.87, 1.29, 3);
INSERT INTO public.price VALUES (22, 1, 22, 1.43, 0.8, 2);
INSERT INTO public.price VALUES (23, 1, 23, 0.87, 0.25, 2);
INSERT INTO public.price VALUES (24, 1, 24, 6, 4, 10);
INSERT INTO public.price VALUES (25, 1, 25, 1.01, 0.79, 1.5);
INSERT INTO public.price VALUES (26, 1, 26, 1.77, 1, 3);
INSERT INTO public.price VALUES (27, 1, 27, 8.2, 8, 10);
INSERT INTO public.price VALUES (28, 1, 28, 3.2, 2.8, 3.8);
INSERT INTO public.price VALUES (29, 1, 29, 50, 49, 91);
INSERT INTO public.price VALUES (30, 1, 30, 4.95, 3.5, 8);
INSERT INTO public.price VALUES (31, 1, 31, 2.3, 2, 4);
INSERT INTO public.price VALUES (32, 1, 32, 35, 30, 40);
INSERT INTO public.price VALUES (33, 1, 33, 1.8, 1.71, 1.93);
INSERT INTO public.price VALUES (34, 1, 34, 30000, 29275, 33000);
INSERT INTO public.price VALUES (35, 1, 35, 30420, 27500, 33340);
INSERT INTO public.price VALUES (36, 1, 36, 329.67, 250, 523.08);
INSERT INTO public.price VALUES (37, 1, 37, 20.29, 9.99, 40);
INSERT INTO public.price VALUES (38, 1, 38, 40.36, 30, 50);
INSERT INTO public.price VALUES (39, 1, 39, 35.56, 20, 65);
INSERT INTO public.price VALUES (40, 1, 40, 21.22, 14, 30);
INSERT INTO public.price VALUES (41, 1, 41, 12, 10, 18);
INSERT INTO public.price VALUES (42, 1, 42, 206.44, 50, 700);
INSERT INTO public.price VALUES (43, 1, 43, 7994.44, 4950, 12000);
INSERT INTO public.price VALUES (44, 1, 44, 83.27, 30, 120);
INSERT INTO public.price VALUES (45, 1, 45, 35.84, 19.99, 60);
INSERT INTO public.price VALUES (46, 1, 46, 85.72, 49, 120);
INSERT INTO public.price VALUES (47, 1, 47, 131.83, 59.99, 200);
INSERT INTO public.price VALUES (48, 1, 48, 1288.42, 900, 2000);
INSERT INTO public.price VALUES (49, 1, 49, 928.24, 600, 1500);
INSERT INTO public.price VALUES (50, 1, 50, 2442.69, 2000, 4000);
INSERT INTO public.price VALUES (51, 1, 51, 1761.79, 1400, 2500);
INSERT INTO public.price VALUES (52, 1, 52, 8372.93, 6800, 10000);
INSERT INTO public.price VALUES (53, 1, 53, 6056.52, 4500, 7534.74);
INSERT INTO public.price VALUES (54, 1, 54, 3143.36, 0, 0);
INSERT INTO public.price VALUES (55, 1, 55, 4.04, 3.14, 4.8);
INSERT INTO public.price VALUES (56, 2, 1, 15, 7, 22.5);
INSERT INTO public.price VALUES (57, 2, 2, 70, 47, 100);
INSERT INTO public.price VALUES (58, 2, 3, 9, 8.69, 11.5);
INSERT INTO public.price VALUES (59, 2, 4, 4.85, 3.5, 6);
INSERT INTO public.price VALUES (60, 2, 5, 4, 3.3, 5);
INSERT INTO public.price VALUES (61, 2, 6, 3.37, 2, 4.5);
INSERT INTO public.price VALUES (62, 2, 7, 2.71, 2, 3.8);
INSERT INTO public.price VALUES (63, 2, 8, 2.55, 2, 3.5);
INSERT INTO public.price VALUES (64, 2, 9, 1.16, 0.95, 1.59);
INSERT INTO public.price VALUES (65, 2, 10, 1.97, 1.2, 3.8);
INSERT INTO public.price VALUES (66, 2, 11, 2.5, 1.19, 3.98);
INSERT INTO public.price VALUES (67, 2, 12, 3.33, 1.92, 4.68);
INSERT INTO public.price VALUES (68, 2, 13, 12.95, 7.9, 22);
INSERT INTO public.price VALUES (69, 2, 14, 13.57, 6, 16.9);
INSERT INTO public.price VALUES (70, 2, 15, 14.36, 7, 28);
INSERT INTO public.price VALUES (71, 2, 16, 2.28, 1.1, 3.5);
INSERT INTO public.price VALUES (72, 2, 17, 1.37, 1.15, 2);
INSERT INTO public.price VALUES (73, 2, 18, 2.15, 1, 6.5);
INSERT INTO public.price VALUES (74, 2, 19, 2.23, 1.19, 4);
INSERT INTO public.price VALUES (75, 2, 20, 1.34, 0.6, 2);
INSERT INTO public.price VALUES (76, 2, 21, 1.76, 0.8, 2);
INSERT INTO public.price VALUES (77, 2, 22, 1.7, 0.9, 1.79);
INSERT INTO public.price VALUES (78, 2, 23, 0.63, 0.27, 1.1);
INSERT INTO public.price VALUES (79, 2, 24, 5, 3.5, 8);
INSERT INTO public.price VALUES (80, 2, 25, 0.97, 0.8, 1.5);
INSERT INTO public.price VALUES (81, 2, 26, 1.74, 0.85, 3);
INSERT INTO public.price VALUES (82, 2, 27, 8, 7.6, 9);
INSERT INTO public.price VALUES (83, 2, 28, 3.4, 3, 3.75);
INSERT INTO public.price VALUES (84, 2, 29, 49, 49, 97);
INSERT INTO public.price VALUES (85, 2, 30, 4, 3.5, 5);
INSERT INTO public.price VALUES (86, 2, 31, 2.2, 2, 3);
INSERT INTO public.price VALUES (87, 2, 32, 30, 25, 38);
INSERT INTO public.price VALUES (88, 2, 33, 1.76, 1.7, 1.9);
INSERT INTO public.price VALUES (89, 2, 34, 26250, 25000, 27615);
INSERT INTO public.price VALUES (90, 2, 35, 24790, 23000, 29910);
INSERT INTO public.price VALUES (91, 2, 36, 283.79, 188, 453.33);
INSERT INTO public.price VALUES (92, 2, 37, 20.02, 10, 40);
INSERT INTO public.price VALUES (93, 2, 38, 43.45, 29.99, 60);
INSERT INTO public.price VALUES (94, 2, 39, 44.18, 20, 75);
INSERT INTO public.price VALUES (95, 2, 40, 17.38, 10, 25);
INSERT INTO public.price VALUES (96, 2, 41, 12.5, 11, 15);
INSERT INTO public.price VALUES (97, 2, 42, 468.57, 290, 750);
INSERT INTO public.price VALUES (98, 2, 43, 13116.67, 9500, 20000);
INSERT INTO public.price VALUES (99, 2, 44, 65.86, 35, 100);
INSERT INTO public.price VALUES (100, 2, 45, 30.53, 18.95, 50);
INSERT INTO public.price VALUES (101, 2, 46, 83.2, 55, 112);
INSERT INTO public.price VALUES (102, 2, 47, 107.88, 70, 200);
INSERT INTO public.price VALUES (103, 2, 48, 1199.14, 900, 1500);
INSERT INTO public.price VALUES (104, 2, 49, 837.27, 660, 1200);
INSERT INTO public.price VALUES (105, 2, 50, 2149.77, 1595, 3500);
INSERT INTO public.price VALUES (106, 2, 51, 1487.5, 1000, 2000);
INSERT INTO public.price VALUES (107, 2, 52, 7579.17, 5600, 10000);
INSERT INTO public.price VALUES (108, 2, 53, 4466.92, 3550, 5500);
INSERT INTO public.price VALUES (109, 2, 54, 3655.67, 0, 0);
INSERT INTO public.price VALUES (110, 2, 55, 3.69, 1.95, 5);
INSERT INTO public.price VALUES (111, 3, 1, 15, 10, 20);
INSERT INTO public.price VALUES (112, 3, 2, 70, 50, 120);
INSERT INTO public.price VALUES (113, 3, 3, 10, 10, 11);
INSERT INTO public.price VALUES (114, 3, 4, 4.5, 3, 6);
INSERT INTO public.price VALUES (115, 3, 5, 4.75, 3.5, 5.2);
INSERT INTO public.price VALUES (116, 3, 6, 3.68, 2, 4.8);
INSERT INTO public.price VALUES (117, 3, 7, 3.14, 2, 4);
INSERT INTO public.price VALUES (118, 3, 8, 2.65, 2, 3.8);
INSERT INTO public.price VALUES (119, 3, 9, 1.21, 0.99, 1.69);
INSERT INTO public.price VALUES (120, 3, 10, 2.34, 1.19, 4);
INSERT INTO public.price VALUES (121, 3, 11, 2.56, 1.5, 3.99);
INSERT INTO public.price VALUES (122, 3, 12, 3.12, 2.27, 4.8);
INSERT INTO public.price VALUES (123, 3, 13, 13.32, 7, 26);
INSERT INTO public.price VALUES (124, 3, 14, 11.81, 5, 16.9);
INSERT INTO public.price VALUES (125, 3, 15, 15.15, 10, 20.45);
INSERT INTO public.price VALUES (126, 3, 16, 2.52, 1.5, 4);
INSERT INTO public.price VALUES (127, 3, 17, 1.55, 1.29, 3);
INSERT INTO public.price VALUES (128, 3, 18, 2.3, 1.75, 4.75);
INSERT INTO public.price VALUES (129, 3, 19, 2.52, 1.29, 4.99);
INSERT INTO public.price VALUES (130, 3, 20, 1.75, 1.05, 3);
INSERT INTO public.price VALUES (131, 3, 21, 1.89, 1, 2.85);
INSERT INTO public.price VALUES (132, 3, 22, 1.73, 1, 2);
INSERT INTO public.price VALUES (133, 3, 23, 0.79, 0.3, 1.5);
INSERT INTO public.price VALUES (134, 3, 24, 5, 4, 10);
INSERT INTO public.price VALUES (135, 3, 25, 0.97, 0.85, 1.1);
INSERT INTO public.price VALUES (136, 3, 26, 1.71, 1, 2.5);
INSERT INTO public.price VALUES (137, 3, 27, 8.2, 8, 9);
INSERT INTO public.price VALUES (138, 3, 28, 3.7, 3.2, 3.9);
INSERT INTO public.price VALUES (139, 3, 29, 49, 49, 63.2);
INSERT INTO public.price VALUES (140, 3, 30, 5.4, 4.7, 6.99);
INSERT INTO public.price VALUES (141, 3, 31, 2.3, 2, 3.6);
INSERT INTO public.price VALUES (142, 3, 32, 30, 30, 60);
INSERT INTO public.price VALUES (143, 3, 33, 1.84, 1.71, 2);
INSERT INTO public.price VALUES (144, 3, 34, 27000, 24000, 29275);
INSERT INTO public.price VALUES (145, 3, 35, 27285.71, 24000, 30000);
INSERT INTO public.price VALUES (146, 3, 36, 297.59, 200, 467.5);
INSERT INTO public.price VALUES (147, 3, 37, 20.43, 11, 39);
INSERT INTO public.price VALUES (148, 3, 38, 38.7, 30, 50);
INSERT INTO public.price VALUES (149, 3, 39, 42.88, 20, 99);
INSERT INTO public.price VALUES (150, 3, 40, 27.62, 20, 35);
INSERT INTO public.price VALUES (151, 3, 41, 13, 10, 15);
INSERT INTO public.price VALUES (152, 3, 42, 766, 400, 1500);
INSERT INTO public.price VALUES (153, 3, 43, 15200, 9600, 20000);
INSERT INTO public.price VALUES (154, 3, 44, 84.34, 40, 120);
INSERT INTO public.price VALUES (155, 3, 45, 36.85, 17.99, 80);
INSERT INTO public.price VALUES (156, 3, 46, 85.62, 50, 129);
INSERT INTO public.price VALUES (157, 3, 47, 112.92, 60, 199);
INSERT INTO public.price VALUES (158, 3, 48, 1368.77, 1000, 1800);
INSERT INTO public.price VALUES (159, 3, 49, 1091.37, 800, 1450);
INSERT INTO public.price VALUES (160, 3, 50, 2457.06, 1800, 3000);
INSERT INTO public.price VALUES (161, 3, 51, 1928.11, 1400, 2500);
INSERT INTO public.price VALUES (162, 3, 52, 11008.04, 8500, 17400);
INSERT INTO public.price VALUES (163, 3, 53, 8148, 6600, 11500);
INSERT INTO public.price VALUES (164, 3, 54, 3571.83, 0, 0);
INSERT INTO public.price VALUES (165, 3, 55, 3.45, 1.91, 4.2);
INSERT INTO public.price VALUES (166, 4, 1, 15, 12, 25);
INSERT INTO public.price VALUES (167, 4, 2, 65, 50, 100);
INSERT INTO public.price VALUES (168, 4, 3, 10, 10, 13);
INSERT INTO public.price VALUES (169, 4, 4, 5, 3, 6);
INSERT INTO public.price VALUES (170, 4, 5, 4, 3, 6);
INSERT INTO public.price VALUES (171, 4, 6, 1.5, 1.2, 2.5);
INSERT INTO public.price VALUES (172, 4, 7, 2.06, 1.5, 3);
INSERT INTO public.price VALUES (173, 4, 8, 1.08, 1, 2);
INSERT INTO public.price VALUES (174, 4, 9, 1.51, 1, 2.05);
INSERT INTO public.price VALUES (175, 4, 10, 1.78, 1.2, 3.5);
INSERT INTO public.price VALUES (176, 4, 11, 2.49, 1.8, 5.5);
INSERT INTO public.price VALUES (177, 4, 12, 3.46, 2, 6);
INSERT INTO public.price VALUES (178, 4, 13, 12.5, 10, 20);
INSERT INTO public.price VALUES (179, 4, 14, 10.39, 7, 15);
INSERT INTO public.price VALUES (180, 4, 15, 15.44, 12, 20);
INSERT INTO public.price VALUES (181, 4, 16, 2.06, 1.49, 3.5);
INSERT INTO public.price VALUES (182, 4, 17, 1.84, 1.2, 3);
INSERT INTO public.price VALUES (183, 4, 18, 2.09, 1, 4);
INSERT INTO public.price VALUES (184, 4, 19, 2.46, 1.3, 5);
INSERT INTO public.price VALUES (185, 4, 20, 1.45, 1, 2.5);
INSERT INTO public.price VALUES (186, 4, 21, 1.58, 1, 2);
INSERT INTO public.price VALUES (187, 4, 22, 1.18, 0.8, 2);
INSERT INTO public.price VALUES (188, 4, 23, 0.4, 0.2, 1);
INSERT INTO public.price VALUES (189, 4, 24, 3.75, 3, 10);
INSERT INTO public.price VALUES (190, 4, 25, 1.51, 1, 2);
INSERT INTO public.price VALUES (191, 4, 26, 2.1, 1.2, 3.5);
INSERT INTO public.price VALUES (192, 4, 27, 6, 5.6, 6.5);
INSERT INTO public.price VALUES (193, 4, 28, 1.5, 1.5, 1.5);
INSERT INTO public.price VALUES (194, 4, 29, 35, 35, 35);
INSERT INTO public.price VALUES (195, 4, 30, 4, 3, 6.5);
INSERT INTO public.price VALUES (196, 4, 31, 1.5, 1.1, 2.5);
INSERT INTO public.price VALUES (197, 4, 32, 39.5, 28, 50);
INSERT INTO public.price VALUES (198, 4, 33, 1.81, 1.6, 2);
INSERT INTO public.price VALUES (199, 4, 34, 25000, 23350, 30000);
INSERT INTO public.price VALUES (200, 4, 35, 25481.25, 24000, 27000);
INSERT INTO public.price VALUES (201, 4, 36, 208.44, 180, 340);
INSERT INTO public.price VALUES (202, 4, 37, 11.89, 7, 15);
INSERT INTO public.price VALUES (203, 4, 38, 27.75, 25, 33);
INSERT INTO public.price VALUES (204, 4, 39, 57.32, 35, 90);
INSERT INTO public.price VALUES (205, 4, 40, 19.77, 15, 30);
INSERT INTO public.price VALUES (206, 4, 41, 10, 8.5, 15);
INSERT INTO public.price VALUES (207, 4, 42, 471.25, 400, 650);
INSERT INTO public.price VALUES (208, 4, 43, 9587.92, 6000, 25000);
INSERT INTO public.price VALUES (209, 4, 44, 60.4, 40, 100);
INSERT INTO public.price VALUES (210, 4, 45, 29.17, 20, 40);
INSERT INTO public.price VALUES (211, 4, 46, 74.17, 50, 120);
INSERT INTO public.price VALUES (212, 4, 47, 100.2, 70, 169);
INSERT INTO public.price VALUES (213, 4, 48, 1101.56, 1000, 1500);
INSERT INTO public.price VALUES (214, 4, 49, 673.48, 600, 800);
INSERT INTO public.price VALUES (215, 4, 50, 2100, 2000, 3000);
INSERT INTO public.price VALUES (216, 4, 51, 1228.33, 1000, 1500);
INSERT INTO public.price VALUES (217, 4, 52, 7111.54, 5000, 10000);
INSERT INTO public.price VALUES (218, 4, 53, 3340.91, 2700, 4500);
INSERT INTO public.price VALUES (219, 4, 54, 1651.42, 0, 0);
INSERT INTO public.price VALUES (220, 4, 55, 4.92, 3.5, 7);
INSERT INTO public.price VALUES (221, 5, 1, 17, 12, 30);
INSERT INTO public.price VALUES (222, 5, 2, 70, 45, 100);
INSERT INTO public.price VALUES (223, 5, 3, 10, 9.5, 15);
INSERT INTO public.price VALUES (224, 5, 4, 5, 3, 7);
INSERT INTO public.price VALUES (225, 5, 5, 4.5, 4, 8);
INSERT INTO public.price VALUES (226, 5, 6, 1.6, 1.1, 4);
INSERT INTO public.price VALUES (227, 5, 7, 2.78, 2, 5);
INSERT INTO public.price VALUES (228, 5, 8, 1.19, 1, 2.5);
INSERT INTO public.price VALUES (229, 5, 9, 1.54, 1.2, 2);
INSERT INTO public.price VALUES (230, 5, 10, 2.42, 1, 4);
INSERT INTO public.price VALUES (231, 5, 11, 2.7, 1.5, 4);
INSERT INTO public.price VALUES (232, 5, 12, 2.8, 1.99, 5);
INSERT INTO public.price VALUES (233, 5, 13, 13.97, 9, 33);
INSERT INTO public.price VALUES (234, 5, 14, 11.59, 5, 15);
INSERT INTO public.price VALUES (235, 5, 15, 16.88, 15, 28.5);
INSERT INTO public.price VALUES (236, 5, 16, 2.1, 0.99, 3);
INSERT INTO public.price VALUES (237, 5, 17, 1.9, 1.5, 5);
INSERT INTO public.price VALUES (238, 5, 18, 2, 1.5, 6);
INSERT INTO public.price VALUES (239, 5, 19, 2.5, 1.5, 6.9);
INSERT INTO public.price VALUES (240, 5, 20, 1.85, 1.3, 4);
INSERT INTO public.price VALUES (241, 5, 21, 1.23, 1, 2.5);
INSERT INTO public.price VALUES (242, 5, 22, 1.3, 1, 2);
INSERT INTO public.price VALUES (243, 5, 23, 0.35, 0.15, 1);
INSERT INTO public.price VALUES (244, 5, 24, 5, 3, 10);
INSERT INTO public.price VALUES (245, 5, 25, 1.94, 1.19, 3.5);
INSERT INTO public.price VALUES (246, 5, 26, 1.5, 0.7, 3.5);
INSERT INTO public.price VALUES (247, 5, 27, 5.6, 5, 6);
INSERT INTO public.price VALUES (248, 5, 28, 1.5, 1.5, 1.5);
INSERT INTO public.price VALUES (249, 5, 29, 33.5, 26, 45);
INSERT INTO public.price VALUES (250, 5, 30, 3.2, 3.2, 7);
INSERT INTO public.price VALUES (251, 5, 31, 1.25, 1.15, 3);
INSERT INTO public.price VALUES (252, 5, 32, 27, 27, 40);
INSERT INTO public.price VALUES (253, 5, 33, 1.78, 1.7, 2.19);
INSERT INTO public.price VALUES (254, 5, 34, 24000, 23000, 30000);
INSERT INTO public.price VALUES (255, 5, 35, 29966.67, 28000, 35000);
INSERT INTO public.price VALUES (256, 5, 36, 224.9, 120, 450);
INSERT INTO public.price VALUES (257, 5, 37, 10.64, 7, 14.99);
INSERT INTO public.price VALUES (258, 5, 38, 27.5, 25, 35);
INSERT INTO public.price VALUES (259, 5, 39, 63.33, 50, 70);
INSERT INTO public.price VALUES (260, 5, 40, 12, 0, 0);
INSERT INTO public.price VALUES (261, 5, 41, 7.5, 6, 15);
INSERT INTO public.price VALUES (262, 5, 42, 400, 400, 970);
INSERT INTO public.price VALUES (263, 5, 43, 6000, 6000, 46494);
INSERT INTO public.price VALUES (264, 5, 44, 71.25, 40, 120);
INSERT INTO public.price VALUES (265, 5, 45, 31.67, 20, 50);
INSERT INTO public.price VALUES (266, 5, 46, 94, 70, 135);
INSERT INTO public.price VALUES (267, 5, 47, 113.33, 70, 200);
INSERT INTO public.price VALUES (268, 5, 48, 983.33, 600, 1500);
INSERT INTO public.price VALUES (269, 5, 49, 500, 500, 500);
INSERT INTO public.price VALUES (270, 5, 50, 2516.67, 2200, 3000);
INSERT INTO public.price VALUES (271, 5, 51, 1000, 1000, 1000);
INSERT INTO public.price VALUES (272, 5, 52, 6000, 5000, 7000);
INSERT INTO public.price VALUES (273, 5, 53, 2750, 2500, 3000);
INSERT INTO public.price VALUES (274, 5, 54, 1550, 0, 0);
INSERT INTO public.price VALUES (275, 5, 55, 4.83, 4, 5);
INSERT INTO public.price VALUES (276, 6, 1, 20, 14, 30);
INSERT INTO public.price VALUES (277, 6, 2, 80, 60, 120);
INSERT INTO public.price VALUES (278, 6, 3, 10, 9, 12);
INSERT INTO public.price VALUES (279, 6, 4, 6, 5, 8);
INSERT INTO public.price VALUES (280, 6, 5, 5, 4, 7);
INSERT INTO public.price VALUES (281, 6, 6, 1.95, 1.2, 3);
INSERT INTO public.price VALUES (282, 6, 7, 2.91, 2.5, 4);
INSERT INTO public.price VALUES (283, 6, 8, 1.42, 1, 2);
INSERT INTO public.price VALUES (284, 6, 9, 1.59, 1, 2);
INSERT INTO public.price VALUES (285, 6, 10, 2.4, 1.5, 3.5);
INSERT INTO public.price VALUES (286, 6, 11, 3.25, 2, 4.5);
INSERT INTO public.price VALUES (287, 6, 12, 3.89, 2.4, 5.6);
INSERT INTO public.price VALUES (288, 6, 13, 16.24, 11, 22);
INSERT INTO public.price VALUES (289, 6, 14, 11.62, 6, 16);
INSERT INTO public.price VALUES (290, 6, 15, 20.16, 11, 25);
INSERT INTO public.price VALUES (291, 6, 16, 2.31, 1, 3);
INSERT INTO public.price VALUES (292, 6, 17, 2.03, 1.2, 3);
INSERT INTO public.price VALUES (293, 6, 18, 2.55, 1.5, 4);
INSERT INTO public.price VALUES (294, 6, 19, 3.29, 1.99, 5);
INSERT INTO public.price VALUES (295, 6, 20, 1.71, 1, 2.5);
INSERT INTO public.price VALUES (296, 6, 21, 1.66, 1, 2.15);
INSERT INTO public.price VALUES (297, 6, 22, 1.32, 0.8, 2);
INSERT INTO public.price VALUES (298, 6, 23, 0.56, 0.3, 1);
INSERT INTO public.price VALUES (299, 6, 24, 7, 4, 12);
INSERT INTO public.price VALUES (300, 6, 25, 1.84, 1, 3);
INSERT INTO public.price VALUES (301, 6, 26, 2.2, 1.3, 4);
INSERT INTO public.price VALUES (302, 6, 27, 6, 5.5, 6.2);
INSERT INTO public.price VALUES (303, 6, 28, 2.2, 2.2, 2.5);
INSERT INTO public.price VALUES (304, 6, 29, 39, 30, 40);
INSERT INTO public.price VALUES (305, 6, 30, 7, 4, 10);
INSERT INTO public.price VALUES (306, 6, 31, 2, 1.14, 3);
INSERT INTO public.price VALUES (307, 6, 32, 33.14, 30, 40);
INSERT INTO public.price VALUES (308, 6, 33, 1.86, 1.77, 2);
INSERT INTO public.price VALUES (309, 6, 34, 27000, 25000, 31000);
INSERT INTO public.price VALUES (310, 6, 35, 29846.67, 28000, 33000);
INSERT INTO public.price VALUES (311, 6, 36, 244.61, 113.33, 476);
INSERT INTO public.price VALUES (312, 6, 37, 9.72, 6, 14.99);
INSERT INTO public.price VALUES (313, 6, 38, 27, 24, 32);
INSERT INTO public.price VALUES (314, 6, 39, 63.94, 30, 100);
INSERT INTO public.price VALUES (315, 6, 40, 31.45, 25, 50);
INSERT INTO public.price VALUES (316, 6, 41, 10, 8.9, 12);
INSERT INTO public.price VALUES (317, 6, 42, 794.04, 600, 1000);
INSERT INTO public.price VALUES (318, 6, 43, 14296.64, 9600, 25000);
INSERT INTO public.price VALUES (319, 6, 44, 90.44, 40, 120);
INSERT INTO public.price VALUES (320, 6, 45, 35.54, 15, 60);
INSERT INTO public.price VALUES (321, 6, 46, 98.2, 70, 130);
INSERT INTO public.price VALUES (322, 6, 47, 132.18, 70, 279);
INSERT INTO public.price VALUES (323, 6, 48, 1442.82, 1000, 2000);
INSERT INTO public.price VALUES (324, 6, 49, 936.5, 700, 1300);
INSERT INTO public.price VALUES (325, 6, 50, 2998.26, 2200, 5000);
INSERT INTO public.price VALUES (326, 6, 51, 1892.84, 1500, 2500);
INSERT INTO public.price VALUES (327, 6, 52, 8981.39, 6000, 11900);
INSERT INTO public.price VALUES (328, 6, 53, 4861.36, 4000, 7000);
INSERT INTO public.price VALUES (329, 6, 54, 1716.25, 0, 0);
INSERT INTO public.price VALUES (330, 6, 55, 4.49, 3.7, 5);
INSERT INTO public.price VALUES (331, 7, 1, 15, 10.4, 25);
INSERT INTO public.price VALUES (332, 7, 2, 90, 60, 120);
INSERT INTO public.price VALUES (333, 7, 3, 10, 9, 11.15);
INSERT INTO public.price VALUES (334, 7, 4, 8, 4.5, 10);
INSERT INTO public.price VALUES (335, 7, 5, 8, 6, 10);
INSERT INTO public.price VALUES (336, 7, 6, 4.51, 2.6, 6);
INSERT INTO public.price VALUES (337, 7, 7, 2.58, 1.8, 4);
INSERT INTO public.price VALUES (338, 7, 8, 1.75, 1.3, 3);
INSERT INTO public.price VALUES (339, 7, 9, 1.12, 0.85, 1.5);
INSERT INTO public.price VALUES (340, 7, 10, 2.73, 1.3, 4);
INSERT INTO public.price VALUES (341, 7, 11, 2.42, 1.4, 4);
INSERT INTO public.price VALUES (342, 7, 12, 3.06, 2.1, 5);
INSERT INTO public.price VALUES (343, 7, 13, 7.73, 5.7, 16);
INSERT INTO public.price VALUES (344, 7, 14, 11.01, 6, 15);
INSERT INTO public.price VALUES (345, 7, 15, 20.7, 10, 35);
INSERT INTO public.price VALUES (346, 7, 16, 2.36, 0.79, 3.5);
INSERT INTO public.price VALUES (347, 7, 17, 1.7, 1.25, 3);
INSERT INTO public.price VALUES (348, 7, 18, 2.22, 0.99, 4);
INSERT INTO public.price VALUES (349, 7, 19, 3.87, 1.95, 6);
INSERT INTO public.price VALUES (350, 7, 20, 1.26, 0.65, 2);
INSERT INTO public.price VALUES (351, 7, 21, 1.8, 1.1, 3);
INSERT INTO public.price VALUES (352, 7, 22, 1.91, 1, 3.4);
INSERT INTO public.price VALUES (353, 7, 23, 1.72, 1, 3);
INSERT INTO public.price VALUES (354, 7, 24, 14.9, 10, 18);
INSERT INTO public.price VALUES (355, 7, 25, 2.7, 1.67, 4);
INSERT INTO public.price VALUES (356, 7, 26, 3.18, 1.65, 4);
INSERT INTO public.price VALUES (357, 7, 27, 10.3, 9.5, 12.3);
INSERT INTO public.price VALUES (358, 7, 28, 3.1, 3, 3.8);
INSERT INTO public.price VALUES (359, 7, 29, 70.25, 60, 71);
INSERT INTO public.price VALUES (360, 7, 30, 6.95, 5, 10);
INSERT INTO public.price VALUES (361, 7, 31, 1.2, 1.05, 1.99);
INSERT INTO public.price VALUES (362, 7, 32, 55.2, 45, 60);
INSERT INTO public.price VALUES (363, 7, 33, 1.92, 1.81, 2.1);
INSERT INTO public.price VALUES (364, 7, 34, 32490, 29000, 40000);
INSERT INTO public.price VALUES (365, 7, 35, 34061.67, 30590, 45000);
INSERT INTO public.price VALUES (366, 7, 36, 104.95, 68, 236.79);
INSERT INTO public.price VALUES (367, 7, 37, 24.2, 15, 26.99);
INSERT INTO public.price VALUES (368, 7, 38, 19.22, 12, 30);
INSERT INTO public.price VALUES (369, 7, 39, 42.28, 25, 65);
INSERT INTO public.price VALUES (370, 7, 40, 27.94, 16, 42);
INSERT INTO public.price VALUES (371, 7, 41, 16.9, 15, 18.4);
INSERT INTO public.price VALUES (372, 7, 42, 316.21, 228, 500);
INSERT INTO public.price VALUES (373, 7, 43, 8742.8, 4800, 17000);
INSERT INTO public.price VALUES (374, 7, 44, 77.86, 48, 110);
INSERT INTO public.price VALUES (375, 7, 45, 30.44, 20, 48);
INSERT INTO public.price VALUES (376, 7, 46, 72.57, 45, 120);
INSERT INTO public.price VALUES (377, 7, 47, 93.9, 69, 150);
INSERT INTO public.price VALUES (378, 7, 48, 969.24, 835, 1200);
INSERT INTO public.price VALUES (379, 7, 49, 798.85, 700, 1000);
INSERT INTO public.price VALUES (380, 7, 50, 1739.83, 1500, 2500);
INSERT INTO public.price VALUES (381, 7, 51, 1276.55, 1100, 1800);
INSERT INTO public.price VALUES (382, 7, 52, 7104.13, 5900, 10000);
INSERT INTO public.price VALUES (383, 7, 53, 4349.66, 3900, 7000);
INSERT INTO public.price VALUES (384, 7, 54, 2890, 0, 0);
INSERT INTO public.price VALUES (385, 7, 55, 3.05, 0.85, 4.6);
INSERT INTO public.price VALUES (386, 8, 1, 10, 8.5, 20);
INSERT INTO public.price VALUES (387, 8, 2, 75, 55, 100);
INSERT INTO public.price VALUES (388, 8, 3, 7.66, 7, 10);
INSERT INTO public.price VALUES (389, 8, 4, 6, 3, 8);
INSERT INTO public.price VALUES (390, 8, 5, 6.5, 3, 8.33);
INSERT INTO public.price VALUES (391, 8, 6, 4.14, 2, 8);
INSERT INTO public.price VALUES (392, 8, 7, 2.37, 1.5, 3.5);
INSERT INTO public.price VALUES (393, 8, 8, 1.63, 1, 5);
INSERT INTO public.price VALUES (394, 8, 9, 1.05, 0.75, 1.4);
INSERT INTO public.price VALUES (395, 8, 10, 2.12, 1.09, 5.25);
INSERT INTO public.price VALUES (396, 8, 11, 1.7, 1.1, 2.59);
INSERT INTO public.price VALUES (397, 8, 12, 2.8, 1.8, 3.72);
INSERT INTO public.price VALUES (398, 8, 13, 7.53, 4.41, 16);
INSERT INTO public.price VALUES (399, 8, 14, 10.17, 4.41, 13);
INSERT INTO public.price VALUES (400, 8, 15, 18.01, 11, 51.95);
INSERT INTO public.price VALUES (401, 8, 16, 2.26, 0.99, 4);
INSERT INTO public.price VALUES (402, 8, 17, 1.63, 1.45, 2);
INSERT INTO public.price VALUES (403, 8, 18, 1.55, 1, 3);
INSERT INTO public.price VALUES (404, 8, 19, 3.28, 1.98, 5.49);
INSERT INTO public.price VALUES (405, 8, 20, 0.87, 0.59, 2);
INSERT INTO public.price VALUES (406, 8, 21, 1.28, 1, 2);
INSERT INTO public.price VALUES (407, 8, 22, 1.6, 1, 2.79);
INSERT INTO public.price VALUES (408, 8, 23, 1.17, 0.5, 2.5);
INSERT INTO public.price VALUES (409, 8, 24, 13, 10, 20);
INSERT INTO public.price VALUES (410, 8, 25, 2.55, 1.52, 3.8);
INSERT INTO public.price VALUES (411, 8, 26, 3.04, 1.7, 4);
INSERT INTO public.price VALUES (412, 8, 27, 9.7, 8.9, 10.2);
INSERT INTO public.price VALUES (413, 8, 28, 3.2, 3, 3.2);
INSERT INTO public.price VALUES (414, 8, 29, 54, 40, 54);
INSERT INTO public.price VALUES (415, 8, 30, 5.9, 3.9, 8.5);
INSERT INTO public.price VALUES (416, 8, 31, 1.48, 1, 2);
INSERT INTO public.price VALUES (417, 8, 32, 45, 44.4, 100);
INSERT INTO public.price VALUES (418, 8, 33, 2.01, 1.81, 2.25);
INSERT INTO public.price VALUES (419, 8, 34, 22000, 22000, 28000);
INSERT INTO public.price VALUES (420, 8, 35, 19000, 19000, 28000);
INSERT INTO public.price VALUES (421, 8, 36, 71.93, 46.36, 355.45);
INSERT INTO public.price VALUES (422, 8, 37, 26.99, 25, 29);
INSERT INTO public.price VALUES (423, 8, 38, 24.24, 19.9, 35);
INSERT INTO public.price VALUES (424, 8, 39, 49.9, 0, 0);
INSERT INTO public.price VALUES (425, 8, 40, 20, 0, 0);
INSERT INTO public.price VALUES (426, 8, 41, 15.45, 14, 18);
INSERT INTO public.price VALUES (427, 8, 42, 100, 100, 295);
INSERT INTO public.price VALUES (428, 8, 43, 4000, 4000, 4000);
INSERT INTO public.price VALUES (429, 8, 44, 78.75, 35, 105);
INSERT INTO public.price VALUES (430, 8, 45, 10, 10, 60);
INSERT INTO public.price VALUES (431, 8, 46, 80.72, 60, 120);
INSERT INTO public.price VALUES (432, 8, 47, 97.5, 90, 100);
INSERT INTO public.price VALUES (433, 8, 48, 686.67, 630, 780);
INSERT INTO public.price VALUES (434, 8, 49, 556.67, 450, 700);
INSERT INTO public.price VALUES (435, 8, 50, 1100, 900, 1300);
INSERT INTO public.price VALUES (436, 8, 51, 946.33, 800, 1039);
INSERT INTO public.price VALUES (437, 8, 52, 2836, 0, 0);
INSERT INTO public.price VALUES (438, 8, 53, 0, 0, 0);
INSERT INTO public.price VALUES (439, 8, 54, 0, 0, 0);
INSERT INTO public.price VALUES (440, 8, 55, 3.03, 1.5, 4);
INSERT INTO public.price VALUES (441, 9, 1, 12, 10, 20);
INSERT INTO public.price VALUES (442, 9, 2, 70, 60, 150);
INSERT INTO public.price VALUES (443, 9, 3, 8.5, 8, 10);
INSERT INTO public.price VALUES (444, 9, 4, 7.25, 4, 8.5);
INSERT INTO public.price VALUES (445, 9, 5, 6, 5, 9);
INSERT INTO public.price VALUES (446, 9, 6, 3.28, 2, 5);
INSERT INTO public.price VALUES (447, 9, 7, 2.2, 1.5, 4);
INSERT INTO public.price VALUES (448, 9, 8, 1.92, 1, 4);
INSERT INTO public.price VALUES (449, 9, 9, 0.9, 0.69, 1.9);
INSERT INTO public.price VALUES (450, 9, 10, 2.04, 1, 3.25);
INSERT INTO public.price VALUES (451, 9, 11, 2.04, 0.8, 3);
INSERT INTO public.price VALUES (452, 9, 12, 2.27, 1.2, 3.47);
INSERT INTO public.price VALUES (453, 9, 13, 7.04, 3, 12);
INSERT INTO public.price VALUES (454, 9, 14, 9.98, 4.5, 14);
INSERT INTO public.price VALUES (455, 9, 15, 9.5, 5, 30);
INSERT INTO public.price VALUES (456, 9, 16, 1.85, 0.6, 3);
INSERT INTO public.price VALUES (457, 9, 17, 1.5, 0.78, 4);
INSERT INTO public.price VALUES (458, 9, 18, 1.96, 1, 4);
INSERT INTO public.price VALUES (459, 9, 19, 3.1, 1, 4);
INSERT INTO public.price VALUES (460, 9, 20, 0.67, 0.45, 2);
INSERT INTO public.price VALUES (461, 9, 21, 1.35, 1.05, 1.7);
INSERT INTO public.price VALUES (462, 9, 22, 1.5, 1, 2);
INSERT INTO public.price VALUES (463, 9, 23, 1.4, 1, 2.45);
INSERT INTO public.price VALUES (464, 9, 24, 11, 8, 17);
INSERT INTO public.price VALUES (465, 9, 25, 2.56, 1.67, 5.88);
INSERT INTO public.price VALUES (466, 9, 26, 2.87, 2, 4);
INSERT INTO public.price VALUES (467, 9, 27, 9.7, 9.5, 15);
INSERT INTO public.price VALUES (468, 9, 28, 3.4, 3.4, 4);
INSERT INTO public.price VALUES (469, 9, 29, 58, 56, 59.8);
INSERT INTO public.price VALUES (470, 9, 30, 5, 4.3, 20);
INSERT INTO public.price VALUES (471, 9, 31, 1.52, 1.05, 2);
INSERT INTO public.price VALUES (472, 9, 32, 44.4, 29, 62.4);
INSERT INTO public.price VALUES (473, 9, 33, 1.99, 1.81, 2.22);
INSERT INTO public.price VALUES (474, 9, 34, 28245, 28000, 28490);
INSERT INTO public.price VALUES (475, 9, 35, 29549.33, 27000, 29000);
INSERT INTO public.price VALUES (476, 9, 36, 218.87, 64, 370);
INSERT INTO public.price VALUES (477, 9, 37, 25.55, 15, 26.99);
INSERT INTO public.price VALUES (478, 9, 38, 17.5, 15, 34);
INSERT INTO public.price VALUES (479, 9, 39, 37.45, 24.9, 50);
INSERT INTO public.price VALUES (480, 9, 40, 20.5, 0, 0);
INSERT INTO public.price VALUES (481, 9, 41, 15, 12, 15);
INSERT INTO public.price VALUES (482, 9, 42, 272.5, 200, 350);
INSERT INTO public.price VALUES (483, 9, 43, 3500, 3000, 5200);
INSERT INTO public.price VALUES (484, 9, 44, 55, 20, 120);
INSERT INTO public.price VALUES (485, 9, 45, 24, 15, 40);
INSERT INTO public.price VALUES (486, 9, 46, 76.67, 51, 140);
INSERT INTO public.price VALUES (487, 9, 47, 92.8, 50, 250);
INSERT INTO public.price VALUES (488, 9, 48, 620, 550, 750);
INSERT INTO public.price VALUES (489, 9, 49, 550, 450, 600);
INSERT INTO public.price VALUES (490, 9, 50, 1118.67, 956, 1200);
INSERT INTO public.price VALUES (491, 9, 51, 880, 740, 1000);
INSERT INTO public.price VALUES (492, 9, 52, 3333.33, 2500, 4000);
INSERT INTO public.price VALUES (493, 9, 53, 1900, 1200, 2500);
INSERT INTO public.price VALUES (494, 9, 54, 2386.67, 0, 0);
INSERT INTO public.price VALUES (495, 9, 55, 2.95, 0.8, 5);


--
-- TOC entry 4047 (class 0 OID 22433)
-- Dependencies: 209
-- Data for Name: subcategory; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subcategory VALUES (1, 'Meal, Inexpensive Restaurant', 1);
INSERT INTO public.subcategory VALUES (2, 'Meal for 2 People, Mid-range Restaurant, Three-course', 1);
INSERT INTO public.subcategory VALUES (3, 'McMeal at McDonalds (or Equivalent Combo Meal)', 1);
INSERT INTO public.subcategory VALUES (4, 'Domestic Beer (0.5 liter draught)', 1);
INSERT INTO public.subcategory VALUES (5, 'Imported Beer (0.33 liter bottle)', 1);
INSERT INTO public.subcategory VALUES (6, 'Cappuccino (regular)', 1);
INSERT INTO public.subcategory VALUES (7, 'Coke/Pepsi (0.33 liter bottle)', 1);
INSERT INTO public.subcategory VALUES (8, 'Water (0.33 liter bottle)', 1);
INSERT INTO public.subcategory VALUES (9, 'Milk (regular), (1 liter)', 2);
INSERT INTO public.subcategory VALUES (10, 'Loaf of Fresh White Bread (500g)', 2);
INSERT INTO public.subcategory VALUES (11, 'Rice (white), (1kg)', 2);
INSERT INTO public.subcategory VALUES (12, 'Eggs (regular) (12)', 2);
INSERT INTO public.subcategory VALUES (13, 'Local Cheese (1kg)', 2);
INSERT INTO public.subcategory VALUES (14, 'Chicken Fillets (1kg)', 2);
INSERT INTO public.subcategory VALUES (15, 'Beef Round (1kg) (or Equivalent Back Leg Red Meat)', 2);
INSERT INTO public.subcategory VALUES (16, 'Apples (1kg)', 2);
INSERT INTO public.subcategory VALUES (17, 'Banana (1kg)', 2);
INSERT INTO public.subcategory VALUES (18, 'Oranges (1kg)', 2);
INSERT INTO public.subcategory VALUES (19, 'Tomato (1kg)', 2);
INSERT INTO public.subcategory VALUES (20, 'Potato (1kg)', 2);
INSERT INTO public.subcategory VALUES (21, 'Onion (1kg)', 2);
INSERT INTO public.subcategory VALUES (22, 'Lettuce (1 head)', 2);
INSERT INTO public.subcategory VALUES (23, 'Water (1.5 liter bottle)', 2);
INSERT INTO public.subcategory VALUES (24, 'Bottle of Wine (Mid-Range)', 2);
INSERT INTO public.subcategory VALUES (25, 'Domestic Beer (0.5 liter bottle)', 2);
INSERT INTO public.subcategory VALUES (26, 'Imported Beer (0.33 liter bottle)', 2);
INSERT INTO public.subcategory VALUES (27, 'Cigarettes 20 Pack (Marlboro)', 2);
INSERT INTO public.subcategory VALUES (28, 'One-way Ticket (Local Transport)', 3);
INSERT INTO public.subcategory VALUES (29, 'Monthly Pass (Regular Price)', 3);
INSERT INTO public.subcategory VALUES (30, 'Taxi Start (Normal Tariff)', 3);
INSERT INTO public.subcategory VALUES (31, 'Taxi 1km (Normal Tariff)', 3);
INSERT INTO public.subcategory VALUES (32, 'Taxi 1hour Waiting (Normal Tariff)', 3);
INSERT INTO public.subcategory VALUES (33, 'Gasoline (1 liter)', 3);
INSERT INTO public.subcategory VALUES (34, 'Volkswagen Golf 1.4 90 KW Trendline (Or Equivalent New Car)', 3);
INSERT INTO public.subcategory VALUES (35, 'Toyota Corolla Sedan 1.6l 97kW Comfort (Or Equivalent New Car)', 3);
INSERT INTO public.subcategory VALUES (36, 'Basic (Electricity, Heating, Cooling, Water, Garbage) for 85m2 Apartment', 4);
INSERT INTO public.subcategory VALUES (37, 'Mobile Phone Monthly Plan with Calls and 10GB+ Data', 4);
INSERT INTO public.subcategory VALUES (38, 'Internet (60 Mbps or More, Unlimited Data, Cable/ADSL)', 4);
INSERT INTO public.subcategory VALUES (39, 'Fitness Club, Monthly Fee for 1 Adult', 5);
INSERT INTO public.subcategory VALUES (40, 'Tennis Court Rent (1 Hour on Weekend)', 5);
INSERT INTO public.subcategory VALUES (41, 'Cinema, International Release, 1 Seat', 5);
INSERT INTO public.subcategory VALUES (42, 'Preschool (or Kindergarten), Full Day, Private, Monthly for 1 Child', 6);
INSERT INTO public.subcategory VALUES (43, 'International Primary School, Yearly for 1 Child', 6);
INSERT INTO public.subcategory VALUES (44, '1 Pair of Jeans (Levis 501 Or Similar)', 7);
INSERT INTO public.subcategory VALUES (45, '1 Summer Dress in a Chain Store (Zara, H&M, ...)', 7);
INSERT INTO public.subcategory VALUES (46, '1 Pair of Nike Running Shoes (Mid-Range)', 7);
INSERT INTO public.subcategory VALUES (47, '1 Pair of Men Leather Business Shoes', 7);
INSERT INTO public.subcategory VALUES (48, 'Apartment (1 bedroom) in City Centre', 8);
INSERT INTO public.subcategory VALUES (49, 'Apartment (1 bedroom) Outside of Centre', 8);
INSERT INTO public.subcategory VALUES (50, 'Apartment (3 bedrooms) in City Centre', 8);
INSERT INTO public.subcategory VALUES (51, 'Apartment (3 bedrooms) Outside of Centre', 8);
INSERT INTO public.subcategory VALUES (52, 'Price per Square Meter to Buy Apartment in City Centre', 9);
INSERT INTO public.subcategory VALUES (53, 'Price per Square Meter to Buy Apartment Outside of Centre', 9);
INSERT INTO public.subcategory VALUES (54, 'Average Monthly Net Salary (After Tax)', 10);
INSERT INTO public.subcategory VALUES (55, 'Mortgage Interest Rate in Percentages (%), Yearly, for 20 Years Fixed-Rate', 10);


--
-- TOC entry 4062 (class 0 OID 0)
-- Dependencies: 206
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.category_id_seq', 10, true);


--
-- TOC entry 4063 (class 0 OID 0)
-- Dependencies: 204
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.city_id_seq', 9, true);


--
-- TOC entry 4064 (class 0 OID 0)
-- Dependencies: 202
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.country_id_seq', 3, true);


--
-- TOC entry 4065 (class 0 OID 0)
-- Dependencies: 200
-- Name: lifestyle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lifestyle_id_seq', 10, true);


--
-- TOC entry 4066 (class 0 OID 0)
-- Dependencies: 210
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.price_id_seq', 495, true);


--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 208
-- Name: subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subcategory_id_seq', 55, true);


--
-- TOC entry 3899 (class 2606 OID 22430)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3897 (class 2606 OID 22417)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 3895 (class 2606 OID 22409)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 3893 (class 2606 OID 22401)
-- Name: lifestyle lifestyle_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lifestyle
    ADD CONSTRAINT lifestyle_pkey PRIMARY KEY (id);


--
-- TOC entry 3903 (class 2606 OID 22451)
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);


--
-- TOC entry 3901 (class 2606 OID 22438)
-- Name: subcategory subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_pkey PRIMARY KEY (id);


--
-- TOC entry 3904 (class 2606 OID 22418)
-- Name: city city_country_id_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_country_id_fk_fkey FOREIGN KEY (country_id_fk) REFERENCES public.country(id) ON UPDATE CASCADE;


--
-- TOC entry 3906 (class 2606 OID 22452)
-- Name: price price_city_id_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_city_id_fk_fkey FOREIGN KEY (city_id_fk) REFERENCES public.city(id) ON UPDATE CASCADE;


--
-- TOC entry 3907 (class 2606 OID 22457)
-- Name: price price_subcategory_id_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_subcategory_id_fk_fkey FOREIGN KEY (subcategory_id_fk) REFERENCES public.subcategory(id) ON UPDATE CASCADE;


--
-- TOC entry 3905 (class 2606 OID 22439)
-- Name: subcategory subcategory_category_id_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategory
    ADD CONSTRAINT subcategory_category_id_fk_fkey FOREIGN KEY (category_id_fk) REFERENCES public.category(id) ON UPDATE CASCADE;


-- Completed on 2024-04-29 01:15:44 EEST

--
-- PostgreSQL database dump complete
--

