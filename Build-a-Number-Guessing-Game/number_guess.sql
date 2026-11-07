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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (9, 'joe', 0, NULL);
INSERT INTO public.users VALUES (10, 'user_1794046439062', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1794046439061', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1794046698301', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1794046698300', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1794047595566', 0, NULL);
INSERT INTO public.users VALUES (15, 'user_1794047595565', 0, NULL);
INSERT INTO public.users VALUES (16, 'user_1794047601416', 0, NULL);
INSERT INTO public.users VALUES (17, 'user_1794047601415', 0, NULL);
INSERT INTO public.users VALUES (18, 'JOE', 0, NULL);
INSERT INTO public.users VALUES (19, 'user_1794047619455', 0, NULL);
INSERT INTO public.users VALUES (20, 'user_1794047619454', 0, NULL);
INSERT INTO public.users VALUES (21, 'user_1794048775966', 0, NULL);
INSERT INTO public.users VALUES (22, 'user_1794048775965', 0, NULL);
INSERT INTO public.users VALUES (23, 'user_1794048799327', 0, NULL);
INSERT INTO public.users VALUES (24, 'user_1794048799326', 0, NULL);
INSERT INTO public.users VALUES (25, 'user_1794049484104', 0, NULL);
INSERT INTO public.users VALUES (26, 'user_1794049484103', 0, NULL);
INSERT INTO public.users VALUES (27, 'user_1794050611978', 0, NULL);
INSERT INTO public.users VALUES (28, 'user_1794050611977', 0, NULL);
INSERT INTO public.users VALUES (29, 'user_1794050686693', 0, NULL);
INSERT INTO public.users VALUES (30, 'user_1794050686692', 0, NULL);
INSERT INTO public.users VALUES (32, 'user_1794050742680', 2, 120);
INSERT INTO public.users VALUES (31, 'user_1794050742681', 5, 203);
INSERT INTO public.users VALUES (50, 'user_1794051820403', 2, 739);
INSERT INTO public.users VALUES (34, 'user_1794050785411', 2, 260);
INSERT INTO public.users VALUES (49, 'user_1794051820404', 5, 348);
INSERT INTO public.users VALUES (33, 'user_1794050785412', 5, 135);
INSERT INTO public.users VALUES (36, 'user_1794050815914', 2, 50);
INSERT INTO public.users VALUES (52, 'user_1794052107444', 2, 550);
INSERT INTO public.users VALUES (35, 'user_1794050815915', 5, 48);
INSERT INTO public.users VALUES (51, 'user_1794052107445', 5, 112);
INSERT INTO public.users VALUES (38, 'user_1794050833940', 2, 231);
INSERT INTO public.users VALUES (37, 'user_1794050833941', 5, 110);
INSERT INTO public.users VALUES (40, 'user_1794050875795', 2, 586);
INSERT INTO public.users VALUES (54, 'user_1794052303936', 2, 424);
INSERT INTO public.users VALUES (39, 'user_1794050875796', 5, 126);
INSERT INTO public.users VALUES (53, 'user_1794052303937', 5, 110);
INSERT INTO public.users VALUES (42, 'user_1794051046492', 2, 814);
INSERT INTO public.users VALUES (41, 'user_1794051046493', 5, 321);
INSERT INTO public.users VALUES (44, 'user_1794051137122', 2, 306);
INSERT INTO public.users VALUES (43, 'user_1794051137123', 5, 27);
INSERT INTO public.users VALUES (46, 'user_1794051509560', 2, 340);
INSERT INTO public.users VALUES (45, 'user_1794051509561', 5, 272);
INSERT INTO public.users VALUES (48, 'user_1794051598935', 2, 189);
INSERT INTO public.users VALUES (47, 'user_1794051598936', 5, 55);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 54, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

