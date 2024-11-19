--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-19 02:08:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 235 (class 1255 OID 16533)
-- Name: auto_insert_contact_person(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_insert_contact_person() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Automatically insert a default contact person for the new student
    INSERT INTO contact_person (student_id, contact_person_id, name, email, phone_number)
    VALUES
    (NEW.student_id, '000000000000', 'Default Contact', 'default@example.com', '555-0000');

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.auto_insert_contact_person() OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 16531)
-- Name: auto_insert_instruments(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_insert_instruments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Automatically insert default instruments for the new instructor
    INSERT INTO instructor_instrument (instrument, instructor_id)
    VALUES
    ('Guitar', NEW.instructor_id),
    ('Piano', NEW.instructor_id),
    ('Violin', NEW.instructor_id);

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.auto_insert_instruments() OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 16535)
-- Name: auto_insert_lesson_instruments(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_insert_lesson_instruments() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Automatically associate a default instrument with the new lesson
    INSERT INTO lesson_instrument (instrument, lesson_id)
    VALUES
    ('Guitar', NEW.lesson_id);

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.auto_insert_lesson_instruments() OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 16537)
-- Name: auto_insert_rental(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_insert_rental() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Automatically create a rental record for the new student
    INSERT INTO rental (instrument_id, student_id, rental_time)
    VALUES
    (1, NEW.student_id, CURRENT_TIMESTAMP); -- Default instrument_id is 1

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.auto_insert_rental() OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 16539)
-- Name: auto_insert_sibling(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.auto_insert_sibling() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Automatically create a sibling record for the new student
    INSERT INTO sibling_personal_number (sibling_personal_number, student_id)
    VALUES
    ('000000000000', NEW.student_id);

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.auto_insert_sibling() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 17036)
-- Name: contact_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_person (
    student_id integer NOT NULL,
    contact_person_id character varying(12) NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(200),
    phone_number character varying(100) NOT NULL
);


ALTER TABLE public.contact_person OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16994)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    instructor_id integer NOT NULL,
    name character varying(100) NOT NULL,
    personal_number character varying(12) NOT NULL,
    adress character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(100) NOT NULL,
    can_teach_ensembles boolean
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16993)
-- Name: instructor_instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instructor ALTER COLUMN instructor_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.instructor_instructor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 17001)
-- Name: instructor_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_instrument (
    instrument character varying(100) NOT NULL,
    instructor_id integer NOT NULL
);


ALTER TABLE public.instructor_instrument OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17012)
-- Name: instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrument (
    instrument_id integer NOT NULL,
    instrument_serial_number character varying(100) NOT NULL,
    brand character varying(100) NOT NULL,
    monthlyfee integer NOT NULL,
    instrument_type character varying(100) NOT NULL
);


ALTER TABLE public.instrument OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17011)
-- Name: instrument_instrument_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.instrument ALTER COLUMN instrument_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.instrument_instrument_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 17065)
-- Name: lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson (
    lesson_id integer NOT NULL,
    level character varying(100) NOT NULL,
    minimum_number_of_students integer,
    maximum_number_of_students integer,
    genre character varying(100),
    student_id integer NOT NULL,
    instructor_id integer NOT NULL,
    price_list_id integer NOT NULL,
    time_slot_id integer NOT NULL
);


ALTER TABLE public.lesson OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17090)
-- Name: lesson_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_instrument (
    instrument character varying(100) NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.lesson_instrument OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17064)
-- Name: lesson_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.lesson ALTER COLUMN lesson_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.lesson_lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 17020)
-- Name: price_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_list (
    price_list_id integer NOT NULL,
    lesson_type character varying(20) NOT NULL,
    level character varying(20) NOT NULL,
    price integer NOT NULL,
    is_valid boolean NOT NULL
);


ALTER TABLE public.price_list OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17019)
-- Name: price_list_price_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.price_list ALTER COLUMN price_list_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.price_list_price_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 17100)
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    instrument_id integer NOT NULL,
    student_id integer NOT NULL,
    rental_time character varying(100) NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17048)
-- Name: sibling_personal_number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sibling_personal_number (
    sibling_personal_number character varying(12) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.sibling_personal_number OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17026)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    name character varying(100) NOT NULL,
    personal_number character varying(12) NOT NULL,
    adress character varying(200) NOT NULL,
    email character varying(200) NOT NULL,
    phone_number character varying(100) NOT NULL,
    maximum_rentals integer NOT NULL,
    CONSTRAINT student_maximum_rentals_check CHECK (((maximum_rentals >= 0) AND (maximum_rentals <= 2)))
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17025)
-- Name: student_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.student ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.student_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 17059)
-- Name: time_slot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slot (
    time_slot_id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    available boolean NOT NULL
);


ALTER TABLE public.time_slot OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17058)
-- Name: time_slot_time_slot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.time_slot ALTER COLUMN time_slot_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.time_slot_time_slot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4886 (class 0 OID 17036)
-- Dependencies: 226
-- Data for Name: contact_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_person (student_id, contact_person_id, name, email, phone_number) FROM stdin;
\.


--
-- TOC entry 4878 (class 0 OID 16994)
-- Dependencies: 218
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (instructor_id, name, personal_number, adress, email, phone_number, can_teach_ensembles) FROM stdin;
\.


--
-- TOC entry 4879 (class 0 OID 17001)
-- Dependencies: 219
-- Data for Name: instructor_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor_instrument (instrument, instructor_id) FROM stdin;
\.


--
-- TOC entry 4881 (class 0 OID 17012)
-- Dependencies: 221
-- Data for Name: instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instrument (instrument_id, instrument_serial_number, brand, monthlyfee, instrument_type) FROM stdin;
\.


--
-- TOC entry 4891 (class 0 OID 17065)
-- Dependencies: 231
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson (lesson_id, level, minimum_number_of_students, maximum_number_of_students, genre, student_id, instructor_id, price_list_id, time_slot_id) FROM stdin;
\.


--
-- TOC entry 4892 (class 0 OID 17090)
-- Dependencies: 232
-- Data for Name: lesson_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson_instrument (instrument, lesson_id) FROM stdin;
\.


--
-- TOC entry 4883 (class 0 OID 17020)
-- Dependencies: 223
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_list (price_list_id, lesson_type, level, price, is_valid) FROM stdin;
\.


--
-- TOC entry 4893 (class 0 OID 17100)
-- Dependencies: 233
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental (instrument_id, student_id, rental_time) FROM stdin;
\.


--
-- TOC entry 4887 (class 0 OID 17048)
-- Dependencies: 227
-- Data for Name: sibling_personal_number; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sibling_personal_number (sibling_personal_number, student_id) FROM stdin;
\.


--
-- TOC entry 4885 (class 0 OID 17026)
-- Dependencies: 225
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (student_id, name, personal_number, adress, email, phone_number, maximum_rentals) FROM stdin;
\.


--
-- TOC entry 4889 (class 0 OID 17059)
-- Dependencies: 229
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slot (time_slot_id, date, available) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 217
-- Name: instructor_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instructor_id_seq', 1, false);


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 220
-- Name: instrument_instrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instrument_instrument_id_seq', 1, false);


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 230
-- Name: lesson_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_lesson_id_seq', 1, false);


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 222
-- Name: price_list_price_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_list_price_list_id_seq', 1, false);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 224
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 1, false);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 228
-- Name: time_slot_time_slot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slot_time_slot_id_seq', 1, false);


--
-- TOC entry 4709 (class 2606 OID 17042)
-- Name: contact_person contact_person_contact_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_contact_person_id_key UNIQUE (contact_person_id);


--
-- TOC entry 4693 (class 2606 OID 17000)
-- Name: instructor instructor_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_personal_number_key UNIQUE (personal_number);


--
-- TOC entry 4699 (class 2606 OID 17018)
-- Name: instrument instrument_instrument_serial_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_instrument_serial_number_key UNIQUE (instrument_serial_number);


--
-- TOC entry 4711 (class 2606 OID 17040)
-- Name: contact_person pk_contact_person; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT pk_contact_person PRIMARY KEY (student_id);


--
-- TOC entry 4695 (class 2606 OID 16998)
-- Name: instructor pk_instructor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT pk_instructor PRIMARY KEY (instructor_id);


--
-- TOC entry 4697 (class 2606 OID 17005)
-- Name: instructor_instrument pk_instructor_instrument; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument
    ADD CONSTRAINT pk_instructor_instrument PRIMARY KEY (instrument, instructor_id);


--
-- TOC entry 4701 (class 2606 OID 17016)
-- Name: instrument pk_instrument; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT pk_instrument PRIMARY KEY (instrument_id);


--
-- TOC entry 4717 (class 2606 OID 17069)
-- Name: lesson pk_lesson; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT pk_lesson PRIMARY KEY (lesson_id);


--
-- TOC entry 4719 (class 2606 OID 17094)
-- Name: lesson_instrument pk_lesson_instrument; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_instrument
    ADD CONSTRAINT pk_lesson_instrument PRIMARY KEY (instrument, lesson_id);


--
-- TOC entry 4703 (class 2606 OID 17024)
-- Name: price_list pk_price_list; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list
    ADD CONSTRAINT pk_price_list PRIMARY KEY (price_list_id);


--
-- TOC entry 4721 (class 2606 OID 17104)
-- Name: rental pk_rental; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT pk_rental PRIMARY KEY (instrument_id, student_id);


--
-- TOC entry 4713 (class 2606 OID 17052)
-- Name: sibling_personal_number pk_sibling_personal_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_personal_number
    ADD CONSTRAINT pk_sibling_personal_number PRIMARY KEY (sibling_personal_number, student_id);


--
-- TOC entry 4705 (class 2606 OID 17033)
-- Name: student pk_student; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT pk_student PRIMARY KEY (student_id);


--
-- TOC entry 4715 (class 2606 OID 17063)
-- Name: time_slot pk_time_slot; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slot
    ADD CONSTRAINT pk_time_slot PRIMARY KEY (time_slot_id);


--
-- TOC entry 4707 (class 2606 OID 17035)
-- Name: student student_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_personal_number_key UNIQUE (personal_number);


--
-- TOC entry 4723 (class 2606 OID 17043)
-- Name: contact_person fk_contact_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT fk_contact_person FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;


--
-- TOC entry 4722 (class 2606 OID 17006)
-- Name: instructor_instrument fk_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument
    ADD CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON DELETE CASCADE;


--
-- TOC entry 4725 (class 2606 OID 17075)
-- Name: lesson fk_lesson_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id);


--
-- TOC entry 4729 (class 2606 OID 17095)
-- Name: lesson_instrument fk_lesson_instrument; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_instrument
    ADD CONSTRAINT fk_lesson_instrument FOREIGN KEY (lesson_id) REFERENCES public.lesson(lesson_id) ON DELETE CASCADE;


--
-- TOC entry 4726 (class 2606 OID 17080)
-- Name: lesson fk_lesson_price; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_price FOREIGN KEY (price_list_id) REFERENCES public.price_list(price_list_id);


--
-- TOC entry 4727 (class 2606 OID 17070)
-- Name: lesson fk_lesson_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_student FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- TOC entry 4728 (class 2606 OID 17085)
-- Name: lesson fk_lesson_time; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_time FOREIGN KEY (time_slot_id) REFERENCES public.time_slot(time_slot_id);


--
-- TOC entry 4730 (class 2606 OID 17105)
-- Name: rental fk_rental_instrument; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_instrument FOREIGN KEY (instrument_id) REFERENCES public.instrument(instrument_id) ON DELETE CASCADE;


--
-- TOC entry 4731 (class 2606 OID 17110)
-- Name: rental fk_rental_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_student FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;


--
-- TOC entry 4724 (class 2606 OID 17053)
-- Name: sibling_personal_number fk_sibling; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_personal_number
    ADD CONSTRAINT fk_sibling FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;


-- Completed on 2024-11-19 02:08:54

--
-- PostgreSQL database dump complete
--

