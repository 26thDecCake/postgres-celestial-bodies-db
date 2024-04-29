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
-- Name: clusters; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.clusters (
    clusters_id integer NOT NULL,
    distance_mly integer,
    recession_velocity_kms integer NOT NULL,
    description character varying(200),
    name character varying(30) NOT NULL
);


ALTER TABLE public.clusters OWNER TO freecodecamp;

--
-- Name: clusters_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.clusters_clusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_clusters_id_seq OWNER TO freecodecamp;

--
-- Name: clusters_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.clusters_clusters_id_seq OWNED BY public.clusters.clusters_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    clusters_id integer,
    magnitude numeric,
    diameter_kly integer NOT NULL,
    angular_size numeric,
    subcluster text
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
    orbital_speed integer,
    discovered_by character varying(50),
    discovery_year integer
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
    name character varying(30) NOT NULL,
    star_id integer,
    is_inhabitable boolean,
    has_rings boolean,
    radius_km integer,
    description character varying(200)
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
    galaxy_id integer,
    magnitude numeric,
    constelation character varying(50),
    description character varying(200)
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
-- Name: clusters clusters_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clusters ALTER COLUMN clusters_id SET DEFAULT nextval('public.clusters_clusters_id_seq'::regclass);


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
-- Data for Name: clusters; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.clusters VALUES (1, 59, 1139, 'The Virgo Cluster is a large cluster of galaxies whose center is 53.8 ± 0.3 Mly (16.5 ± 0.1 Mpc) away in the constellation Virgo.', 'Virgo Cluster');
INSERT INTO public.clusters VALUES (2, 62, 1379, 'The Fornax Cluster is a cluster of galaxies lying at a distance of 19 megaparsecs (62 million light-years).', 'Fornax Cluster');
INSERT INTO public.clusters VALUES (3, 133, 2608, 'The Antlia Cluster (or Abell S0636) is a cluster of galaxies located in the Hydra–Centaurus Supercluster. The Antlia Cluster is the third-nearest to the Local Group.', 'Antlia Cluster');
INSERT INTO public.clusters VALUES (4, NULL, 3298, 'The Centaurus Cluster (A3526) is a cluster of hundreds of galaxies, located approximately 170 million light-years away in the Centaurus constellation.', 'Centaurus Cluster');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Messier 87', 1, 8.6, 120, 7.2, NULL);
INSERT INTO public.galaxy VALUES (2, 'NGC 1365', 2, 9.1, 200, 12.8, NULL);
INSERT INTO public.galaxy VALUES (3, 'NGC 2997', 3, 9.8, 120, 6.9, NULL);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 4, 6.84, 120, 25.7, NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 49', 1, 8.4, 150, 9.8, NULL);
INSERT INTO public.galaxy VALUES (7, 'NGC 1316', 2, 9.4, 150, 9.5, NULL);
INSERT INTO public.galaxy VALUES (8, 'NGC 3258', 3, 10.3, 180, 7.6, NULL);
INSERT INTO public.galaxy VALUES (9, 'NGC 4696', 4, 9.2, 160, 8.9, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon S0-2 b-1', 1, 2000, 'Galileo Galilei', 1610);
INSERT INTO public.moon VALUES (2, 'Moon S0-38 c-1', 2, 1800, 'Carl Sagan', 1977);
INSERT INTO public.moon VALUES (3, 'Moon Spica d-1', 3, 2200, 'Hubble Space Telescope', 1990);
INSERT INTO public.moon VALUES (4, 'Moon Zeta Fornacis e-1', 4, 1900, 'Kepler Space Telescope', 2009);
INSERT INTO public.moon VALUES (5, 'Moon Beta Antliae f-1', 5, 2100, 'James Clerk Maxwell', 1857);
INSERT INTO public.moon VALUES (6, 'Moon Alpha Antliae g-1', 6, 2300, 'Clyde Tombaugh', 1930);
INSERT INTO public.moon VALUES (7, 'Moon Alpha Centauri A h-1', 7, 2400, 'Edward Charles Pickering', 1898);
INSERT INTO public.moon VALUES (8, 'Moon Beta Centauri i-1', 8, 2600, 'Henry Norris Russell', 1897);
INSERT INTO public.moon VALUES (9, 'Moon Alpha Virginis j-1', 9, 2800, 'Annie Jump Cannon', 1896);
INSERT INTO public.moon VALUES (10, 'Moon Gamma Virginis k-1', 10, 2500, 'Subrahmanyan Chandrasekhar', 1930);
INSERT INTO public.moon VALUES (11, 'Moon Beta Ursae Majoris l-1', 11, 2700, 'Henrietta Swan Leavitt', 1908);
INSERT INTO public.moon VALUES (12, 'Moon Delta Ursae Majoris m-1', 12, 2900, 'Albert Einstein', 1905);
INSERT INTO public.moon VALUES (13, 'Moon Polaris n-1', 13, 2300, 'Edwin Hubble', 1923);
INSERT INTO public.moon VALUES (14, 'Moon Beta Crucis o-1', 14, 2100, 'Stephen Hawking', 1988);
INSERT INTO public.moon VALUES (15, 'Moon Gamma Hydrae p-1', 15, 1900, 'Carl Friedrich Gauss', 1781);
INSERT INTO public.moon VALUES (16, 'Moon Alpha Hydrae q-1', 16, 1700, 'Johannes Kepler', 1619);
INSERT INTO public.moon VALUES (17, 'Moon Alpha Centauri B r-1', 17, 1500, 'Galileo Galilei', 1610);
INSERT INTO public.moon VALUES (18, 'Moon Proxima Centauri s-1', 18, 1300, 'Clyde Tombaugh', 1930);
INSERT INTO public.moon VALUES (19, 'Moon Alpha Antliae g-2', 6, 2600, 'Clyde Tombaugh', 1930);
INSERT INTO public.moon VALUES (20, 'Moon Delta Ursae Majoris m-2', 12, 2900, 'Albert Einstein', 1905);
INSERT INTO public.moon VALUES (21, 'Moon Polaris n-2', 13, 2300, 'Edwin Hubble', 1923);
INSERT INTO public.moon VALUES (22, 'Moon Gamma Hydrae p-2', 15, 3100, 'Carl Friedrich Gauss', 1781);
INSERT INTO public.moon VALUES (23, 'Moon Alpha Hydrae q-2', 16, 2800, 'Johannes Kepler', 1619);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet S0-2 b', 1, false, false, 20000, 'Planet S0-2 b is a hot Jupiter exoplanet orbiting around the star S0-2.');
INSERT INTO public.planet VALUES (2, 'Planet S0-38 c', 2, true, false, 15000, 'Planet S0-38 c is a rocky exoplanet with signs of liquid water, potentially habitable, orbiting around the star S0-38.');
INSERT INTO public.planet VALUES (3, 'Planet Spica d', 3, false, true, 60000, 'Planet Spica d is a gas giant with a prominent ring system orbiting around the star Spica.');
INSERT INTO public.planet VALUES (4, 'Planet Zeta Fornacis e', 4, false, false, 18000, 'Planet Zeta Fornacis e is a rocky exoplanet with a thin atmosphere, orbiting around the star Zeta Fornacis.');
INSERT INTO public.planet VALUES (5, 'Planet Beta Antliae f', 5, false, false, 22000, 'Planet Beta Antliae f is a rocky exoplanet with extreme volcanic activity, orbiting around the star Beta Antliae.');
INSERT INTO public.planet VALUES (6, 'Planet Alpha Antliae g', 6, false, false, 30000, 'Planet Alpha Antliae g is a gas giant with turbulent storms, orbiting around the star Alpha Antliae.');
INSERT INTO public.planet VALUES (7, 'Planet Alpha Centauri A h', 7, true, false, 16000, 'Planet Alpha Centauri A h is a rocky exoplanet with a stable climate and potential for life, orbiting around the star Alpha Centauri A.');
INSERT INTO public.planet VALUES (8, 'Planet Beta Centauri i', 8, false, true, 50000, 'Planet Beta Centauri i is a gas giant with a faint ring system, orbiting around the star Beta Centauri.');
INSERT INTO public.planet VALUES (9, 'Planet Alpha Virginis j', 9, false, false, 25000, 'Planet Alpha Virginis j is a rocky exoplanet with a thin atmosphere, orbiting around the star Alpha Virginis.');
INSERT INTO public.planet VALUES (10, 'Planet Gamma Virginis k', 10, true, false, 18000, 'Planet Gamma Virginis k is a potentially habitable rocky exoplanet orbiting around the star Gamma Virginis.');
INSERT INTO public.planet VALUES (11, 'Planet Beta Ursae Majoris l', 11, false, false, 20000, 'Planet Beta Ursae Majoris l is a rocky exoplanet with large ice caps, orbiting around the star Beta Ursae Majoris.');
INSERT INTO public.planet VALUES (12, 'Planet Delta Ursae Majoris m', 12, false, false, 23000, 'Planet Delta Ursae Majoris m is a rocky exoplanet with a dense atmosphere, orbiting around the star Delta Ursae Majoris.');
INSERT INTO public.planet VALUES (13, 'Planet Polaris n', 13, false, false, 35000, 'Planet Polaris n is a gas giant with turbulent atmospheric patterns, orbiting around the star Polaris.');
INSERT INTO public.planet VALUES (14, 'Planet Beta Crucis o', 14, false, true, 48000, 'Planet Beta Crucis o is a gas giant with a dense ring system, orbiting around the star Beta Crucis.');
INSERT INTO public.planet VALUES (15, 'Planet Gamma Hydrae p', 15, false, false, 28000, 'Planet Gamma Hydrae p is a rocky exoplanet with intense volcanic activity, orbiting around the star Gamma Hydrae.');
INSERT INTO public.planet VALUES (16, 'Planet Alpha Hydrae q', 16, true, false, 20000, 'Planet Alpha Hydrae q is a potentially habitable rocky exoplanet, with a stable climate, orbiting around the star Alpha Hydrae.');
INSERT INTO public.planet VALUES (17, 'Planet Alpha Centauri B r', 17, false, false, 22000, 'Planet Alpha Centauri B r is a rocky exoplanet with a rugged terrain, orbiting around the star Alpha Centauri B.');
INSERT INTO public.planet VALUES (18, 'Planet Proxima Centauri s', 18, false, false, 15000, 'Planet Proxima Centauri s is a rocky exoplanet with a tidally locked orbit, orbiting around the star Proxima Centauri.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'S0-2', 1, 14.3, 'Virgo', 'S0-2 is a star near the center of the Milky Way, orbits around the supermassive black hole Sagittarius A*.');
INSERT INTO public.star VALUES (2, 'S0-38', 1, 13.8, 'Virgo', 'S0-38 is a star near the center of the Milky Way, orbits around the supermassive black hole Sagittarius A*.');
INSERT INTO public.star VALUES (3, 'Spica', 2, 0.98, 'Fornax', 'Spica is the brightest star in the constellation Virgo.');
INSERT INTO public.star VALUES (4, 'Zeta Fornacis', 2, 5.92, 'Fornax', 'Zeta Fornacis is a binary star system in the constellation of Fornax.');
INSERT INTO public.star VALUES (5, 'Beta Antliae', 3, 4.25, 'Antlia', 'Beta Antliae is a binary star system in the constellation Antlia.');
INSERT INTO public.star VALUES (6, 'Alpha Antliae', 3, 4.25, 'Antlia', 'Alpha Antliae is the brightest star in the constellation Antlia.');
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 4, -0.01, 'Centaurus', 'Alpha Centauri A is the primary star in the Alpha Centauri system.');
INSERT INTO public.star VALUES (8, 'Beta Centauri', 4, 0.61, 'Centaurus', 'Beta Centauri is a binary star system in the constellation of Centaurus.');
INSERT INTO public.star VALUES (9, 'Alpha Virginis', 5, 0.98, 'Virgo', 'Alpha Virginis, also known as Spica, is the brightest star in the constellation Virgo.');
INSERT INTO public.star VALUES (10, 'Gamma Virginis', 5, 2.08, 'Virgo', 'Gamma Virginis, also known as Porrima, is a binary star system in the constellation Virgo.');
INSERT INTO public.star VALUES (11, 'Beta Ursae Majoris', 5, 2.27, 'Virgo', 'Beta Ursae Majoris, also known as Merak, is a star in the constellation Ursa Major.');
INSERT INTO public.star VALUES (12, 'Delta Ursae Majoris', 5, 3.31, 'Virgo', 'Delta Ursae Majoris, also known as Megrez, is a star in the constellation Ursa Major.');
INSERT INTO public.star VALUES (13, 'Polaris', 2, 1.97, 'Fornax', 'Polaris, also known as the North Star, is a bright star located close to the north celestial pole.');
INSERT INTO public.star VALUES (14, 'Beta Crucis', 2, 1.25, 'Fornax', 'Beta Crucis, also known as Mimosa, is the second brightest star in the Southern Cross constellation.');
INSERT INTO public.star VALUES (15, 'Gamma Hydrae', 3, 3.00, 'Antlia', 'Gamma Hydrae is a binary star system in the constellation Hydra.');
INSERT INTO public.star VALUES (16, 'Alpha Hydrae', 3, 2.00, 'Antlia', 'Alpha Hydrae, also known as Alphard, is the brightest star in the constellation Hydra.');
INSERT INTO public.star VALUES (17, 'Alpha Centauri B', 4, 1.35, 'Centaurus', 'Alpha Centauri B is a companion star to Alpha Centauri A in the Alpha Centauri system.');
INSERT INTO public.star VALUES (18, 'Proxima Centauri', 4, 11.13, 'Centaurus', 'Proxima Centauri is the closest known star to the Sun and a member of the Alpha Centauri system.');


--
-- Name: clusters_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.clusters_clusters_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: clusters clusters_clusters_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_clusters_id_key UNIQUE (clusters_id);


--
-- Name: clusters clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (clusters_id);


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
-- Name: galaxy galaxy_clusters_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_clusters_id_fkey FOREIGN KEY (clusters_id) REFERENCES public.clusters(clusters_id);


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

