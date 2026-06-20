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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 577);
INSERT INTO public.games VALUES (2, 2, 392);
INSERT INTO public.games VALUES (3, 1, 193);
INSERT INTO public.games VALUES (4, 1, 200);
INSERT INTO public.games VALUES (5, 1, 336);
INSERT INTO public.games VALUES (6, 3, 757);
INSERT INTO public.games VALUES (7, 4, 154);
INSERT INTO public.games VALUES (8, 3, 992);
INSERT INTO public.games VALUES (9, 3, 16);
INSERT INTO public.games VALUES (10, 3, 347);
INSERT INTO public.games VALUES (11, 5, 292);
INSERT INTO public.games VALUES (12, 6, 49);
INSERT INTO public.games VALUES (13, 5, 396);
INSERT INTO public.games VALUES (14, 5, 565);
INSERT INTO public.games VALUES (15, 5, 598);
INSERT INTO public.games VALUES (16, 7, 445);
INSERT INTO public.games VALUES (17, 8, 634);
INSERT INTO public.games VALUES (18, 7, 129);
INSERT INTO public.games VALUES (19, 7, 57);
INSERT INTO public.games VALUES (20, 7, 441);
INSERT INTO public.games VALUES (21, 10, 1);
INSERT INTO public.games VALUES (22, 10, 1);
INSERT INTO public.games VALUES (23, 10, 1);
INSERT INTO public.games VALUES (24, 14, 1);
INSERT INTO public.games VALUES (25, 15, 6);
INSERT INTO public.games VALUES (26, 15, 6);
INSERT INTO public.games VALUES (27, 16, 6);
INSERT INTO public.games VALUES (28, 16, 6);
INSERT INTO public.games VALUES (29, 15, 8);
INSERT INTO public.games VALUES (30, 15, 7);
INSERT INTO public.games VALUES (31, 15, 6);
INSERT INTO public.games VALUES (32, 13, 8);
INSERT INTO public.games VALUES (33, 17, 223);
INSERT INTO public.games VALUES (34, 17, 59);
INSERT INTO public.games VALUES (35, 18, 18);
INSERT INTO public.games VALUES (36, 18, 283);
INSERT INTO public.games VALUES (37, 17, 361);
INSERT INTO public.games VALUES (38, 17, 568);
INSERT INTO public.games VALUES (39, 17, 729);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1781983836365');
INSERT INTO public.users VALUES (2, 'user_1781983836364');
INSERT INTO public.users VALUES (3, 'user_1781983993123');
INSERT INTO public.users VALUES (4, 'user_1781983993122');
INSERT INTO public.users VALUES (5, 'user_1781984024436');
INSERT INTO public.users VALUES (6, 'user_1781984024435');
INSERT INTO public.users VALUES (7, 'user_1781984075771');
INSERT INTO public.users VALUES (8, 'user_1781984075770');
INSERT INTO public.users VALUES (9, '');
INSERT INTO public.users VALUES (10, '2');
INSERT INTO public.users VALUES (11, '3');
INSERT INTO public.users VALUES (12, '4');
INSERT INTO public.users VALUES (13, '5');
INSERT INTO public.users VALUES (14, '6');
INSERT INTO public.users VALUES (15, 'user_1781984854150');
INSERT INTO public.users VALUES (16, 'user_1781984854149');
INSERT INTO public.users VALUES (17, 'user_1781985005626');
INSERT INTO public.users VALUES (18, 'user_1781985005625');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 39, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

