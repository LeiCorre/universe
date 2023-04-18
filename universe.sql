--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    distance_across_in_lightyears numeric(38,5),
    mass_in_solar_mass character varying,
    constellation text,
    galaxy_type character varying(50)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    days_to_orbit_planet numeric(10,3),
    has_known_water character varying
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_is_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_is_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_is_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_is_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_is_seq OWNED BY public.moon.moon_id;


--
-- Name: other_space_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_space_object (
    other_space_object_id integer NOT NULL,
    type character varying(55),
    name character varying(50),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.other_space_object OWNER TO freecodecamp;

--
-- Name: other_space_object_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_space_object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_space_object_object_id_seq OWNER TO freecodecamp;

--
-- Name: other_space_object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_space_object_object_id_seq OWNED BY public.other_space_object.other_space_object_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    has_one_moon_or_more boolean,
    potentially_habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(30) NOT NULL,
    age character varying(50),
    galaxy_id integer,
    how_many_known_planets integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_is_seq'::regclass);


--
-- Name: other_space_object other_space_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_space_object ALTER COLUMN other_space_object_id SET DEFAULT nextval('public.other_space_object_object_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105700.00000, '1.2 Trillion to 1.9 Trillion', 'Sagittarius', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 14000.00000, '200 Billion to 300 Billion', 'Both Dorado & Mensa', 'Irregular');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 7000.00000, '7 Billion', 'Both Tucana & Hydrus', 'Dwarf Irregular');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000.00000, '800 Billion', 'Virgo', 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 220000.00000, '1 Trillion', 'Andromeda', 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 37000.00000, '50 Billion', 'Ursa Major', 'Starburst');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 27.000, 'Has known water');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.330, 'Suspected to have frozen water');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 1.250, 'Suspected to have frozen water');
INSERT INTO public.moon VALUES (4, 'Io', 5, 17.000, 'Thought to have no water');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.500, 'Suspected to have a salty ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.000, 'Has known water');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 17.000, 'Suspected to have a salty ocean');
INSERT INTO public.moon VALUES (8, 'Despina', 6, 0.333, 'Suspected to have water');
INSERT INTO public.moon VALUES (9, 'Galatea', 6, 0.412, 'Unknown');
INSERT INTO public.moon VALUES (10, 'Halimede', 6, 1879.000, 'Unknown');
INSERT INTO public.moon VALUES (11, 'Larissa', 6, 0.542, 'Unknown');
INSERT INTO public.moon VALUES (12, 'Hippocamp', 6, 0.958, 'Unknown');
INSERT INTO public.moon VALUES (13, 'Titan', 7, 16.000, 'Suspected to have water');
INSERT INTO public.moon VALUES (14, 'Enceladus', 7, 1.375, 'Suspected to have salty water');
INSERT INTO public.moon VALUES (15, 'Iapetus', 7, 79.000, 'Composed mostly of ice');
INSERT INTO public.moon VALUES (16, 'Mimas', 7, 0.958, 'Suspected to have a liquid ocean');
INSERT INTO public.moon VALUES (17, 'Dione', 7, 2.750, 'Suspected to have a liquid ocean');
INSERT INTO public.moon VALUES (18, 'Ariel', 8, 2.500, 'Believed to be composed of water and rock');
INSERT INTO public.moon VALUES (19, 'Oberon', 8, 13.000, 'Thought to be half ice water and half rock');
INSERT INTO public.moon VALUES (20, 'Titania', 8, 16.000, 'Beleived to have a subsurface liquid ocean');


--
-- Data for Name: other_space_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_space_object VALUES (1, 'Comet', 'Halleys Comet', 1);
INSERT INTO public.other_space_object VALUES (2, 'Comet McNaught', 'Comet', 1);
INSERT INTO public.other_space_object VALUES (3, '16 Psyche', 'Asteroid', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, true, true, 8);
INSERT INTO public.planet VALUES (2, 'Mars', 6779, true, false, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, true, false, 8);
INSERT INTO public.planet VALUES (6, 'Neptune', 49244, true, false, 8);
INSERT INTO public.planet VALUES (7, 'Saturn', 116460, true, false, 8);
INSERT INTO public.planet VALUES (8, 'Uranus', 50724, true, false, 8);
INSERT INTO public.planet VALUES (3, 'Venus', 12104, false, false, 8);
INSERT INTO public.planet VALUES (4, 'Mercury', 4879, false, false, 8);
INSERT INTO public.planet VALUES (9, 'Kepler-90i', 16838, false, false, 9);
INSERT INTO public.planet VALUES (10, 'Kepler-90g', 1669700, false, false, 9);
INSERT INTO public.planet VALUES (11, 'Kepler-90h', 144410, false, false, 9);
INSERT INTO public.planet VALUES (12, 'Kepler-90c', 15163, false, false, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Andromedae', '70 MYR', 5, 3);
INSERT INTO public.star VALUES (2, 'Beta Andromedae', 'Unknown', 5, 0);
INSERT INTO public.star VALUES (3, 'Upsilon Andromedae', '3.12 GYR', 5, 4);
INSERT INTO public.star VALUES (4, 'Canopus', '10 MYR', 1, 0);
INSERT INTO public.star VALUES (5, 'Sirius', '228 MYR', 1, 0);
INSERT INTO public.star VALUES (6, 'Antares', '11.01 MYR', 1, 0);
INSERT INTO public.star VALUES (7, 'Rigel', '8.005 MYR', 1, 14);
INSERT INTO public.star VALUES (8, 'Sun', '4.603 GYR', 1, 8);
INSERT INTO public.star VALUES (9, 'Kepler-90', '2 GYR', 1, 8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_is_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_is_seq', 20, true);


--
-- Name: other_space_object_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_space_object_object_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_space_object other_space_object_object_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_space_object
    ADD CONSTRAINT other_space_object_object_id_key UNIQUE (other_space_object_id);


--
-- Name: other_space_object other_space_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_space_object
    ADD CONSTRAINT other_space_object_pkey PRIMARY KEY (other_space_object_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: other_space_object other_space_object_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_space_object
    ADD CONSTRAINT other_space_object_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

