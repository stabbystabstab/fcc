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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(20),
    material character varying(20),
    diameter integer,
    star_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    description text,
    type character varying(20),
    galaxy_id integer NOT NULL,
    age numeric(4,2),
    smbh boolean,
    collision_course boolean
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
    name character varying(50) NOT NULL,
    description text,
    "position" integer,
    type character varying(20),
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    "position" integer,
    type character varying(20),
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    type character varying(20),
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'AAA1', 'iron', 1200, 2);
INSERT INTO public.asteroid VALUES (2, 'Danger Danger', 'iron', 3600, 1);
INSERT INTO public.asteroid VALUES (3, 'Dinosaur Killer', 'iron', 2121, 1);
INSERT INTO public.asteroid VALUES (4, 'Sky Explosion', 'ice', 200, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milkyway', 'Home to ''The Sun'' and planet Earth', 'SPIRAL', 1, 13.70, true, true);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Closest galaxy to Milkyway', 'SPIRAL', 2, 13.70, false, true);
INSERT INTO public.galaxy VALUES ('AA112', NULL, 'CLUSTER', 3, 11.00, false, false);
INSERT INTO public.galaxy VALUES ('AB113', 'visible from Earth', 'SPIRAL', 4, 12.50, false, false);
INSERT INTO public.galaxy VALUES ('AA122', NULL, 'CLUSTER', 5, 11.00, false, false);
INSERT INTO public.galaxy VALUES ('AB114', 'visible from Earth', 'SPIRAL', 6, 12.50, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '''The Moon''', 'Earth''s only moon', 1, 'ROCKY', 3);
INSERT INTO public.moon VALUES (2, 'Daemos', NULL, 1, 'ROCKY', 4);
INSERT INTO public.moon VALUES (3, 'Phoebe', NULL, 2, 'ROCKY', 4);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 1, 'ICY', 5);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 1, 'ICY', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 3, 'ICY', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 4, 'ICY', 5);
INSERT INTO public.moon VALUES (8, 'Leda', NULL, 5, 'ICY', 5);
INSERT INTO public.moon VALUES (9, 'Ersa', NULL, 6, 'ICY', 5);
INSERT INTO public.moon VALUES (10, 'Himalia', NULL, 7, 'ICY', 5);
INSERT INTO public.moon VALUES (11, 'Pandia', NULL, 8, 'ICY', 5);
INSERT INTO public.moon VALUES (12, 'Elara', 'funny shape', 9, 'ROCKY', 5);
INSERT INTO public.moon VALUES (13, 'Dia', 'Water an ice', 10, 'ICY', 5);
INSERT INTO public.moon VALUES (14, 'Mimas', NULL, 1, 'ROCKY', 6);
INSERT INTO public.moon VALUES (15, 'Enchiladas', NULL, 2, 'ROCKY', 6);
INSERT INTO public.moon VALUES (16, 'Tethys', NULL, 3, 'ROCKY', 6);
INSERT INTO public.moon VALUES (17, 'Dione', NULL, 4, 'ROCKY', 6);
INSERT INTO public.moon VALUES (18, 'Rhea', NULL, 5, 'ROCKY', 6);
INSERT INTO public.moon VALUES (19, 'Titan', 'Largest moon in solarsystem. Comparable to Mars', 6, 'ROCKY', 6);
INSERT INTO public.moon VALUES (20, 'Iapetus', NULL, 7, 'ROCKY', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Very hot', 1, 'ROCKY', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Dense Atmosphere', 2, 'ROCKY', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Water on Surface', 3, 'ROCKY', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red Desert', 4, 'ROCKY', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet of The Sun', 5, 'GASSY', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Has impressive rings', 6, 'GASSY', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Spins on its side for some reason', 7, 'GASSY', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Very cold. Rains liquid methane', 8, 'GASSY', 1);
INSERT INTO public.planet VALUES (9, 'SB1', '', 1, 'ROCKY', 6);
INSERT INTO public.planet VALUES (10, 'SB2', 'Habitable Zone', 2, 'ROCKY', 6);
INSERT INTO public.planet VALUES (11, 'SB3', 'Habitable Zone', 3, 'ROCKY', 6);
INSERT INTO public.planet VALUES (12, 'SB4', 'Cold', 4, 'UNCERTAIN', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'Centre of the Earth''s Solar System', 'REGULAR', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centuri A', 'Closest star to Earth after The Sun', 'BINARY', 1);
INSERT INTO public.star VALUES (3, 'Alpha Centuri B', NULL, 'BINARY', 1);
INSERT INTO public.star VALUES (4, 'Proxima Centuri', NULL, 'REGULAR', 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Largest star known by Earth', 'RED_GIANT', 1);
INSERT INTO public.star VALUES (6, 'Sirius B', 'Closest white dwarf to earth', 'WHITE_DWARF', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
