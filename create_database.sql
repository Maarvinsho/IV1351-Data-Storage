--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-19 16:32:35

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
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 17967)
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
-- TOC entry 218 (class 1259 OID 17970)
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
-- TOC entry 219 (class 1259 OID 17973)
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
-- TOC entry 220 (class 1259 OID 17974)
-- Name: instructor_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_instrument (
    instrument character varying(100) NOT NULL,
    instructor_id integer NOT NULL
);


ALTER TABLE public.instructor_instrument OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17977)
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
-- TOC entry 222 (class 1259 OID 17980)
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
-- TOC entry 223 (class 1259 OID 17981)
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
-- TOC entry 224 (class 1259 OID 17984)
-- Name: lesson_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_instrument (
    instrument character varying(100) NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.lesson_instrument OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17987)
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
-- TOC entry 226 (class 1259 OID 17988)
-- Name: price_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_list (
    price_list_id integer NOT NULL,
    lesson_type character varying(20) NOT NULL,
    level character varying(20) NOT NULL,
    price integer NOT NULL,
    valid_from date DEFAULT CURRENT_DATE NOT NULL,
    valid_to date
);


ALTER TABLE public.price_list OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17992)
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
-- TOC entry 228 (class 1259 OID 17993)
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    instrument_id integer NOT NULL,
    student_id integer NOT NULL,
    rental_time character varying(100) NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17996)
-- Name: sibling_personal_number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sibling_personal_number (
    sibling_personal_number character varying(12) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.sibling_personal_number OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17999)
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
-- TOC entry 231 (class 1259 OID 18005)
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
-- TOC entry 232 (class 1259 OID 18006)
-- Name: time_slot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slot (
    time_slot_id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    available boolean NOT NULL
);


ALTER TABLE public.time_slot OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18009)
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
-- TOC entry 4873 (class 0 OID 17967)
-- Dependencies: 217
-- Data for Name: contact_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_person (student_id, contact_person_id, name, email, phone_number) FROM stdin;
1	197612055678	Maria Karlsson	maria.karlsson@example.com	+46703334444
2	198010103456	Peter Nilsson	peter.nilsson@example.com	+46704445555
\.


--
-- TOC entry 4874 (class 0 OID 17970)
-- Dependencies: 218
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (instructor_id, name, personal_number, adress, email, phone_number, can_teach_ensembles) FROM stdin;
1	Erik Andersson	198705221234	Kungsgatan 12, Stockholm	erik.andersson@example.com	+46701234567	t
2	Sara Svensson	199012155678	Storgatan 45, G”teborg	sara.svensson@example.com	+46705555555	f
\.


--
-- TOC entry 4876 (class 0 OID 17974)
-- Dependencies: 220
-- Data for Name: instructor_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor_instrument (instrument, instructor_id) FROM stdin;
Guitar	1
Piano	1
Violin	2
\.


--
-- TOC entry 4877 (class 0 OID 17977)
-- Dependencies: 221
-- Data for Name: instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instrument (instrument_id, instrument_serial_number, brand, monthlyfee, instrument_type) FROM stdin;
1	A456	Yamaha	200	Guitar
2	B789	Steinway	300	Piano
3	C012	Stradivarius	500	Violin
\.


--
-- TOC entry 4879 (class 0 OID 17981)
-- Dependencies: 223
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson (lesson_id, level, minimum_number_of_students, maximum_number_of_students, genre, student_id, instructor_id, price_list_id, time_slot_id) FROM stdin;
1	Intermediate	2	5	Classical	1	1	2	1
2	Beginner	1	3	Pop	2	2	1	3
\.


--
-- TOC entry 4880 (class 0 OID 17984)
-- Dependencies: 224
-- Data for Name: lesson_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson_instrument (instrument, lesson_id) FROM stdin;
Guitar	1
Piano	2
\.


--
-- TOC entry 4882 (class 0 OID 17988)
-- Dependencies: 226
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_list (price_list_id, lesson_type, level, price, valid_from, valid_to) FROM stdin;
1	Individual	Beginner	200	2024-01-01	\N
2	Group	Intermediate	150	2024-01-01	\N
3	Ensemble	Advanced	300	2024-01-01	\N
4	Individual	Beginner	180	2023-01-01	2023-12-31
5	Group	Intermediate	140	2023-01-01	2023-12-31
\.


--
-- TOC entry 4884 (class 0 OID 17993)
-- Dependencies: 228
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental (instrument_id, student_id, rental_time) FROM stdin;
1	1	2024-11-01 10:00:00
2	2	2024-11-02 11:00:00
\.


--
-- TOC entry 4885 (class 0 OID 17996)
-- Dependencies: 229
-- Data for Name: sibling_personal_number; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sibling_personal_number (sibling_personal_number, student_id) FROM stdin;
199305252345	1
199901014567	2
\.


--
-- TOC entry 4886 (class 0 OID 17999)
-- Dependencies: 230
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (student_id, name, personal_number, adress, email, phone_number, maximum_rentals) FROM stdin;
1	Anna Karlsson	200305157890	Vasagatan 18, Malm”	anna.karlsson@example.com	+46701112222	2
2	Johan Nilsson	199806101234	Drottninggatan 25, Uppsala	johan.nilsson@example.com	+46702223333	1
\.


--
-- TOC entry 4888 (class 0 OID 18006)
-- Dependencies: 232
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slot (time_slot_id, date, available) FROM stdin;
1	2024-11-20 10:00:00	t
2	2024-11-20 11:00:00	f
3	2024-11-21 14:00:00	t
\.


--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 219
-- Name: instructor_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instructor_id_seq', 2, true);


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 222
-- Name: instrument_instrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instrument_instrument_id_seq', 3, true);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 225
-- Name: lesson_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_lesson_id_seq', 2, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 227
-- Name: price_list_price_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_list_price_list_id_seq', 5, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 231
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 2, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 233
-- Name: time_slot_time_slot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slot_time_slot_id_seq', 3, true);


--
-- TOC entry 4689 (class 2606 OID 18011)
-- Name: contact_person contact_person_contact_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_contact_person_id_key UNIQUE (contact_person_id);


--
-- TOC entry 4693 (class 2606 OID 18013)
-- Name: instructor instructor_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_personal_number_key UNIQUE (personal_number);


--
-- TOC entry 4699 (class 2606 OID 18015)
-- Name: instrument instrument_instrument_serial_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_instrument_serial_number_key UNIQUE (instrument_serial_number);


--
-- TOC entry 4691 (class 2606 OID 18017)
-- Name: contact_person pk_contact_person; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT pk_contact_person PRIMARY KEY (student_id);


--
-- TOC entry 4695 (class 2606 OID 18019)
-- Name: instructor pk_instructor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT pk_instructor PRIMARY KEY (instructor_id);


--
-- TOC entry 4697 (class 2606 OID 18021)
-- Name: instructor_instrument pk_instructor_instrument; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument
    ADD CONSTRAINT pk_instructor_instrument PRIMARY KEY (instrument, instructor_id);


--
-- TOC entry 4701 (class 2606 OID 18023)
-- Name: instrument pk_instrument; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT pk_instrument PRIMARY KEY (instrument_id);


--
-- TOC entry 4703 (class 2606 OID 18025)
-- Name: lesson pk_lesson; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT pk_lesson PRIMARY KEY (lesson_id);


--
-- TOC entry 4705 (class 2606 OID 18027)
-- Name: lesson_instrument pk_lesson_instrument; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_instrument
    ADD CONSTRAINT pk_lesson_instrument PRIMARY KEY (instrument, lesson_id);


--
-- TOC entry 4707 (class 2606 OID 18029)
-- Name: price_list pk_price_list; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list
    ADD CONSTRAINT pk_price_list PRIMARY KEY (price_list_id);


--
-- TOC entry 4709 (class 2606 OID 18031)
-- Name: rental pk_rental; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT pk_rental PRIMARY KEY (instrument_id, student_id);


--
-- TOC entry 4711 (class 2606 OID 18033)
-- Name: sibling_personal_number pk_sibling_personal_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_personal_number
    ADD CONSTRAINT pk_sibling_personal_number PRIMARY KEY (sibling_personal_number, student_id);


--
-- TOC entry 4713 (class 2606 OID 18035)
-- Name: student pk_student; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT pk_student PRIMARY KEY (student_id);


--
-- TOC entry 4717 (class 2606 OID 18037)
-- Name: time_slot pk_time_slot; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slot
    ADD CONSTRAINT pk_time_slot PRIMARY KEY (time_slot_id);


--
-- TOC entry 4715 (class 2606 OID 18039)
-- Name: student student_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_personal_number_key UNIQUE (personal_number);


--
-- TOC entry 4718 (class 2606 OID 18040)
-- Name: contact_person fk_contact_person; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT fk_contact_person FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;


--
-- TOC entry 4719 (class 2606 OID 18045)
-- Name: instructor_instrument fk_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument
    ADD CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON DELETE CASCADE;


--
-- TOC entry 4720 (class 2606 OID 18050)
-- Name: lesson fk_lesson_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id);


--
-- TOC entry 4724 (class 2606 OID 18055)
-- Name: lesson_instrument fk_lesson_instrument; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_instrument
    ADD CONSTRAINT fk_lesson_instrument FOREIGN KEY (lesson_id) REFERENCES public.lesson(lesson_id) ON DELETE CASCADE;


--
-- TOC entry 4721 (class 2606 OID 18060)
-- Name: lesson fk_lesson_price; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_price FOREIGN KEY (price_list_id) REFERENCES public.price_list(price_list_id);


--
-- TOC entry 4722 (class 2606 OID 18065)
-- Name: lesson fk_lesson_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_student FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- TOC entry 4723 (class 2606 OID 18070)
-- Name: lesson fk_lesson_time; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_time FOREIGN KEY (time_slot_id) REFERENCES public.time_slot(time_slot_id);


--
-- TOC entry 4725 (class 2606 OID 18075)
-- Name: rental fk_rental_instrument; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_instrument FOREIGN KEY (instrument_id) REFERENCES public.instrument(instrument_id) ON DELETE CASCADE;


--
-- TOC entry 4726 (class 2606 OID 18080)
-- Name: rental fk_rental_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_student FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;


--
-- TOC entry 4727 (class 2606 OID 18085)
-- Name: sibling_personal_number fk_sibling; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_personal_number
    ADD CONSTRAINT fk_sibling FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON DELETE CASCADE;


--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE contact_person; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.contact_person TO marvi;


--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE instructor; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.instructor TO marvi;


--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 219
-- Name: SEQUENCE instructor_instructor_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.instructor_instructor_id_seq TO marvi;


--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE instructor_instrument; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.instructor_instrument TO marvi;


--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE instrument; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.instrument TO marvi;


--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 222
-- Name: SEQUENCE instrument_instrument_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.instrument_instrument_id_seq TO marvi;


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE lesson; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lesson TO marvi;


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE lesson_instrument; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lesson_instrument TO marvi;


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 225
-- Name: SEQUENCE lesson_lesson_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.lesson_lesson_id_seq TO marvi;


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE price_list; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.price_list TO marvi;


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 227
-- Name: SEQUENCE price_list_price_list_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.price_list_price_list_id_seq TO marvi;


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE rental; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.rental TO marvi;


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE sibling_personal_number; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.sibling_personal_number TO marvi;


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE student; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.student TO marvi;


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 231
-- Name: SEQUENCE student_student_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.student_student_id_seq TO marvi;


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE time_slot; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.time_slot TO marvi;


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 233
-- Name: SEQUENCE time_slot_time_slot_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.time_slot_time_slot_id_seq TO marvi;


-- Completed on 2024-11-19 16:32:35

--
-- PostgreSQL database dump complete
--

