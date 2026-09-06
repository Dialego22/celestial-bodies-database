--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(40),
    age_in_millions_of_year integer NOT NULL,
    discovery_year integer NOT NULL,
    radius_in_light_years numeric(18,5),
    description text,
    galaxy_types_id integer
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
    galaxy_types_id integer NOT NULL,
    name character varying(40) NOT NULL,
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

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    age_in_millions_of_year integer NOT NULL,
    discovery_year integer NOT NULL,
    radius_in_km numeric(18,5),
    description text,
    has_life boolean DEFAULT false,
    planet_id integer
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
    name character varying(40),
    age_in_millions_of_year integer NOT NULL,
    discovery_year integer NOT NULL,
    radius_in_km numeric(18,5),
    description text,
    has_life boolean DEFAULT false,
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
    name character varying(40),
    age_in_millions_of_year integer NOT NULL,
    discovery_year integer NOT NULL,
    radius_in_solar_radii numeric(18,5),
    description text,
    galaxy_id integer
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 13600, 1610, 52850.00000, 'Nuestra galaxia hogar, que contiene el sistema solar.', 5);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 964, 110000.00000, 'La galaxia grande mas cercana a la Via Lactea.', 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulo', 12000, 1654, 30000.00000, 'La tercera galaxia espiral mas grande del Grupo Local.', 1);
INSERT INTO public.galaxy VALUES (4, 'Gran Nube de Magallanes', 13000, 964, 14000.00000, 'Una galaxia satelite que orbita alrededor de la Via Lactea.', 3);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 13200, 1781, 60000.00000, 'Una galaxia gigante famosa por albergar un agujero negro supermasivo.', 2);
INSERT INTO public.galaxy VALUES (6, 'Galaxia del Sombrero', 13250, 1781, 25000.00000, 'Una galaxia espectacular conocida por su brillante nucleo central.', 4);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Espiral', 'Galaxias con brazos en forma de disco que rotan, llenas de estrellas jóvenes, gas y polvo cosmico.');
INSERT INTO public.galaxy_types VALUES (2, 'Eliptica', 'Galaxias con forma de elipsoide, compuestas mayormente por estrellas viejas y con muy poco gas calido.');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'Galaxias que no tienen una estructura definida o simetrica, usualmente formadas por colisiones galacticas.');
INSERT INTO public.galaxy_types VALUES (4, 'Lenticular', 'Galaxias con forma de disco pero sin brazos espirales, que ya han perdido la mayor parte de su materia interestelar.');
INSERT INTO public.galaxy_types VALUES (5, 'Espiral Barrada', 'Galaxias espirales que poseen una banda central de estrellas en forma de barra que atraviesa su nucleo.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, 1610, 1737.40000, 'El unico satelite natural de la Tierra y el quinto mas grande del sistema solar.', false, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', 4500, 1877, 11.20000, 'La luna mas grande y cercana de las dos que posee Marte.', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 1877, 6.20000, 'La luna mas pequeña y externa de Marte, con forma irregular.', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 4500, 1610, 1821.60000, 'El cuerpo celeste con mayor actividad volcanica del sistema solar.', false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4500, 1610, 1560.80000, 'Famosa por albergar un enorme oceano liquido bajo su gruesa capa de hielo.', false, 5);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 4500, 1610, 2634.10000, 'La luna mas grande de todo el sistema solar, superando en tamaño a Mercurio.', false, 5);
INSERT INTO public.moon VALUES (7, 'Calisto', 4500, 1610, 2410.30000, 'La tercera luna mas grande del sistema solar y el objeto con mas crateres.', false, 5);
INSERT INTO public.moon VALUES (8, 'Amaltea', 4500, 1892, 83.50000, 'Una pequeña luna interior de Jupiter con una forma muy alargada.', false, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 4500, 1904, 85.00000, 'El satelite irregular mas grande de Jupiter.', false, 5);
INSERT INTO public.moon VALUES (10, 'Elara', 4500, 1905, 43.00000, 'Una luna irregular que orbita a gran distancia de Jupiter.', false, 5);
INSERT INTO public.moon VALUES (11, 'Pasifae', 4500, 1908, 30.00000, 'Una luna con orbita retrograda alrededor de Jupiter.', false, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 4500, 1655, 2574.70000, 'La unica luna conocida con una atmosfera densa y lagos de metano liquido.', false, 6);
INSERT INTO public.moon VALUES (13, 'Encelado', 4500, 1789, 252.10000, 'Famosa por sus geiseres que expulsan agua helada al espacio.', false, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 4500, 1789, 198.20000, 'Conocida popularmente como la estrella de la muerte por su enorme crater.', false, 6);
INSERT INTO public.moon VALUES (15, 'Rea', 4500, 1672, 763.80000, 'La segunda luna mas grande de Saturno, compuesta mayormente por hielo.', false, 6);
INSERT INTO public.moon VALUES (16, 'Dione', 4500, 1684, 561.40000, 'Una luna helada con grandes acantilados de hielo en su superficie.', false, 6);
INSERT INTO public.moon VALUES (17, 'Tetis', 4500, 1684, 531.10000, 'Posee un enorme impacto llamado crater Odiseo que cubre gran parte de ella.', false, 6);
INSERT INTO public.moon VALUES (18, 'Triton', 4500, 1846, 1353.40000, 'La luna mas grande de Neptuno, que orbita en direccion contraria a su planeta.', false, 8);
INSERT INTO public.moon VALUES (19, 'Proteo', 4500, 1989, 210.00000, 'Una de las lunas mas oscuras del sistema solar, detectada por la Voyager 2.', false, 8);
INSERT INTO public.moon VALUES (20, 'Nereida', 4500, 1949, 170.00000, 'Famosa por tener una de las orbitas mas excentricas y alargadas del sistema.', false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 4500, 1610, 2439.70000, 'El planeta mas pequeño y cercano al Sol.', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 1610, 6051.80000, 'El planeta mas caliente del sistema solar debido a su atmosfera.', false, 1);
INSERT INTO public.planet VALUES (3, 'Tierra', 4540, 1610, 6371.00000, 'Nuestro planeta, el unico confirmado con vida hasta ahora.', true, 1);
INSERT INTO public.planet VALUES (4, 'Marte', 4500, 1610, 3389.50000, 'El planeta rojo, objeto de exploracion para buscar vida pasada.', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4600, 1610, 69911.00000, 'El gigante gaseoso mas grande de nuestro sistema planetario.', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturno', 4500, 1610, 58232.00000, 'Famoso por su imponente y brillante sistema de anillos.', false, 1);
INSERT INTO public.planet VALUES (7, 'Urano', 4500, 1781, 25362.00000, 'Un gigante de hielo que orbita de lado con respecto a su plano.', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptuno', 4500, 1846, 24622.00000, 'El planeta mas alejado del Sol, azotado por vientos supersonicos.', false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4850, 2016, 6500.00000, 'Un exoplaneta rocoso que orbita en la zona habitable de su estrella.', false, 6);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 4850, 2019, 45000.00000, 'Un planeta mas lejano y frio, posiblemente una supertierra.', false, 6);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 4000, 2011, 15300.00000, 'El primer exoplaneta confirmado por la NASA en la zona habitable de su estrella.', false, 7);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 4000, 1999, 98000.00000, 'Famoso exoplaneta apodado Osiris, el primero en el que se detecto atmosfera.', false, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 4600, 1610, 1.00000, 'La estrella central de nuestro propio sistema planetario.', 1);
INSERT INTO public.star VALUES (2, 'Sirio', 242, 1844, 1.71000, 'La estrella mas brillante del cielo nocturno en la Via Lactea.', 1);
INSERT INTO public.star VALUES (3, 'Almach', 6500, 1778, 80.00000, 'Un sistema estelar multiple ubicado dentro de la galaxia de Andromeda.', 2);
INSERT INTO public.star VALUES (4, 'M87-Proto', 10000, 2000, 150.00000, 'Una estrella supergigante vieja en la galaxia eliptica gigante Messier 87.', 5);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 8500, 1836, 887.00000, 'Una supergigante roja masiva en la constelacion de Orion (Via Lactea).', 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 4850, 1915, 0.15000, 'La estrella individual mas cercana fisicamente a nuestro Sol.', 1);
INSERT INTO public.star VALUES (7, 'Kepler-22', 4000, 2011, 0.98000, 'Una estrella enana amarilla muy similar a nuestro Sol en la constelacion de Cygnus.', 1);
INSERT INTO public.star VALUES (8, 'HD 209458', 4000, 1999, 1.15000, 'Una estrella de tipo solar en la constelacion de Pegaso, famosa por sus exoplanetas.', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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

