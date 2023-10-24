--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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

--
-- Name: delete_person(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.delete_person(IN p_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM person
	WHERE id = p_id;
    
	COMMIT;
END;
$$;


ALTER PROCEDURE public.delete_person(IN p_id integer) OWNER TO postgres;

--
-- Name: get_person_by_id(integer, refcursor); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.get_person_by_id(IN p_id integer, INOUT result refcursor)
    LANGUAGE plpgsql
    AS $$
BEGIN
OPEN result FOR 
	SELECT id, 
		name, 
		surname, 
		date_created::text
	FROM person
	WHERE id = p_id; 
END;
$$;


ALTER PROCEDURE public.get_person_by_id(IN p_id integer, INOUT result refcursor) OWNER TO postgres;

--
-- Name: get_persons(refcursor); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.get_persons(INOUT result refcursor)
    LANGUAGE plpgsql
    AS $$BEGIN
OPEN result FOR 
	SELECT id, 
		name, 
		surname, 
		date_created::text
	FROM person; 
END;
$$;


ALTER PROCEDURE public.get_persons(INOUT result refcursor) OWNER TO postgres;

--
-- Name: insert_person(text, text, integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.insert_person(IN p_name text, IN p_surname text, INOUT next_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO person (name, surname)
	VALUES (p_name, p_surname)
    RETURNING id INTO next_id;
    
	COMMIT;
END;
$$;


ALTER PROCEDURE public.insert_person(IN p_name text, IN p_surname text, INOUT next_id integer) OWNER TO postgres;

--
-- Name: test_prc(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.test_prc()
    LANGUAGE plpgsql
    AS $$
        
BEGIN
insert into person(name, surname) values('qqq', 'www');
--open result for SELECT * FROM person; 
END;
$$;


ALTER PROCEDURE public.test_prc() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    name text,
    surname text,
    date_created timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (id, name, surname, date_created) FROM stdin;
1	Petro	Volk	2023-04-30 14:11:24.307527+03
2	Vasil	Pupko	2023-04-30 14:11:24.307527+03
3	Bogdan	Ivashko	2023-04-30 14:11:24.307527+03
59	Curl1	CurlCurl22	2023-04-30 14:16:37.681559+03
60	Curl1	CurlCurl22	2023-04-30 14:18:16.648938+03
61	Curl1	CurlCurl22	2023-04-30 14:24:55.677837+03
62	Curl1	CurlCurl22	2023-04-30 14:25:27.827327+03
63	Curl1	CurlCurl22	2023-04-30 14:27:19.758731+03
66	Curl1	CurlCurl22	2023-04-30 14:46:12.941627+03
\.


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 66, true);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

