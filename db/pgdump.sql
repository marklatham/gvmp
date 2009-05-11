--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: colleagues; Type: TABLE; Schema: public; Owner: app62414; Tablespace: 
--

CREATE TABLE colleagues (
    id integer NOT NULL,
    given_name character varying(255),
    family_name character varying(255),
    "role" character varying(255),
    email character varying(255),
    photo character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "sequence" double precision
);


ALTER TABLE public.colleagues OWNER TO app62414;

--
-- Name: colleagues_id_seq; Type: SEQUENCE; Schema: public; Owner: app62414
--

CREATE SEQUENCE colleagues_id_seq
    START WITH 14
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.colleagues_id_seq OWNER TO app62414;

--
-- Name: colleagues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app62414
--

ALTER SEQUENCE colleagues_id_seq OWNED BY colleagues.id;


--
-- Name: colleagues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app62414
--

SELECT pg_catalog.setval('colleagues_id_seq', 14, false);


--
-- Name: communities; Type: TABLE; Schema: public; Owner: app62414; Tablespace: 
--

CREATE TABLE communities (
    id integer NOT NULL,
    name character varying(255),
    short_name character varying(255),
    category character varying(255),
    country character varying(255),
    prov_state character varying(255),
    city character varying(255),
    official_url character varying(255),
    wiki_url character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    scope character varying(255)
);


ALTER TABLE public.communities OWNER TO app62414;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: app62414
--

CREATE SEQUENCE communities_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO app62414;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app62414
--

ALTER SEQUENCE communities_id_seq OWNED BY communities.id;


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app62414
--

SELECT pg_catalog.setval('communities_id_seq', 205, true);


--
-- Name: faqs; Type: TABLE; Schema: public; Owner: app62414; Tablespace: 
--

CREATE TABLE faqs (
    id integer NOT NULL,
    category character varying(255),
    "sequence" double precision,
    importance double precision,
    question character varying(255),
    answer text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.faqs OWNER TO app62414;

--
-- Name: faqs_id_seq; Type: SEQUENCE; Schema: public; Owner: app62414
--

CREATE SEQUENCE faqs_id_seq
    START WITH 24
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.faqs_id_seq OWNER TO app62414;

--
-- Name: faqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app62414
--

ALTER SEQUENCE faqs_id_seq OWNED BY faqs.id;


--
-- Name: faqs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app62414
--

SELECT pg_catalog.setval('faqs_id_seq', 24, false);


--
-- Name: pubs; Type: TABLE; Schema: public; Owner: app62414; Tablespace: 
--

CREATE TABLE pubs (
    id integer NOT NULL,
    date_sequence date,
    date_text character varying(255),
    title character varying(255),
    country character varying(255),
    journal character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.pubs OWNER TO app62414;

--
-- Name: pubs_id_seq; Type: SEQUENCE; Schema: public; Owner: app62414
--

CREATE SEQUENCE pubs_id_seq
    START WITH 16
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pubs_id_seq OWNER TO app62414;

--
-- Name: pubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app62414
--

ALTER SEQUENCE pubs_id_seq OWNED BY pubs.id;


--
-- Name: pubs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app62414
--

SELECT pg_catalog.setval('pubs_id_seq', 16, false);


--
-- Name: rankings; Type: TABLE; Schema: public; Owner: app62414; Tablespace: 
--

CREATE TABLE rankings (
    id integer NOT NULL,
    community_id integer,
    website_id integer,
    rank double precision DEFAULT 0.0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rankings OWNER TO app62414;

--
-- Name: rankings_id_seq; Type: SEQUENCE; Schema: public; Owner: app62414
--

CREATE SEQUENCE rankings_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rankings_id_seq OWNER TO app62414;

--
-- Name: rankings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app62414
--

ALTER SEQUENCE rankings_id_seq OWNED BY rankings.id;


--
-- Name: rankings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app62414
--

SELECT pg_catalog.setval('rankings_id_seq', 85, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: app62414; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO app62414;

--
-- Name: votes; Type: TABLE; Schema: public; Owner: app62414; Tablespace: 
--

CREATE TABLE votes (
    id integer NOT NULL,
    ip_address character varying(255),
    community_id integer,
    website_id integer,
    support double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.votes OWNER TO app62414;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: app62414
--

CREATE SEQUENCE votes_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.votes_id_seq OWNER TO app62414;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app62414
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app62414
--

SELECT pg_catalog.setval('votes_id_seq', 105, true);


--
-- Name: websites; Type: TABLE; Schema: public; Owner: app62414; Tablespace: 
--

CREATE TABLE websites (
    id integer NOT NULL,
    url character varying(255),
    title character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.websites OWNER TO app62414;

--
-- Name: websites_id_seq; Type: SEQUENCE; Schema: public; Owner: app62414
--

CREATE SEQUENCE websites_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.websites_id_seq OWNER TO app62414;

--
-- Name: websites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app62414
--

ALTER SEQUENCE websites_id_seq OWNED BY websites.id;


--
-- Name: websites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app62414
--

SELECT pg_catalog.setval('websites_id_seq', 88, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app62414
--

ALTER TABLE colleagues ALTER COLUMN id SET DEFAULT nextval('colleagues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app62414
--

ALTER TABLE communities ALTER COLUMN id SET DEFAULT nextval('communities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app62414
--

ALTER TABLE faqs ALTER COLUMN id SET DEFAULT nextval('faqs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app62414
--

ALTER TABLE pubs ALTER COLUMN id SET DEFAULT nextval('pubs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app62414
--

ALTER TABLE rankings ALTER COLUMN id SET DEFAULT nextval('rankings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app62414
--

ALTER TABLE votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app62414
--

ALTER TABLE websites ALTER COLUMN id SET DEFAULT nextval('websites_id_seq'::regclass);


--
-- Data for Name: colleagues; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY colleagues (id, given_name, family_name, "role", email, photo, description, created_at, updated_at, "sequence") FROM stdin;
5	Greg	Moreno	Website Development\n	greg.moreno[at]gmail.com	\N		2009-05-05 05:05:59	2009-05-05 05:29:35	6
11	James	McRitchie	Advisory Board\n	\N	\N	<a href="http://corpgov.net/">Publisher, CorpGov.net</a>\n	2009-05-05 06:03:22	2009-05-05 19:48:13	9
6	Junho	Lee	Website Development\n	junho[at]votermedia.org	junho_lee.jpg	M.Sc., Computer Science\n	2009-05-05 05:06:58	2009-05-05 05:30:02	6
12	Mark	Rubinstein	Advisory Board\n	\N	\N	<a href="http://www.haas.berkeley.edu/faculty/rubinstein.html">\nProfessor of Finance <br />\nUniversity of California, Berkeley</a>\n	2009-05-05 06:04:22	2009-05-05 19:45:54	9
7	Naoya	Makino	Website Development\n	naoya[at]votermedia.org	naoya_makino.jpg	Computer science student, \n<a href="http://www.langara.bc.ca/">Langara College</a>\n	2009-05-05 05:08:18	2009-05-05 19:51:47	6
13	Rebecca	Bollwitt	Advisory Board\n	\N	\N	<a href="http://www.miss604.com/about">Editor, Miss604.com</a>\n	2009-05-05 06:05:09	2009-05-05 19:43:03	9
2	Bradley	Coleman	Strategy\n	bradley[at]votermedia.org	bradley_coleman.jpg		2009-05-05 04:59:23	2009-05-05 05:28:40	3
8	Andy	Eggers	Advisory Board\n	\N	\N	<a href="http://proxydemocracy.org/about/us">\nPresident, ProxyDemocracy</a>\n	2009-05-05 05:58:33	2009-05-05 19:46:36	9
3	Erez	Maharshak	Website Development\n	erez[at]votermedia.org	\N		2009-05-05 05:00:09	2009-05-05 05:28:52	6
9	Fred	Cutler	Advisory Board\n	\N	\N	<a href="http://www.politics.ubc.ca/fcutler">\nAssistant Professor of Political Science<br />\nUniversity of British Columbia</a>\n	2009-05-05 06:00:58	2009-05-05 19:45:20	9
4	Fanny	Shen	Website Design\n	fanny[at]votermedia.org	\N	Web Designer, <a href="http://complexmadesimple.com/">Complex Made Simple</a>\n	2009-05-05 05:01:34	2009-05-05 05:29:08	5
10	Jackie	Cook	Advisory Board\n	\N	\N	<a href="http://www.fundvotes.com/contact.php">Founder, Fund Votes</a>\n	2009-05-05 06:02:01	2009-05-05 19:44:42	9
1	Mark	Latham	Executive Director	mark[at]votermedia.org	mark_latham.jpg	<a href="http://votermedia.org/hr/mlresume.html">Résumé</a><br />Voicemail: (604) 608-9779<br /> Paper mail: 1755 Robson Street #469,<br /> Vancouver, B.C., Canada V6G 3B7	2009-05-05 04:57:09	2009-05-10 20:45:10.340191	1
\.


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY communities (id, name, short_name, category, country, prov_state, city, official_url, wiki_url, description, created_at, updated_at, scope) FROM stdin;
203	San Francisco	San Francisco	Municipal	USA	California	San Francisco	http://www.sfgov.org/	http://en.wikipedia.org/wiki/San_francisco	\N	2009-05-02 19:57:14	2009-05-02 19:58:27	San Francisco
166	Democratic Party (USA)	Democratic Party	Political	USA	DC	Washington	http://www.democrats.org/	http://en.wikipedia.org/wiki/Democratic_Party_(United_States)	\N	2009-04-11 22:52:30	2009-04-14 23:19:00	USA
129	Janus Funds	Janus Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
18	Canadian Union of Public Employees	CUPE	Labour	Canada	Ontario	Ottawa	http://cupe.ca/	http://en.wikipedia.org/wiki/CUPE	\N	2009-04-11 22:52:28	2009-04-14 22:33:55	Canada
55	White Rock	White Rock	Municipal	Canada	B.C.	White Rock	http://www.city.whiterock.bc.ca/	http://en.wikipedia.org/wiki/White_Rock,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-14 22:40:41	White Rock
92	Students' Unions of Vancouver Community College	Students' Unions VCC	Student	Canada	B.C.	Vancouver	http://www.suvcc.ca/	http://en.wikipedia.org/wiki/Vancouver_Community_College	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
185	Upland	Upland	Municipal	USA	California	Upland	http://www.ci.upland.ca.us/	http://en.wikipedia.org/wiki/Upland,_California	\N	2009-04-27 19:05:42	2009-04-27 19:05:42	Upland
148	Vanguard Group, The	Vanguard Group	Investor	USA	\N	\N	http://www.vanguard.com/	http://en.wikipedia.org/wiki/The_Vanguard_Group	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
37	Lions Bay	Lions Bay	Municipal	Canada	B.C.	Lions Bay	http://www.lionsbay.citymax.com/page/page/479914.htm	http://en.wikipedia.org/wiki/Lions_Bay	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-11 22:52:28	\N
74	New Democratic Party	NDP	Political	Canada	\N	\N	http://www.ndp.ca/	http://en.wikipedia.org/wiki/New_Democratic_Party	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
111	United States of America	USA	Country	USA	DC	Washington	http://www.usa.gov/	http://en.wikipedia.org/wiki/Usa	\N	2009-04-11 22:52:30	2009-04-14 23:14:13	USA
204	California State Teachers Retirement System	CalSTRS	Investor	USA	California	West Sacramento	http://www.calstrs.com/	http://en.wikipedia.org/wiki/CalSTRS	CalSTRS provides retirement related benefits and services to teachers in California public schools and community colleges. It is the largest U.S. teachers' retirement fund with 833,000 members and assets of $111.6 billion as of March 31, 2009. Like CalPERS, they have an international reputation for corporate governance activism.	2009-05-08 02:27:02	2009-05-09 02:44:06	California
167	Green Party (USA)	Green Party (USA)	Political	USA	\N	\N	http://www.gp.org/	http://en.wikipedia.org/wiki/Green_Party_(United_States)	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
130	MFS Funds	MFS Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
56	British Columbia Automobile Association	BC Auto Association	Nonprofit	Canada	B.C.	Burnaby	http://www.bcaa.com	None as of January 2009	\N	2009-04-11 22:52:29	2009-04-14 22:41:32	B.C.
93	Trinity Western University Students Association	TWU Students Ass'n	Student	Canada	B.C.	\N	http://www.twusa.ca/	http://en.wikipedia.org/wiki/Trinity_Western_University_Students_Association	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
19	Fédération des travailleurs/-euses du Québec	Féd'n trav. Québec	Labour	Canada	Québec	Montréal	http://www.ftq.qc.ca/	http://en.wikipedia.org/wiki/Fédération_des_travailleurs_du_Québec	Fédération des travailleurs et travailleuses du Québec, QFL, Quebec Federation of Labour	2009-04-11 22:52:28	2009-04-14 22:35:46	Québec
186	Monrovia	Monrovia	Municipal	USA	California	Monrovia	http://www.ci.monrovia.ca.us/	http://en.wikipedia.org/wiki/Monrovia,_California	\N	2009-04-27 19:13:36	2009-04-27 19:13:36	Monrovia
149	Wells Fargo Funds	Wells Fargo Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
75	British Columbia Liberal Party	BC Liberals	Political	Canada	B.C.	\N	http://www.bcliberals.com/	http://en.wikipedia.org/wiki/British_Columbia_Liberal_Party	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
112	American Century Investments	American Century	Investor	USA	Missouri	Kansas City	https://www.americancentury.com/	http://en.wikipedia.org/wiki/American_Century_Investments	\N	2009-04-11 22:52:30	2009-04-14 23:15:43	USA
1	Mountain Equipment Co-op	MEC	Co-op	Canada	B.C.	Vancouver	http://mec.ca	http://en.wikipedia.org/wiki/Mountain_Equipment_Co-op	\N	2009-04-11 22:52:28	2009-04-14 18:26:36	Canada
38	Maple Ridge	Maple Ridge	Municipal	Canada	B.C.	Maple Ridge	http://www.mapleridge.org/EN/index.html	http://en.wikipedia.org/wiki/Maple_Ridge	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-11 22:52:28	\N
168	Libertarian Party (USA)	Libertarian Party	Political	USA	\N	\N	http://www.lp.org/	http://en.wikipedia.org/wiki/Libertarian_Party_(United_States)	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
131	MMA Praxis Funds	MMA Praxis Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
94	University of Calgary Students' Union	U Calgary Students	Student	Canada	Alberta	Calgary	http://www.su.ucalgary.ca/	http://en.wikipedia.org/wiki/University_of_Calgary_Students%27_Union	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
20	Hospital Employees' Union (British Columbia)	HospitalEmployees BC	Labour	Canada	B.C.	Burnaby	http://www.heu.org/	http://en.wikipedia.org/wiki/Hospital_Employees%27_Union	\N	2009-04-11 22:52:28	2009-04-14 22:37:01	B.C.
57	British Columbia Medical Association	BC Medical Ass'n	Nonprofit	Canada	B.C.	Vancouver	http://www.bcma.org/	None as of January 2009	\N	2009-04-11 22:52:29	2009-04-14 22:42:39	B.C.
187	Los Angeles	Los Angeles	Municipal	USA	California	Los Angeles	http://www.lacity.org/	http://en.wikipedia.org/wiki/Los_angeles	\N	2009-04-27 19:17:47	2009-04-27 19:17:47	Los Angeles
150	Bellingham	Bellingham	Municipal	USA	Washington	Bellingham	http://www.bellingham.org/	http://en.wikipedia.org/wiki/Bellingham,_Washington	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
113	American Funds	American Funds	Investor	USA	\N	\N	http://www.americanfunds.com/	http://en.wikipedia.org/wiki/American_Funds	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
2	Ballard Power Systems	Ballard Power	Corporation	Canada	B.C.	Burnaby	http://www.ballard.com/	http://en.wikipedia.org/wiki/Ballard_Power_Systems	TSX, NASDAQ, BLDP	2009-04-11 22:52:28	2009-04-14 22:09:27	Canada, USA
39	Mission	Mission	Municipal	Canada	B.C.	Mission	http://www.mission.ca/site3.aspx	http://en.wikipedia.org/wiki/District_of_Mission	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-11 22:52:28	\N
76	Green Party of British Columbia	Green Party of BC	Political	Canada	B.C.	\N	http://www.greenparty.bc.ca/	http://en.wikipedia.org/wiki/Green_Party_of_British_Columbia	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
169	MoveOn.org	MoveOn.org	Political	USA	\N	\N	http://www.moveon.org/	http://en.wikipedia.org/wiki/Moveon	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
132	Morgan Stanley Funds	Morgan Stanley Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
21	Vancouver Police Union	Vancouver Police	Labour	Canada	B.C.	Vancouver	http://www.vpu.ca/	http://en.wikipedia.org/wiki/Vancouver_Police_Union	\N	2009-04-11 22:52:28	2009-04-14 22:37:52	Vancouver
58	Canadian Automobile Association	Canadian Auto Ass'n	Nonprofit	Canada	Ontario	Ottawa	http://www.caa.ca/	http://en.wikipedia.org/wiki/Canadian_Automobile_Association	\N	2009-04-11 22:52:29	2009-04-14 22:45:17	Canada
95	University of the Fraser Valley Student Union Soc.	UFV Student Union	Student	Canada	B.C.	\N	http://www.ufvsus.ca/	http://en.wikipedia.org/wiki/UFV_Student_Union_Society	University of the Fraser Valley Student Union Society	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
188	Nanaimo	Nanaimo	Municipal	Canada	B.C.	Nanaimo	http://www.nanaimo.ca/	http://en.wikipedia.org/wiki/Nanaimo	Vancouver Island	2009-04-27 21:45:07	2009-04-27 21:48:31	Nanaimo
151	Berkeley	Berkeley	Municipal	USA	California	Berkeley	http://www.ci.berkeley.ca.us/Home.aspx	http://en.wikipedia.org/wiki/Berkeley,_California	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
3	Canadian Broadcasting Corporation	CBC	Corporation	Canada	Ontario	Ottawa	http://www.cbc.radio-canada.ca/	http://en.wikipedia.org/wiki/Canadian_Broadcasting_Corporation	CBC is a crown corporation, not a publicly traded corporation. So its voter community is all citizens of Canada.	2009-04-11 22:52:28	2009-04-27 19:36:09	Canada
40	New Westminster	New Westminster	Municipal	Canada	B.C.	New Westminster	http://www.newwestcity.ca/	http://en.wikipedia.org/wiki/New_Westminster	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-11 22:52:28	\N
77	New Democratic Party of British Columbia	BC NDP	Political	Canada	B.C.	\N	http://www.bcndp.ca/	http://en.wikipedia.org/wiki/New_Democratic_Party_of_British_Columbia	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
114	Barclays Global Investors	Barclays Global Inv.	Investor	USA	\N	\N	http://www.barclaysglobal.com/	http://en.wikipedia.org/wiki/Barclays_Global_Investors	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
170	Republican Party (USA)	GOP	Political	USA	DC	Washington	http://www.gop.com/	http://en.wikipedia.org/wiki/Republican_Party_(United_States)	\N	2009-04-11 22:52:30	2009-04-14 23:19:56	USA
133	Nationwide Funds	Nationwide Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
22	Abbotsford	Abbotsford	Municipal	Canada	B.C.	Abbotsford	http://www.abbotsford.ca/site4.aspx	http://en.wikipedia.org/wiki/Abbotsford,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-14 22:38:13	Abbotsford
59	Canadian Internet Registration Authority	Cdn Internet Reg Aut	Nonprofit	Canada	\N	\N	http://www.cira.ca/en/home.html	http://en.wikipedia.org/wiki/Canadian_Internet_Registration_Authority	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
96	University of Victoria Students’ Society	UVic Students' Soc.	Student	Canada	B.C.	Victoria	http://www.uvss.uvic.ca/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-14 22:48:10	Victoria
189	London	London	Municipal	Canada	Ontario	London	http://www.london.ca/	http://en.wikipedia.org/wiki/London,_Ontario	\N	2009-04-27 22:37:47	2009-04-27 22:39:09	London
152	Cambridge	Cambridge	Municipal	USA	Massachusetts	Cambridge	http://www.cambridgema.gov/	http://en.wikipedia.org/wiki/Cambridge,_Massachusetts	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
115	Blackrock Funds	Blackrock Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
4	Telus	Telus	Corporation	Canada	B.C.	Burnaby	http://www.telus.com/	http://en.wikipedia.org/wiki/Telus	TSE, T, T.A	2009-04-11 22:52:28	2009-04-14 22:13:32	Canada
41	North Vancouver (City)	North Van (City)	Municipal	Canada	B.C.	North Vancouver (City)	http://www.cnv.org/	http://en.wikipedia.org/wiki/North_Vancouver,_British_Columbia_(city)	The City of North Vancouver is distinct from the adjacent <a href="./42">District of North Vancouver</a>. GVRD, Metro Vancouver.	2009-04-11 22:52:28	2009-04-27 17:01:39	North Vancouver (City)
78	Coalition of Progressive Electors	COPE	Political	Canada	B.C.	Vancouver	http://www.cope.bc.ca/	http://en.wikipedia.org/wiki/Coalition_of_Progressive_Electors	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
171	California	California	State	USA	California	Sacramento	http://www.ca.gov/	http://en.wikipedia.org/wiki/Massachusetts	\N	2009-04-11 22:52:30	2009-04-14 23:20:32	California
134	Neuberger Berman Funds	Neuberger Berman	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
23	Anmore	Anmore	Municipal	Canada	B.C.	Anmore	http://www.anmore.com/	http://en.wikipedia.org/wiki/Anmore	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-14 22:38:30	Anmore
60	Canadian Red Cross	Canadian Red Cross	Nonprofit	Canada	\N	\N	http://www.redcross.ca/	http://en.wikipedia.org/wiki/Canadian_Red_Cross	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
97	Conference Board	Conference Board	Nonprofit	USA	New York	New York	http://www.conference-board.org/	http://en.wikipedia.org/wiki/Conference_Board	\N	2009-04-11 22:52:30	2009-04-14 23:12:39	International
190	Knoxville	Knoxville	Municipal	USA	Tennessee	Knoxville	http://www.cityofknoxville.org/	http://en.wikipedia.org/wiki/Knoxville	\N	2009-04-27 22:46:06	2009-04-27 22:51:26	Knoxville
153	Seattle	Seattle	Municipal	USA	Washington	Seattle	http://www.seattle.gov/	http://en.wikipedia.org/wiki/Seattle	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
116	California Public Employees Retirement System	CalPERS	Investor	USA	California	Sacramento	http://www.calpers.ca.gov/	http://en.wikipedia.org/wiki/Calpers	CalPERS manages pension and health benefits for more than 1.6 million California public employees, retirees, and their families. The second largest public pension fund in the US, they are internationally known for their shareowner activism.	2009-04-11 22:52:30	2009-05-08 01:58:02	California
5	Canada	Canada	Country	Canada	Ontario	Ottawa	http://canada.gc.ca/	http://en.wikipedia.org/wiki/Canada	\N	2009-04-11 22:52:28	2009-04-14 18:27:50	Canada
42	North Vancouver (District Municipality)	North Van (District)	Municipal	Canada	B.C.	North Vancouver (District)	http://www.district.north-van.bc.ca/	http://en.wikipedia.org/wiki/North_Vancouver,_British_Columbia_(district_municipality)	The City of North Vancouver is distinct from the adjacent <a href="./41">District of North Vancouver</a>. GVRD, Metro Vancouver.	2009-04-11 22:52:28	2009-04-27 17:01:10	North Vancouver (District)
79	Non-Partisan Association	NPA	Political	Canada	B.C.	Vancouver	http://www.npavancouver.ca/	http://en.wikipedia.org/wiki/Non-Partisan_Association	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
172	Massachusetts	Massachusetts	State	USA	Massachusetts	\N	http://www.mass.gov/	http://en.wikipedia.org/wiki/Massachusetts	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
135	Parnassus Funds	Parnassus Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
24	Belcarra	Belcarra	Municipal	Canada	B.C.	Belcarra	http://www.belcarra.ca/	http://en.wikipedia.org/wiki/Belcarra,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-14 22:38:47	Belcarra
61	Canadian Standards Association	Cdn Standards Ass'n	Nonprofit	Canada	\N	\N	http://www.csa.ca	http://en.wikipedia.org/wiki/Canadian_Standards_Association	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
98	Greenpeace	Greenpeace	Nonprofit	Netherlands	\N	Amsterdam	http://www.greenpeace.org	http://en.wikipedia.org/wiki/Greenpeace	28 autonomous branches	2009-04-11 22:52:30	2009-04-14 22:53:54	International
191	Chattanooga	Chattanooga	Municipal	USA	Tennessee	Chattanooga	http://www.chattanooga.gov/	http://en.wikipedia.org/wiki/Chattanooga	\N	2009-04-27 22:55:44	2009-04-27 22:57:02	Chattanooga
154	American Association of Individual Investors	AAII	Nonprofit	USA	Illinois	Chicago	http://www.aaii.com/	http://en.wikipedia.org/wiki/AAII	\N	2009-04-11 22:52:30	2009-04-14 23:17:18	USA
117	Calvert Funds	Calvert Funds	Investor	USA	\N	\N	http://www.calvert.com/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
6	Coast Capital Savings	Coast Capital	Credit&nbsp;Union	Canada	B.C.	Surrey	https://www.coastcapitalsavings.com/	http://en.wikipedia.org/wiki/Coast_Capital_Savings	\N	2009-04-11 22:52:28	2009-05-04 06:24:53	B.C.
43	Pemberton	Pemberton	Municipal	Canada	B.C.	Pemberton	http://www.pemberton.ca/	http://en.wikipedia.org/wiki/Pemberton,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-11 22:52:28	\N
80	Vision Vancouver	Vision Vancouver	Political	Canada	B.C.	Vancouver	http://www.votevision.ca/	http://en.wikipedia.org/wiki/Vision_Vancouver	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
173	Washington State	Washington	State	USA	Washington	Olympia	http://access.wa.gov/	http://en.wikipedia.org/wiki/Washington	\N	2009-04-11 22:52:30	2009-04-14 23:22:05	Washington State
136	Pax World Funds	Pax World Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
25	Bowen Island	Bowen Island	Municipal	Canada	B.C.	Bowen Island	http://www.bowenisland.com/	http://en.wikipedia.org/wiki/Bowen_island	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-14 22:39:06	Bowen Island
62	Coal Harbour Residents Association	Coal Harbour Res.	Nonprofit	Canada	B.C.	Vancouver	http://www.ch-ra.ca/	http://en.wikipedia.org/wiki/Coal_Harbour	\N	2009-04-11 22:52:29	2009-04-14 22:46:01	Vancouver
99	International Corporate Governance Network	ICGN	Nonprofit	United Kingdom	London	London	http://www.icgn.org/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-14 22:54:47	International
192	Tennessee	Tennessee	State	USA	Tennessee	Nashville	http://www.tennessee.gov/	http://en.wikipedia.org/wiki/Tennessee	\N	2009-04-27 22:58:42	2009-04-27 22:58:42	Tennessee
155	American Association of Retired Persons	AARP	Nonprofit	USA	\N	\N	http://www.aarp.org/	http://en.wikipedia.org/wiki/AARP	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
118	Columbia Funds	Columbia Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
7	North Shore Credit Union	North Shore CU	Credit&nbsp;Union	Canada	B.C.	North Vancouver	https://www.nscu.com/	http://en.wikipedia.org/wiki/North_Shore_Credit_Union	\N	2009-04-11 22:52:28	2009-05-04 06:27:22	B.C.
44	Pitt Meadows	Pitt Meadows	Municipal	Canada	B.C.	Pitt Meadows	http://www.pittmeadows.bc.ca/	http://en.wikipedia.org/wiki/Pitt_Meadows	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-11 22:52:28	\N
81	British Columbia	British Columbia	Province	Canada	B.C.	Victoria	http://www.gov.bc.ca/	http://en.wikipedia.org/wiki/British_Columbia	\N	2009-04-11 22:52:29	2009-04-27 03:46:56	B.C.
174	Associated Students of Stanford University	Stanford Students	Student	USA	California	Stanford	http://assu.stanford.edu/home/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-14 23:24:46	Stanford
137	Putnam Funds	Putnam Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
26	Burnaby	Burnaby	Municipal	Canada	B.C.	Burnaby	http://www.city.burnaby.bc.ca/Home.html	http://en.wikipedia.org/wiki/Burnaby	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-14 22:39:46	Burnaby
63	Downtown Eastside Residents’ Association	Dntn Eastside Res.	Nonprofit	Canada	B.C.	Vancouver	http://www.dera.bc.ca/	http://en.wikipedia.org/wiki/Downtown_Eastside_Residents_Association	\N	2009-04-11 22:52:29	2009-04-14 22:46:30	Vancouver
100	Red Cross & Red Crescent Societies (Int'l Fed'n)	Red Cross/Crescent	Nonprofit	Switzerland	\N	Geneva	http://www.ifrc.org/	http://en.wikipedia.org/wiki/International_Federation_of_Red_Cross_and_Red_Crescent_Societies	International Federation of Red Cross and Red Crescent Societies	2009-04-11 22:52:30	2009-04-14 22:56:07	International
193	Nashville	Nashville	Municipal	USA	Tennessee	Nashville	\N	\N	\N	2009-04-27 23:19:05	2009-04-27 23:19:05	Nashville
156	American Automobile Association	AAA	Nonprofit	USA	\N	\N	http://www.aaa.com/	http://en.wikipedia.org/wiki/American_Automobile_Association	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
119	DFA Funds	DFA Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
8	Vancouver City Savings Credit Union	Vancity	Credit&nbsp;Union	Canada	B.C.	Vancouver	https://www.vancity.com/	http://en.wikipedia.org/wiki/Vancity	\N	2009-04-11 22:52:28	2009-05-04 06:27:45	B.C.
45	Port Coquitlam	Port Coquitlam	Municipal	Canada	B.C.	Port Coquitlam	http://www.city.port-coquitlam.bc.ca/Home_Page.htm	http://en.wikipedia.org/wiki/Port_Coquitlam	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
82	University of British Columbia Alma Mater Society	UBC AMS	Student	Canada	B.C.	Vancouver	http://www.amsubc.ca/	http://en.wikipedia.org/wiki/Alma_Mater_Society_of_the_University_of_British_Columbia	Alma Mater Society of the University of British Columbia	2009-04-11 22:52:30	2009-04-26 16:22:07	Vancouver
175	Associated Students of U. of California, Berkeley	Assoc Students of UC	Student	USA	California	Berkeley	http://www.asuc.org/	http://en.wikipedia.org/wiki/Associated_Students_of_the_University_of_California	Associated Students of the University of California, Berkeley	2009-04-11 22:52:30	2009-04-14 23:25:48	Berkeley
138	RiverSource Funds	RiverSource Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
27	Chilliwack	Chilliwack	Municipal	Canada	B.C.	Chilliwack	http://www.gov.chilliwack.bc.ca/main/	http://en.wikipedia.org/wiki/Chilliwack,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-14 22:40:06	Chilliwack
64	Fair Vote Canada	Fair Vote Canada	Nonprofit	Canada	\N	\N	\N	\N	\N	2009-04-11 22:52:29	2009-04-14 22:46:57	Canada
101	Servas International	Servas International	Nonprofit	Switzerland	\N	\N	http://joomla.servas.org/	http://en.wikipedia.org/wiki/Servas_Open_Doors	open doors	2009-04-11 22:52:30	2009-04-14 23:00:48	International
194	Ontario Teachers' Federation	Ontario Teachers	Labour	Canada	Ontario	Toronto	http://www.otffeo.on.ca/	http://en.wikipedia.org/wiki/Ontario_Teachers%27_Federation	OTF-FEO. Fédération des enseignantes et des enseignants de l'Ontario.	2009-05-02 17:09:22	2009-05-02 18:27:53	Ontario
157	American Medical Association	AMA	Nonprofit	USA	\N	\N	http://www.ama-assn.org/	http://en.wikipedia.org/wiki/American_Medical_Association	\N	2009-04-11 22:52:30	2009-05-06 00:23:13	USA
120	Dodge & Cox Funds	Dodge & Cox Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
46	Port Moody	Port Moody	Municipal	Canada	B.C.	Port Moody	http://www.cityofportmoody.com/default.htm	http://en.wikipedia.org/wiki/Port_Moody	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
83	BCIT Student Association	BCIT Student Ass'n	Student	Canada	B.C.	\N	http://www.bcitsa.ca/	None as of January 2009	British Columbia Institute of Technology Student Association	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
9	Westminster Savings Credit Union	Westminster Savings	Credit&nbsp;Union	Canada	B.C.	New Westminster	https://www.wscu.com	None as of January 2009	\N	2009-04-11 22:52:28	2009-05-04 06:28:07	B.C.
176	Associated Students of University of Washington	Assoc Students of UW	Student	USA	Washington	Seattle	http://www.asuw.org/	http://en.wikipedia.org/wiki/Associated_Students_of_the_University_of_Washington	Associated Students of the University of Washington	2009-04-11 22:52:30	2009-04-14 23:25:19	Seattle
139	Schwab Funds	Schwab Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
65	Law Society of BC	Law Society of BC	Nonprofit	Canada	B.C.	\N	http://www.lawsociety.bc.ca/	\N	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
102	Toastmasters International	Toastmasters	Nonprofit	USA	California	Rancho Santa Margarita	http://www.toastmasters.org/	http://en.wikipedia.org/wiki/Toastmasters_International	\N	2009-04-11 22:52:30	2009-04-14 23:13:17	International
28	Coquitlam	Coquitlam	Municipal	Canada	B.C.	Coquitlam	http://www.coquitlam.ca/default.htm	http://en.wikipedia.org/wiki/Coquitlam	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-14 22:40:24	Coquitlam
195	Ontario Teachers' Pension Plan	OTPP	Investor	Canada	Ontario	Toronto	http://www.otpp.com/	http://en.wikipedia.org/wiki/Ontario_Teachers%27_Pension_Plan	\N	2009-05-02 18:31:28	2009-05-02 18:32:09	Ontario
158	American Red Cross	American Red Cross	Nonprofit	USA	\N	\N	http://www.redcross.org/	http://en.wikipedia.org/wiki/American_Red_Cross	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
121	Domini Social Investments	Domini Social Inv'ts	Investor	USA	\N	\N	http://www.domini.com/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
84	Canadian Alliance of Student Associations	CASA	Student	Canada	\N	\N	http://www.casa.ca/	http://en.wikipedia.org/wiki/Canadian_Alliance_of_Student_Associations	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
10	Classico condo, 1328 W Pender St, Vancouver	Classico	Homeowner	Canada	B.C.	Vancouver	http://www.theclassico.ca/	None as of March 2009	BCS 460. 1328 West Pender Street, Vancouver, BC, Canada V6E 4T1	2009-04-11 22:52:28	2009-04-14 22:21:11	1328 W Pender St
47	Richmond	Richmond	Municipal	Canada	B.C.	Richmond	http://www.richmond.ca/home.htm	http://en.wikipedia.org/wiki/Richmond,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
177	Associated Students of Western Washington Univ.	Assoc. Students WWU	Student	USA	Washington	Bellingham	http://www.as.wwu.edu/	None as of January 2009	Associated Students of Western Washington University	2009-04-11 22:52:30	2009-04-14 23:26:09	Bellingham
140	Sentinel Funds	Sentinel Funds	Investor	USA	\N	\N	\N	\N	Formerly Citizens	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
103	Transparency International	Transparency Int'l	Nonprofit	Germany	Berlin	Berlin	http://www.transparency.org/	http://en.wikipedia.org/wiki/Transparency_International	\N	2009-04-11 22:52:30	2009-04-14 23:04:49	International
29	Delta	Delta	Municipal	Canada	B.C.	Delta	http://www.delta.com/	http://en.wikipedia.org/wiki/Delta,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-17 21:57:29	Delta
66	University of British Columbia Alumni Association	UBC Alumni Ass'n	Nonprofit	Canada	B.C.	\N	http://www.alumni.ubc.ca/	http://en.wikipedia.org/wiki/University_of_British_Columbia	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
196	British Columbia Investment Management Corporation	BCIMC	Investor	Canada	B.C.	Victoria	http://www.bcimc.com/	None as of 2009-05-02	\N	2009-05-02 18:34:41	2009-05-02 18:37:04	B.C.
159	Consumers Union	Consumers Union	Nonprofit	USA	New York	Yonkers	http://www.consumersunion.org/	http://en.wikipedia.org/wiki/Consumers_Union	\N	2009-04-11 22:52:30	2009-04-14 23:13:01	USA, Canada
122	Dreyfus Funds	Dreyfus Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
11	B.C. Government & Service Employees Union	BCGSEU	Labour	Canada	B.C.	Burnaby	http://www.bcgeu.bc.ca/	\N	British Columbia Government and Service Employees Union	2009-04-11 22:52:28	2009-04-14 22:23:08	B.C.
48	Sechelt	Sechelt	Municipal	Canada	B.C.	Sechelt	http://www.district.sechelt.bc.ca/	http://en.wikipedia.org/wiki/Sechelt	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-05-06 00:21:40	Sechelt
85	Canadian Federation of Students	CFS	Student	Canada	\N	\N	http://www.cfs-fcee.ca/	http://en.wikipedia.org/wiki/Canadian_Federation_of_Students	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
178	Harvard Undergraduate Council	Harvard Undergrads	Student	USA	Massachusetts	Cambridge	http://www.uc.fas.harvard.edu/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-14 23:26:45	Cambridge, Boston
141	Smith Barney Funds	Smith Barney Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
30	Gibsons	Gibsons	Municipal	Canada	B.C.	Gibsons	http://www.gibsons.ca/	http://en.wikipedia.org/wiki/Gibsons,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-17 22:01:01	Gibsons
67	Vancouver Board of Trade	Van. Board of Trade	Nonprofit	Canada	B.C.	Vancouver	http://www.boardoftrade.com/	http://en.wikipedia.org/wiki/Vancouver_Board_of_Trade	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
104	VoterMedia.org	VoterMedia.org	Nonprofit	Canada	B.C.	Vancouver	http://votermedia.org	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-14 23:05:22	International
197	Ontario	Ontario	Province	Canada	Ontario	Toronto	http://www.ontario.ca/	http://en.wikipedia.org/wiki/Ontario	\N	2009-05-02 19:42:26	2009-05-02 19:44:03	Ontario
160	Council of Institutional Investors	CII	Nonprofit	USA	\N	\N	http://www.cii.org/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
123	DWS Funds	DWS Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
12	British Columbia Federation of Labour	BC Fed'n of Labour	Labour	Canada	B.C.	Vancouver	http://www.bcfed.com/	http://en.wikipedia.org/wiki/British_Columbia_Federation_of_Labour	\N	2009-04-11 22:52:28	2009-04-14 22:24:22	B.C.
49	Squamish	Squamish	Municipal	Canada	B.C.	Squamish	http://www.squamish.ca/	http://en.wikipedia.org/wiki/Squamish	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
86	Capilano Students' Union	Capilano Students	Student	Canada	B.C.	North Vancouver	http://www.csu.bc.ca/	http://en.wikipedia.org/wiki/Capilano_University	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
179	MIT Undergraduate Association	MIT Undergrad Ass'n	Student	USA	Massachusetts	Cambridge	http://ua.mit.edu/	None as of January 2009	Massachusetts Institute of Technology Undergraduate Association	2009-04-11 22:52:30	2009-04-14 23:27:06	Cambridge
142	State Street Global Advisors	State Street Global	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
31	Harrison Hot Springs	Harrison Hot Springs	Municipal	Canada	B.C.	Harrison Hot Springs	http://www.harrisonhotsprings.ca/	http://en.wikipedia.org/wiki/Harrison_Hot_Springs	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-26 17:31:38	Harrison Hot Springs
68	Vancouver Community Network	Van. Comm'y Network	Nonprofit	Canada	B.C.	Vancouver	http://www2.vcn.bc.ca/	http://en.wikipedia.org/wiki/Vancouver_Community_Network	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
105	Wikimedia Foundation	Wikimedia Foundation	Nonprofit	USA	California	San Francisco	http://wikimediafoundation.org/wiki/Home	http://en.wikipedia.org/wiki/Wikimedia	\N	2009-04-11 22:52:30	2009-04-14 23:13:35	International
198	Toronto	Toronto	Municipal	Canada	Ontario	Toronto	http://www.toronto.ca/	http://en.wikipedia.org/wiki/Toronto	\N	2009-05-02 19:45:07	2009-05-02 19:45:48	Toronto
161	Nat'l Assoc. for the Advancement of Colored People	NAACP	Nonprofit	USA	\N	\N	http://www.naacp.org/	http://en.wikipedia.org/wiki/Naacp	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
124	Evergreen Funds	Evergreen Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
13	British Columbia Nurses' Union	BC Nurses' Union	Labour	Canada	B.C.	Burnaby	http://www.bcnu.org	None as of January 2009	\N	2009-04-11 22:52:28	2009-04-14 22:26:51	B.C.
50	Surrey	Surrey	Municipal	Canada	B.C.	Surrey	http://www.surrey.ca/default.htm	http://en.wikipedia.org/wiki/Surrey,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
87	Douglas Students' Union	Douglas Students	Student	Canada	B.C.	\N	http://www.cfslocal18.ca/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
180	United States Student Association	US Student Ass'n	Student	USA	DC	Washington	http://www.usstudents.org/	http://en.wikipedia.org/wiki/United_States_Student_Association	\N	2009-04-11 22:52:30	2009-04-14 23:27:55	USA
143	T Rowe Price Funds	T Rowe Price Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
32	Hope	Hope	Municipal	Canada	B.C.	Hope	http://www.hopebc.ca/	http://en.wikipedia.org/wiki/Hope,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-11 22:52:28	\N
69	West End Residents Association	West End Res. Ass'n	Nonprofit	Canada	B.C.	Vancouver	http://www.wera.bc.ca/	None as of January 2009	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
106	UK Shareholders' Association	UK Shareholders Assn	Nonprofit	United Kingdom	\N	Chislehurst	http://www.uksa.org.uk/index.htm	\N	\N	2009-04-11 22:52:30	2009-04-14 23:09:08	United Kingdom
199	Ottawa	Ottawa	Municipal	Canada	Ontario	Ottawa	http://www.ottawa.ca/	http://en.wikipedia.org/wiki/Ottawa	\N	2009-05-02 19:47:02	2009-05-02 19:47:48	Ottawa
162	National Organization for Women	NOW	Nonprofit	USA	\N	\N	http://www.now.org/	http://en.wikipedia.org/wiki/National_Organization_for_Women	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
125	Federated Funds	Federated Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
14	British Columbia Teachers' Federation	BCTF	Labour	Canada	B.C.	Vancouver	http://www.bctf.ca/	http://en.wikipedia.org/wiki/British_Columbia_Teachers_Federation	\N	2009-04-11 22:52:28	2009-04-14 22:28:24	B.C.
51	Vancouver	Vancouver	Municipal	Canada	B.C.	Vancouver	http://www.vancouver.ca/	http://en.wikipedia.org/wiki/Vancouver	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-27 01:36:06	Vancouver
88	Kwantlen Student Association	Kwantlen Students	Student	Canada	B.C.	\N	http://www.kusa.ca/	http://en.wikipedia.org/wiki/Alma_Mater_Society_of_the_University_of_British_Columbia	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
181	British Columbia School Trustees' Association	B.C. School Trustees	Nonprofit	Canada	B.C.	Vancouver	http://www.bcsta.org	None as of April 2009	\N	2009-04-19 05:38:47	2009-04-19 05:41:26	B.C.
144	TIAA – CREF	TIAA-CREF	Investor	USA	\N	\N	http://www.tiaa-cref.org/	http://en.wikipedia.org/wiki/TIAA-CREF_Investment_Management	Teachers Insurance and Annuity Association - College Retirement Equities Fund	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
33	Kent	Kent	Municipal	Canada	B.C.	Kent	http://www.district.kent.bc.ca/	http://en.wikipedia.org/wiki/Kent,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-11 22:52:28	\N
70	Bloc Québécois	Bloc Québécois	Political	Canada	\N	\N	http://www.blocquebecois.org/	http://en.wikipedia.org/wiki/Bloc_Québécois	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
107	Harvard/MIT Cooperative Society	Harvard/MIT Coop	Co-op	USA	Massachusetts	Cambridge	http://www.thecoop.com/	http://en.wikipedia.org/wiki/Harvard/MIT_Cooperative_Society	\N	2009-04-11 22:52:30	2009-04-14 23:11:29	Cambridge, Boston
200	Alberta	Alberta	Province	Canada	Alberta	Edmonton	http://alberta.ca/	http://en.wikipedia.org/wiki/Alberta	\N	2009-05-02 19:50:02	2009-05-02 19:50:50	Alberta
163	National Rifle Association	NRA	Nonprofit	USA	\N	\N	http://www.nra.org/	http://en.wikipedia.org/wiki/National_Rifle_Association	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
126	Fidelity Investments	Fidelity	Investor	USA	\N	\N	http://www.fidelity.com/	http://en.wikipedia.org/wiki/Fidelity_Investments	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
15	Canadian Association of University Teachers	Cdn Ass'n U Teachers	Labour	Canada	Ontario	Ottawa	http://www.caut.ca	\N	\N	2009-04-11 22:52:28	2009-04-14 22:29:38	Canada
52	Victoria	Victoria	Municipal	Canada	B.C.	Victoria	http://www.victoria.ca	http://en.wikipedia.org/wiki/Victoria,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
89	Langara Students Union	Langara Students	Student	Canada	B.C.	Vancouver	http://www.lsu.bc.ca/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
182	Cyberphyber Media	Cyber	Other	Canada	BC	Vancouver	www.cyberphyber.com	\N	webdesign technical writing video production	2009-04-20 00:00:00	2009-04-20 06:52:33	Vancouver BC Canada
145	Trillium Asset Management	Trillium Asset Mgt	Investor	USA	\N	\N	http://trilliuminvest.com/	None as of January 2009	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
34	Langley (City)	Langley (City)	Municipal	Canada	B.C.	Langley (City)	http://www.city.langley.bc.ca/	http://en.wikipedia.org/wiki/Langley,_British_Columbia_(city)	The City of Langley is not to be confused with the larger "<a href="./35">Township of Langley</a>" (also called "Langley District Municipality"). GVRD, Metro Vancouver.	2009-04-11 22:52:28	2009-04-27 16:39:10	Langley (City)
71	Conservative Party of Canada	Conservative Party	Political	Canada	\N	\N	http://www.conservative.ca/	http://en.wikipedia.org/wiki/Conservative_Party_of_Canada	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
108	Recreational Equipment Inc.	REI	Co-op	USA	Washington	Seattle	http://www.rei.com/	http://en.wikipedia.org/wiki/REI	\N	2009-04-11 22:52:30	2009-04-14 23:12:04	USA
201	Edmonton	Edmonton	Municipal	Canada	Alberta	Edmonton	http://www.edmonton.ca/	http://en.wikipedia.org/wiki/Edmonton	\N	2009-05-02 19:52:42	2009-05-02 19:53:24	Edmonton
164	The Authors Guild	Authors Guild	Nonprofit	USA	\N	\N	http://www.authorsguild.org/	http://en.wikipedia.org/wiki/Authors_Guild	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
127	Franklin Templeton Funds	Franklin Templeton	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
16	Canadian Auto Workers	Cdn Auto Workers	Labour	Canada	Ontario	Toronto	http://www.caw.ca	http://en.wikipedia.org/wiki/Canadian_Auto_Workers	\N	2009-04-11 22:52:28	2009-04-14 22:31:01	Canada
53	West Vancouver	West Vancouver	Municipal	Canada	B.C.	West Vancouver	http://www.westvancouver.net/	http://en.wikipedia.org/wiki/West_Vancouver	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
90	Northern Undergraduate Student Society	Northern Undergrads	Student	Canada	B.C.	\N	http://nugss.unbc.ca/	http://en.wikipedia.org/wiki/Northern_Undergraduate_Student_Society	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
183	Google	Google	Corporation	USA	California	Mountain View	http://www.google.com/corporate	http://en.wikipedia.org/wiki/Google	\N	2009-04-27 05:25:53	2009-04-27 05:25:53	International
146	United Services Automobile Association	USAA	Investor	USA	\N	\N	http://www.usaa.com/	http://en.wikipedia.org/wiki/USAA	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
35	Langley (District Municipality)	Langley (District)	Municipal	Canada	B.C.	Langley (District)	http://www.tol.bc.ca/	http://en.wikipedia.org/wiki/Langley,_British_Columbia_(district_municipality)	Langley District Municipality (also called Langley Township) is not to be confused with the smaller "<a href="./34">City of Langley</a>".  GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-27 16:38:28	Langley (District)
72	Green Party of Canada	Green Party	Political	Canada	\N	\N	http://www.green.ca/	http://en.wikipedia.org/wiki/Green_Party_of_Canada	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
109	Microsoft	Microsoft	Corporation	USA	Washington	Redmond	http://www.microsoft.com	http://en.wikipedia.org/wiki/Microsoft	NASDAQ; MSFT	2009-04-11 22:52:30	2009-04-25 23:59:05	International
202	Calgary	Calgary	Municipal	Canada	Alberta	Calgary	http://www.calgary.ca/	http://en.wikipedia.org/wiki/Calgary	\N	2009-05-02 19:55:13	2009-05-02 19:55:59	Calgary
165	United Way of America	United Way America	Nonprofit	USA	\N	\N	http://www.liveunited.org/	http://en.wikipedia.org/wiki/United_Way_of_America	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
128	Goldman Sachs Funds	Goldman Sachs Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
17	Canadian Auto Workers Local 111	CAW Local 111	Labour	Canada	B.C.	New Westminster	http://www.caw111.com/	http://en.wikipedia.org/wiki/CAW_Local_111	bus drivers	2009-04-11 22:52:28	2009-04-14 22:32:56	B.C.
54	Whistler	Whistler	Municipal	Canada	B.C.	Whistler	http://www.whistler.ca/	http://en.wikipedia.org/wiki/Whistler_(British_Columbia)	GVRD, Metro Vancouver	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
91	Simon Fraser Student Society	Simon Fraser Student	Student	Canada	B.C.	\N	http://www.sfss.ca/	http://en.wikipedia.org/wiki/Simon_Fraser_Student_Society	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
184	Claremont	Claremont	Municipal	USA	California	Claremont	http://www.ci.claremont.ca.us/	http://en.wikipedia.org/wiki/Claremont,_California	\N	2009-04-27 18:58:20	2009-04-27 18:58:59	Claremont
147	Van Kampen Funds	Van Kampen Funds	Investor	USA	\N	\N	\N	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
36	Lillooet	Lillooet	Municipal	Canada	B.C.	Lillooet	http://www.lillooetbc.com/	http://en.wikipedia.org/wiki/Lillooet,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28	2009-04-11 22:52:28	\N
73	Liberal Party of Canada	Liberal Party	Political	Canada	\N	\N	http://www.liberal.ca/	http://en.wikipedia.org/wiki/Liberal_Party_of_Canada	\N	2009-04-11 22:52:29	2009-04-11 22:52:29	\N
110	Ticketmaster Entertainment, Inc.	Ticketmaster	Corporation	USA	California	West Hollywood	http://www.ticketmaster.com	\N	\N	2009-04-11 22:52:30	2009-04-11 22:52:30	\N
205	Iran	Iran	Country	Iran	Tehran	Tehran	http://www.iran.ir/	http://en.wikipedia.org/wiki/Iran		2009-05-11 15:47:44.230715	2009-05-11 16:49:19.368446	Iran
\.


--
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY faqs (id, category, "sequence", importance, question, answer, created_at, updated_at) FROM stdin;
16	Voting	5.4000000000000004	7	How are votes tallied?	We sometimes adjust our tallying method. Here's a description as of 2009-05-01, but it may have been adjusted since then:\n\nWe count your latest vote for each website/blog, subject to "vote decay through time", which means that votes are weighted according to how old they are. Zero through 10 days old gets 100% weight. After 10 days, a vote's weight diminishes by 2% per day, so that its weight falls to zero when it's 60 days old.\n\nSo if you vote about once a week (as we suggest), your latest vote will always have 100% weight.\n	2009-05-02 02:58:51	2009-05-03 20:56:42
11	Voting	5.2000000000000002	8	How many websites/blogs should/can I vote for?	You can vote for as many websites/blogs as you like. Voting for more websites/blogs does not decrease the weight of each of your votes.\n\nOf course, it makes the most sense to vote for websites/blogs that you know something about. We suggest voting for those that you think should be ranked higher than they are now.\n	2009-05-02 02:25:15	2009-05-02 21:13:21
22	Mechanics	3.3999999999999999	7	How are the listed websites/blogs chosen? What sort of websites/blogs should I add?	VoterMedia.org website users and administrators decide which websites/blogs to add to a community's list. You should add websites that you think provide a service to that voter community. These can be blogs, or websites for other media like newspapers, radio, TV.\n\nBut it need not be limited to media. You could add websites/blogs from organizations that provide other community benefits that voters may want to support, including charities, events or whatever.\n	2009-05-02 03:29:21	2009-05-02 05:07:44
17	Voting	5.3499999999999996	5	How often do you count the votes?	As of 2009-05-01, we were tallying every vote in real time, updating the ranking in response. (We may adjust this at any time though, and might not update this answer right away.)\n	2009-05-02 03:03:08	2009-05-02 21:13:38
23	Voting	5.4500000000000002	7	Do I have to be a member of that particular community to vote on its website/blog ranking?	No. You can vote in any community you care about. Later, we plan to also develop rankings based on votes from community members only, and let users see both rankings. Creating a member-votes-only ranking will require some coordination with the community's administration.\n	2009-05-04 19:43:24	2009-05-06 00:28:35
12	Voting	5.2999999999999998	7	How often should/can I vote?	You can vote as often as you like. We count your latest vote for each website/blog. We suggest voting about once a week.\n	2009-05-02 02:26:39	2009-05-02 21:11:28
1	Organization	1.1000000000000001	8	What the heck is VoterMedia.org? What's it for? Who is behind this? Why are you doing this? What are your goals? Who is funding it? Who is working on it?	Uh... relax, OK? VoterMedia.org is a public interest project for improving the policies of the world's organizations (governments, corporations, unions, nonprofits etc.) by developing better voter information systems. We are implementing voter funded media as explained in the paper Global Voter Media Platform and our other publications.\nThis website is built by a group of volunteers, led by <a href="/about_contact">Mark Latham</a>. We plan to create a nonprofit organization to manage the project, with a board of directors elected by the website's users. We are already practising what we preach, by <a href="/communities/104">inviting websites/blogs to critique VoterMedia.org</a>.\nThere's a lot more info on <a href="http://votermedia.org">our old website</a>, which we are gradually copying here to build our next release.\n	2009-05-02 02:11:00	2009-05-02 20:36:02
18	Voting	5.5	7	By what criteria should I judge the websites when I vote? What do you mean by "Which websites/blogs deserve more support from the ... voter community?"	You can vote based on any criteria you want. The impact of your vote is to push websites you support upward in the ranking. That means more people will probably read them. And if there are cash awards for higher-ranked blogs (which there were not as of 2009-05-01), then your supported websites might get more funding. So presumably you should vote for websites that you think benefit you more than those currently ranked above them. You might also want to consider whether some websites/blogs are already receiving voter community funds (support) through other channels.\n\nVoterMedia.org is designed to direct funding to websites/blogs that benefit the voter community. Those that are seen as beneficial by the most voters would thus be ranked higher.\n	2009-05-02 03:06:45	2009-05-02 20:25:22
13	Reasoning	7.5	7	Why would voter-supported news media be any different from the news media we have now?	Voting is a community service. Information to help people vote better is a public good. So it is not surprising that commercial markets do not supply enough of this public good, especially in terms of its quality. Commercial markets supply goods with personal benefits that people will pay for individually.\n\nMany experts and other citizens agree that we need to improve our public-interest media (see for example <a href="http://freepress.net">freepress.net</a>). The usual way to pay for public goods is with public funds. Normally public funds are controlled by politicians, but for political information that would be a conflict of interest, so voters should control that funding directly.\n\nThe incentives that determine which media you pay for individually are different from the incentives for voting public funds. It makes sense to pay for your own entertainment, but when you are influencing the media going to all citizens, it is not in your interest to vote for entertainment for everyone, since most of that wouldn’t benefit you. However, information that helps everyone vote more intelligently does benefit you. It is a public good that lacks the private benefit of entertainment. It is rational to be unwilling to pay as an individual for a public good, but to be willing to vote for everyone to pay for it. So the same citizens who buy <i>People</i> magazine at the checkout stand will vote public funds for serious investigative reporting.\n	2009-05-02 02:28:26	2009-05-02 20:31:52
19	Voting	5.5999999999999996	6	What benefit do top-ranked websites get?	As of 2009-05-01 there are no cash awards yet, though we hope this will change soon. But for now, higher ranked websites/blogs get bragging rights and exposure, presumably bringing more readers and more credibility.\n	2009-05-02 03:15:44	2009-05-02 05:10:55
8	Organization	1.3999999999999999	7	How do you make money? How do you plan to make money?	Our goal is saving the world, not making money. However, money can help get things done, so we invite donations from individuals, foundations, and the communities served by VoterMedia.org. So far the main donor to this project has been Mark Latham.\n\nIn the long run, we expect most donations to come from the communities we serve. Most of those funds will flow through as awards to the websites/blogs serving those communities, ranked by voters. Donors will be able to designate which community's website ranking the funds will flow to, and whether to donate for the expenses of VoterMedia.org.\n	2009-05-02 02:21:38	2009-05-02 05:08:19
14	Reasoning	7.4000000000000004	7	Wouldn’t some media award contestants be biased, corrupted by bribery or other influence?	Yes, there are likely to be such biases, just as there are in our current news media. But voter funding will add a new incentive for media to build reputations for serving the public interest, so we can expect them to produce better information.\n	2009-05-02 02:29:10	2009-05-02 05:09:12
20	Reasoning	7.2999999999999998	7	How does this website help achieve the goals of the VoterMedia project?	This website builds support, exposure and reputation of websites/blogs that many voters consider beneficial. They may also receive financial support, when we get donations.\n\nThese different kinds of support encourage websites/blogs to help voter communities. We think an important type of community benefit they will provide is a check and balance on the power of elected leaders, increasing accountability and thus improving the leaders' policies, decisions and administration.\n	2009-05-02 03:20:48	2009-05-02 05:08:54
9	Reasoning	7.2000000000000002	7	Why should I care about VoterMedia? Why should I use the VoterMedia website? How should I use the VoterMedia website?	VoterMedia.org is designed to benefit you by improving accountability of elected leaders. But we need your help to make that happen. Please add relevant blogs and communities to our system, check out some websites/blogs that serve your communities, and vote for those you think deserve higher rankings. Encourage your communities to fund their top-ranked websites/blogs.\n	2009-05-02 02:22:19	2009-05-04 06:07:06
15	Reasoning	7.7000000000000002	5	How do we know whether voter-funded media will actually be beneficial?	No one knows for sure. There have only been a few trials so far; see an assessment in <a href="http://votermedia.blogspot.com/2009/02/ubc-ams-vfm-voting-results.html">this blog post</a>. The arguments in the paper "<a href="http://votermedia.org/publications/GlobalVoterMediaPlatform.pdf">Global Voter Media Platform</a>" are plausible, but the only way to find out is to try it. If voter funding for media is beneficial, we can apply it throughout democratic politics as well as for shareowner voting in corporations. So the potential benefits are huge compared to the cost of trying it out.\n	2009-05-02 02:29:44	2009-05-02 20:27:37
21	Mechanics	3.2999999999999998	7	How are the communities in VoterMedia chosen? What sort of communities should I add?	VoterMedia.org website users and administrators choose what communities to add to the system. We recommend adding communities with over 1,000 voters and annual budgets over US$200,000. That gives enough scale to make a voted ranking of competing websites/blogs a worthwhile benefit to the community.\n	2009-05-02 03:23:48	2009-05-02 05:07:19
10	Mechanics	3.2000000000000002	5	Can I use the VoterMedia.org website without a login? What difference does it make whether I have a login here or not?	Yes, you can use the site without a login. Most functions are available without logging in, including browsing the rankings, voting, adding communities and adding websites.\n\nWe will gradually be adding more functions, and some of them will need you to log in, e.g. to customize your user interface in various ways.\n\nAs you become comfortable with using the site, we invite you to create a login and participate more fully in the VoterMedia.org community. We plan to elect a board of directors to oversee the website, and our voting members will be active users with logins.\n	2009-05-02 02:22:50	2009-05-02 22:10:59
\.


--
-- Data for Name: pubs; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY pubs (id, date_sequence, date_text, title, country, journal, created_at, updated_at) FROM stdin;
5	2006-11-15	November 2006	<a href="/publications/HowUBCCanChangeTheWorld.pdf">How UBC Can Change the World</a>\n	Canada	[press release]\n	2009-05-03 05:09:41	2009-05-03 05:09:41
11	1998-09-26	Sept 1998	<a href="/publications/HowToTransformAFailedJapaneseBank.pdf">How To Transform a Failed Japanese Bank</a>\n	USA	[working paper]\n	2009-05-03 05:29:31	2009-05-03 05:30:35
6	2003-04-15	April 2003	<a href="/publications/DemocracyAndInfomediaries.pdf">Democracy and Infomediaries</a>\n	UK	<a href="http://www.blackwellpublishing.com/journal.asp?ref=0964-8410&site=1">Corporate Governance: An International Review</a>\n	2009-05-03 05:13:44	2009-05-03 05:13:44
12	1999-09-15	Sept 1999	<a href="/publications/CollectiveAction.pdf">Collective Action for Dispersed Shareowners</a>\n	China (Hong&nbsp;Kong)	<a href="http://www.hkics.org.hk/index.php?_room=10&searchDone=1&_action=detail&_page=39">Corporate Governance International</a>\n	2009-05-03 05:36:45	2009-05-05 21:40:31
1	2009-02-12	February 2009	<a href="/publications/GlobalVoterMediaPlatform.pdf">Global Voter Media Platform</a>\n	Canada	[working paper]\n	2009-05-03 03:41:25	2009-05-03 03:43:36
7	1999-01-01	January 1999	<a href="/publications/CorporateMonitoringFirm.pdf">The Corporate Monitoring Firm</a>\n	UK	<a href="http://www.blackwellpublishing.com/journal.asp?ref=0964-8410&site=1">Corporate Governance: An International Review</a>\n	2009-05-03 05:21:05	2009-05-03 05:21:05
13	2005-05-21	May 2005	<a href="/publications/VoteYourStock.pdf">Vote Your Stock</a> <span style="font-weight: normal">[superseded by <a href="/publications/ProxyVotingBrandCompetition.pdf">Proxy Voting Brand Competition</a>]</span>\n	Canada	[working paper]\n	2009-05-03 22:43:41	2009-05-03 22:47:20
2	2007-04-13	April 2007	<a href="/publications/VoterFundedMedia.pdf">Voter-Funded Media: Governance Reform for Democracies and Corporations</a>\n	Canada	[working paper]\n	2009-05-03 04:00:14	2009-05-03 04:20:16
8	1998-09-30	Sept/Oct 1998	<a href="/publications/CorporateMonitoringNewShareholderPowerTool.pdf">Corporate Monitoring: New Shareholder Power Tool</a>\n	USA	<a href="http://www.cfapubs.org/loi/faj">Financial Analysts Journal</a>\n	2009-05-03 05:22:34	2009-05-03 05:23:16
3	1988-06-07	June 1988	<a href="/publications/VFMidea19880607.pdf">First voter-funded media idea</a>\n	USA	[letter]\n	2009-05-03 04:18:10	2009-05-03 04:18:10
14	2004-06-12	June 2004	<a href="http://www.citizensassembly.bc.ca/resources/submissions/csharman-10_0406151124-834.pdf">Presentation favouring STV over MMP</a>\n	Canada	<a href="http://www.citizensassembly.bc.ca/">British Columbia Citizens' Assembly on Electoral Reform</a>\n	2009-05-03 22:49:51	2009-05-03 22:53:54
9	1993-07-15	July 1993	<a href="/publications/ManagementAuditingFirm.pdf">The Management Auditing Firm</a>\n	USA	[working paper]\n	2009-05-03 05:25:23	2009-05-03 05:25:23
15	2000-06-15	June 2000	<a href="/publications/InternetWillDriveCorporateMonitoring.pdf">The Internet Will Drive Corporate Monitoring</a>\n	China (Hong&nbsp;Kong)	<a href="http://www.hkics.org.hk/index.php?_room=10&searchDone=1&_action=detail&_page=39">Corporate Governance International</a>\n	2009-05-03 22:58:27	2009-05-05 21:40:11
4	2007-01-01	January 2007	<a href="/publications/ProxyVotingBrandCompetition.pdf">Proxy Voting Brand Competition</a>\n	USA	<a href="http://www.joim.com/">Journal of Investment Management</a>\n	2009-05-03 05:04:16	2009-05-03 05:05:00
10	1997-09-30	Sept/Oct 1997	<a href="/publications/ProposedGovernanceMonitor.pdf">Proposed: A Governance "Monitor"</a>\n	USA	<a href="http://www.corporateboard.com/">The Corporate Board</a>\n	2009-05-03 05:27:37	2009-05-03 05:27:37
\.


--
-- Data for Name: rankings; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY rankings (id, community_id, website_id, rank, created_at, updated_at) FROM stdin;
9	51	12	0	2009-04-26 04:04:59	2009-04-26 04:04:59
47	54	50	1	2009-04-27 18:22:52	2009-04-27 18:23:26
28	82	31	1	2009-04-26 04:29:36	2009-04-26 04:31:34
66	192	69	2	2009-04-27 22:59:12	2009-04-27 23:09:23
76	116	79	0	2009-05-08 02:02:58	2009-05-08 02:02:58
57	188	60	0	2009-04-27 21:45:42	2009-04-27 21:45:42
38	14	41	1	2009-04-26 04:40:34	2009-04-26 04:40:50
10	51	13	1	2009-04-26 04:05:24	2009-05-03 21:32:03
48	184	51	1	2009-04-27 18:59:31	2009-04-27 18:59:44
29	82	32	0	2009-04-26 04:29:55	2009-04-26 04:29:55
67	191	70	1	2009-04-27 23:10:24	2009-05-01 18:58:02
77	116	80	0	2009-05-08 02:04:22	2009-05-08 02:04:22
20	81	23	2	2009-04-26 04:16:31	2009-04-29 15:16:34
58	188	61	0	2009-04-27 21:47:01	2009-04-27 21:47:01
1	109	4	1	2009-04-25 20:39:59	2009-04-29 16:36:01
39	181	42	1	2009-04-26 04:42:56	2009-04-26 04:46:40
30	82	33	1	2009-04-26 04:30:12	2009-04-26 04:31:45
68	190	71	1	2009-04-27 23:16:29	2009-04-27 23:17:00
11	51	14	0	2009-04-26 04:05:45	2009-04-26 04:05:45
49	185	52	0	2009-04-27 19:06:13	2009-04-27 19:06:13
78	116	81	0	2009-05-08 02:16:19	2009-05-08 02:16:19
21	81	24	2	2009-04-26 04:17:45	2009-04-29 17:57:27
59	3	62	1	2009-04-27 21:52:36	2009-04-27 21:52:53
2	51	5	1	2009-04-26 03:28:14	2009-04-26 03:51:32
40	3	43	1	2009-04-26 04:53:57	2009-04-26 04:54:02
69	193	72	1	2009-04-27 23:19:22	2009-04-27 23:19:41
31	82	34	1	2009-04-26 04:30:30	2009-04-27 05:30:34
12	51	15	0	2009-04-26 04:06:04	2009-04-26 04:06:04
50	186	53	1	2009-04-27 19:14:40	2009-04-27 19:14:48
79	116	82	0	2009-05-08 02:17:33	2009-05-08 02:17:33
3	51	6	1	2009-04-26 03:28:49	2009-04-26 04:06:40
41	109	44	1	2009-04-26 05:20:07	2009-04-29 16:34:36
22	81	25	1	2009-04-26 04:18:06	2009-05-02 20:03:22
60	5	63	1	2009-04-27 21:53:29	2009-04-29 18:20:56
70	81	73	0	2009-04-28 03:17:07	2009-04-28 03:17:07
32	82	35	0	2009-04-26 04:30:53	2009-04-26 04:30:53
13	51	16	1	2009-04-26 04:06:24	2009-04-29 15:16:04
51	171	54	1	2009-04-27 19:15:24	2009-04-27 19:15:34
80	116	83	0	2009-05-08 02:18:31	2009-05-08 02:18:31
4	81	7	2	2009-04-26 03:31:26	2009-04-26 03:33:39
42	35	45	1	2009-04-27 16:27:45	2009-04-27 16:28:03
23	5	26	2	2009-04-26 04:20:00	2009-04-29 16:42:01
61	51	64	1	2009-04-27 21:54:25	2009-04-29 15:15:38
71	104	74	0	2009-04-28 03:46:25	2009-04-28 03:46:25
14	51	17	2	2009-04-26 04:09:48	2009-04-29 15:16:12
52	187	55	1	2009-04-27 19:18:25	2009-04-27 19:18:33
33	82	36	0	2009-04-26 04:31:12	2009-04-26 04:31:12
81	204	84	0	2009-05-08 02:29:39	2009-05-08 02:29:39
43	35	46	0	2009-04-27 16:32:50	2009-04-27 16:32:50
24	5	27	1	2009-04-26 04:20:25	2009-04-29 10:05:57
62	111	65	1	2009-04-27 22:34:15	2009-04-27 22:34:26
5	81	8	2	2009-04-26 03:32:03	2009-04-29 15:22:01
72	111	75	1	2009-05-03 16:20:00	2009-05-03 16:20:12
15	51	18	1	2009-04-26 04:10:22	2009-05-10 00:31:09
53	3	56	1	2009-04-27 19:22:16	2009-05-04 03:33:00
34	82	37	0	2009-04-26 04:33:08	2009-04-26 04:33:08
82	204	85	0	2009-05-08 02:30:24	2009-05-08 02:30:24
25	47	28	0	2009-04-26 04:24:57	2009-04-26 04:24:57
63	189	66	1	2009-04-27 22:38:04	2009-04-27 22:39:18
6	81	9	0	2009-04-26 03:34:10	2009-04-25 20:45:48
44	34	47	1	2009-04-27 16:34:21	2009-04-27 16:34:28
73	116	76	1	2009-05-08 01:59:15	2009-05-08 02:20:09
54	3	57	1	2009-04-27 19:25:58	2009-04-29 16:18:07
35	81	38	0	2009-04-26 04:35:00	2009-04-26 04:35:00
16	51	19	0	2009-04-26 04:13:11	2009-04-26 04:13:11
26	50	29	0	2009-04-26 04:25:39	2009-04-26 04:25:39
64	190	67	1	2009-04-27 22:50:19	2009-04-27 22:50:29
7	51	10	0	2009-04-26 04:01:50	2009-04-26 04:01:50
45	42	48	0	2009-04-27 16:56:41	2009-04-27 16:56:41
74	116	77	0	2009-05-08 02:01:01	2009-05-08 02:01:01
36	84	39	0	2009-04-26 04:39:24	2009-04-26 04:39:24
17	81	20	0	2009-04-26 04:13:44	2009-04-26 04:13:44
55	3	58	1	2009-04-27 19:28:44	2009-04-27 19:33:34
65	191	68	1	2009-04-27 22:56:09	2009-04-27 22:57:14
8	51	11	1	2009-04-26 04:04:22	2009-04-27 05:53:35
46	41	49	0	2009-04-27 16:57:06	2009-04-27 16:57:06
27	82	30	1	2009-04-26 04:29:13	2009-04-29 16:34:00
75	116	78	0	2009-05-08 02:02:06	2009-05-08 02:02:06
37	85	40	0	2009-04-26 04:39:51	2009-04-26 04:39:51
56	3	59	0	2009-04-27 19:33:22	2009-04-27 19:33:22
84	205	87	1	2009-05-11 15:49:58.207416	2009-05-11 16:48:14.564818
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY schema_migrations (version) FROM stdin;
20090411224116
20090411224737
20090414164116
20090425000241
20090425201039
20090425231510
20090426035839
20090502020217
20090503033828
20090505045317
20090505051246
20090510232115
20090510232141
20090510233747
20090510233922
20090510233950
20090510234012
20090510234033
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY votes (id, ip_address, community_id, website_id, support, created_at, updated_at) FROM stdin;
85	24.85.86.192	81	8	\N	2009-04-29 16:36:21	2009-04-29 16:36:21
9	24.85.86.192	81	8	\N	2009-04-26 03:33:26	2009-04-26 03:33:26
47	90.55.14.198	1	1	\N	2009-04-29 14:20:18	2009-04-29 14:20:18
28	24.85.86.192	184	51	\N	2009-04-27 18:59:42	2009-04-27 18:59:42
66	90.55.14.198	1	1	\N	2009-04-29 15:02:02	2009-04-29 15:02:02
95	24.85.86.192	111	75	\N	2009-05-03 16:20:07	2009-05-03 16:20:07
76	24.85.86.192	3	43	\N	2009-04-29 16:17:56	2009-04-29 16:17:56
19	24.85.86.192	181	42	\N	2009-04-26 04:46:38	2009-04-26 04:46:38
57	90.55.14.198	1	1	\N	2009-04-29 14:30:37	2009-04-29 14:30:37
38	24.85.86.192	190	67	\N	2009-04-27 22:50:26	2009-04-27 22:50:26
86	24.85.86.192	51	17	\N	2009-04-29 16:37:44	2009-04-29 16:37:44
10	24.85.86.192	81	7	\N	2009-04-26 03:33:36	2009-04-26 03:33:36
48	90.55.14.198	1	1	\N	2009-04-29 14:21:40	2009-04-29 14:21:40
29	24.85.86.192	186	53	\N	2009-04-27 19:14:48	2009-04-27 19:14:48
67	90.55.14.198	1	1	\N	2009-04-29 15:10:33	2009-04-29 15:10:33
96	24.85.86.192	51	13	\N	2009-05-03 21:32:01	2009-05-03 21:32:01
77	24.85.86.192	3	57	\N	2009-04-29 16:18:04	2009-04-29 16:18:04
20	24.85.86.192	3	43	\N	2009-04-26 04:54:00	2009-04-26 04:54:00
58	90.55.14.198	1	1	\N	2009-04-29 14:30:42	2009-04-29 14:30:42
39	24.85.86.192	191	68	\N	2009-04-27 22:57:11	2009-04-27 22:57:11
87	24.85.86.192	51	6	\N	2009-04-29 16:37:51	2009-04-29 16:37:51
30	24.85.86.192	171	54	\N	2009-04-27 19:15:30	2009-04-27 19:15:30
68	90.55.14.198	51	64	\N	2009-04-29 15:15:35	2009-04-29 15:15:35
11	24.85.86.192	51	5	\N	2009-04-26 03:51:32	2009-04-26 03:51:32
49	90.55.14.198	1	1	\N	2009-04-29 14:23:30	2009-04-29 14:23:30
97	24.85.86.192	51	13	\N	2009-05-03 21:32:11	2009-05-03 21:32:11
78	24.85.86.192	3	57	\N	2009-04-29 16:18:14	2009-04-29 16:18:14
21	24.85.86.192	109	44	\N	2009-04-26 05:20:10	2009-04-26 05:20:10
59	90.55.14.198	1	1	\N	2009-04-29 14:30:48	2009-04-29 14:30:48
40	24.85.86.192	192	69	\N	2009-04-27 22:59:18	2009-04-27 22:59:18
88	24.85.86.192	51	11	\N	2009-04-29 16:40:28	2009-04-29 16:40:28
31	24.85.86.192	187	55	\N	2009-04-27 19:18:31	2009-04-27 19:18:31
69	90.55.14.198	51	64	\N	2009-04-29 15:15:52	2009-04-29 15:15:52
12	24.85.86.192	51	6	\N	2009-04-26 04:06:37	2009-04-26 04:06:37
50	90.55.14.198	1	1	\N	2009-04-29 14:26:29	2009-04-29 14:26:29
98	96.49.64.179	3	56	\N	2009-05-04 03:32:57	2009-05-04 03:32:57
79	24.85.86.192	82	33	\N	2009-04-29 16:33:45	2009-04-29 16:33:45
41	24.85.86.192	192	69	\N	2009-04-27 23:09:23	2009-04-27 23:09:23
22	24.85.86.192	109	44	\N	2009-04-26 05:20:17	2009-04-26 05:20:17
60	90.55.14.198	1	1	\N	2009-04-29 14:34:40	2009-04-29 14:34:40
89	24.85.86.192	5	26	\N	2009-04-29 16:42:01	2009-04-29 16:42:01
32	24.85.86.192	3	58	\N	2009-04-27 19:33:31	2009-04-27 19:33:31
70	90.55.14.198	51	16	\N	2009-04-29 15:16:01	2009-04-29 15:16:01
13	24.85.86.192	5	26	\N	2009-04-26 04:20:30	2009-04-26 04:20:30
51	90.55.14.198	1	1	\N	2009-04-29 14:26:36	2009-04-29 14:26:36
99	96.49.64.179	3	56	\N	2009-05-04 03:33:14	2009-05-04 03:33:14
80	24.85.86.192	82	30	\N	2009-04-29 16:34:00	2009-04-29 16:34:00
4	24.85.86.192	109	4	\N	2009-04-26 01:49:37	2009-04-26 01:49:37
42	24.85.86.192	190	71	\N	2009-04-27 23:16:56	2009-04-27 23:16:56
23	24.85.86.192	82	34	\N	2009-04-27 05:30:31	2009-04-27 05:30:31
61	90.55.14.198	1	1	\N	2009-04-29 14:35:59	2009-04-29 14:35:59
90	24.85.86.192	81	24	\N	2009-04-29 17:57:25	2009-04-29 17:57:25
71	90.55.14.198	51	17	\N	2009-04-29 15:16:12	2009-04-29 15:16:12
14	24.85.86.192	82	30	\N	2009-04-26 04:31:21	2009-04-26 04:31:21
52	90.55.14.198	1	1	\N	2009-04-29 14:26:41	2009-04-29 14:26:41
33	24.85.86.192	51	17	\N	2009-04-27 21:33:15	2009-04-27 21:33:15
100	96.49.64.179	3	56	\N	2009-05-04 03:33:22	2009-05-04 03:33:22
81	24.85.86.192	109	4	\N	2009-04-29 16:34:21	2009-04-29 16:34:21
43	24.85.86.192	193	72	\N	2009-04-27 23:19:39	2009-04-27 23:19:39
24	24.85.86.192	51	11	\N	2009-04-27 05:53:29	2009-04-27 05:53:29
62	90.55.14.198	1	1	\N	2009-04-29 14:43:15	2009-04-29 14:43:15
5	24.85.86.192	109	4	\N	2009-04-26 01:49:57	2009-04-26 01:49:57
91	24.85.86.192	109	44	\N	2009-04-29 18:17:42	2009-04-29 18:17:42
72	90.55.14.198	81	23	\N	2009-04-29 15:16:31	2009-04-29 15:16:31
15	24.85.86.192	82	31	\N	2009-04-26 04:31:32	2009-04-26 04:31:32
53	90.55.14.198	1	1	\N	2009-04-29 14:26:46	2009-04-29 14:26:46
34	24.85.86.192	3	62	\N	2009-04-27 21:52:46	2009-04-27 21:52:46
101	64.30.119.183	116	76	\N	2009-05-08 02:20:07	2009-05-08 02:20:07
82	24.85.86.192	109	44	\N	2009-04-29 16:34:36	2009-04-29 16:34:36
25	24.85.86.192	35	45	\N	2009-04-27 16:27:58	2009-04-27 16:27:58
63	90.55.14.198	1	1	\N	2009-04-29 14:46:42	2009-04-29 14:46:42
44	90.55.145.200	5	27	\N	2009-04-29 10:05:54	2009-04-29 10:05:54
92	24.85.86.192	5	63	\N	2009-04-29 18:20:54	2009-04-29 18:20:54
73	90.55.14.198	81	23	\N	2009-04-29 15:16:45	2009-04-29 15:16:45
54	90.55.14.198	1	1	\N	2009-04-29 14:28:25	2009-04-29 14:28:25
35	24.85.86.192	81	23	\N	2009-04-27 22:04:27	2009-04-27 22:04:27
16	24.85.86.192	82	33	\N	2009-04-26 04:31:40	2009-04-26 04:31:40
102	64.30.119.183	116	76	\N	2009-05-08 02:20:34	2009-05-08 02:20:34
83	24.85.86.192	109	44	\N	2009-04-29 16:35:49	2009-04-29 16:35:49
26	24.85.86.192	34	47	\N	2009-04-27 16:34:26	2009-04-27 16:34:26
64	90.55.14.198	1	1	\N	2009-04-29 14:46:47	2009-04-29 14:46:47
7	24.85.86.192	109	4	\N	2009-04-26 02:05:40	2009-04-26 02:05:40
45	90.55.145.200	5	26	\N	2009-04-29 10:06:06	2009-04-29 10:06:06
93	24.85.86.192	191	70	\N	2009-05-01 18:58:00	2009-05-01 18:58:00
74	90.55.14.198	81	24	\N	2009-04-29 15:21:50	2009-04-29 15:21:50
36	24.85.86.192	111	65	\N	2009-04-27 22:34:24	2009-04-27 22:34:24
17	24.85.86.192	82	30	\N	2009-04-26 04:31:49	2009-04-26 04:31:49
55	90.55.14.198	1	1	\N	2009-04-29 14:28:29	2009-04-29 14:28:29
84	24.85.86.192	109	4	\N	2009-04-29 16:35:59	2009-04-29 16:35:59
65	90.55.14.198	1	1	\N	2009-04-29 15:01:55	2009-04-29 15:01:55
8	24.85.86.192	81	7	\N	2009-04-26 03:31:32	2009-04-26 03:31:32
46	90.55.145.200	5	26	\N	2009-04-29 10:06:15	2009-04-29 10:06:15
27	24.85.86.192	54	50	\N	2009-04-27 18:23:24	2009-04-27 18:23:24
94	24.85.86.192	81	25	\N	2009-05-02 20:03:22	2009-05-02 20:03:22
75	90.55.14.198	81	8	\N	2009-04-29 15:22:01	2009-04-29 15:22:01
37	24.85.86.192	189	66	\N	2009-04-27 22:39:15	2009-04-27 22:39:15
18	24.85.86.192	14	41	\N	2009-04-26 04:40:50	2009-04-26 04:40:50
56	90.55.14.198	1	1	\N	2009-04-29 14:29:54	2009-04-29 14:29:54
104	24.85.86.192	205	87	\N	2009-05-11 16:48:11.670341	2009-05-11 16:48:11.670341
\.


--
-- Data for Name: websites; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY websites (id, url, title, created_at, updated_at) FROM stdin;
85	http://www.pensiontsunami.com/	PensionWatch\n	2009-05-08 02:30:24	2009-05-08 02:30:24
9	http://billtieleman.blogspot.com/	Bill Tieleman\n	2009-04-26 03:34:09	2009-04-26 03:34:09
47	http://www.kimrichter.com/Blog/langleyfreepress.html	Langley Free Press\n	2009-04-27 16:34:21	2009-04-27 16:34:21
28	http://stephenrees.wordpress.com/	Stephen Rees's blog\n	2009-04-26 04:24:57	2009-05-04 05:22:03
66	http://thelondonfog.blogspot.com/	The London Fog\n	2009-04-27 22:38:04	2009-04-27 22:38:04
76	http://perswatch.net//	PERSWatch\n	2009-05-08 01:59:15	2009-05-08 01:59:15
19	http://jnarvey.com/	Currents\n	2009-04-26 04:13:11	2009-04-26 04:13:11
57	http://peterjanes.homeip.net/cbc/	Planet CBC\n	2009-04-27 19:25:58	2009-04-27 19:25:58
38	http://www.bcvote.ca/	BC Vote\n	2009-04-26 04:35:00	2009-04-26 04:35:00
10	http://www.thevancouverobserver.com/	Vancouver Observer: Frontpage\n	2009-04-26 04:01:50	2009-05-09 04:54:40
48	http://northvancouverpolitics.com/	northvancouverpolitics.com\n	2009-04-27 16:56:40	2009-05-04 05:21:27
29	http://www.paulhillsdon.com/blog/	paulhillsdon.com\n	2009-04-26 04:25:39	2009-05-04 05:22:44
67	http://knoxvilletennesseeblog.com/	Knoxville Tennessee Blog\n	2009-04-27 22:50:19	2009-04-27 22:50:19
77	http://www.sacbee.com/static/weblogs/the_state_worker/	The State Worker\n	2009-05-08 02:01:01	2009-05-08 02:01:01
20	http://jnarvey.com/	Currents\n	2009-04-26 04:13:44	2009-04-26 04:13:44
58	http://teamakers.blogspot.com/	The Tea Makers\n	2009-04-27 19:28:44	2009-04-27 19:28:44
1	http://thecrandreagoupr.blogspot.com/	Activism - The Crandrea Group\n	2009-04-25 01:31:44	2009-04-25 01:31:44
39	http://oncampus.macleans.ca/education	Macleans OnCampus\n	2009-04-26 04:39:24	2009-04-26 04:39:24
30	http://ubcspectator.blogspot.com/	The UBC Spectator\n	2009-04-26 04:29:13	2009-04-26 04:29:13
68	http://civicforum.chattablogs.com/	TennesseeTicket.com\n	2009-04-27 22:56:09	2009-04-27 22:56:09
11	http://thetyee.ca/	Tyee Home :: thetyee.ca\n	2009-04-26 04:04:22	2009-05-10 21:19:32
49	http://northvancouverpolitics.com/	northvancouverpolitics.com\n	2009-04-27 16:57:05	2009-05-04 05:20:52
78	http://www.pensiontsunami.com/	Pension Watch\n	2009-05-08 02:02:06	2009-05-08 02:02:06
59	http://peterjanes.ca/blog/	Petroglyphs\n	2009-04-27 19:33:21	2009-04-27 19:33:21
2	http://www.networkworld.com/community/blog/1926	Microsoft Subnet Blog\n	2009-04-25 02:42:54	2009-04-25 02:42:54
40	http://oncampus.macleans.ca/education	Macleans OnCampus\n	2009-04-26 04:39:51	2009-04-26 04:39:51
69	http://civicforum.chattablogs.com/	TennesseeTicket.com\n	2009-04-27 22:59:12	2009-04-27 22:59:12
31	http://radicalbeer.wordpress.com/	The Radical Beer Tribune\n	2009-04-26 04:29:36	2009-05-04 05:02:33
12	http://davideby.blogspot.com/	David Eby - Blog\n	2009-04-26 04:04:59	2009-05-04 04:57:13
50	http://www.piquenewsmagazine.com/	Pique newsmagazine| Whistler, CANADA\n	2009-04-27 18:22:52	2009-05-04 05:23:34
79	http://calpensions.com/	Calpensions\n	2009-05-08 02:02:58	2009-05-08 06:03:50
3	http://thecrandreagoupr.blogspot.com/	Activism - The Crandrea Group\n	2009-04-25 03:37:43	2009-04-25 03:37:43
41	http://communities.canada.com/vancouversun/blogs/reportcard/default.aspx	Report Card - Vancouver Sun blogs\n	2009-04-26 04:40:34	2009-05-04 05:19:04
60	http://nanaimosouthendvotes.wordpress.com/	South End Votes\n	2009-04-27 21:45:41	2009-04-27 21:45:41
70	http://chattarati.com/	Chattarati, Chattanooga news and opinion\n	2009-04-27 23:10:24	2009-04-27 23:10:24
32	http://ubcstudentmedia.wordpress.com/	UBC Student Media\n	2009-04-26 04:29:55	2009-04-26 04:29:55
13	http://www.paulhillsdon.com/blog/	paulhillsdon.com\n	2009-04-26 04:05:24	2009-05-04 04:35:52
51	http://claremontca.blogspot.com/	Claremont Insider\n	2009-04-27 18:59:30	2009-04-27 18:59:30
80	http://www.rpea.com/	Retired Public Employees Association\n	2009-05-08 02:04:22	2009-05-08 02:04:22
4	http://thecrandreagoupr.blogspot.com/	Activism-The Crandrea Group\n	2009-04-25 20:39:59	2009-05-04 05:10:26
42	http://communities.canada.com/vancouversun/blogs/reportcard/default.aspx	Report Card - Vancouver Sun blogs\n	2009-04-26 04:42:56	2009-05-04 05:24:43
23	http://thetyee.ca/	Tyee Home :: thetyee.ca\n	2009-04-26 04:16:31	2009-05-10 21:19:45
61	http://www.gonanaimo.com/blog/	Go Nanaimo Blog\n	2009-04-27 21:47:01	2009-04-27 21:47:01
71	http://knoxify.com/	Knoxify - The insider’s take on what makes Knoxville great\n	2009-04-27 23:16:29	2009-04-27 23:16:29
14	http://www.beyondrobson.com/	Beyond Robson | Vancouver blog\n	2009-04-26 04:05:45	2009-05-04 04:56:15
52	http://www.allthingsupland.com/	All Things Upland\n	2009-04-27 19:06:13	2009-04-27 19:06:13
33	http://ubcinsiders.blogspot.com/	UBC Insiders\n	2009-04-26 04:30:12	2009-04-26 04:30:12
81	http://www.calcsea.org	California State Employees Association - Retirees\n	2009-05-08 02:16:19	2009-05-08 02:16:19
43	http://www.earsay.com/standonguardforcbc/	About Us | Stand On Guard For CBC\n	2009-04-26 04:53:57	2009-05-04 05:07:40
24	http://davideby.blogspot.com/	David Eby - Blog\n	2009-04-26 04:17:45	2009-05-04 04:48:30
62	http://worththefeetoreadit.wordpress.com/	Worth the Fee to Read It\n	2009-04-27 21:52:35	2009-04-27 21:52:35
5	http://stephenrees.wordpress.com/	Stephen Rees's blog\n	2009-04-26 03:28:13	2009-05-04 04:55:26
72	http://nashvillest.com/	Nashvillest\n	2009-04-27 23:19:22	2009-04-27 23:19:22
15	http://pricetags.wordpress.com/	Price Tags\n	2009-04-26 04:06:04	2009-04-26 04:06:04
53	http://thefcblog.com/	The Foothill Cities Blog\n	2009-04-27 19:14:40	2009-04-27 19:14:40
34	http://www.knollubc.ca/	http://www.knollubc.ca/\n	2009-04-26 04:30:30	2009-05-04 05:02:02
82	http://pub.csea.com/cseahome/	California School Employees Association\n	2009-05-08 02:17:33	2009-05-08 02:17:33
25	http://www.paulhillsdon.com/blog/	paulhillsdon.com\n	2009-04-26 04:18:06	2009-05-04 04:46:09
63	http://worththefeetoreadit.wordpress.com/	Worth the Fee to Read It\n	2009-04-27 21:53:29	2009-04-27 21:53:29
6	http://www.francesbula.com/	Frances Bula &#8212; Vancouver city life and politics\n	2009-04-26 03:28:49	2009-05-04 04:50:36
44	http://www.networkworld.com/community/blog/1926	Microsoft Subnet Blog\n	2009-04-26 05:20:07	2009-04-26 05:20:07
73	http://bc2009.com/	BC Election 2009\n	2009-04-28 03:17:07	2009-04-28 03:17:07
54	http://thefcblog.com/	The Foothill Cities Blog\n	2009-04-27 19:15:23	2009-04-27 19:15:23
35	http://fairvoteubc.wordpress.com/	Fair Vote UBC\n	2009-04-26 04:30:53	2009-04-26 04:30:53
16	http://www.miss604.com/	Vancouver Blog Miss 604 by Rebecca Bollwitt\n	2009-04-26 04:06:24	2009-05-03 14:04:17
83	http://www.seiu1000.org/	SEIU Local 1000\n	2009-05-08 02:18:31	2009-05-08 02:18:31
26	http://thetyee.ca/	Tyee Home :: thetyee.ca\n	2009-04-26 04:20:00	2009-05-10 21:20:07
64	http://worththefeetoreadit.wordpress.com/	Worth the Fee to Read It\n	2009-04-27 21:54:25	2009-04-27 21:54:25
7	http://stephenrees.wordpress.com/	Stephen Rees's blog\n	2009-04-26 03:31:26	2009-05-04 04:48:09
45	http://www.langleypolitics.com/	Langley Politics Dotcom\n	2009-04-27 16:27:44	2009-04-27 16:27:44
74	http://votermedia.blogspot.com/	VoterMedia Democracy Blog\n	2009-04-28 03:46:24	2009-04-28 03:46:24
36	http://www.ubcdevil.com/	UBC Devil's Advocate\n	2009-04-26 04:31:12	2009-05-04 05:04:04
17	http://hummingbird604.com/	Hummingbird604.com\n	2009-04-26 04:09:48	2009-04-26 04:09:48
55	http://thefcblog.com/	The Foothill Cities Blog\n	2009-04-27 19:18:25	2009-04-27 19:18:25
84	http://calpensions.com/	Calpensions\n	2009-05-08 02:29:38	2009-05-08 02:29:38
65	http://www.michaelbutler.com/blog/civic/	MB Civic\n	2009-04-27 22:34:13	2009-04-27 22:34:13
8	http://www.publiceyeonline.com/	Public Eye Online\n	2009-04-26 03:32:02	2009-04-26 03:32:02
46	http://www.kimrichter.com/Blog/langleyfreepress.html	Langley Free Press\n	2009-04-27 16:32:50	2009-04-27 16:32:50
27	http://jnarvey.com/	Currents\n	2009-04-26 04:20:24	2009-04-26 04:20:24
75	http://factcheck.org/	FactCheck.org\n	2009-05-03 16:19:59	2009-05-03 16:19:59
37	http://blogs.ubc.ca/phoebeyu	UBC Years - Phoebe Yu » The loquacious musings of a caffeinated UBC student\n	2009-04-26 04:33:08	2009-05-04 05:03:15
18	http://thebernermonologues.blogspot.com/	David Talks/The Berner Monologues\n	2009-04-26 04:10:22	2009-04-26 04:10:22
56	http://publicbroadcasting.ca	publicbroadcasting.ca\n	2009-04-27 19:22:16	2009-04-27 19:22:16
87	http://balatarin.com/	بالاترین:‌ لینکهای داغ	2009-05-11 15:49:58.198578	2009-05-11 16:47:33.340842
\.


--
-- Name: colleagues_pkey; Type: CONSTRAINT; Schema: public; Owner: app62414; Tablespace: 
--

ALTER TABLE ONLY colleagues
    ADD CONSTRAINT colleagues_pkey PRIMARY KEY (id);


--
-- Name: communities_pkey; Type: CONSTRAINT; Schema: public; Owner: app62414; Tablespace: 
--

ALTER TABLE ONLY communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: faqs_pkey; Type: CONSTRAINT; Schema: public; Owner: app62414; Tablespace: 
--

ALTER TABLE ONLY faqs
    ADD CONSTRAINT faqs_pkey PRIMARY KEY (id);


--
-- Name: pubs_pkey; Type: CONSTRAINT; Schema: public; Owner: app62414; Tablespace: 
--

ALTER TABLE ONLY pubs
    ADD CONSTRAINT pubs_pkey PRIMARY KEY (id);


--
-- Name: rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: app62414; Tablespace: 
--

ALTER TABLE ONLY rankings
    ADD CONSTRAINT rankings_pkey PRIMARY KEY (id);


--
-- Name: votes_pkey; Type: CONSTRAINT; Schema: public; Owner: app62414; Tablespace: 
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: websites_pkey; Type: CONSTRAINT; Schema: public; Owner: app62414; Tablespace: 
--

ALTER TABLE ONLY websites
    ADD CONSTRAINT websites_pkey PRIMARY KEY (id);


--
-- Name: index_rankings_on_community_id_and_website_id; Type: INDEX; Schema: public; Owner: app62414; Tablespace: 
--

CREATE UNIQUE INDEX index_rankings_on_community_id_and_website_id ON rankings USING btree (community_id, website_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: app62414; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

