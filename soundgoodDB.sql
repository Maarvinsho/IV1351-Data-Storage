--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-29 10:57:49

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
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16903)
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
-- TOC entry 218 (class 1259 OID 16906)
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
-- TOC entry 219 (class 1259 OID 16909)
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
-- TOC entry 220 (class 1259 OID 16910)
-- Name: instructor_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor_instrument (
    instrument character varying(100) NOT NULL,
    instructor_id integer NOT NULL
);


ALTER TABLE public.instructor_instrument OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16913)
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
-- TOC entry 222 (class 1259 OID 16916)
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
-- TOC entry 223 (class 1259 OID 16917)
-- Name: lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson (
    lesson_id integer NOT NULL,
    level character varying(20) NOT NULL,
    minimum_number_of_students integer,
    maximum_number_of_students integer,
    genre character varying(100),
    instructor_id integer NOT NULL,
    price_list_id integer NOT NULL,
    time_slot_id integer NOT NULL
);


ALTER TABLE public.lesson OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16920)
-- Name: lesson_instrument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_instrument (
    instrument character varying(100) NOT NULL,
    lesson_id integer NOT NULL
);


ALTER TABLE public.lesson_instrument OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16923)
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
-- TOC entry 226 (class 1259 OID 16924)
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
-- TOC entry 227 (class 1259 OID 16928)
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
-- TOC entry 228 (class 1259 OID 16929)
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    instrument_id integer NOT NULL,
    student_id integer NOT NULL,
    rental_time character varying(100) NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16932)
-- Name: sibling_personal_number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sibling_personal_number (
    sibling_personal_number character varying(12) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.sibling_personal_number OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16935)
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
-- TOC entry 234 (class 1259 OID 17027)
-- Name: student_lesson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_lesson (
    lesson_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.student_lesson OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16940)
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
-- TOC entry 232 (class 1259 OID 16941)
-- Name: time_slot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slot (
    time_slot_id integer NOT NULL,
    date timestamp(6) without time zone NOT NULL,
    available boolean NOT NULL
);


ALTER TABLE public.time_slot OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16944)
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
-- TOC entry 4933 (class 0 OID 16903)
-- Dependencies: 217
-- Data for Name: contact_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_person (student_id, contact_person_id, name, email, phone_number) FROM stdin;
1	197612055678	Maria Karlsson	maria.karlsson@example.com	+46703334444
2	198010103456	Peter Nilsson	peter.nilsson@example.com	+46704445555
3	197512018765	Lena Olsson	lena.olsson@example.com	+46705556666
4	198209098654	Thomas Berg	thomas.berg@example.com	+46706667777
5	197811147890	Karin Fors	karin.fors@example.com	+46707778888
6	196903127654	Bengt Dahl	bengt.dahl@example.com	+46708889999
7	197802118901	Lisa Strand	lisa.strand@example.com	+46709990000
8	198602171234	Göran Nyström	goran.nystrom@example.com	+46701111222
9	197003145678	Ingrid Holm	ingrid.holm@example.com	+46702223333
10	198405122345	Henrik Lind	henrik.lind@example.com	+46703334444
11	198701198765	Eva Berglund	eva.berglund@example.com	+46704445566
12	197402188901	Olof Sand	olof.sand@example.com	+46705556677
13	198305176543	Kristina Eklund	kristina.eklund@example.com	+46706667788
14	197803127890	Anna Sjögren	anna.sjogren@example.com	+46707778899
15	196805188765	Martin Forsberg	martin.forsberg@example.com	+46708889900
16	197212047654	Nina Dahlberg	nina.dahlberg@example.com	+46709990011
17	198109018765	Fredrik Nygren	fredrik.nygren@example.com	+46701111233
18	197406148901	Therese Åberg	therese.aberg@example.com	+46702223344
19	198010198765	Lars Nilsson	lars.nilsson@example.com	+46703334455
20	197708018901	Elisabeth Strandberg	elisabeth.strandberg@example.com	+46704445566
21	196811027654	Pär Nygren	par.nygren@example.com	+46705556677
22	198312187890	Mona Andersson	mona.andersson@example.com	+46706667788
23	197703137654	Oscar Blom	oscar.blom@example.com	+46707778899
24	198011127890	Helen Bergman	helen.bergman@example.com	+46708889900
25	196910157654	Tomas Sjöblom	tomas.sjoblom@example.com	+46709990011
26	197510187654	Malin Holmström	malin.holmstrom@example.com	+46701111222
27	198209167890	Johan Strandberg	johan.strandberg@example.com	+46702223333
28	197604177890	Sara Dahl	sara.dahl@example.com	+46703334444
29	198104137654	Mats Eklund	mats.eklund@example.com	+46704445555
30	197311107654	Susanne Nyström	susanne.nystrom@example.com	+46705556666
\.


--
-- TOC entry 4934 (class 0 OID 16906)
-- Dependencies: 218
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (instructor_id, name, personal_number, adress, email, phone_number, can_teach_ensembles) FROM stdin;
1	Erik Andersson	198705221234	Kungsgatan 12, Stockholm	erik.andersson@example.com	+46701234567	t
2	Sara Svensson	199012155678	Storgatan 45, Göteborg	sara.svensson@example.com	+46705555555	f
3	Anna Johansson	197805091234	Vasagatan 3, Malmö	anna.johansson@example.com	+46701456789	t
4	Karl Karlsson	198002181567	Östermalmstorg 10, Stockholm	karl.karlsson@example.com	+46708889999	f
5	Maria Lind	199306121234	Lundavägen 24, Lund	maria.lind@example.com	+46701112233	t
6	Fredrik Nyberg	199506061112	Haga Nygata 7, Göteborg	fredrik.nyberg@example.com	+46707774444	t
7	Elin Berg	198910201234	Drottninggatan 25, Stockholm	elin.berg@example.com	+46709998877	f
8	Johan Persson	199111111234	Kungsgatan 8, Uppsala	johan.persson@example.com	+46703336666	t
9	Emma Nilsson	199708091234	Storgatan 13, Växjö	emma.nilsson@example.com	+46705556677	f
10	Oscar Holm	198303051234	Kyrkogatan 5, Helsingborg	oscar.holm@example.com	+46706667788	t
11	Louise Svensson	198908121234	Nygatan 2, Jönköping	louise.svensson@example.com	+46707778899	t
12	Anders Eriksson	197705231234	Lilla Torg 12, Malmö	anders.eriksson@example.com	+46708889900	f
13	Camilla Larsson	198405051234	Västra Hamngatan 15, Göteborg	camilla.larsson@example.com	+46709990011	t
14	Henrik Sjöberg	199103031234	Brunnsgatan 9, Stockholm	henrik.sjoberg@example.com	+46702223344	f
15	Nina Strand	199206201234	Fleminggatan 16, Stockholm	nina.strand@example.com	+46701112244	t
16	Alexander Löf	198601071234	Hamngatan 5, Umeå	alexander.lof@example.com	+46708881234	t
17	Sofia Blom	199409101234	Vaksalagatan 18, Uppsala	sofia.blom@example.com	+46705553322	f
18	Victor Bergman	198802181234	Norra Hamngatan 6, Göteborg	victor.bergman@example.com	+46703333445	t
19	Isabella Sand	199507051234	Skolgatan 20, Linköping	isabella.sand@example.com	+46704445566	f
20	Daniel Nyström	198901301234	Kungsgatan 21, Gävle	daniel.nystrom@example.com	+46706667744	t
21	Maja Hedlund	199008241234	Södra Vägen 14, Karlstad	maja.hedlund@example.com	+46708889922	t
22	Olof Dahl	199111171234	Storgatan 8, Västerås	olof.dahl@example.com	+46702221133	f
23	Therese Falk	199305301234	Östra Hamngatan 4, Göteborg	therese.falk@example.com	+46701114455	t
24	Mattias Åberg	198505251234	Långgatan 7, Örebro	mattias.aberg@example.com	+46708887766	f
25	Karin Östberg	198612201234	Drottninggatan 30, Uppsala	karin.ostberg@example.com	+46705556677	t
26	Gustav Lindström	199204181234	Kungsgatan 33, Sundsvall	gustav.lindstrom@example.com	+46706665544	t
27	Helena Svensk	199406071234	Norra Esplanaden 5, Växjö	helena.svensk@example.com	+46702223344	f
28	Marcus Sandberg	198711151234	Skolgatan 12, Kalmar	marcus.sandberg@example.com	+46709990033	t
29	Lina Håkansson	198905051234	Storgatan 5, Falun	lina.hakansson@example.com	+46708880099	t
30	Jonas Sjögren	199109031234	Kungsgatan 44, Karlskrona	jonas.sjogren@example.com	+46705551122	f
31	Frida Hellström	199705221234	Västra Vägen 23, Uppsala	frida.hellstrom@example.com	+46704443322	t
32	Magnus Larsson	198403041234	Nygatan 3, Östersund	magnus.larsson@example.com	+46703336655	t
33	Malin Sjöblom	199607081234	Södra Hamngatan 6, Göteborg	malin.sjoblom@example.com	+46701112233	f
34	Andreas Holmström	199012121234	Kungsgatan 20, Luleå	andreas.holmstrom@example.com	+46706667733	t
35	Emma Axelsson	198508051234	Drottninggatan 40, Norrköping	emma.axelsson@example.com	+46708887711	t
36	Viktor Fors	199209071234	Norra Vägen 9, Borås	viktor.fors@example.com	+46702224455	f
37	Ida Eklund	199104181234	Storgatan 29, Jönköping	ida.eklund@example.com	+46705550022	t
38	Oscar Ljung	198711121234	Fleminggatan 22, Malmö	oscar.ljung@example.com	+46709991133	t
39	Linda Hall	199306101234	Kungsgatan 6, Sundsvall	linda.hall@example.com	+46704445511	f
\.


--
-- TOC entry 4936 (class 0 OID 16910)
-- Dependencies: 220
-- Data for Name: instructor_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor_instrument (instrument, instructor_id) FROM stdin;
Guitar	1
Piano	1
Violin	2
Drums	3
Keyboard	4
Piano	5
Saxophone	6
Guitar	7
Violin	8
Flute	9
Trumpet	10
Clarinet	11
Drums	12
Piano	13
Keyboard	14
Saxophone	15
Guitar	16
Piano	17
Synthesizer	18
Cello	19
Guitar	20
Violin	21
Keyboard	22
Drums	23
Piano	24
Flute	25
Saxophone	26
Trumpet	27
Guitar	28
Keyboard	29
Violin	30
Drums	31
Piano	32
Guitar	33
Clarinet	34
Saxophone	35
Flute	36
Drums	37
Cello	38
Guitar	39
\.


--
-- TOC entry 4937 (class 0 OID 16913)
-- Dependencies: 221
-- Data for Name: instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instrument (instrument_id, instrument_serial_number, brand, monthlyfee, instrument_type) FROM stdin;
1	A45612345678	Yamaha	200	Guitar
2	B78912345678	Steinway	300	Piano
3	C01212345678	Stradivarius	500	Violin
4	D12312345678	Fender	250	Guitar
5	E45612345678	Gibson	300	Guitar
6	F78912345678	Roland	350	Keyboard
7	G01212345678	Kawai	400	Piano
8	H67812345678	Pearl	150	Drums
9	I67812345678	Selmer	250	Saxophone
10	J90112345678	Bach	300	Trumpet
11	K23412345678	Yamaha	200	Flute
12	L56712345678	Ibanez	220	Guitar
13	M56712345678	Casio	180	Keyboard
14	N12312345678	DW	320	Drums
15	O45612345678	Martin	500	Guitar
16	P78912345678	Buffet Crampon	450	Clarinet
17	Q01212345678	Steinberg	350	Keyboard
18	R34512345678	Zildjian	200	Cymbals
19	S67812345678	Korg	300	Synthesizer
20	T90112345678	Epiphone	275	Guitar
21	U23412345678	Conn	250	Trombone
22	V56712345678	Mapex	290	Drums
23	W89012345678	Bechstein	550	Piano
24	X12312345678	Seagull	320	Guitar
25	Y45612345678	Taylor	400	Guitar
26	Z78912345678	Yamaha	350	Saxophone
27	A98712345678	Kurzweil	300	Keyboard
28	B65412345678	Fazioli	600	Piano
29	C32112345678	Ludwig	280	Drums
30	D87612345678	Yamaha	220	Violin
31	E54312345678	Schimmel	520	Piano
32	F21012345678	Eastman	250	Cello
33	G67812345678	Gretsch	400	Guitar
34	H678ABCDEFGH	Kawai	390	Piano
35	I01212345678	Roland	330	Synthesizer
36	J78912345678	Meinl	250	Percussion
37	K45612345678	Conn-Selmer	270	Tuba
38	L12312345678	Shure	180	Microphone
39	M567ABCDEFGH	Zoom	190	Microphone
40	N67812345678	Boss	300	Effects Pedal
41	O12312345678	Arturia	400	Synthesizer
\.


--
-- TOC entry 4939 (class 0 OID 16917)
-- Dependencies: 223
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson (lesson_id, level, minimum_number_of_students, maximum_number_of_students, genre, instructor_id, price_list_id, time_slot_id) FROM stdin;
1	Beginner	\N	\N	\N	1	1	2
2	Beginner	\N	\N	\N	1	1	6
3	Intermediate	\N	\N	\N	2	2	15
4	Intermediate	\N	\N	\N	2	2	17
5	Beginner	2	5	\N	1	4	9
6	Beginner	2	5	\N	1	4	12
7	Intermediate	3	10	\N	3	5	20
8	Intermediate	3	10	\N	3	5	27
9	Advanced	5	15	Jazz	4	9	28
10	Advanced	5	15	Classical	4	9	34
11	Advanced	5	15	Pop	5	9	35
12	Advanced	5	15	Rock	5	9	41
13	Advanced	5	15	Folk	6	9	43
14	Advanced	5	15	Blues	6	9	48
\.


--
-- TOC entry 4940 (class 0 OID 16920)
-- Dependencies: 224
-- Data for Name: lesson_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson_instrument (instrument, lesson_id) FROM stdin;
Guitar	1
Piano	2
Violin	3
Drums	4
Flute	5
Guitar	6
Keyboard	7
Trumpet	8
Piano	9
Violin	10
Drums	11
Guitar	12
Flute	13
Keyboard	14
\.


--
-- TOC entry 4942 (class 0 OID 16924)
-- Dependencies: 226
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_list (price_list_id, lesson_type, level, price, valid_from, valid_to) FROM stdin;
1	Individual	Beginner	200	2024-01-01	\N
2	Individual	Intermediate	250	2024-01-01	\N
3	Individual	Advanced	300	2024-01-01	\N
4	Group	Beginner	150	2024-01-01	\N
5	Group	Intermediate	200	2024-01-01	\N
6	Group	Advanced	250	2024-01-01	\N
7	Ensemble	Beginner	180	2024-01-01	\N
8	Ensemble	Intermediate	220	2024-01-01	\N
9	Ensemble	Advanced	300	2024-01-01	\N
10	Individual	Beginner	180	2023-01-01	2023-12-31
11	Individual	Intermediate	230	2023-01-01	2023-12-31
12	Individual	Advanced	280	2023-01-01	2023-12-31
13	Group	Beginner	140	2023-01-01	2023-12-31
14	Group	Intermediate	190	2023-01-01	2023-12-31
15	Group	Advanced	240	2023-01-01	2023-12-31
16	Ensemble	Beginner	170	2023-01-01	2023-12-31
17	Ensemble	Intermediate	210	2023-01-01	2023-12-31
18	Ensemble	Advanced	290	2023-01-01	2023-12-31
\.


--
-- TOC entry 4944 (class 0 OID 16929)
-- Dependencies: 228
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental (instrument_id, student_id, rental_time) FROM stdin;
3	1	2024-11-01 10:00:00
2	2	2024-11-02 11:00:00
5	3	2024-11-03 14:00:00
1	4	2024-11-04 15:00:00
4	5	2024-11-05 16:00:00
8	6	2024-11-06 10:00:00
7	7	2024-11-07 11:00:00
6	8	2024-11-08 12:00:00
9	9	2024-11-09 13:00:00
10	10	2024-11-10 14:00:00
13	11	2024-11-11 15:00:00
12	12	2024-11-12 16:00:00
11	13	2024-11-13 10:00:00
14	14	2024-11-14 11:00:00
15	15	2024-11-15 12:00:00
16	16	2024-11-16 13:00:00
\.


--
-- TOC entry 4945 (class 0 OID 16932)
-- Dependencies: 229
-- Data for Name: sibling_personal_number; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sibling_personal_number (sibling_personal_number, student_id) FROM stdin;
199305252345	1
199901014567	2
198807113456	3
199511201234	4
199812291345	5
200102021678	6
199606301234	7
199708051234	8
199406281234	9
199503241234	10
199902141234	11
199712071234	12
199807201234	13
200003041234	14
200011091234	15
199509181234	16
200005251234	17
199807111234	18
200107211234	19
199706181234	20
200006151234	21
199807291234	22
199612181234	23
200103171234	24
199902251234	25
199901211234	26
199805051234	27
199609091234	28
199510041234	29
200110191234	30
199808281234	31
199710071234	32
199703121234	33
199506291234	34
199812091234	35
199605241234	36
200010301234	37
199902211234	38
199911131234	39
199512041234	40
199705051234	41
200201211234	42
199804051234	43
199903281234	44
199910181234	45
199511261234	46
199902151234	47
199603211234	48
200201211234	6
200201211234	26
199503241234	40
199506291234	29
199612181234	9
\.


--
-- TOC entry 4946 (class 0 OID 16935)
-- Dependencies: 230
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (student_id, name, personal_number, adress, email, phone_number, maximum_rentals) FROM stdin;
1	Anna Karlsson	200305157890	Vasagatan 18, Malmö	anna.karlsson@example.com	+46701112222	2
2	Johan Nilsson	199806101234	Drottninggatan 25, Uppsala	johan.nilsson@example.com	+46702223333	2
3	Emma Johansson	200104229876	Storgatan 8, Göteborg	emma.johansson@example.com	+46703334455	2
4	Lucas Berg	199902156789	Kungsgatan 20, Stockholm	lucas.berg@example.com	+46704445566	2
5	Maja Eriksson	200112148901	Nygatan 3, Växjö	maja.eriksson@example.com	+46705556677	2
6	William Lind	199911207654	Brunnsgatan 12, Malmö	william.lind@example.com	+46706667788	2
7	Evelina Nyström	200306131234	Drottninggatan 40, Uppsala	evelina.nystrom@example.com	+46707778899	2
8	Oliver Sandberg	200002181112	Hamngatan 7, Sundsvall	oliver.sandberg@example.com	+46708889900	2
9	Alice Persson	200101201345	Kungsgatan 15, Kalmar	alice.persson@example.com	+46701119922	2
10	Filip Andersson	199804171456	Fleminggatan 9, Linköping	filip.andersson@example.com	+46702223344	2
11	Sofia Blom	200212050987	Norra Hamngatan 11, Karlstad	sofia.blom@example.com	+46703334455	2
12	Oscar Håkansson	199706101234	Vaksalagatan 18, Västerås	oscar.hakansson@example.com	+46704445566	2
13	Clara Sjögren	199903221876	Östra Hamngatan 6, Göteborg	clara.sjogren@example.com	+46705556677	2
14	Elias Svensson	200011051234	Skolgatan 12, Helsingborg	elias.svensson@example.com	+46706667788	2
15	Alma Larsson	200301078901	Lilla Torg 4, Malmö	alma.larsson@example.com	+46707778899	2
16	Viktor Forsberg	200203011234	Norra Vägen 23, Falun	viktor.forsberg@example.com	+46708889900	2
17	Isabella Hellström	199912151112	Kungsgatan 5, Borås	isabella.hellstrom@example.com	+46701119922	2
18	Benjamin Dahl	200005029876	Storgatan 18, Jönköping	benjamin.dahl@example.com	+46702223344	2
19	Nova Åkesson	199908171345	Drottninggatan 22, Stockholm	nova.akesson@example.com	+46703334455	2
20	Leo Sjöblom	200010231456	Kungsgatan 2, Luleå	leo.sjoblom@example.com	+46704445566	2
21	Alva Eklund	200207121234	Storgatan 9, Örebro	alva.eklund@example.com	+46705556677	2
22	Liam Strand	199912051112	Nygatan 4, Karlskrona	liam.strand@example.com	+46706667788	2
23	Elsa Holm	200310178901	Kungsgatan 13, Sundsvall	elsa.holm@example.com	+46707778899	2
24	Axel Berglund	199805011234	Skolgatan 21, Växjö	axel.berglund@example.com	+46708889900	2
25	Ella Nyberg	200107091112	Fleminggatan 14, Uppsala	ella.nyberg@example.com	+46701119922	2
26	Hugo Lund	200201291234	Drottninggatan 19, Malmö	hugo.lund@example.com	+46702223344	2
27	Freja Nilsson	199812151345	Hamngatan 8, Göteborg	freja.nilsson@example.com	+46703334455	2
28	Theo Nyström	199909111456	Norra Hamngatan 7, Stockholm	theo.nystrom@example.com	+46704445566	2
29	Molly Strandberg	200105211234	Kungsgatan 17, Karlstad	molly.strandberg@example.com	+46705556677	2
30	Adrian Sjögren	200008221112	Östra Hamngatan 10, Falun	adrian.sjogren@example.com	+46706667788	2
31	Ebba Bergman	200004051234	Storgatan 3, Linköping	ebba.bergman@example.com	+46707778899	2
32	Wilma Sand	199810011345	Drottninggatan 2, Västerås	wilma.sand@example.com	+46708889900	2
33	Alexander Östberg	199907061456	Kungsgatan 25, Jönköping	alexander.ostberg@example.com	+46701119922	2
34	Agnes Dahlberg	200209101112	Norra Vägen 12, Kalmar	agnes.dahlberg@example.com	+46702223344	2
35	Arvid Hellström	199811251234	Storgatan 6, Sundsvall	arvid.hellstrom@example.com	+46703334455	2
36	Stella Fors	200102081345	Vaksalagatan 16, Malmö	stella.fors@example.com	+46704445566	2
37	Vera Sjöblom	200311041112	Nygatan 18, Uppsala	vera.sjoblom@example.com	+46705556677	2
38	Hannes Åberg	199911301234	Drottninggatan 30, Karlskrona	hannes.aberg@example.com	+46706667788	2
39	Alice Öberg	200301071345	Kungsgatan 10, Luleå	alice.oberg@example.com	+46707778899	2
40	Lucas Bergström	199812111456	Storgatan 11, Växjö	lucas.bergstrom@example.com	+46708889900	2
41	Tuva Nyström	200202221112	Fleminggatan 10, Malmö	tuva.nystrom@example.com	+46701119922	2
42	Edvin Blom	200307021234	Norra Vägen 9, Göteborg	edvin.blom@example.com	+46702223344	2
43	Elvira Dahl	200003011345	Storgatan 14, Falun	elvira.dahl@example.com	+46703334455	2
44	Alfred Strand	199909291456	Hamngatan 1, Sundsvall	alfred.strand@example.com	+46704445566	2
45	Stina Forsberg	199804011234	Kungsgatan 4, Stockholm	stina.forsberg@example.com	+46705556677	2
46	Noah Holmström	200010251112	Skolgatan 8, Jönköping	noah.holmstrom@example.com	+46706667788	2
47	Maja Nygren	200205211234	Vasagatan 2, Växjö	maja.nygren@example.com	+46707778899	2
48	Isak Berg	200409051112	Storgatan 14, Falun	isak.berg@example.com	+46701113344	2
49	Nora Dahl	199906011234	Kungsgatan 18, Kalmar	nora.dahl@example.com	+46702224455	2
50	Viggo Sandberg	200103021112	Hamngatan 10, Sundsvall	viggo.sandberg@example.com	+46703335566	2
51	Saga Holm	200312051345	Fleminggatan 22, Malmö	saga.holm@example.com	+46704446677	2
52	Melker Nyström	199810231456	Vasagatan 11, Växjö	melker.nystrom@example.com	+46705557788	2
53	Tyra Eklund	200203071112	Skolgatan 5, Karlstad	tyra.eklund@example.com	+46706668899	2
54	Olle Strand	200111151345	Nygatan 9, Uppsala	olle.strand@example.com	+46707779900	2
55	Stella Sjögren	200405301234	Norra Hamngatan 7, Göteborg	stella.sjogren@example.com	+46708880011	2
56	Ture Fors	199909221112	Drottninggatan 12, Luleå	ture.fors@example.com	+46709991122	2
57	Ines Nyberg	200007111456	Kungsgatan 25, Jönköping	ines.nyberg@example.com	+46701112233	2
58	Sixten Dahlberg	200211181234	Storgatan 4, Linköping	sixten.dahlberg@example.com	+46702223344	2
59	Majken Blom	200307121112	Hamngatan 9, Västerås	majken.blom@example.com	+46703334455	2
60	Otto Holmström	199811171345	Vaksalagatan 6, Borås	otto.holmstrom@example.com	+46704445566	2
61	Lovisa Strandberg	200106291456	Nygatan 11, Falun	lovisa.strandberg@example.com	+46705556677	2
62	Ludvig Sjöblom	200010081112	Drottninggatan 18, Malmö	ludvig.sjoblom@example.com	+46706667788	2
63	Signe Nygren	200212211345	Storgatan 22, Sundsvall	signe.nygren@example.com	+46707778899	2
64	Mille Forsberg	200205131234	Hamngatan 13, Uppsala	mille.forsberg@example.com	+46708889900	2
65	Lova Håkansson	199812141112	Kungsgatan 7, Kalmar	lova.hakansson@example.com	+46709990011	2
66	Frank Nyström	200310251456	Vasagatan 20, Växjö	frank.nystrom@example.com	+46701111122	2
67	Elina Strand	200402081112	Fleminggatan 8, Karlstad	elina.strand@example.com	+46702222233	2
68	Felix Dahl	199909091345	Norra Vägen 3, Luleå	felix.dahl@example.com	+46703333344	2
69	Vera Blomberg	200111041112	Hamngatan 12, Linköping	vera.blomberg@example.com	+46704444455	2
70	Nils Åberg	200308291234	Kungsgatan 19, Borås	nils.aberg@example.com	+46705555566	2
71	Ida Fors	199906081345	Storgatan 19, Göteborg	ida.fors@example.com	+46706666677	2
72	Algot Strand	200010071456	Drottninggatan 10, Sundsvall	algot.strand@example.com	+46707777788	2
73	Elly Nyberg	200304121112	Skolgatan 2, Växjö	elly.nyberg@example.com	+46708888899	2
74	Måns Sjögren	199907221345	Nygatan 6, Malmö	mans.sjogren@example.com	+46709999900	2
75	Selma Blom	200301031234	Hamngatan 15, Stockholm	selma.blom@example.com	+46701111011	2
76	Malte Berg	200107081112	Kungsgatan 9, Karlskrona	malte.berg@example.com	+46702222022	2
77	Elsie Forsberg	199909191456	Storgatan 12, Jönköping	elsie.forsberg@example.com	+46703333033	2
78	Harry Strandberg	200310221345	Fleminggatan 5, Växjö	harry.strandberg@example.com	+46704444044	2
79	Hedda Holm	200204251112	Hamngatan 18, Kalmar	hedda.holm@example.com	+46705555055	2
80	Elvin Nygren	199810291234	Skolgatan 7, Uppsala	elvin.nygren@example.com	+46706666066	2
81	Nora Blomberg	200209071345	Norra Vägen 5, Borås	nora.blomberg@example.com	+46707777077	2
82	Ebbe Strand	199904041112	Kungsgatan 21, Göteborg	ebbe.strand@example.com	+46708888088	2
83	Siri Forsberg	200312011456	Vasagatan 8, Sundsvall	siri.forsberg@example.com	+46709999099	2
84	Oskar Bergman	200110311112	Storgatan 1, Linköping	oskar.bergman@example.com	+46701110100	2
85	Alicia Strand	200403081345	Drottninggatan 14, Stockholm	alicia.strand@example.com	+46702220202	2
86	Viktoria Dahlberg	199903051112	Nygatan 12, Kalmar	viktoria.dahlberg@example.com	+46703330303	2
87	Milo Sjögren	200011291234	Hamngatan 6, Karlskrona	milo.sjogren@example.com	+46704440404	2
88	Sofia Fors	200006011456	Skolgatan 19, Falun	sofia.fors@example.com	+46705550505	2
89	Wilmer Blom	200208101112	Kungsgatan 16, Växjö	wilmer.blom@example.com	+46706660606	2
90	Tuva Nygren	200401211345	Hamngatan 19, Luleå	tuva.nygren@example.com	+46707770707	2
91	Ture Strandberg	200106071456	Drottninggatan 8, Göteborg	ture.strandberg@example.com	+46708880808	2
92	Saga Holmberg	199812221112	Norra Hamngatan 20, Sundsvall	saga.holmberg@example.com	+46709990909	2
\.


--
-- TOC entry 4950 (class 0 OID 17027)
-- Dependencies: 234
-- Data for Name: student_lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_lesson (lesson_id, student_id) FROM stdin;
4	4
3	3
2	2
1	1
8	16
8	15
8	14
7	13
7	12
7	11
6	10
6	9
6	8
5	7
5	6
5	5
14	46
14	45
14	44
14	43
14	42
13	41
13	40
13	39
13	38
13	37
12	36
12	35
12	34
12	33
12	32
11	31
11	30
11	29
11	28
11	27
10	26
10	25
10	24
10	23
10	22
9	21
9	20
9	19
9	18
9	17
\.


--
-- TOC entry 4948 (class 0 OID 16941)
-- Dependencies: 232
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slot (time_slot_id, date, available) FROM stdin;
1	2024-08-01 09:00:00	t
2	2024-08-05 10:00:00	f
3	2024-08-07 11:00:00	t
4	2024-08-08 09:00:00	t
5	2024-08-10 14:00:00	t
6	2024-08-12 10:00:00	f
7	2024-08-15 15:00:00	t
8	2024-08-18 11:00:00	t
9	2024-08-20 16:00:00	f
10	2024-08-22 14:00:00	t
11	2024-08-25 15:00:00	t
12	2024-08-28 16:00:00	f
13	2024-09-02 09:00:00	t
14	2024-09-05 09:00:00	t
15	2024-09-06 10:00:00	f
16	2024-09-09 11:00:00	t
17	2024-09-10 10:00:00	f
18	2024-09-12 14:00:00	t
19	2024-09-15 11:00:00	t
20	2024-09-18 15:00:00	f
21	2024-09-19 14:00:00	t
22	2024-09-22 16:00:00	t
23	2024-09-24 15:00:00	t
24	2024-09-28 16:00:00	t
25	2024-10-03 09:00:00	t
26	2024-10-05 09:00:00	t
27	2024-10-07 10:00:00	f
28	2024-10-10 10:00:00	f
29	2024-10-12 11:00:00	t
30	2024-10-15 11:00:00	t
31	2024-10-16 14:00:00	t
32	2024-10-20 14:00:00	t
33	2024-10-21 15:00:00	t
34	2024-10-24 15:00:00	f
35	2024-10-25 16:00:00	f
36	2024-10-29 16:00:00	t
37	2024-11-01 09:00:00	t
38	2024-11-03 09:00:00	t
39	2024-11-04 10:00:00	t
40	2024-11-07 10:00:00	t
41	2024-11-08 11:00:00	f
42	2024-11-12 14:00:00	t
43	2024-11-13 11:00:00	f
44	2024-11-17 14:00:00	t
45	2024-11-18 15:00:00	t
46	2024-11-21 15:00:00	t
47	2024-11-22 16:00:00	t
48	2024-11-27 16:00:00	f
\.


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 219
-- Name: instructor_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instructor_id_seq', 39, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 222
-- Name: instrument_instrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instrument_instrument_id_seq', 41, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 225
-- Name: lesson_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_lesson_id_seq', 14, true);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 227
-- Name: price_list_price_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_list_price_list_id_seq', 18, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 231
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 92, true);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 233
-- Name: time_slot_time_slot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slot_time_slot_id_seq', 48, true);


--
-- TOC entry 4746 (class 2606 OID 16946)
-- Name: contact_person contact_person_contact_person_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_contact_person_id_key UNIQUE (contact_person_id);


--
-- TOC entry 4748 (class 2606 OID 16948)
-- Name: contact_person contact_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT contact_person_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4754 (class 2606 OID 16950)
-- Name: instructor_instrument instructor_instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument
    ADD CONSTRAINT instructor_instrument_pkey PRIMARY KEY (instrument, instructor_id);


--
-- TOC entry 4750 (class 2606 OID 16952)
-- Name: instructor instructor_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_personal_number_key UNIQUE (personal_number);


--
-- TOC entry 4752 (class 2606 OID 16954)
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (instructor_id);


--
-- TOC entry 4756 (class 2606 OID 16956)
-- Name: instrument instrument_instrument_serial_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_instrument_serial_number_key UNIQUE (instrument_serial_number);


--
-- TOC entry 4758 (class 2606 OID 16958)
-- Name: instrument instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrument
    ADD CONSTRAINT instrument_pkey PRIMARY KEY (instrument_id);


--
-- TOC entry 4762 (class 2606 OID 17026)
-- Name: lesson_instrument lesson_instrument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_instrument
    ADD CONSTRAINT lesson_instrument_pkey PRIMARY KEY (instrument, lesson_id);


--
-- TOC entry 4760 (class 2606 OID 16962)
-- Name: lesson lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_pkey PRIMARY KEY (lesson_id);


--
-- TOC entry 4776 (class 2606 OID 17031)
-- Name: student_lesson pk_student_lesson; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_lesson
    ADD CONSTRAINT pk_student_lesson PRIMARY KEY (lesson_id, student_id);


--
-- TOC entry 4764 (class 2606 OID 16964)
-- Name: price_list price_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_list
    ADD CONSTRAINT price_list_pkey PRIMARY KEY (price_list_id);


--
-- TOC entry 4766 (class 2606 OID 16966)
-- Name: rental rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (instrument_id, student_id);


--
-- TOC entry 4768 (class 2606 OID 16968)
-- Name: sibling_personal_number sibling_personal_number_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_personal_number
    ADD CONSTRAINT sibling_personal_number_pkey PRIMARY KEY (sibling_personal_number, student_id);


--
-- TOC entry 4770 (class 2606 OID 16970)
-- Name: student student_personal_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_personal_number_key UNIQUE (personal_number);


--
-- TOC entry 4772 (class 2606 OID 16972)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);


--
-- TOC entry 4774 (class 2606 OID 16974)
-- Name: time_slot time_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slot
    ADD CONSTRAINT time_slot_pkey PRIMARY KEY (time_slot_id);


--
-- TOC entry 4777 (class 2606 OID 16975)
-- Name: contact_person fk_contact_person_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_person
    ADD CONSTRAINT fk_contact_person_student FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4778 (class 2606 OID 16980)
-- Name: instructor_instrument fk_instructor_instrument_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor_instrument
    ADD CONSTRAINT fk_instructor_instrument_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4779 (class 2606 OID 16985)
-- Name: lesson fk_lesson_instructor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_instructor FOREIGN KEY (instructor_id) REFERENCES public.instructor(instructor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4782 (class 2606 OID 16990)
-- Name: lesson_instrument fk_lesson_instrument_lesson; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_instrument
    ADD CONSTRAINT fk_lesson_instrument_lesson FOREIGN KEY (lesson_id) REFERENCES public.lesson(lesson_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4780 (class 2606 OID 16995)
-- Name: lesson fk_lesson_price_list; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_price_list FOREIGN KEY (price_list_id) REFERENCES public.price_list(price_list_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4781 (class 2606 OID 17005)
-- Name: lesson fk_lesson_time_slot; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson_time_slot FOREIGN KEY (time_slot_id) REFERENCES public.time_slot(time_slot_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4783 (class 2606 OID 17010)
-- Name: rental fk_rental_instrument; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_instrument FOREIGN KEY (instrument_id) REFERENCES public.instrument(instrument_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4784 (class 2606 OID 17015)
-- Name: rental fk_rental_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT fk_rental_student FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4785 (class 2606 OID 17020)
-- Name: sibling_personal_number fk_sibling_personal_number_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sibling_personal_number
    ADD CONSTRAINT fk_sibling_personal_number_student FOREIGN KEY (student_id) REFERENCES public.student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4786 (class 2606 OID 17032)
-- Name: student_lesson fk_student_lesson_0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_lesson
    ADD CONSTRAINT fk_student_lesson_0 FOREIGN KEY (lesson_id) REFERENCES public.lesson(lesson_id);


--
-- TOC entry 4787 (class 2606 OID 17037)
-- Name: student_lesson fk_student_lesson_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_lesson
    ADD CONSTRAINT fk_student_lesson_1 FOREIGN KEY (student_id) REFERENCES public.student(student_id);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2024-11-29 10:57:49

--
-- PostgreSQL database dump complete
--

