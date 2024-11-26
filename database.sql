--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-26 12:56:44

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
-- TOC entry 4938 (class 0 OID 17477)
-- Dependencies: 230
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (1, 'Anna Karlsson', '200305157890', 'Vasagatan 18, Malmö', 'anna.karlsson@example.com', '+46701112222', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (2, 'Johan Nilsson', '199806101234', 'Drottninggatan 25, Uppsala', 'johan.nilsson@example.com', '+46702223333', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (3, 'Emma Johansson', '200104229876', 'Storgatan 8, Göteborg', 'emma.johansson@example.com', '+46703334455', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (4, 'Lucas Berg', '199902156789', 'Kungsgatan 20, Stockholm', 'lucas.berg@example.com', '+46704445566', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (5, 'Maja Eriksson', '200112148901', 'Nygatan 3, Växjö', 'maja.eriksson@example.com', '+46705556677', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (6, 'William Lind', '199911207654', 'Brunnsgatan 12, Malmö', 'william.lind@example.com', '+46706667788', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (7, 'Evelina Nyström', '200306131234', 'Drottninggatan 40, Uppsala', 'evelina.nystrom@example.com', '+46707778899', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (8, 'Oliver Sandberg', '200002181112', 'Hamngatan 7, Sundsvall', 'oliver.sandberg@example.com', '+46708889900', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (9, 'Alice Persson', '200101201345', 'Kungsgatan 15, Kalmar', 'alice.persson@example.com', '+46701119922', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (10, 'Filip Andersson', '199804171456', 'Fleminggatan 9, Linköping', 'filip.andersson@example.com', '+46702223344', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (11, 'Sofia Blom', '200212050987', 'Norra Hamngatan 11, Karlstad', 'sofia.blom@example.com', '+46703334455', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (12, 'Oscar Håkansson', '199706101234', 'Vaksalagatan 18, Västerås', 'oscar.hakansson@example.com', '+46704445566', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (13, 'Clara Sjögren', '199903221876', 'Östra Hamngatan 6, Göteborg', 'clara.sjogren@example.com', '+46705556677', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (14, 'Elias Svensson', '200011051234', 'Skolgatan 12, Helsingborg', 'elias.svensson@example.com', '+46706667788', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (15, 'Alma Larsson', '200301078901', 'Lilla Torg 4, Malmö', 'alma.larsson@example.com', '+46707778899', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (16, 'Viktor Forsberg', '200203011234', 'Norra Vägen 23, Falun', 'viktor.forsberg@example.com', '+46708889900', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (17, 'Isabella Hellström', '199912151112', 'Kungsgatan 5, Borås', 'isabella.hellstrom@example.com', '+46701119922', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (18, 'Benjamin Dahl', '200005029876', 'Storgatan 18, Jönköping', 'benjamin.dahl@example.com', '+46702223344', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (19, 'Nova Åkesson', '199908171345', 'Drottninggatan 22, Stockholm', 'nova.akesson@example.com', '+46703334455', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (20, 'Leo Sjöblom', '200010231456', 'Kungsgatan 2, Luleå', 'leo.sjoblom@example.com', '+46704445566', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (21, 'Alva Eklund', '200207121234', 'Storgatan 9, Örebro', 'alva.eklund@example.com', '+46705556677', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (22, 'Liam Strand', '199912051112', 'Nygatan 4, Karlskrona', 'liam.strand@example.com', '+46706667788', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (23, 'Elsa Holm', '200310178901', 'Kungsgatan 13, Sundsvall', 'elsa.holm@example.com', '+46707778899', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (24, 'Axel Berglund', '199805011234', 'Skolgatan 21, Växjö', 'axel.berglund@example.com', '+46708889900', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (25, 'Ella Nyberg', '200107091112', 'Fleminggatan 14, Uppsala', 'ella.nyberg@example.com', '+46701119922', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (26, 'Hugo Lund', '200201291234', 'Drottninggatan 19, Malmö', 'hugo.lund@example.com', '+46702223344', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (27, 'Freja Nilsson', '199812151345', 'Hamngatan 8, Göteborg', 'freja.nilsson@example.com', '+46703334455', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (28, 'Theo Nyström', '199909111456', 'Norra Hamngatan 7, Stockholm', 'theo.nystrom@example.com', '+46704445566', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (29, 'Molly Strandberg', '200105211234', 'Kungsgatan 17, Karlstad', 'molly.strandberg@example.com', '+46705556677', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (30, 'Adrian Sjögren', '200008221112', 'Östra Hamngatan 10, Falun', 'adrian.sjogren@example.com', '+46706667788', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (31, 'Ebba Bergman', '200004051234', 'Storgatan 3, Linköping', 'ebba.bergman@example.com', '+46707778899', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (32, 'Wilma Sand', '199810011345', 'Drottninggatan 2, Västerås', 'wilma.sand@example.com', '+46708889900', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (33, 'Alexander Östberg', '199907061456', 'Kungsgatan 25, Jönköping', 'alexander.ostberg@example.com', '+46701119922', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (34, 'Agnes Dahlberg', '200209101112', 'Norra Vägen 12, Kalmar', 'agnes.dahlberg@example.com', '+46702223344', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (35, 'Arvid Hellström', '199811251234', 'Storgatan 6, Sundsvall', 'arvid.hellstrom@example.com', '+46703334455', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (36, 'Stella Fors', '200102081345', 'Vaksalagatan 16, Malmö', 'stella.fors@example.com', '+46704445566', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (37, 'Vera Sjöblom', '200311041112', 'Nygatan 18, Uppsala', 'vera.sjoblom@example.com', '+46705556677', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (38, 'Hannes Åberg', '199911301234', 'Drottninggatan 30, Karlskrona', 'hannes.aberg@example.com', '+46706667788', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (39, 'Alice Öberg', '200301071345', 'Kungsgatan 10, Luleå', 'alice.oberg@example.com', '+46707778899', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (40, 'Lucas Bergström', '199812111456', 'Storgatan 11, Växjö', 'lucas.bergstrom@example.com', '+46708889900', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (41, 'Tuva Nyström', '200202221112', 'Fleminggatan 10, Malmö', 'tuva.nystrom@example.com', '+46701119922', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (42, 'Edvin Blom', '200307021234', 'Norra Vägen 9, Göteborg', 'edvin.blom@example.com', '+46702223344', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (43, 'Elvira Dahl', '200003011345', 'Storgatan 14, Falun', 'elvira.dahl@example.com', '+46703334455', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (44, 'Alfred Strand', '199909291456', 'Hamngatan 1, Sundsvall', 'alfred.strand@example.com', '+46704445566', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (45, 'Stina Forsberg', '199804011234', 'Kungsgatan 4, Stockholm', 'stina.forsberg@example.com', '+46705556677', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (46, 'Noah Holmström', '200010251112', 'Skolgatan 8, Jönköping', 'noah.holmstrom@example.com', '+46706667788', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (47, 'Maja Nygren', '200205211234', 'Vasagatan 2, Växjö', 'maja.nygren@example.com', '+46707778899', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (48, 'Isak Berg', '200409051112', 'Storgatan 14, Falun', 'isak.berg@example.com', '+46701113344', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (49, 'Nora Dahl', '199906011234', 'Kungsgatan 18, Kalmar', 'nora.dahl@example.com', '+46702224455', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (50, 'Viggo Sandberg', '200103021112', 'Hamngatan 10, Sundsvall', 'viggo.sandberg@example.com', '+46703335566', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (51, 'Saga Holm', '200312051345', 'Fleminggatan 22, Malmö', 'saga.holm@example.com', '+46704446677', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (52, 'Melker Nyström', '199810231456', 'Vasagatan 11, Växjö', 'melker.nystrom@example.com', '+46705557788', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (53, 'Tyra Eklund', '200203071112', 'Skolgatan 5, Karlstad', 'tyra.eklund@example.com', '+46706668899', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (54, 'Olle Strand', '200111151345', 'Nygatan 9, Uppsala', 'olle.strand@example.com', '+46707779900', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (55, 'Stella Sjögren', '200405301234', 'Norra Hamngatan 7, Göteborg', 'stella.sjogren@example.com', '+46708880011', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (56, 'Ture Fors', '199909221112', 'Drottninggatan 12, Luleå', 'ture.fors@example.com', '+46709991122', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (57, 'Ines Nyberg', '200007111456', 'Kungsgatan 25, Jönköping', 'ines.nyberg@example.com', '+46701112233', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (58, 'Sixten Dahlberg', '200211181234', 'Storgatan 4, Linköping', 'sixten.dahlberg@example.com', '+46702223344', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (59, 'Majken Blom', '200307121112', 'Hamngatan 9, Västerås', 'majken.blom@example.com', '+46703334455', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (60, 'Otto Holmström', '199811171345', 'Vaksalagatan 6, Borås', 'otto.holmstrom@example.com', '+46704445566', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (61, 'Lovisa Strandberg', '200106291456', 'Nygatan 11, Falun', 'lovisa.strandberg@example.com', '+46705556677', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (62, 'Ludvig Sjöblom', '200010081112', 'Drottninggatan 18, Malmö', 'ludvig.sjoblom@example.com', '+46706667788', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (63, 'Signe Nygren', '200212211345', 'Storgatan 22, Sundsvall', 'signe.nygren@example.com', '+46707778899', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (64, 'Mille Forsberg', '200205131234', 'Hamngatan 13, Uppsala', 'mille.forsberg@example.com', '+46708889900', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (65, 'Lova Håkansson', '199812141112', 'Kungsgatan 7, Kalmar', 'lova.hakansson@example.com', '+46709990011', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (66, 'Frank Nyström', '200310251456', 'Vasagatan 20, Växjö', 'frank.nystrom@example.com', '+46701111122', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (67, 'Elina Strand', '200402081112', 'Fleminggatan 8, Karlstad', 'elina.strand@example.com', '+46702222233', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (68, 'Felix Dahl', '199909091345', 'Norra Vägen 3, Luleå', 'felix.dahl@example.com', '+46703333344', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (69, 'Vera Blomberg', '200111041112', 'Hamngatan 12, Linköping', 'vera.blomberg@example.com', '+46704444455', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (70, 'Nils Åberg', '200308291234', 'Kungsgatan 19, Borås', 'nils.aberg@example.com', '+46705555566', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (71, 'Ida Fors', '199906081345', 'Storgatan 19, Göteborg', 'ida.fors@example.com', '+46706666677', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (72, 'Algot Strand', '200010071456', 'Drottninggatan 10, Sundsvall', 'algot.strand@example.com', '+46707777788', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (73, 'Elly Nyberg', '200304121112', 'Skolgatan 2, Växjö', 'elly.nyberg@example.com', '+46708888899', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (74, 'Måns Sjögren', '199907221345', 'Nygatan 6, Malmö', 'mans.sjogren@example.com', '+46709999900', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (75, 'Selma Blom', '200301031234', 'Hamngatan 15, Stockholm', 'selma.blom@example.com', '+46701111011', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (76, 'Malte Berg', '200107081112', 'Kungsgatan 9, Karlskrona', 'malte.berg@example.com', '+46702222022', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (77, 'Elsie Forsberg', '199909191456', 'Storgatan 12, Jönköping', 'elsie.forsberg@example.com', '+46703333033', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (78, 'Harry Strandberg', '200310221345', 'Fleminggatan 5, Växjö', 'harry.strandberg@example.com', '+46704444044', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (79, 'Hedda Holm', '200204251112', 'Hamngatan 18, Kalmar', 'hedda.holm@example.com', '+46705555055', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (80, 'Elvin Nygren', '199810291234', 'Skolgatan 7, Uppsala', 'elvin.nygren@example.com', '+46706666066', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (81, 'Nora Blomberg', '200209071345', 'Norra Vägen 5, Borås', 'nora.blomberg@example.com', '+46707777077', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (82, 'Ebbe Strand', '199904041112', 'Kungsgatan 21, Göteborg', 'ebbe.strand@example.com', '+46708888088', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (83, 'Siri Forsberg', '200312011456', 'Vasagatan 8, Sundsvall', 'siri.forsberg@example.com', '+46709999099', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (84, 'Oskar Bergman', '200110311112', 'Storgatan 1, Linköping', 'oskar.bergman@example.com', '+46701110100', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (85, 'Alicia Strand', '200403081345', 'Drottninggatan 14, Stockholm', 'alicia.strand@example.com', '+46702220202', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (86, 'Viktoria Dahlberg', '199903051112', 'Nygatan 12, Kalmar', 'viktoria.dahlberg@example.com', '+46703330303', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (87, 'Milo Sjögren', '200011291234', 'Hamngatan 6, Karlskrona', 'milo.sjogren@example.com', '+46704440404', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (88, 'Sofia Fors', '200006011456', 'Skolgatan 19, Falun', 'sofia.fors@example.com', '+46705550505', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (89, 'Wilmer Blom', '200208101112', 'Kungsgatan 16, Växjö', 'wilmer.blom@example.com', '+46706660606', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (90, 'Tuva Nygren', '200401211345', 'Hamngatan 19, Luleå', 'tuva.nygren@example.com', '+46707770707', 2);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (91, 'Ture Strandberg', '200106071456', 'Drottninggatan 8, Göteborg', 'ture.strandberg@example.com', '+46708880808', 1);
INSERT INTO public.student OVERRIDING SYSTEM VALUE VALUES (92, 'Saga Holmberg', '199812221112', 'Norra Hamngatan 20, Sundsvall', 'saga.holmberg@example.com', '+46709990909', 2);


--
-- TOC entry 4925 (class 0 OID 17445)
-- Dependencies: 217
-- Data for Name: contact_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contact_person VALUES (1, '197612055678', 'Maria Karlsson', 'maria.karlsson@example.com', '+46703334444');
INSERT INTO public.contact_person VALUES (2, '198010103456', 'Peter Nilsson', 'peter.nilsson@example.com', '+46704445555');
INSERT INTO public.contact_person VALUES (3, '197512018765', 'Lena Olsson', 'lena.olsson@example.com', '+46705556666');
INSERT INTO public.contact_person VALUES (4, '198209098654', 'Thomas Berg', 'thomas.berg@example.com', '+46706667777');
INSERT INTO public.contact_person VALUES (5, '197811147890', 'Karin Fors', 'karin.fors@example.com', '+46707778888');
INSERT INTO public.contact_person VALUES (6, '196903127654', 'Bengt Dahl', 'bengt.dahl@example.com', '+46708889999');
INSERT INTO public.contact_person VALUES (7, '197802118901', 'Lisa Strand', 'lisa.strand@example.com', '+46709990000');
INSERT INTO public.contact_person VALUES (8, '198602171234', 'Göran Nyström', 'goran.nystrom@example.com', '+46701111222');
INSERT INTO public.contact_person VALUES (9, '197003145678', 'Ingrid Holm', 'ingrid.holm@example.com', '+46702223333');
INSERT INTO public.contact_person VALUES (10, '198405122345', 'Henrik Lind', 'henrik.lind@example.com', '+46703334444');
INSERT INTO public.contact_person VALUES (11, '198701198765', 'Eva Berglund', 'eva.berglund@example.com', '+46704445566');
INSERT INTO public.contact_person VALUES (12, '197402188901', 'Olof Sand', 'olof.sand@example.com', '+46705556677');
INSERT INTO public.contact_person VALUES (13, '198305176543', 'Kristina Eklund', 'kristina.eklund@example.com', '+46706667788');
INSERT INTO public.contact_person VALUES (14, '197803127890', 'Anna Sjögren', 'anna.sjogren@example.com', '+46707778899');
INSERT INTO public.contact_person VALUES (15, '196805188765', 'Martin Forsberg', 'martin.forsberg@example.com', '+46708889900');
INSERT INTO public.contact_person VALUES (16, '197212047654', 'Nina Dahlberg', 'nina.dahlberg@example.com', '+46709990011');
INSERT INTO public.contact_person VALUES (17, '198109018765', 'Fredrik Nygren', 'fredrik.nygren@example.com', '+46701111233');
INSERT INTO public.contact_person VALUES (18, '197406148901', 'Therese Åberg', 'therese.aberg@example.com', '+46702223344');
INSERT INTO public.contact_person VALUES (19, '198010198765', 'Lars Nilsson', 'lars.nilsson@example.com', '+46703334455');
INSERT INTO public.contact_person VALUES (20, '197708018901', 'Elisabeth Strandberg', 'elisabeth.strandberg@example.com', '+46704445566');
INSERT INTO public.contact_person VALUES (21, '196811027654', 'Pär Nygren', 'par.nygren@example.com', '+46705556677');
INSERT INTO public.contact_person VALUES (22, '198312187890', 'Mona Andersson', 'mona.andersson@example.com', '+46706667788');
INSERT INTO public.contact_person VALUES (23, '197703137654', 'Oscar Blom', 'oscar.blom@example.com', '+46707778899');
INSERT INTO public.contact_person VALUES (24, '198011127890', 'Helen Bergman', 'helen.bergman@example.com', '+46708889900');
INSERT INTO public.contact_person VALUES (25, '196910157654', 'Tomas Sjöblom', 'tomas.sjoblom@example.com', '+46709990011');
INSERT INTO public.contact_person VALUES (26, '197510187654', 'Malin Holmström', 'malin.holmstrom@example.com', '+46701111222');
INSERT INTO public.contact_person VALUES (27, '198209167890', 'Johan Strandberg', 'johan.strandberg@example.com', '+46702223333');
INSERT INTO public.contact_person VALUES (28, '197604177890', 'Sara Dahl', 'sara.dahl@example.com', '+46703334444');
INSERT INTO public.contact_person VALUES (29, '198104137654', 'Mats Eklund', 'mats.eklund@example.com', '+46704445555');
INSERT INTO public.contact_person VALUES (30, '197311107654', 'Susanne Nyström', 'susanne.nystrom@example.com', '+46705556666');


--
-- TOC entry 4926 (class 0 OID 17448)
-- Dependencies: 218
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (1, 'Erik Andersson', '198705221234', 'Kungsgatan 12, Stockholm', 'erik.andersson@example.com', '+46701234567', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (2, 'Sara Svensson', '199012155678', 'Storgatan 45, Göteborg', 'sara.svensson@example.com', '+46705555555', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (3, 'Anna Johansson', '197805091234', 'Vasagatan 3, Malmö', 'anna.johansson@example.com', '+46701456789', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (4, 'Karl Karlsson', '198002181567', 'Östermalmstorg 10, Stockholm', 'karl.karlsson@example.com', '+46708889999', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (5, 'Maria Lind', '199306121234', 'Lundavägen 24, Lund', 'maria.lind@example.com', '+46701112233', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (6, 'Fredrik Nyberg', '199506061112', 'Haga Nygata 7, Göteborg', 'fredrik.nyberg@example.com', '+46707774444', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (7, 'Elin Berg', '198910201234', 'Drottninggatan 25, Stockholm', 'elin.berg@example.com', '+46709998877', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (8, 'Johan Persson', '199111111234', 'Kungsgatan 8, Uppsala', 'johan.persson@example.com', '+46703336666', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (9, 'Emma Nilsson', '199708091234', 'Storgatan 13, Växjö', 'emma.nilsson@example.com', '+46705556677', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (10, 'Oscar Holm', '198303051234', 'Kyrkogatan 5, Helsingborg', 'oscar.holm@example.com', '+46706667788', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (11, 'Louise Svensson', '198908121234', 'Nygatan 2, Jönköping', 'louise.svensson@example.com', '+46707778899', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (12, 'Anders Eriksson', '197705231234', 'Lilla Torg 12, Malmö', 'anders.eriksson@example.com', '+46708889900', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (13, 'Camilla Larsson', '198405051234', 'Västra Hamngatan 15, Göteborg', 'camilla.larsson@example.com', '+46709990011', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (14, 'Henrik Sjöberg', '199103031234', 'Brunnsgatan 9, Stockholm', 'henrik.sjoberg@example.com', '+46702223344', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (15, 'Nina Strand', '199206201234', 'Fleminggatan 16, Stockholm', 'nina.strand@example.com', '+46701112244', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (16, 'Alexander Löf', '198601071234', 'Hamngatan 5, Umeå', 'alexander.lof@example.com', '+46708881234', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (17, 'Sofia Blom', '199409101234', 'Vaksalagatan 18, Uppsala', 'sofia.blom@example.com', '+46705553322', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (18, 'Victor Bergman', '198802181234', 'Norra Hamngatan 6, Göteborg', 'victor.bergman@example.com', '+46703333445', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (19, 'Isabella Sand', '199507051234', 'Skolgatan 20, Linköping', 'isabella.sand@example.com', '+46704445566', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (20, 'Daniel Nyström', '198901301234', 'Kungsgatan 21, Gävle', 'daniel.nystrom@example.com', '+46706667744', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (21, 'Maja Hedlund', '199008241234', 'Södra Vägen 14, Karlstad', 'maja.hedlund@example.com', '+46708889922', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (22, 'Olof Dahl', '199111171234', 'Storgatan 8, Västerås', 'olof.dahl@example.com', '+46702221133', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (23, 'Therese Falk', '199305301234', 'Östra Hamngatan 4, Göteborg', 'therese.falk@example.com', '+46701114455', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (24, 'Mattias Åberg', '198505251234', 'Långgatan 7, Örebro', 'mattias.aberg@example.com', '+46708887766', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (25, 'Karin Östberg', '198612201234', 'Drottninggatan 30, Uppsala', 'karin.ostberg@example.com', '+46705556677', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (26, 'Gustav Lindström', '199204181234', 'Kungsgatan 33, Sundsvall', 'gustav.lindstrom@example.com', '+46706665544', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (27, 'Helena Svensk', '199406071234', 'Norra Esplanaden 5, Växjö', 'helena.svensk@example.com', '+46702223344', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (28, 'Marcus Sandberg', '198711151234', 'Skolgatan 12, Kalmar', 'marcus.sandberg@example.com', '+46709990033', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (29, 'Lina Håkansson', '198905051234', 'Storgatan 5, Falun', 'lina.hakansson@example.com', '+46708880099', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (30, 'Jonas Sjögren', '199109031234', 'Kungsgatan 44, Karlskrona', 'jonas.sjogren@example.com', '+46705551122', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (31, 'Frida Hellström', '199705221234', 'Västra Vägen 23, Uppsala', 'frida.hellstrom@example.com', '+46704443322', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (32, 'Magnus Larsson', '198403041234', 'Nygatan 3, Östersund', 'magnus.larsson@example.com', '+46703336655', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (33, 'Malin Sjöblom', '199607081234', 'Södra Hamngatan 6, Göteborg', 'malin.sjoblom@example.com', '+46701112233', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (34, 'Andreas Holmström', '199012121234', 'Kungsgatan 20, Luleå', 'andreas.holmstrom@example.com', '+46706667733', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (35, 'Emma Axelsson', '198508051234', 'Drottninggatan 40, Norrköping', 'emma.axelsson@example.com', '+46708887711', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (36, 'Viktor Fors', '199209071234', 'Norra Vägen 9, Borås', 'viktor.fors@example.com', '+46702224455', false);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (37, 'Ida Eklund', '199104181234', 'Storgatan 29, Jönköping', 'ida.eklund@example.com', '+46705550022', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (38, 'Oscar Ljung', '198711121234', 'Fleminggatan 22, Malmö', 'oscar.ljung@example.com', '+46709991133', true);
INSERT INTO public.instructor OVERRIDING SYSTEM VALUE VALUES (39, 'Linda Hall', '199306101234', 'Kungsgatan 6, Sundsvall', 'linda.hall@example.com', '+46704445511', false);


--
-- TOC entry 4928 (class 0 OID 17452)
-- Dependencies: 220
-- Data for Name: instructor_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructor_instrument VALUES ('Guitar', 1);
INSERT INTO public.instructor_instrument VALUES ('Piano', 1);
INSERT INTO public.instructor_instrument VALUES ('Violin', 2);
INSERT INTO public.instructor_instrument VALUES ('Drums', 3);
INSERT INTO public.instructor_instrument VALUES ('Keyboard', 4);
INSERT INTO public.instructor_instrument VALUES ('Piano', 5);
INSERT INTO public.instructor_instrument VALUES ('Saxophone', 6);
INSERT INTO public.instructor_instrument VALUES ('Guitar', 7);
INSERT INTO public.instructor_instrument VALUES ('Violin', 8);
INSERT INTO public.instructor_instrument VALUES ('Flute', 9);
INSERT INTO public.instructor_instrument VALUES ('Trumpet', 10);
INSERT INTO public.instructor_instrument VALUES ('Clarinet', 11);
INSERT INTO public.instructor_instrument VALUES ('Drums', 12);
INSERT INTO public.instructor_instrument VALUES ('Piano', 13);
INSERT INTO public.instructor_instrument VALUES ('Keyboard', 14);
INSERT INTO public.instructor_instrument VALUES ('Saxophone', 15);
INSERT INTO public.instructor_instrument VALUES ('Guitar', 16);
INSERT INTO public.instructor_instrument VALUES ('Piano', 17);
INSERT INTO public.instructor_instrument VALUES ('Synthesizer', 18);
INSERT INTO public.instructor_instrument VALUES ('Cello', 19);
INSERT INTO public.instructor_instrument VALUES ('Guitar', 20);
INSERT INTO public.instructor_instrument VALUES ('Violin', 21);
INSERT INTO public.instructor_instrument VALUES ('Keyboard', 22);
INSERT INTO public.instructor_instrument VALUES ('Drums', 23);
INSERT INTO public.instructor_instrument VALUES ('Piano', 24);
INSERT INTO public.instructor_instrument VALUES ('Flute', 25);
INSERT INTO public.instructor_instrument VALUES ('Saxophone', 26);
INSERT INTO public.instructor_instrument VALUES ('Trumpet', 27);
INSERT INTO public.instructor_instrument VALUES ('Guitar', 28);
INSERT INTO public.instructor_instrument VALUES ('Keyboard', 29);
INSERT INTO public.instructor_instrument VALUES ('Violin', 30);
INSERT INTO public.instructor_instrument VALUES ('Drums', 31);
INSERT INTO public.instructor_instrument VALUES ('Piano', 32);
INSERT INTO public.instructor_instrument VALUES ('Guitar', 33);
INSERT INTO public.instructor_instrument VALUES ('Clarinet', 34);
INSERT INTO public.instructor_instrument VALUES ('Saxophone', 35);
INSERT INTO public.instructor_instrument VALUES ('Flute', 36);
INSERT INTO public.instructor_instrument VALUES ('Drums', 37);
INSERT INTO public.instructor_instrument VALUES ('Cello', 38);
INSERT INTO public.instructor_instrument VALUES ('Guitar', 39);


--
-- TOC entry 4929 (class 0 OID 17455)
-- Dependencies: 221
-- Data for Name: instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (1, 'A45612345678', 'Yamaha', 200, 'Guitar');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (2, 'B78912345678', 'Steinway', 300, 'Piano');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (3, 'C01212345678', 'Stradivarius', 500, 'Violin');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (4, 'D12312345678', 'Fender', 250, 'Guitar');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (5, 'E45612345678', 'Gibson', 300, 'Guitar');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (6, 'F78912345678', 'Roland', 350, 'Keyboard');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (7, 'G01212345678', 'Kawai', 400, 'Piano');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (8, 'H67812345678', 'Pearl', 150, 'Drums');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (9, 'I67812345678', 'Selmer', 250, 'Saxophone');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (10, 'J90112345678', 'Bach', 300, 'Trumpet');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (11, 'K23412345678', 'Yamaha', 200, 'Flute');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (12, 'L56712345678', 'Ibanez', 220, 'Guitar');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (13, 'M56712345678', 'Casio', 180, 'Keyboard');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (14, 'N12312345678', 'DW', 320, 'Drums');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (15, 'O45612345678', 'Martin', 500, 'Guitar');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (16, 'P78912345678', 'Buffet Crampon', 450, 'Clarinet');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (17, 'Q01212345678', 'Steinberg', 350, 'Keyboard');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (18, 'R34512345678', 'Zildjian', 200, 'Cymbals');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (19, 'S67812345678', 'Korg', 300, 'Synthesizer');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (20, 'T90112345678', 'Epiphone', 275, 'Guitar');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (21, 'U23412345678', 'Conn', 250, 'Trombone');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (22, 'V56712345678', 'Mapex', 290, 'Drums');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (23, 'W89012345678', 'Bechstein', 550, 'Piano');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (24, 'X12312345678', 'Seagull', 320, 'Guitar');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (25, 'Y45612345678', 'Taylor', 400, 'Guitar');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (26, 'Z78912345678', 'Yamaha', 350, 'Saxophone');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (27, 'A98712345678', 'Kurzweil', 300, 'Keyboard');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (28, 'B65412345678', 'Fazioli', 600, 'Piano');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (29, 'C32112345678', 'Ludwig', 280, 'Drums');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (30, 'D87612345678', 'Yamaha', 220, 'Violin');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (31, 'E54312345678', 'Schimmel', 520, 'Piano');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (32, 'F21012345678', 'Eastman', 250, 'Cello');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (33, 'G67812345678', 'Gretsch', 400, 'Guitar');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (34, 'H678ABCDEFGH', 'Kawai', 390, 'Piano');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (35, 'I01212345678', 'Roland', 330, 'Synthesizer');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (36, 'J78912345678', 'Meinl', 250, 'Percussion');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (37, 'K45612345678', 'Conn-Selmer', 270, 'Tuba');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (38, 'L12312345678', 'Shure', 180, 'Microphone');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (39, 'M567ABCDEFGH', 'Zoom', 190, 'Microphone');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (40, 'N67812345678', 'Boss', 300, 'Effects Pedal');
INSERT INTO public.instrument OVERRIDING SYSTEM VALUE VALUES (41, 'O12312345678', 'Arturia', 400, 'Synthesizer');


--
-- TOC entry 4934 (class 0 OID 17466)
-- Dependencies: 226
-- Data for Name: price_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (1, 'Individual', 'Beginner', 200, '2024-01-01', NULL);
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (2, 'Individual', 'Intermediate', 250, '2024-01-01', NULL);
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (3, 'Individual', 'Advanced', 300, '2024-01-01', NULL);
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (4, 'Group', 'Beginner', 150, '2024-01-01', NULL);
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (5, 'Group', 'Intermediate', 200, '2024-01-01', NULL);
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (6, 'Group', 'Advanced', 250, '2024-01-01', NULL);
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (7, 'Ensemble', 'Beginner', 180, '2024-01-01', NULL);
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (8, 'Ensemble', 'Intermediate', 220, '2024-01-01', NULL);
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (9, 'Ensemble', 'Advanced', 300, '2024-01-01', NULL);
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (10, 'Individual', 'Beginner', 180, '2023-01-01', '2023-12-31');
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (11, 'Individual', 'Intermediate', 230, '2023-01-01', '2023-12-31');
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (12, 'Individual', 'Advanced', 280, '2023-01-01', '2023-12-31');
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (13, 'Group', 'Beginner', 140, '2023-01-01', '2023-12-31');
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (14, 'Group', 'Intermediate', 190, '2023-01-01', '2023-12-31');
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (15, 'Group', 'Advanced', 240, '2023-01-01', '2023-12-31');
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (16, 'Ensemble', 'Beginner', 170, '2023-01-01', '2023-12-31');
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (17, 'Ensemble', 'Intermediate', 210, '2023-01-01', '2023-12-31');
INSERT INTO public.price_list OVERRIDING SYSTEM VALUE VALUES (18, 'Ensemble', 'Advanced', 290, '2023-01-01', '2023-12-31');


--
-- TOC entry 4940 (class 0 OID 17483)
-- Dependencies: 232
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (1, '2024-08-01 09:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (2, '2024-08-05 10:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (3, '2024-08-07 11:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (4, '2024-08-08 09:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (5, '2024-08-10 14:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (6, '2024-08-12 10:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (7, '2024-08-15 15:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (8, '2024-08-18 11:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (9, '2024-08-20 16:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (10, '2024-08-22 14:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (11, '2024-08-25 15:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (12, '2024-08-28 16:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (13, '2024-09-02 09:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (14, '2024-09-05 09:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (15, '2024-09-06 10:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (16, '2024-09-09 11:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (17, '2024-09-10 10:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (18, '2024-09-12 14:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (19, '2024-09-15 11:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (20, '2024-09-18 15:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (21, '2024-09-19 14:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (22, '2024-09-22 16:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (23, '2024-09-24 15:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (24, '2024-09-28 16:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (25, '2024-10-03 09:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (26, '2024-10-05 09:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (27, '2024-10-07 10:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (28, '2024-10-10 10:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (29, '2024-10-12 11:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (30, '2024-10-15 11:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (31, '2024-10-16 14:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (32, '2024-10-20 14:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (33, '2024-10-21 15:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (34, '2024-10-24 15:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (35, '2024-10-25 16:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (36, '2024-10-29 16:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (37, '2024-11-01 09:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (38, '2024-11-03 09:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (39, '2024-11-04 10:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (40, '2024-11-07 10:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (41, '2024-11-08 11:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (42, '2024-11-12 14:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (43, '2024-11-13 11:00:00', false);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (44, '2024-11-17 14:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (45, '2024-11-18 15:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (46, '2024-11-21 15:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (47, '2024-11-22 16:00:00', true);
INSERT INTO public.time_slot OVERRIDING SYSTEM VALUE VALUES (48, '2024-11-27 16:00:00', false);


--
-- TOC entry 4931 (class 0 OID 17459)
-- Dependencies: 223
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (1, 'Beginner', NULL, NULL, NULL, 1, 1, 1, 2);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (2, 'Beginner', NULL, NULL, NULL, 2, 1, 1, 6);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (3, 'Intermediate', NULL, NULL, NULL, 5, 2, 2, 15);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (4, 'Intermediate', NULL, NULL, NULL, 6, 2, 2, 17);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (5, 'Beginner', 2, 5, NULL, 3, 1, 4, 9);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (6, 'Beginner', 2, 5, NULL, 4, 1, 4, 12);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (7, 'Intermediate', 3, 10, NULL, 7, 3, 5, 20);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (8, 'Intermediate', 3, 10, NULL, 8, 3, 5, 27);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (9, 'Advanced', 5, 15, 'Jazz', 9, 4, 9, 28);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (10, 'Advanced', 5, 15, 'Classical', 10, 4, 9, 34);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (11, 'Advanced', 5, 15, 'Pop', 11, 5, 9, 35);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (12, 'Advanced', 5, 15, 'Rock', 12, 5, 9, 41);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (13, 'Advanced', 5, 15, 'Folk', 13, 6, 9, 43);
INSERT INTO public.lesson OVERRIDING SYSTEM VALUE VALUES (14, 'Advanced', 5, 15, 'Blues', 14, 6, 9, 48);


--
-- TOC entry 4932 (class 0 OID 17462)
-- Dependencies: 224
-- Data for Name: lesson_instrument; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lesson_instrument VALUES ('Guitar', 1);
INSERT INTO public.lesson_instrument VALUES ('Piano', 2);
INSERT INTO public.lesson_instrument VALUES ('Violin', 3);
INSERT INTO public.lesson_instrument VALUES ('Drums', 4);
INSERT INTO public.lesson_instrument VALUES ('Flute', 5);
INSERT INTO public.lesson_instrument VALUES ('Guitar', 6);
INSERT INTO public.lesson_instrument VALUES ('Keyboard', 7);
INSERT INTO public.lesson_instrument VALUES ('Trumpet', 8);
INSERT INTO public.lesson_instrument VALUES ('Piano', 9);
INSERT INTO public.lesson_instrument VALUES ('Violin', 10);
INSERT INTO public.lesson_instrument VALUES ('Drums', 11);
INSERT INTO public.lesson_instrument VALUES ('Guitar', 12);
INSERT INTO public.lesson_instrument VALUES ('Flute', 13);
INSERT INTO public.lesson_instrument VALUES ('Keyboard', 14);


--
-- TOC entry 4936 (class 0 OID 17471)
-- Dependencies: 228
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rental VALUES (3, 1, '2024-11-01 10:00:00');
INSERT INTO public.rental VALUES (2, 2, '2024-11-02 11:00:00');
INSERT INTO public.rental VALUES (5, 3, '2024-11-03 14:00:00');
INSERT INTO public.rental VALUES (1, 4, '2024-11-04 15:00:00');
INSERT INTO public.rental VALUES (4, 5, '2024-11-05 16:00:00');
INSERT INTO public.rental VALUES (8, 6, '2024-11-06 10:00:00');
INSERT INTO public.rental VALUES (7, 7, '2024-11-07 11:00:00');
INSERT INTO public.rental VALUES (6, 8, '2024-11-08 12:00:00');
INSERT INTO public.rental VALUES (9, 9, '2024-11-09 13:00:00');
INSERT INTO public.rental VALUES (10, 10, '2024-11-10 14:00:00');
INSERT INTO public.rental VALUES (13, 11, '2024-11-11 15:00:00');
INSERT INTO public.rental VALUES (12, 12, '2024-11-12 16:00:00');
INSERT INTO public.rental VALUES (11, 13, '2024-11-13 10:00:00');
INSERT INTO public.rental VALUES (14, 14, '2024-11-14 11:00:00');
INSERT INTO public.rental VALUES (15, 15, '2024-11-15 12:00:00');
INSERT INTO public.rental VALUES (16, 16, '2024-11-16 13:00:00');


--
-- TOC entry 4937 (class 0 OID 17474)
-- Dependencies: 229
-- Data for Name: sibling_personal_number; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sibling_personal_number VALUES ('199305252345', 1);
INSERT INTO public.sibling_personal_number VALUES ('199901014567', 2);
INSERT INTO public.sibling_personal_number VALUES ('198807113456', 3);
INSERT INTO public.sibling_personal_number VALUES ('199511201234', 4);
INSERT INTO public.sibling_personal_number VALUES ('199812291345', 5);
INSERT INTO public.sibling_personal_number VALUES ('200102021678', 6);
INSERT INTO public.sibling_personal_number VALUES ('199606301234', 7);
INSERT INTO public.sibling_personal_number VALUES ('199708051234', 8);
INSERT INTO public.sibling_personal_number VALUES ('199406281234', 9);
INSERT INTO public.sibling_personal_number VALUES ('199503241234', 10);
INSERT INTO public.sibling_personal_number VALUES ('199902141234', 11);
INSERT INTO public.sibling_personal_number VALUES ('199712071234', 12);
INSERT INTO public.sibling_personal_number VALUES ('199807201234', 13);
INSERT INTO public.sibling_personal_number VALUES ('200003041234', 14);
INSERT INTO public.sibling_personal_number VALUES ('200011091234', 15);
INSERT INTO public.sibling_personal_number VALUES ('199509181234', 16);
INSERT INTO public.sibling_personal_number VALUES ('200005251234', 17);
INSERT INTO public.sibling_personal_number VALUES ('199807111234', 18);
INSERT INTO public.sibling_personal_number VALUES ('200107211234', 19);
INSERT INTO public.sibling_personal_number VALUES ('199706181234', 20);
INSERT INTO public.sibling_personal_number VALUES ('200006151234', 21);
INSERT INTO public.sibling_personal_number VALUES ('199807291234', 22);
INSERT INTO public.sibling_personal_number VALUES ('199612181234', 23);
INSERT INTO public.sibling_personal_number VALUES ('200103171234', 24);
INSERT INTO public.sibling_personal_number VALUES ('199902251234', 25);
INSERT INTO public.sibling_personal_number VALUES ('199901211234', 26);
INSERT INTO public.sibling_personal_number VALUES ('199805051234', 27);
INSERT INTO public.sibling_personal_number VALUES ('199609091234', 28);
INSERT INTO public.sibling_personal_number VALUES ('199510041234', 29);
INSERT INTO public.sibling_personal_number VALUES ('200110191234', 30);
INSERT INTO public.sibling_personal_number VALUES ('199808281234', 31);
INSERT INTO public.sibling_personal_number VALUES ('199710071234', 32);
INSERT INTO public.sibling_personal_number VALUES ('199703121234', 33);
INSERT INTO public.sibling_personal_number VALUES ('199506291234', 34);
INSERT INTO public.sibling_personal_number VALUES ('199812091234', 35);
INSERT INTO public.sibling_personal_number VALUES ('199605241234', 36);
INSERT INTO public.sibling_personal_number VALUES ('200010301234', 37);
INSERT INTO public.sibling_personal_number VALUES ('199902211234', 38);
INSERT INTO public.sibling_personal_number VALUES ('199911131234', 39);
INSERT INTO public.sibling_personal_number VALUES ('199512041234', 40);
INSERT INTO public.sibling_personal_number VALUES ('199705051234', 41);
INSERT INTO public.sibling_personal_number VALUES ('200201211234', 42);
INSERT INTO public.sibling_personal_number VALUES ('199804051234', 43);
INSERT INTO public.sibling_personal_number VALUES ('199903281234', 44);
INSERT INTO public.sibling_personal_number VALUES ('199910181234', 45);
INSERT INTO public.sibling_personal_number VALUES ('199511261234', 46);
INSERT INTO public.sibling_personal_number VALUES ('199902151234', 47);
INSERT INTO public.sibling_personal_number VALUES ('199603211234', 48);


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 219
-- Name: instructor_instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_instructor_id_seq', 39, true);


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 222
-- Name: instrument_instrument_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instrument_instrument_id_seq', 41, true);


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 225
-- Name: lesson_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_lesson_id_seq', 14, true);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 227
-- Name: price_list_price_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_list_price_list_id_seq', 18, true);


--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 231
-- Name: student_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_student_id_seq', 92, true);


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 233
-- Name: time_slot_time_slot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_slot_time_slot_id_seq', 48, true);


-- Completed on 2024-11-26 12:56:45

--
-- PostgreSQL database dump complete
--

