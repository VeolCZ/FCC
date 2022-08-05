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
    age numeric,
    from_earth integer,
    life boolean,
    name character varying(30),
    nickname text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    age numeric,
    from_earth integer,
    life boolean,
    name character varying(30),
    nickname text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    age numeric,
    from_earth integer,
    life boolean,
    name character varying(30),
    nickname text NOT NULL
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    age numeric,
    from_earth integer,
    life boolean,
    name character varying(30),
    nickname text NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    age numeric,
    from_earth integer,
    life boolean,
    name character varying(30),
    nickname text NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 600, 900, false, 'Andromeda', 'Andy');
INSERT INTO public.galaxy VALUES (2, 600, 900, false, 'Antennae', 'Any');
INSERT INTO public.galaxy VALUES (3, 600, 900, false, 'Backward', 'Backy');
INSERT INTO public.galaxy VALUES (4, 600, 900, false, 'Butterfly', 'Butty');
INSERT INTO public.galaxy VALUES (5, 600, 900, false, 'Cigar', 'Ciny');
INSERT INTO public.galaxy VALUES (6, 600, 900, false, 'Centaurus', 'Ceny');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 600, 900, false, 'Phobos', 'Phoby', NULL);
INSERT INTO public.moon VALUES (2, 600, 900, false, 'Deimos', 'Demy', NULL);
INSERT INTO public.moon VALUES (3, 600, 900, false, 'Ganymede', 'Gamy', NULL);
INSERT INTO public.moon VALUES (4, 600, 900, false, 'Callysto', 'Cally', NULL);
INSERT INTO public.moon VALUES (5, 600, 900, false, 'IO', 'IO', NULL);
INSERT INTO public.moon VALUES (7, 600, 900, false, 'Europa', 'EU', NULL);
INSERT INTO public.moon VALUES (8, 600, 900, false, 'Amalthea', 'Amy', NULL);
INSERT INTO public.moon VALUES (9, 600, 900, false, 'Himalia', 'Himy', NULL);
INSERT INTO public.moon VALUES (10, 600, 900, false, 'Thebe', 'Theby', NULL);
INSERT INTO public.moon VALUES (11, 600, 900, false, 'Elara', 'Ely', NULL);
INSERT INTO public.moon VALUES (12, 600, 900, false, 'Pasiphae', 'Pasi', NULL);
INSERT INTO public.moon VALUES (13, 600, 900, false, 'Metis', 'Mesi', NULL);
INSERT INTO public.moon VALUES (14, 600, 900, false, 'Carme', 'Camy', NULL);
INSERT INTO public.moon VALUES (15, 600, 900, false, 'Sinope', 'Sini', NULL);
INSERT INTO public.moon VALUES (16, 600, 900, false, 'Lysithea', 'Lisi', NULL);
INSERT INTO public.moon VALUES (17, 600, 900, false, 'Ananke', 'Any', NULL);
INSERT INTO public.moon VALUES (18, 600, 900, false, 'Leda', 'led', NULL);
INSERT INTO public.moon VALUES (19, 600, 900, false, 'Adrastea', 'Adry', NULL);
INSERT INTO public.moon VALUES (20, 600, 900, false, 'Callirhoe', 'Cali', NULL);
INSERT INTO public.moon VALUES (21, 600, 900, false, 'Themisto', 'Themy', NULL);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 600, 900, false, 'Ant', 'Ant');
INSERT INTO public.nebula VALUES (2, 600, 900, false, 'Barnard', 'Bardy');
INSERT INTO public.nebula VALUES (3, 600, 900, false, 'Bat', 'Bardy');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 600, 900, false, 'Earth', 'Earthy', NULL);
INSERT INTO public.planet VALUES (2, 600, 900, false, 'Mars', 'Marsy', NULL);
INSERT INTO public.planet VALUES (3, 600, 900, false, 'Venus', 'Veny', NULL);
INSERT INTO public.planet VALUES (4, 600, 900, false, 'Uran', 'Ury', NULL);
INSERT INTO public.planet VALUES (5, 600, 900, false, 'Jupiter', 'Jupy', NULL);
INSERT INTO public.planet VALUES (6, 600, 900, false, 'Mercury', 'Mery', NULL);
INSERT INTO public.planet VALUES (7, 600, 900, false, 'Saturn', 'Saty', NULL);
INSERT INTO public.planet VALUES (8, 600, 900, false, 'Neptune', 'Nepty', NULL);
INSERT INTO public.planet VALUES (9, 600, 900, false, 'Ceres', 'Cery', NULL);
INSERT INTO public.planet VALUES (10, 600, 900, false, 'Pluto', 'Pluty', NULL);
INSERT INTO public.planet VALUES (11, 600, 900, false, 'Hygea', 'Higy', NULL);
INSERT INTO public.planet VALUES (12, 600, 900, false, 'Luna', 'Luny', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 600, 900, false, 'Absolutno', 'Aby', NULL);
INSERT INTO public.star VALUES (2, 600, 900, false, 'Acamar', 'Acy', NULL);
INSERT INTO public.star VALUES (3, 600, 900, false, 'Achernar', 'Achy', NULL);
INSERT INTO public.star VALUES (4, 600, 900, false, 'Achid', 'Achi', NULL);
INSERT INTO public.star VALUES (5, 600, 900, false, 'Acrab', 'Acyb', NULL);
INSERT INTO public.star VALUES (6, 600, 900, false, 'Acrux', 'Acyx', NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_id_seq', 3, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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


