--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying NOT NULL,
    no_of_stars integer,
    no_of_solar_system integer,
    has_earth boolean,
    star_in_galaxy character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    galaxy_cluster_id bigint NOT NULL,
    name character varying NOT NULL,
    no_of_galaxy integer NOT NULL
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    name character varying NOT NULL,
    no_of_human integer,
    no_of_humans_landed integer,
    has_humans boolean NOT NULL,
    moon_around_planet character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying NOT NULL,
    no_of_moon integer,
    no_of_human integer,
    has_humans boolean,
    planet_around_star character varying(30),
    moon_around_planet character varying(30)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying NOT NULL,
    no_of_planet integer,
    away_from_earth numeric,
    discovered_year integer,
    discovered_by text,
    star_in_galaxy character varying(30),
    planet_around_star character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 900000, 16853, true, 'Sun');
INSERT INTO public.galaxy VALUES (2, 'Msvsy', 906000, 16853, false, 'vsfn');
INSERT INTO public.galaxy VALUES (3, 'dssdf', 65556, 54565, false, 'sfsf');
INSERT INTO public.galaxy VALUES (4, 'sdcs', 556, 63, false, 'fvd');
INSERT INTO public.galaxy VALUES (5, 'fdvgs', 525355, 5424255, false, 'dvdsdsvfv');
INSERT INTO public.galaxy VALUES (6, 'fdfvdfvvf', 542245, 428, false, 'dsvvv');


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES (1, 'sffd', 625);
INSERT INTO public.galaxy_cluster VALUES (2, 'potato', 26355352);
INSERT INTO public.galaxy_cluster VALUES (3, 'djsk', 5255);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 0, 12, false, NULL);
INSERT INTO public.moon VALUES (2, 'svfdv', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (3, 'fvsfv', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (4, 'sfvfdvs', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (5, 'svfdse', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (6, 'fvbrsd', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (7, 'dfvwq', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (8, 'hjdiksnj', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (9, 'prasun', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (10, 'dacfew', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (11, 'svfvdsv52', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (12, 'vcsdqwer', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (13, 'jhsdunsfd6', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (14, 'jdujsd', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (15, 'jsundm62', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (16, 'hsdij', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (17, 'nsfdjunfsfs95', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (18, 'jsfnsfh17', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (19, 'hbucjns', 0, 0, false, NULL);
INSERT INTO public.moon VALUES (20, 'yeudhhbc52', 0, 0, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 1, 8000, true, NULL, 'moon');
INSERT INTO public.planet VALUES (2, 'sdcc', 5, 0, false, NULL, 'dvsvds');
INSERT INTO public.planet VALUES (3, 'dsvs', 25, 0, false, NULL, 'sdvds');
INSERT INTO public.planet VALUES (4, 'dsds', 4, 0, false, NULL, 'fdbfd');
INSERT INTO public.planet VALUES (5, 'dfvsdf', 5, 0, false, NULL, 'fdvdfb');
INSERT INTO public.planet VALUES (6, 'fddsfs', 62, 0, false, NULL, 'fdvdfsv');
INSERT INTO public.planet VALUES (7, 'dfvdffds', 52, 0, false, NULL, 'fdvdfbbdfbf');
INSERT INTO public.planet VALUES (8, 'fdgvdfb', 5, 0, false, NULL, 'dfbdfb');
INSERT INTO public.planet VALUES (9, 'dfbgfdbfg', 652, 0, false, NULL, 'dfbgdbdg');
INSERT INTO public.planet VALUES (10, 'dfvdfgbghd', 52, 0, false, NULL, 'hjjunij');
INSERT INTO public.planet VALUES (11, 'dyyuuiffds', 52, 0, false, NULL, 'fdvuotiubf');
INSERT INTO public.planet VALUES (12, 'fdgvddgbfgnfb', 5, 0, false, NULL, 'jnnhjnhdfbdfb');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 8, 8, 1, 'vdsfv', NULL, 'earth');
INSERT INTO public.star VALUES (2, 'dsvdss', 7, 5, 4, 'dscfffd', NULL, 'imnj');
INSERT INTO public.star VALUES (3, 'vsdvun', 8, 8, 1, 'vdssvsddvv', NULL, 'eadscth');
INSERT INTO public.star VALUES (4, 'drdfvdss', 7, 5, 4, 'dssdffd', NULL, 'sdvmnj');
INSERT INTO public.star VALUES (5, 'dsfsdf', 5, 8, 1965, 'fdgsw', NULL, 'dfgfdg');
INSERT INTO public.star VALUES (6, 'dscscasd', 5, 6, 1956, 'fdvfdv', NULL, 'vdfsasfv');


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_star_in_galaxy_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_in_galaxy_key UNIQUE (star_in_galaxy);


--
-- Name: moon moon_moon_around_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_around_planet_key UNIQUE (moon_around_planet);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_moon_around_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_around_planet_key UNIQUE (moon_around_planet);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_around_star_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_around_star_key UNIQUE (planet_around_star);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_planet_around_star_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_around_star_key UNIQUE (planet_around_star);


--
-- Name: star star_star_in_galaxy_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_in_galaxy_key UNIQUE (star_in_galaxy);


--
-- Name: star galaxy_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_star_fk FOREIGN KEY (star_in_galaxy) REFERENCES public.galaxy(star_in_galaxy);


--
-- Name: moon planet_moon_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_moon_fk FOREIGN KEY (moon_around_planet) REFERENCES public.planet(moon_around_planet);


--
-- Name: planet star_planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_planet_fk FOREIGN KEY (planet_around_star) REFERENCES public.star(planet_around_star);


--
-- PostgreSQL database dump complete
--

