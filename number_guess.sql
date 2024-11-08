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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_data (
    id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.user_data OWNER TO freecodecamp;

--
-- Name: user_data_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_data_id_seq OWNER TO freecodecamp;

--
-- Name: user_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_data_id_seq OWNED BY public.user_data.id;


--
-- Name: user_data id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_data ALTER COLUMN id SET DEFAULT nextval('public.user_data_id_seq'::regclass);


--
-- Data for Name: user_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_data VALUES (2, 'heath2', 3, 1);
INSERT INTO public.user_data VALUES (3, '', 7, 1);
INSERT INTO public.user_data VALUES (5, 'user_1731034552474', 2, 33);
INSERT INTO public.user_data VALUES (4, 'user_1731034552475', 4, 108);
INSERT INTO public.user_data VALUES (7, 'user_1731034635376', 2, 147);
INSERT INTO public.user_data VALUES (6, 'user_1731034635377', 4, 158);
INSERT INTO public.user_data VALUES (9, 'user_1731034647288', 2, 53);
INSERT INTO public.user_data VALUES (8, 'user_1731034647289', 4, 24);
INSERT INTO public.user_data VALUES (11, 'user_1731034679984', 2, 743);
INSERT INTO public.user_data VALUES (10, 'user_1731034679985', 4, 177);
INSERT INTO public.user_data VALUES (12, 'goodman', 0, 0);
INSERT INTO public.user_data VALUES (14, 'user_1731034808102', 2, 12);
INSERT INTO public.user_data VALUES (13, 'user_1731034808103', 5, 109);
INSERT INTO public.user_data VALUES (1, 'goodmanmn', 9, 1);
INSERT INTO public.user_data VALUES (16, 'user_1731034935732', 2, 613);
INSERT INTO public.user_data VALUES (15, 'user_1731034935733', 5, 342);


--
-- Name: user_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_data_id_seq', 16, true);


--
-- Name: user_data user_data_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

