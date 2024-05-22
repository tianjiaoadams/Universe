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
    description text,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_millions_of_years numeric NOT NULL,
    galaxy_types character varying(30),
    distance_from_earth integer,
    spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: junction_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junction_table (
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(30),
    junction_table_id integer NOT NULL
);


ALTER TABLE public.junction_table OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    description text,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer,
    spherical boolean,
    moon_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    description text,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer,
    spherical boolean,
    planet_id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    description text,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer,
    spherical boolean,
    star_id integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('big', 'alpha', true, 500, 'cloudy', 400, true, 1);
INSERT INTO public.galaxy VALUES ('big', 'beta', true, 600, 'cloudy', 300, true, 2);
INSERT INTO public.galaxy VALUES ('small', 'gamma', false, 100, 'colorful', 700, true, 3);
INSERT INTO public.galaxy VALUES ('small', 'delta', false, 1000, 'colorful', 300, true, 4);
INSERT INTO public.galaxy VALUES ('small', 'epsilon', true, 2000, 'dark', 3300, true, 5);
INSERT INTO public.galaxy VALUES ('small', 'zeta', true, 800, 'dark', 300, true, 6);


--
-- Data for Name: junction_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junction_table VALUES (1, 1, 1, NULL, 1);
INSERT INTO public.junction_table VALUES (2, 2, 2, NULL, 2);
INSERT INTO public.junction_table VALUES (3, 3, 3, NULL, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('none', 'earth-1', false, 5000, 200, true, 1, 1);
INSERT INTO public.moon VALUES ('none', 'mars-1', false, 5000, 300, true, 2, 2);
INSERT INTO public.moon VALUES ('none', 'venus-1', false, 6000, 400, true, 3, 3);
INSERT INTO public.moon VALUES ('none', 'venus-2', false, 7000, 500, true, 4, 3);
INSERT INTO public.moon VALUES ('none', 'jupiter-2', false, 8000, 600, true, 5, 4);
INSERT INTO public.moon VALUES ('none', 'jupiter-3', false, 9000, 700, true, 6, 4);
INSERT INTO public.moon VALUES ('none', 'red-1-1', false, 93000, 7200, true, 7, 6);
INSERT INTO public.moon VALUES ('none', 'red-1-2', true, 93000, 7200, true, 8, 6);
INSERT INTO public.moon VALUES ('none', 'red-2-1', true, 93030, 8200, true, 9, 7);
INSERT INTO public.moon VALUES ('none', 'red-2-2', false, 93030, 8200, true, 10, 7);
INSERT INTO public.moon VALUES ('none', 'red-2-3', false, 93030, 8200, true, 11, 7);
INSERT INTO public.moon VALUES ('none', 'white-2-1', true, 53030, 82030, true, 12, 10);
INSERT INTO public.moon VALUES ('none', 'white-2-2', false, 53030, 82030, true, 13, 10);
INSERT INTO public.moon VALUES ('none', 'white-2-3', false, 53030, 82035, true, 14, 10);
INSERT INTO public.moon VALUES ('none', 'white-2-4', false, 53030, 82335, true, 15, 10);
INSERT INTO public.moon VALUES ('none', 'white-3-1', false, 93030, 50005, true, 16, 11);
INSERT INTO public.moon VALUES ('none', 'white-3-2', true, 93030, 50005, true, 17, 11);
INSERT INTO public.moon VALUES ('none', 'white-3-3', true, 93030, 50035, true, 18, 11);
INSERT INTO public.moon VALUES ('none', 'green-1-1', true, 3030, 5035, true, 19, 12);
INSERT INTO public.moon VALUES ('none', 'green-1-2', true, 3030, 5535, true, 20, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('blue planet', 'earth', true, 2000, 0, true, 1, 1);
INSERT INTO public.planet VALUES ('red planet', 'mars', false, 3000, 100, true, 2, 1);
INSERT INTO public.planet VALUES ('golden planet', 'venus', false, 3000, 300, true, 3, 1);
INSERT INTO public.planet VALUES ('gas', 'jupiter', false, 3000, 500, true, 4, 1);
INSERT INTO public.planet VALUES ('ice', 'pluto', false, 4000, 800, true, 5, 1);
INSERT INTO public.planet VALUES ('fire', 'red-1', false, 4000, 8000, true, 6, 1);
INSERT INTO public.planet VALUES ('fire', 'red-2', false, 4000, 9000, true, 7, 1);
INSERT INTO public.planet VALUES ('earth', 'brown-1', false, 45000, 92000, true, 8, 2);
INSERT INTO public.planet VALUES ('earth', 'white-1', true, 75000, 32000, true, 9, 3);
INSERT INTO public.planet VALUES ('new terra', 'white-2', true, 75000, 52000, true, 10, 3);
INSERT INTO public.planet VALUES ('new terra-2', 'white-3', false, 75000, 72000, true, 11, 3);
INSERT INTO public.planet VALUES ('toxic', 'green-1', false, 95000, 2000, true, 12, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('giant', 'red', 2000, 3300, true, 1, 1);
INSERT INTO public.star VALUES ('giant', 'brown', 20020, 33300, true, 2, 2);
INSERT INTO public.star VALUES ('small', 'white', 10020, 3330, true, 3, 3);
INSERT INTO public.star VALUES ('small', 'blue', 16020, 3430, true, 4, 4);
INSERT INTO public.star VALUES ('small', 'light blue', 26020, 6430, true, 5, 5);
INSERT INTO public.star VALUES ('small', 'green', 36020, 6530, true, 6, 6);


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
-- Name: junction_table junction_table_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_moon_id_key UNIQUE (moon_id);


--
-- Name: junction_table junction_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junction_table
    ADD CONSTRAINT junction_table_pkey PRIMARY KEY (junction_table_id);


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

