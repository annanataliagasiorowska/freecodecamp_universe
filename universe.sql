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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_virgosupercluster boolean,
    age_in_millions_of_years integer,
    diameter_in_parsecs numeric NOT NULL,
    shape character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_type_id integer NOT NULL,
    name character varying(30),
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_type_id;


--
-- Name: minerals; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.minerals (
    mineral_id integer NOT NULL,
    name character varying(30),
    valuable_raw_material boolean
);


ALTER TABLE public.minerals OWNER TO freecodecamp;

--
-- Name: minerals_mineral_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.minerals_mineral_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minerals_mineral_id_seq OWNER TO freecodecamp;

--
-- Name: minerals_mineral_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.minerals_mineral_id_seq OWNED BY public.minerals.mineral_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer,
    have_atmosphere boolean,
    year_discovered integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
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
    planet_id integer NOT NULL,
    name character varying(30),
    has_life boolean,
    star_id integer,
    light_years_from_earth double precision
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_minerals; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_minerals (
    planet_id integer NOT NULL,
    mineral_id integer NOT NULL
);


ALTER TABLE public.planet_minerals OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
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
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer,
    age_in_million_of_years integer,
    stellar_classification character varying(10) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
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
-- Name: galaxy_types galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: minerals mineral_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minerals ALTER COLUMN mineral_id SET DEFAULT nextval('public.minerals_mineral_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 13500, 30000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda M31', true, 10000, 61000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'IC 1101', false, 13800, 97000, 'Elliptical');
INSERT INTO public.galaxy VALUES (4, 'Messier 87 M87', true, 13800, 20000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool M51', true, 10000, 23000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A NGC5128', false, 10000, 16000, 'Lenticular');
INSERT INTO public.galaxy VALUES (7, 'Triangulum M33', true, 10000, 19500, 'Spiral');
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', false, 13000, 3500, 'Irregular');
INSERT INTO public.galaxy VALUES (9, 'Small Magellanic Cloud', false, 12000, 2000, 'Irregular');
INSERT INTO public.galaxy VALUES (10, 'NGC 6822', false, 10000, 3600, 'Irregular');


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: minerals; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.minerals VALUES (1, 'Iron', true);
INSERT INTO public.minerals VALUES (2, 'Silicon', true);
INSERT INTO public.minerals VALUES (3, 'Nickel', true);
INSERT INTO public.minerals VALUES (4, 'Magnesium', false);
INSERT INTO public.minerals VALUES (5, 'Oxygen', false);
INSERT INTO public.minerals VALUES (6, 'Carbon', false);
INSERT INTO public.minerals VALUES (7, 'Calcium', false);
INSERT INTO public.minerals VALUES (8, 'Sulfur', false);
INSERT INTO public.minerals VALUES (9, 'Hydrogene', true);
INSERT INTO public.minerals VALUES (10, 'Helium', true);
INSERT INTO public.minerals VALUES (11, 'Methane', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Io', 5, true, 1610);
INSERT INTO public.moon VALUES (3, 'Europa', 5, true, 1610);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, true, 1610);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, true, 1610);
INSERT INTO public.moon VALUES (6, 'Titan', 6, true, 1655);
INSERT INTO public.moon VALUES (7, 'Rhea', 6, true, 1672);
INSERT INTO public.moon VALUES (8, 'Iapetus', 6, true, 1671);
INSERT INTO public.moon VALUES (9, 'Dione', 6, true, 1684);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, true, 1684);
INSERT INTO public.moon VALUES (11, 'Miranda', 7, true, 1948);
INSERT INTO public.moon VALUES (12, 'Ariel', 7, true, 1851);
INSERT INTO public.moon VALUES (13, 'Umbriel', 7, true, 1851);
INSERT INTO public.moon VALUES (14, 'Triton', 8, true, 1846);
INSERT INTO public.moon VALUES (15, 'Nereid', 8, false, 1949);
INSERT INTO public.moon VALUES (16, 'Phobos', 4, false, 1877);
INSERT INTO public.moon VALUES (17, 'Deimos', 4, false, 1877);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, true, 1787);
INSERT INTO public.moon VALUES (19, 'Hi iaka', 17, false, 2005);
INSERT INTO public.moon VALUES (20, 'Namaka', 17, false, 2005);
INSERT INTO public.moon VALUES (21, 'MK2', 18, false, 2016);
INSERT INTO public.moon VALUES (22, 'Dysnomia', 19, false, 2005);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', false, 14, 4.24e-05);
INSERT INTO public.planet VALUES (3, 'Venus', false, 14, 0.000261);
INSERT INTO public.planet VALUES (4, 'Earth', true, 14, 0);
INSERT INTO public.planet VALUES (5, 'Mars', false, 14, 0.0004247);
INSERT INTO public.planet VALUES (6, 'Jupiter', false, 14, 0.0008247);
INSERT INTO public.planet VALUES (7, 'Saturn', false, 14, 0.001429);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 14, 0.002688);
INSERT INTO public.planet VALUES (9, 'Neptune', false, 14, 0.002776);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', NULL, 7, 4.24);
INSERT INTO public.planet VALUES (11, 'NGC 206 Planet', NULL, 1, 2.5);
INSERT INTO public.planet VALUES (12, 'Cepheid V1 Planet', NULL, 2, 2.5);
INSERT INTO public.planet VALUES (13, 'HR 8799 Planet', NULL, 3, 129);
INSERT INTO public.planet VALUES (14, 'Eta Carinae Planet', NULL, 4, 7500);
INSERT INTO public.planet VALUES (15, 'Denebolaa Planet', NULL, 5, 36);
INSERT INTO public.planet VALUES (16, 'Sirius Planet', NULL, 8, 8.6);
INSERT INTO public.planet VALUES (17, 'Pluto', false, 14, 0.000628);
INSERT INTO public.planet VALUES (18, 'Makemake', false, 14, 1.893e-06);
INSERT INTO public.planet VALUES (19, 'Eris', false, 14, 1.427e-05);


--
-- Data for Name: planet_minerals; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_minerals VALUES (2, 1);
INSERT INTO public.planet_minerals VALUES (2, 2);
INSERT INTO public.planet_minerals VALUES (2, 5);
INSERT INTO public.planet_minerals VALUES (3, 6);
INSERT INTO public.planet_minerals VALUES (3, 2);
INSERT INTO public.planet_minerals VALUES (3, 8);
INSERT INTO public.planet_minerals VALUES (4, 1);
INSERT INTO public.planet_minerals VALUES (4, 5);
INSERT INTO public.planet_minerals VALUES (4, 2);
INSERT INTO public.planet_minerals VALUES (4, 4);
INSERT INTO public.planet_minerals VALUES (4, 6);
INSERT INTO public.planet_minerals VALUES (4, 8);
INSERT INTO public.planet_minerals VALUES (4, 3);
INSERT INTO public.planet_minerals VALUES (4, 7);
INSERT INTO public.planet_minerals VALUES (5, 1);
INSERT INTO public.planet_minerals VALUES (5, 2);
INSERT INTO public.planet_minerals VALUES (5, 8);
INSERT INTO public.planet_minerals VALUES (5, 4);
INSERT INTO public.planet_minerals VALUES (6, 9);
INSERT INTO public.planet_minerals VALUES (6, 10);
INSERT INTO public.planet_minerals VALUES (7, 9);
INSERT INTO public.planet_minerals VALUES (7, 10);
INSERT INTO public.planet_minerals VALUES (8, 10);
INSERT INTO public.planet_minerals VALUES (8, 9);
INSERT INTO public.planet_minerals VALUES (15, 5);
INSERT INTO public.planet_minerals VALUES (15, 6);
INSERT INTO public.planet_minerals VALUES (15, 2);
INSERT INTO public.planet_minerals VALUES (16, 6);
INSERT INTO public.planet_minerals VALUES (16, 2);
INSERT INTO public.planet_minerals VALUES (16, 1);
INSERT INTO public.planet_minerals VALUES (9, 10);
INSERT INTO public.planet_minerals VALUES (8, 11);
INSERT INTO public.planet_minerals VALUES (9, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'NGC 206 Star', 2, 4, '08V');
INSERT INTO public.star VALUES (2, 'Cepheid V1', 2, 10, 'F8Ib');
INSERT INTO public.star VALUES (3, 'Peacock HR 8799', 1, 30, 'A5V');
INSERT INTO public.star VALUES (4, 'Eta Carinae', 1, 3, 'B1la');
INSERT INTO public.star VALUES (5, 'Denebola', 1, 300, 'A3V');
INSERT INTO public.star VALUES (6, 'Sadr', 1, 12, 'F8lb');
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1, 4850, 'M5.5Ve');
INSERT INTO public.star VALUES (8, 'Sirius', 1, 225, 'A1V');
INSERT INTO public.star VALUES (9, 'NGC 604 Star', 7, 10, 'O2lll');
INSERT INTO public.star VALUES (10, 'R136a1', 8, 1, 'WN5h');
INSERT INTO public.star VALUES (11, 'NGC 6822 V1', 10, 11, 'F8lb');
INSERT INTO public.star VALUES (12, 'HD 5980', 9, 3, 'WN6h');
INSERT INTO public.star VALUES (13, 'SN 1987A', 8, 11, 'B3I');
INSERT INTO public.star VALUES (14, 'Sun', 1, 4600, 'G2V');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 1, false);


--
-- Name: minerals_mineral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.minerals_mineral_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: planet_minerals compound_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_minerals
    ADD CONSTRAINT compound_pk PRIMARY KEY (planet_id, mineral_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: minerals minerals_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minerals
    ADD CONSTRAINT minerals_pkey PRIMARY KEY (mineral_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: minerals unique_mineral_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minerals
    ADD CONSTRAINT unique_mineral_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_minerals planet_minerals_mineral_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_minerals
    ADD CONSTRAINT planet_minerals_mineral_id_fkey FOREIGN KEY (mineral_id) REFERENCES public.minerals(mineral_id);


--
-- Name: planet_minerals planet_minerals_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_minerals
    ADD CONSTRAINT planet_minerals_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

