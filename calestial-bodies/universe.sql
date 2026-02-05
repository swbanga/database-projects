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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    diameter_in_ly integer,
    stars_estimated_billions integer,
    red_shift numeric(10,2),
    has_supermassive_black_hole boolean
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
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    planet_id integer,
    mission_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    launch_year integer,
    crew_size integer,
    cost_in_billions numeric(10,2),
    is_successful boolean NOT NULL,
    is_manned boolean
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mission_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    planet_id integer,
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    distance_from_planet integer,
    diameter_in_km integer,
    orbital_period_days numeric(10,2),
    is_tidally_locked boolean
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
    star_id integer,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    order_from_sun integer,
    planet_types character varying,
    number_of_moons integer,
    mass_relative_to_earth numeric(10,2),
    has_rings boolean
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
    galaxy_id integer,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions integer,
    distance_from_earth numeric(10,2),
    temperature_kelvin integer,
    is_main_sequance boolean,
    has_planets boolean NOT NULL
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
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.mission_mission_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy. Barred spiral', true, 105700, 400, 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy. Collision course.', false, 220000, 1000, 0.00, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in Local Group.', false, 60000, 40, 0.00, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Classic spiral structure. Interaction.', false, 76000, 100, 0.00, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright nucleus, large central bulge.', false, 50000, 800, 0.00, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy.', false, 170000, 1000, 0.00, false);
INSERT INTO public.galaxy VALUES (7, 'Cigar', 'Starburst galaxy with high formation.', false, 37000, 30, 0.00, false);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (3, 1, 'Apollo 11', 'The spaceflight that first landed humans on the moon', 1969, 3, 25.40, true, true);
INSERT INTO public.mission VALUES (4, 2, 'Viking 1', 'The first spacecraft to successfully land on Mars and operate', 1975, 0, 1.00, true, false);
INSERT INTO public.mission VALUES (5, 3, 'Voyager 1', 'Space probe that is the furthest man-made object from Earth', 1977, 0, 0.25, true, false);
INSERT INTO public.mission VALUES (6, 4, 'Cassini', 'Probe that studied the Saturn for 13 years', 1997, 0, 3.26, true, false);
INSERT INTO public.mission VALUES (4, 5, 'Curiosity', 'Car-sized rover exploring Gale Crater on Mars', 2011, 0, 2.50, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 1, 'The Moon', 'Earths only natural satellite and fifth largest moon', true, 384400, 3474, 27.30, true);
INSERT INTO public.moon VALUES (4, 2, 'Phobos', 'The larger and closer of the two natural satellites of mars', false, 6000, 22, 0.30, true);
INSERT INTO public.moon VALUES (4, 3, 'Deimos', 'The smaller and outer moon of Mars', false, 23460, 12, 1.26, true);
INSERT INTO public.moon VALUES (5, 4, 'Io', 'The most geologically active object in the solar system', true, 421700, 3642, 1.77, true);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 'Icy moon with a subsurface water ocean', true, 670900, 3121, 3.55, true);
INSERT INTO public.moon VALUES (5, 6, 'Ganymede', 'The largest moon in the solar system', true, 1070400, 5268, 7.15, true);
INSERT INTO public.moon VALUES (5, 7, 'Callisto', 'Heavily cratered and very old surface', true, 1882700, 4820, 16.69, true);
INSERT INTO public.moon VALUES (5, 8, 'Amalthea', 'Irregularly shaped, reddish moon orbiting close to jupiter', false, 181365, 167, 0.49, true);
INSERT INTO public.moon VALUES (6, 9, 'Titan', 'The only moon known to have a dense atmosphere', true, 1221870, 5149, 15.94, true);
INSERT INTO public.moon VALUES (6, 10, 'Rhea', 'Second largest moon of Saturn.', true, 527108, 1527, 4.51, true);
INSERT INTO public.moon VALUES (6, 11, 'Iapetus', 'Known for its two-tone coloration and equatorial ridge', true, 3560820, 1468, 79.32, true);
INSERT INTO public.moon VALUES (6, 12, 'Dione', 'Icy Surface', true, 377396, 1122, 2.73, true);
INSERT INTO public.moon VALUES (6, 13, 'Tethys', 'Composed almost entirely of water ice with a huge crater', true, 294619, 1062, 1.88, true);
INSERT INTO public.moon VALUES (6, 14, 'Enceladus', 'Possesses active cryovolcanoes shooting jets of water ice', true, 237948, 504, 1.37, true);
INSERT INTO public.moon VALUES (6, 15, 'Mimas', 'Known for a massive impact crater resmbling the death of a star', true, 185539, 396, 0.94, true);
INSERT INTO public.moon VALUES (6, 16, 'Hyperion', 'Chaotic rotation and a sponge-like appearance', false, 1481009, 270, 21.27, false);
INSERT INTO public.moon VALUES (7, 17, 'Miranda', 'Smallest of Uranus major moons', true, 129390, 471, 1.41, true);
INSERT INTO public.moon VALUES (7, 18, 'Ariel', 'The brighest of Uranus major moons', true, 190900, 1157, 2.52, true);
INSERT INTO public.moon VALUES (7, 19, 'Umbriel', 'The darkest and least geologically active of Uranus moons', true, 266000, 1169, 4.14, true);
INSERT INTO public.moon VALUES (7, 20, 'Titania', 'Largest moon of Uranus', true, 435900, 1576, 8.70, true);
INSERT INTO public.moon VALUES (8, 21, 'Triton', 'Largest moon of neptune', true, 354759, 2706, 5.87, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Smallest planet in the solar system and closest to the sun', false, NULL, 'Terrestrial', 0, 0.05, false);
INSERT INTO public.planet VALUES (1, 2, 'Venus', 'Hottest planet with a thick, toxic atmosphere', false, NULL, 'Terrestrial', 0, 0.81, false);
INSERT INTO public.planet VALUES (1, 3, 'Earth', 'The only astronomical object known to harbor life', true, NULL, 'Terrestrial', 1, 1.00, false);
INSERT INTO public.planet VALUES (1, 4, 'Mars', 'The red planet, known for its dusty landscape and volcanoes', false, NULL, 'Terrestrial', 2, 0.10, false);
INSERT INTO public.planet VALUES (1, 5, 'Jupiter', 'The largest planet, a gas giant with great red spot', false, NULL, 'Gas Giant', 79, 317.80, true);
INSERT INTO public.planet VALUES (1, 6, 'Saturn', 'Gas giant known for its prominent ring system', false, NULL, 'Gas Giant', 82, 95.10, true);
INSERT INTO public.planet VALUES (1, 7, 'Uranus', 'Ice giant with a unique tilt, rotating on its side', false, NULL, 'Ice Giant', 27, 14.50, true);
INSERT INTO public.planet VALUES (1, 8, 'Neptune', 'Dark, cold, and windy ice giant furthest from the sun', false, NULL, 'Ice Giant', 14, 17.10, true);
INSERT INTO public.planet VALUES (2, 9, 'Proxima b', 'Exoplanet orbiting in the habitable zone of Proxima Centauri', false, NULL, 'Super Earth', 0, 1.27, false);
INSERT INTO public.planet VALUES (5, 10, 'Gliese 581g', 'Unconfirmed planet located in the middle of the habitable zone', true, NULL, 'Super Earth', 0, 3.10, false);
INSERT INTO public.planet VALUES (6, 11, 'TRAPPIST-1d', 'Potentially habitable exoplanet with a compact orbit', true, NULL, 'Terrestrial', 0, 0.41, false);
INSERT INTO public.planet VALUES (6, 12, 'TRAPPIST-1e', 'Rocky exoplanet similar in size and density to Earth', true, NULL, 'Terristrial', 0, 0.69, false);
INSERT INTO public.planet VALUES (7, 13, 'Kepler-186f', 'First Earth-size planet found in the habitable zone of another star', true, NULL, 'Terrestrial', 0, 1.10, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'The Sun', 'Yellow dwarf star at the center of the solar system', 4600, 0.00, 5778, true, true);
INSERT INTO public.star VALUES (1, 2, 'Proxima Centauri', 'Red dwarf and the nearest known star to the sun', 4850, 4.20, 3042, true, true);
INSERT INTO public.star VALUES (1, 3, 'Betelgeuse', 'Red supergiant star in the constellation Orion.', 10, 642.50, 3500, false, false);
INSERT INTO public.star VALUES (1, 4, 'Sirius', 'The brightest star in the Earths night sky.', 242, 8.60, 9940, true, false);
INSERT INTO public.star VALUES (1, 5, 'Gliese 581', 'Red dwarf star known for its planetary system.', 8000, 20.30, 3480, true, true);
INSERT INTO public.star VALUES (1, 6, 'TRAPPIST-1', 'Ultra Cool dwarf star hosting seven terrestrial planets.', 7600, 39.60, 2550, true, true);
INSERT INTO public.star VALUES (1, 7, 'Kepler-186', 'M1-type dwarfstar located in the Cygnus constellation.', 4000, 500.00, 3788, true, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mission_mission_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


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
-- Name: mission mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

