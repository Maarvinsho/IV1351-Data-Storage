--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-26 10:37:01

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 17445)
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
-- TOC entry 218 (class 1259 OID 17448)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    instructor_id integer NOT NULL,
    name character varying(100) NOT NULL,
    personal_number character varying(12) NOT NULL,
    adress character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(100) NOT NULL,
    can_teach_ensembles boolean NOT NULL
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17451)
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
-- TOC entry 220 (class 1259 OID 17452)
-- Name: instructor_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_instrument (
    instrument character varying(100) NOT NULL,
    instructor_id integer NOT NULL
);


ALTER TABLE public.instructor_instrument OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17455)
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
-- TOC entry 222 (class 1259 OID 17458)
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
-- TOC entry 223 (class 1259 OID 17459)
-- Name: lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson (
    lesson_id integer NOT NULL,
    level character varying(20) NOT NULL,
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
-- TOC entry 224 (class 1259 OID 17462)
-- Name: lesson_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_instrument (
    instrument character varying(100) NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.lesson_instrument OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17465)
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
-- TOC entry 226 (class 1259 OID 17466)
-- Name: price_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_list (
    price_list_id integer NOT NULL,
    lesson_type character varying(20) NOT NULL,
    level character varying(20) NOT NULL,
    price integer NOT NULL,
    valid_from date DEFAULT '2024-01-01'::date NOT NULL,
    valid_to date
);


ALTER TABLE public.price_list OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17470)
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
-- TOC entry 228 (class 1259 OID 17471)
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    instrument_id integer NOT NULL,
    student_id integer NOT NULL,
    rental_time character varying(100) NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17474)
-- Name: sibling_personal_number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sibling_personal_number (
    sibling_personal_number character varying(12) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.sibling_personal_number OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17477)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    student_id integer NOT NULL,
    name character varying(100) NOT NULL,
    personal_number character varying(12) NOT NULL,
    adress character varying(200),
    email character varying(200),
    phone_number character varying(100),
    maximum_rentals integer NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17482)
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
-- TOC entry 232 (class 1259 OID 17483)
-- Name: time_slot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slot (
    time_slot_id integer NOT NULL,
    date timestamp(6) without time zone NOT NULL,
    available boolean NOT NULL
);


ALTER TABLE public.time_slot OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17486)
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
-- TOC entry 4926 (class 0 OID 17445)
-- Dependencies: 217
-- Data for Name: contact_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_person (student_id, contact_person_id, name, email, phone_number) FROM stdin;
\.


--
-- TOC entry 4927 (class 0 OID 17448)
-- Dependencies: 218
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (instructor_id, name, personal_number, adress, email, phone_number, can_teach_ensembles) FROM stdin;
\.


--
-- TOC entry 4929 (class 0 OID 17452)
-- Dependencies: 220
-- Data for Name: instructor_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor_instrument (instrument, instructor_id) FROM stdin;
\.


--
-- TOC entry 4930 (class 0 OID 17455)
-- Dependencies: 221
-- Data for Name: instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instrument (instrument_id, instrument_serial_number, brand, monthlyfee, instrument_type) FROM stdin;
\.


--
-- TOC entry 4932 (class 0 OID 17459)
-- Dependencies: 223
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson (lesson_id, level, minimum_number_of_students, maximum_number_of_students, genre, student_id, instructor_id, price_list_id, time_slot_id) FROM stdin;
\.


--
-- TOC entry 4933 (class 0 OID 17462)
-- Dependencies: 224
-- Data for Name: lesson_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson_instrument (instrument, lesson_id) FROM stdin;
\.


--
-- TOC entry 4935 (class 0 OID 17466)
-- Dependencies: 226
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_list (price_list_id, lesson_type, level, price, valid_from, valid_to) FROM stdin;
\.


--
-- TOC entry 4937 (class 0 OID 17471)
-- Dependencies: 228
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental (instrument_id, student_id, rental_time) FROM stdin;
\.


--
-- TOC entry 4938 (class 0 OID 17474)
-- Dependencies: 229
-- Data for Name: sibling_personal_number; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sibling_personal_number (sibling_personal_number, student_id) FROM stdin;
\.


--
-- TOC entry 4939 (class 0 OID 17477)
-- Dependencies: 230
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (student_id, name, personal_number, adress, email, phone_number, maximum_rentals) FROM stdin;
\.


--
-- TOC entry 4941 (class 0 OID 17483)
-- Dependencies: 232
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slot (time_slot_id, date, available) FROM stdin;
\.


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 219
-- Name: instructor_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instructor_id_seq', 1, false);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 222
-- Name: instrument_instrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instrument_instrument_id_seq', 1, false);


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 225
-- Name: lesson_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_lesson_id_seq', 1, false);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 227
-- Name: price_list_price_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_list_price_list_id_seq', 1, false);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 231
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 1, false);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 233
-- Name: time_slot_time_slot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slot_time_slot_id_seq', 1, false);


--
-- TOC entry 4742 (class 2606 OID 17488)
-- Name: contact_person contact_person_contact_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_contact_person_id_key UNIQUE (contact_person_id);


--
-- TOC entry 4744 (class 2606 OID 17490)
-- Name: contact_person contact_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4750 (class 2606 OID 17492)
-- Name: instructor_instrument instructor_instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument
    ADD CONSTRAINT instructor_instrument_pkey PRIMARY KEY (instrument, instructor_id);


--
-- TOC entry 4746 (class 2606 OID 17494)
-- Name: instructor instructor_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_personal_number_key UNIQUE (personal_number);


--
-- TOC entry 4748 (class 2606 OID 17496)
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (instructor_id);


--
-- TOC entry 4752 (class 2606 OID 17498)
-- Name: instrument instrument_instrument_serial_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_instrument_serial_number_key UNIQUE (instrument_serial_number);


--
-- TOC entry 4754 (class 2606 OID 17500)
-- Name: instrument instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_pkey PRIMARY KEY (instrument_id);


--
-- TOC entry 4758 (class 2606 OID 17502)
-- Name: lesson_instrument lesson_instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_instrument
    ADD CONSTRAINT lesson_instrument_pkey PRIMARY KEY (lesson_id);


--
-- TOC entry 4756 (class 2606 OID 17504)
-- Name: lesson lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_pkey PRIMARY KEY (lesson_id);


--
-- TOC entry 4760 (class 2606 OID 17506)
-- Name: price_list price_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list
    ADD CONSTRAINT price_list_pkey PRIMARY KEY (price_list_id);


--
-- TOC entry 4762 (class 2606 OID 17508)
-- Name: rental rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (instrument_id, student_id);


--
-- TOC entry 4764 (class 2606 OID 17510)
-- Name: sibling_personal_number sibling_personal_number_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_personal_number
    ADD CONSTRAINT sibling_personal_number_pkey PRIMARY KEY (sibling_personal_number, student_id);


--
-- TOC entry 4766 (class 2606 OID 17512)
-- Name: student student_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_personal_number_key UNIQUE (personal_number);


--
-- TOC entry 4768 (class 2606 OID 17514)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4770 (class 2606 OID 17516)
-- Name: time_slot time_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slot
    ADD CONSTRAINT time_slot_pkey PRIMARY KEY (time_slot_id);


--
-- TOC entry 4771 (class 2606 OID 17517)
-- Name: contact_person fk_contact_person_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT fk_contact_person_student FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4772 (class 2606 OID 17522)
-- Name: instructor_instrument fk_instructor_instrument_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument
    ADD CONSTRAINT fk_instructor_instrument_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4773 (class 2606 OID 17527)
-- Name: lesson fk_lesson_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4777 (class 2606 OID 17537)
-- Name: lesson_instrument fk_lesson_instrument_lesson; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_instrument
    ADD CONSTRAINT fk_lesson_instrument_lesson FOREIGN KEY (lesson_id) REFERENCES public.lesson(lesson_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4774 (class 2606 OID 17542)
-- Name: lesson fk_lesson_price_list; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_price_list FOREIGN KEY (price_list_id) REFERENCES public.price_list(price_list_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4775 (class 2606 OID 17547)
-- Name: lesson fk_lesson_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_student FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4776 (class 2606 OID 17552)
-- Name: lesson fk_lesson_time_slot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_time_slot FOREIGN KEY (time_slot_id) REFERENCES public.time_slot(time_slot_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4778 (class 2606 OID 17557)
-- Name: rental fk_rental_instrument; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_instrument FOREIGN KEY (instrument_id) REFERENCES public.instrument(instrument_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4779 (class 2606 OID 17562)
-- Name: rental fk_rental_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_student FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4780 (class 2606 OID 17567)
-- Name: sibling_personal_number fk_sibling_personal_number_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_personal_number
    ADD CONSTRAINT fk_sibling_personal_number_student FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2024-11-26 10:37:02

--
-- PostgreSQL database dump complete
--

