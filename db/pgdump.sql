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

SELECT pg_catalog.setval('colleagues_id_seq', 13, true);


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

SELECT pg_catalog.setval('communities_id_seq', 203, true);


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

SELECT pg_catalog.setval('faqs_id_seq', 23, true);


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

SELECT pg_catalog.setval('pubs_id_seq', 15, true);


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

SELECT pg_catalog.setval('rankings_id_seq', 72, true);


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

SELECT pg_catalog.setval('votes_id_seq', 100, true);


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

SELECT pg_catalog.setval('websites_id_seq', 75, true);


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
2	Bradley	Coleman	Strategy	bradley[at]votermedia.org	bradley_coleman.jpg		2009-05-05 04:59:23.892165	2009-05-05 05:28:40.722944	3
3	Erez	Maharshak	Website Development	erez[at]votermedia.org			2009-05-05 05:00:09.598643	2009-05-05 05:28:52.640514	6
4	Fanny	Shen	Website Design	fanny[at]votermedia.org		Web Designer, <a href="http://complexmadesimple.com/">Complex Made Simple</a>	2009-05-05 05:01:34.354893	2009-05-05 05:29:08.33228	5
5	Greg	Moreno	Website Development	greg.moreno[at]gmail.com			2009-05-05 05:05:59.519358	2009-05-05 05:29:35.996467	6
6	Junho	Lee	Website Development	junho[at]votermedia.org	junho_lee.jpg	M.Sc., Computer Science	2009-05-05 05:06:58.008792	2009-05-05 05:30:02.578571	6
1	Mark	Latham	Executive Director	mark[at]votermedia.org	mark_latham.jpg	Voicemail: (604) 608-9779<br />\r\nPaper mail: 1755 Robson Street #469,<br />\r\nVancouver, B.C., Canada V6G 3B7	2009-05-05 04:57:09.954251	2009-05-05 17:02:00.695866	1
13	Rebecca	Bollwitt	Advisory Board			<a href="http://www.miss604.com/about">Editor, Miss604.com</a>	2009-05-05 06:05:09.413832	2009-05-05 19:43:03.404315	9
10	Jackie	Cook	Advisory Board			<a href="http://www.fundvotes.com/contact.php">Founder, Fund Votes</a>	2009-05-05 06:02:01.239071	2009-05-05 19:44:42.626254	9
9	Fred	Cutler	Advisory Board			<a href="http://www.politics.ubc.ca/fcutler">\r\nAssistant Professor of Political Science<br />\r\nUniversity of British Columbia</a>	2009-05-05 06:00:58.215109	2009-05-05 19:45:20.514336	9
12	Mark	Rubinstein	Advisory Board			<a href="http://www.haas.berkeley.edu/faculty/rubinstein.html">\r\nProfessor of Finance <br />\r\nUniversity of California, Berkeley</a>	2009-05-05 06:04:22.065366	2009-05-05 19:45:54.16807	9
8	Andy	Eggers	Advisory Board			<a href="http://proxydemocracy.org/about/us">\r\nPresident, ProxyDemocracy</a>	2009-05-05 05:58:33.940366	2009-05-05 19:46:36.411998	9
11	James	McRitchie	Advisory Board			<a href="http://corpgov.net/">Publisher, CorpGov.net</a>	2009-05-05 06:03:22.290472	2009-05-05 19:48:13.750137	9
7	Naoya	Makino	Website Development	naoya[at]votermedia.org	naoya_makino.jpg	Computer science student, \r\n<a href="http://www.langara.bc.ca/">Langara College</a>	2009-05-05 05:08:18.900317	2009-05-05 19:51:47.362261	6
\.


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY communities (id, name, short_name, category, country, prov_state, city, official_url, wiki_url, description, created_at, updated_at, scope) FROM stdin;
32	Hope	Hope	Municipal	Canada	B.C.	Hope	http://www.hopebc.ca/	http://en.wikipedia.org/wiki/Hope,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.940921	2009-04-11 22:52:28.940921	\N
33	Kent	Kent	Municipal	Canada	B.C.	Kent	http://www.district.kent.bc.ca/	http://en.wikipedia.org/wiki/Kent,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.943268	2009-04-11 22:52:28.943268	\N
36	Lillooet	Lillooet	Municipal	Canada	B.C.	Lillooet	http://www.lillooetbc.com/	http://en.wikipedia.org/wiki/Lillooet,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.980576	2009-04-11 22:52:28.980576	\N
37	Lions Bay	Lions Bay	Municipal	Canada	B.C.	Lions Bay	http://www.lionsbay.citymax.com/page/page/479914.htm	http://en.wikipedia.org/wiki/Lions_Bay	GVRD, Metro Vancouver	2009-04-11 22:52:28.982881	2009-04-11 22:52:28.982881	\N
38	Maple Ridge	Maple Ridge	Municipal	Canada	B.C.	Maple Ridge	http://www.mapleridge.org/EN/index.html	http://en.wikipedia.org/wiki/Maple_Ridge	GVRD, Metro Vancouver	2009-04-11 22:52:28.985242	2009-04-11 22:52:28.985242	\N
39	Mission	Mission	Municipal	Canada	B.C.	Mission	http://www.mission.ca/site3.aspx	http://en.wikipedia.org/wiki/District_of_Mission	GVRD, Metro Vancouver	2009-04-11 22:52:28.987557	2009-04-11 22:52:28.987557	\N
40	New Westminster	New Westminster	Municipal	Canada	B.C.	New Westminster	http://www.newwestcity.ca/	http://en.wikipedia.org/wiki/New_Westminster	GVRD, Metro Vancouver	2009-04-11 22:52:28.989892	2009-04-11 22:52:28.989892	\N
43	Pemberton	Pemberton	Municipal	Canada	B.C.	Pemberton	http://www.pemberton.ca/	http://en.wikipedia.org/wiki/Pemberton,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.997016	2009-04-11 22:52:28.997016	\N
44	Pitt Meadows	Pitt Meadows	Municipal	Canada	B.C.	Pitt Meadows	http://www.pittmeadows.bc.ca/	http://en.wikipedia.org/wiki/Pitt_Meadows	GVRD, Metro Vancouver	2009-04-11 22:52:28.999333	2009-04-11 22:52:28.999333	\N
45	Port Coquitlam	Port Coquitlam	Municipal	Canada	B.C.	Port Coquitlam	http://www.city.port-coquitlam.bc.ca/Home_Page.htm	http://en.wikipedia.org/wiki/Port_Coquitlam	GVRD, Metro Vancouver	2009-04-11 22:52:29.001676	2009-04-11 22:52:29.001676	\N
46	Port Moody	Port Moody	Municipal	Canada	B.C.	Port Moody	http://www.cityofportmoody.com/default.htm	http://en.wikipedia.org/wiki/Port_Moody	GVRD, Metro Vancouver	2009-04-11 22:52:29.004144	2009-04-11 22:52:29.004144	\N
47	Richmond	Richmond	Municipal	Canada	B.C.	Richmond	http://www.richmond.ca/home.htm	http://en.wikipedia.org/wiki/Richmond,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29.037383	2009-04-11 22:52:29.037383	\N
49	Squamish	Squamish	Municipal	Canada	B.C.	Squamish	http://www.squamish.ca/	http://en.wikipedia.org/wiki/Squamish	GVRD, Metro Vancouver	2009-04-11 22:52:29.042291	2009-04-11 22:52:29.042291	\N
50	Surrey	Surrey	Municipal	Canada	B.C.	Surrey	http://www.surrey.ca/default.htm	http://en.wikipedia.org/wiki/Surrey,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29.044617	2009-04-11 22:52:29.044617	\N
52	Victoria	Victoria	Municipal	Canada	B.C.	Victoria	http://www.victoria.ca	http://en.wikipedia.org/wiki/Victoria,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29.049228	2009-04-11 22:52:29.049228	\N
53	West Vancouver	West Vancouver	Municipal	Canada	B.C.	West Vancouver	http://www.westvancouver.net/	http://en.wikipedia.org/wiki/West_Vancouver	GVRD, Metro Vancouver	2009-04-11 22:52:29.05214	2009-04-11 22:52:29.05214	\N
54	Whistler	Whistler	Municipal	Canada	B.C.	Whistler	http://www.whistler.ca/	http://en.wikipedia.org/wiki/Whistler_(British_Columbia)	GVRD, Metro Vancouver	2009-04-11 22:52:29.054665	2009-04-11 22:52:29.054665	\N
59	Canadian Internet Registration Authority	Cdn Internet Reg Aut	Nonprofit	Canada			http://www.cira.ca/en/home.html	http://en.wikipedia.org/wiki/Canadian_Internet_Registration_Authority		2009-04-11 22:52:29.06721	2009-04-11 22:52:29.06721	\N
60	Canadian Red Cross	Canadian Red Cross	Nonprofit	Canada			http://www.redcross.ca/	http://en.wikipedia.org/wiki/Canadian_Red_Cross		2009-04-11 22:52:29.069652	2009-04-11 22:52:29.069652	\N
61	Canadian Standards Association	Cdn Standards Ass'n	Nonprofit	Canada			http://www.csa.ca	http://en.wikipedia.org/wiki/Canadian_Standards_Association		2009-04-11 22:52:29.072123	2009-04-11 22:52:29.072123	\N
65	Law Society of BC	Law Society of BC	Nonprofit	Canada	B.C.		http://www.lawsociety.bc.ca/			2009-04-11 22:52:29.828061	2009-04-11 22:52:29.828061	\N
64	Fair Vote Canada	Fair Vote Canada	Nonprofit	Canada						2009-04-11 22:52:29.825375	2009-04-14 22:46:57.899413	Canada
66	University of British Columbia Alumni Association	UBC Alumni Ass'n	Nonprofit	Canada	B.C.		http://www.alumni.ubc.ca/	http://en.wikipedia.org/wiki/University_of_British_Columbia		2009-04-11 22:52:29.894812	2009-04-11 22:52:29.894812	\N
67	Vancouver Board of Trade	Van. Board of Trade	Nonprofit	Canada	B.C.	Vancouver	http://www.boardoftrade.com/	http://en.wikipedia.org/wiki/Vancouver_Board_of_Trade		2009-04-11 22:52:29.897589	2009-04-11 22:52:29.897589	\N
68	Vancouver Community Network	Van. Comm'y Network	Nonprofit	Canada	B.C.	Vancouver	http://www2.vcn.bc.ca/	http://en.wikipedia.org/wiki/Vancouver_Community_Network		2009-04-11 22:52:29.900119	2009-04-11 22:52:29.900119	\N
69	West End Residents Association	West End Res. Ass'n	Nonprofit	Canada	B.C.	Vancouver	http://www.wera.bc.ca/	None as of January 2009		2009-04-11 22:52:29.902635	2009-04-11 22:52:29.902635	\N
70	Bloc Québécois	Bloc Québécois	Political	Canada			http://www.blocquebecois.org/	http://en.wikipedia.org/wiki/Bloc_Québécois		2009-04-11 22:52:29.905108	2009-04-11 22:52:29.905108	\N
71	Conservative Party of Canada	Conservative Party	Political	Canada			http://www.conservative.ca/	http://en.wikipedia.org/wiki/Conservative_Party_of_Canada		2009-04-11 22:52:29.937656	2009-04-11 22:52:29.937656	\N
72	Green Party of Canada	Green Party	Political	Canada			http://www.green.ca/	http://en.wikipedia.org/wiki/Green_Party_of_Canada		2009-04-11 22:52:29.9406	2009-04-11 22:52:29.9406	\N
73	Liberal Party of Canada	Liberal Party	Political	Canada			http://www.liberal.ca/	http://en.wikipedia.org/wiki/Liberal_Party_of_Canada		2009-04-11 22:52:29.943118	2009-04-11 22:52:29.943118	\N
74	New Democratic Party	NDP	Political	Canada			http://www.ndp.ca/	http://en.wikipedia.org/wiki/New_Democratic_Party		2009-04-11 22:52:29.945649	2009-04-11 22:52:29.945649	\N
75	British Columbia Liberal Party	BC Liberals	Political	Canada	B.C.		http://www.bcliberals.com/	http://en.wikipedia.org/wiki/British_Columbia_Liberal_Party		2009-04-11 22:52:29.94814	2009-04-11 22:52:29.94814	\N
76	Green Party of British Columbia	Green Party of BC	Political	Canada	B.C.		http://www.greenparty.bc.ca/	http://en.wikipedia.org/wiki/Green_Party_of_British_Columbia		2009-04-11 22:52:29.950553	2009-04-11 22:52:29.950553	\N
77	New Democratic Party of British Columbia	BC NDP	Political	Canada	B.C.		http://www.bcndp.ca/	http://en.wikipedia.org/wiki/New_Democratic_Party_of_British_Columbia		2009-04-11 22:52:29.953027	2009-04-11 22:52:29.953027	\N
78	Coalition of Progressive Electors	COPE	Political	Canada	B.C.	Vancouver	http://www.cope.bc.ca/	http://en.wikipedia.org/wiki/Coalition_of_Progressive_Electors		2009-04-11 22:52:29.955494	2009-04-11 22:52:29.955494	\N
79	Non-Partisan Association	NPA	Political	Canada	B.C.	Vancouver	http://www.npavancouver.ca/	http://en.wikipedia.org/wiki/Non-Partisan_Association		2009-04-11 22:52:29.957944	2009-04-11 22:52:29.957944	\N
80	Vision Vancouver	Vision Vancouver	Political	Canada	B.C.	Vancouver	http://www.votevision.ca/	http://en.wikipedia.org/wiki/Vision_Vancouver		2009-04-11 22:52:29.96093	2009-04-11 22:52:29.96093	\N
83	BCIT Student Association	BCIT Student Ass'n	Student	Canada	B.C.		http://www.bcitsa.ca/	None as of January 2009	British Columbia Institute of Technology Student Association	2009-04-11 22:52:30.008875	2009-04-11 22:52:30.008875	\N
84	Canadian Alliance of Student Associations	CASA	Student	Canada			http://www.casa.ca/	http://en.wikipedia.org/wiki/Canadian_Alliance_of_Student_Associations		2009-04-11 22:52:30.011348	2009-04-11 22:52:30.011348	\N
85	Canadian Federation of Students	CFS	Student	Canada			http://www.cfs-fcee.ca/	http://en.wikipedia.org/wiki/Canadian_Federation_of_Students		2009-04-11 22:52:30.013854	2009-04-11 22:52:30.013854	\N
86	Capilano Students' Union	Capilano Students	Student	Canada	B.C.	North Vancouver	http://www.csu.bc.ca/	http://en.wikipedia.org/wiki/Capilano_University		2009-04-11 22:52:30.016309	2009-04-11 22:52:30.016309	\N
87	Douglas Students' Union	Douglas Students	Student	Canada	B.C.		http://www.cfslocal18.ca/	None as of January 2009		2009-04-11 22:52:30.019392	2009-04-11 22:52:30.019392	\N
88	Kwantlen Student Association	Kwantlen Students	Student	Canada	B.C.		http://www.kusa.ca/	http://en.wikipedia.org/wiki/Alma_Mater_Society_of_the_University_of_British_Columbia		2009-04-11 22:52:30.022371	2009-04-11 22:52:30.022371	\N
89	Langara Students Union	Langara Students	Student	Canada	B.C.	Vancouver	http://www.lsu.bc.ca/	None as of January 2009		2009-04-11 22:52:30.025365	2009-04-11 22:52:30.025365	\N
90	Northern Undergraduate Student Society	Northern Undergrads	Student	Canada	B.C.		http://nugss.unbc.ca/	http://en.wikipedia.org/wiki/Northern_Undergraduate_Student_Society		2009-04-11 22:52:30.057689	2009-04-11 22:52:30.057689	\N
91	Simon Fraser Student Society	Simon Fraser Student	Student	Canada	B.C.		http://www.sfss.ca/	http://en.wikipedia.org/wiki/Simon_Fraser_Student_Society		2009-04-11 22:52:30.060344	2009-04-11 22:52:30.060344	\N
92	Students' Unions of Vancouver Community College	Students' Unions VCC	Student	Canada	B.C.	Vancouver	http://www.suvcc.ca/	http://en.wikipedia.org/wiki/Vancouver_Community_College		2009-04-11 22:52:30.062842	2009-04-11 22:52:30.062842	\N
93	Trinity Western University Students Association	TWU Students Ass'n	Student	Canada	B.C.		http://www.twusa.ca/	http://en.wikipedia.org/wiki/Trinity_Western_University_Students_Association		2009-04-11 22:52:30.065335	2009-04-11 22:52:30.065335	\N
94	University of Calgary Students' Union	U Calgary Students	Student	Canada	Alberta	Calgary	http://www.su.ucalgary.ca/	http://en.wikipedia.org/wiki/University_of_Calgary_Students%27_Union		2009-04-11 22:52:30.067811	2009-04-11 22:52:30.067811	\N
95	University of the Fraser Valley Student Union Soc.	UFV Student Union	Student	Canada	B.C.		http://www.ufvsus.ca/	http://en.wikipedia.org/wiki/UFV_Student_Union_Society	University of the Fraser Valley Student Union Society	2009-04-11 22:52:30.070368	2009-04-11 22:52:30.070368	\N
110	Ticketmaster Entertainment, Inc.	Ticketmaster	Corporation	USA	California	West Hollywood	http://www.ticketmaster.com			2009-04-11 22:52:30.10975	2009-04-11 22:52:30.10975	\N
113	American Funds	American Funds	Investor	USA			http://www.americanfunds.com/	http://en.wikipedia.org/wiki/American_Funds		2009-04-11 22:52:30.273602	2009-04-11 22:52:30.273602	\N
114	Barclays Global Investors	Barclays Global Inv.	Investor	USA			http://www.barclaysglobal.com/	http://en.wikipedia.org/wiki/Barclays_Global_Investors		2009-04-11 22:52:30.276347	2009-04-11 22:52:30.276347	\N
115	Blackrock Funds	Blackrock Funds	Investor	USA						2009-04-11 22:52:30.278898	2009-04-11 22:52:30.278898	\N
116	California Public Employees Retirement System	CalPERS	Investor	USA						2009-04-11 22:52:30.281445	2009-04-11 22:52:30.281445	\N
117	Calvert Funds	Calvert Funds	Investor	USA			http://www.calvert.com/	None as of January 2009		2009-04-11 22:52:30.284277	2009-04-11 22:52:30.284277	\N
118	Columbia Funds	Columbia Funds	Investor	USA						2009-04-11 22:52:30.286843	2009-04-11 22:52:30.286843	\N
119	DFA Funds	DFA Funds	Investor	USA						2009-04-11 22:52:30.289342	2009-04-11 22:52:30.289342	\N
120	Dodge & Cox Funds	Dodge & Cox Funds	Investor	USA						2009-04-11 22:52:30.291899	2009-04-11 22:52:30.291899	\N
121	Domini Social Investments	Domini Social Inv'ts	Investor	USA			http://www.domini.com/	None as of January 2009		2009-04-11 22:52:30.294609	2009-04-11 22:52:30.294609	\N
122	Dreyfus Funds	Dreyfus Funds	Investor	USA						2009-04-11 22:52:30.327897	2009-04-11 22:52:30.327897	\N
123	DWS Funds	DWS Funds	Investor	USA						2009-04-11 22:52:30.330542	2009-04-11 22:52:30.330542	\N
124	Evergreen Funds	Evergreen Funds	Investor	USA						2009-04-11 22:52:30.33308	2009-04-11 22:52:30.33308	\N
125	Federated Funds	Federated Funds	Investor	USA						2009-04-11 22:52:30.335647	2009-04-11 22:52:30.335647	\N
126	Fidelity Investments	Fidelity	Investor	USA			http://www.fidelity.com/	http://en.wikipedia.org/wiki/Fidelity_Investments		2009-04-11 22:52:30.338134	2009-04-11 22:52:30.338134	\N
127	Franklin Templeton Funds	Franklin Templeton	Investor	USA						2009-04-11 22:52:30.340668	2009-04-11 22:52:30.340668	\N
128	Goldman Sachs Funds	Goldman Sachs Funds	Investor	USA						2009-04-11 22:52:30.34329	2009-04-11 22:52:30.34329	\N
129	Janus Funds	Janus Funds	Investor	USA						2009-04-11 22:52:30.34635	2009-04-11 22:52:30.34635	\N
130	MFS Funds	MFS Funds	Investor	USA						2009-04-11 22:52:30.34898	2009-04-11 22:52:30.34898	\N
131	MMA Praxis Funds	MMA Praxis Funds	Investor	USA						2009-04-11 22:52:30.351494	2009-04-11 22:52:30.351494	\N
132	Morgan Stanley Funds	Morgan Stanley Funds	Investor	USA						2009-04-11 22:52:30.354101	2009-04-11 22:52:30.354101	\N
133	Nationwide Funds	Nationwide Funds	Investor	USA						2009-04-11 22:52:30.401303	2009-04-11 22:52:30.401303	\N
134	Neuberger Berman Funds	Neuberger Berman	Investor	USA						2009-04-11 22:52:30.404093	2009-04-11 22:52:30.404093	\N
135	Parnassus Funds	Parnassus Funds	Investor	USA						2009-04-11 22:52:30.406652	2009-04-11 22:52:30.406652	\N
136	Pax World Funds	Pax World Funds	Investor	USA						2009-04-11 22:52:30.40917	2009-04-11 22:52:30.40917	\N
137	Putnam Funds	Putnam Funds	Investor	USA						2009-04-11 22:52:30.411774	2009-04-11 22:52:30.411774	\N
138	RiverSource Funds	RiverSource Funds	Investor	USA						2009-04-11 22:52:30.414386	2009-04-11 22:52:30.414386	\N
139	Schwab Funds	Schwab Funds	Investor	USA						2009-04-11 22:52:30.452831	2009-04-11 22:52:30.452831	\N
140	Sentinel Funds	Sentinel Funds	Investor	USA					Formerly Citizens	2009-04-11 22:52:30.455504	2009-04-11 22:52:30.455504	\N
141	Smith Barney Funds	Smith Barney Funds	Investor	USA						2009-04-11 22:52:30.458001	2009-04-11 22:52:30.458001	\N
142	State Street Global Advisors	State Street Global	Investor	USA						2009-04-11 22:52:30.460455	2009-04-11 22:52:30.460455	\N
143	T Rowe Price Funds	T Rowe Price Funds	Investor	USA						2009-04-11 22:52:30.46299	2009-04-11 22:52:30.46299	\N
144	TIAA – CREF	TIAA-CREF	Investor	USA			http://www.tiaa-cref.org/	http://en.wikipedia.org/wiki/TIAA-CREF_Investment_Management	Teachers Insurance and Annuity Association - College Retirement Equities Fund	2009-04-11 22:52:30.465507	2009-04-11 22:52:30.465507	\N
145	Trillium Asset Management	Trillium Asset Mgt	Investor	USA			http://trilliuminvest.com/	None as of January 2009		2009-04-11 22:52:30.468043	2009-04-11 22:52:30.468043	\N
146	United Services Automobile Association	USAA	Investor	USA			http://www.usaa.com/	http://en.wikipedia.org/wiki/USAA		2009-04-11 22:52:30.470576	2009-04-11 22:52:30.470576	\N
147	Van Kampen Funds	Van Kampen Funds	Investor	USA						2009-04-11 22:52:30.473066	2009-04-11 22:52:30.473066	\N
148	Vanguard Group, The	Vanguard Group	Investor	USA			http://www.vanguard.com/	http://en.wikipedia.org/wiki/The_Vanguard_Group		2009-04-11 22:52:30.506069	2009-04-11 22:52:30.506069	\N
149	Wells Fargo Funds	Wells Fargo Funds	Investor	USA						2009-04-11 22:52:30.509143	2009-04-11 22:52:30.509143	\N
150	Bellingham	Bellingham	Municipal	USA	Washington	Bellingham	http://www.bellingham.org/	http://en.wikipedia.org/wiki/Bellingham,_Washington		2009-04-11 22:52:30.511728	2009-04-11 22:52:30.511728	\N
151	Berkeley	Berkeley	Municipal	USA	California	Berkeley	http://www.ci.berkeley.ca.us/Home.aspx	http://en.wikipedia.org/wiki/Berkeley,_California		2009-04-11 22:52:30.514621	2009-04-11 22:52:30.514621	\N
152	Cambridge	Cambridge	Municipal	USA	Massachusetts	Cambridge	http://www.cambridgema.gov/	http://en.wikipedia.org/wiki/Cambridge,_Massachusetts		2009-04-11 22:52:30.517081	2009-04-11 22:52:30.517081	\N
153	Seattle	Seattle	Municipal	USA	Washington	Seattle	http://www.seattle.gov/	http://en.wikipedia.org/wiki/Seattle		2009-04-11 22:52:30.519849	2009-04-11 22:52:30.519849	\N
155	American Association of Retired Persons	AARP	Nonprofit	USA			http://www.aarp.org/	http://en.wikipedia.org/wiki/AARP		2009-04-11 22:52:30.524813	2009-04-11 22:52:30.524813	\N
156	American Automobile Association	AAA	Nonprofit	USA			http://www.aaa.com/	http://en.wikipedia.org/wiki/American_Automobile_Association		2009-04-11 22:52:30.527241	2009-04-11 22:52:30.527241	\N
158	American Red Cross	American Red Cross	Nonprofit	USA			http://www.redcross.org/	http://en.wikipedia.org/wiki/American_Red_Cross		2009-04-11 22:52:30.532128	2009-04-11 22:52:30.532128	\N
160	Council of Institutional Investors	CII	Nonprofit	USA			http://www.cii.org/	None as of January 2009		2009-04-11 22:52:30.572074	2009-04-11 22:52:30.572074	\N
161	Nat'l Assoc. for the Advancement of Colored People	NAACP	Nonprofit	USA			http://www.naacp.org/	http://en.wikipedia.org/wiki/Naacp		2009-04-11 22:52:30.574729	2009-04-11 22:52:30.574729	\N
162	National Organization for Women	NOW	Nonprofit	USA			http://www.now.org/	http://en.wikipedia.org/wiki/National_Organization_for_Women		2009-04-11 22:52:30.577167	2009-04-11 22:52:30.577167	\N
163	National Rifle Association	NRA	Nonprofit	USA			http://www.nra.org/	http://en.wikipedia.org/wiki/National_Rifle_Association		2009-04-11 22:52:30.579538	2009-04-11 22:52:30.579538	\N
164	The Authors Guild	Authors Guild	Nonprofit	USA			http://www.authorsguild.org/	http://en.wikipedia.org/wiki/Authors_Guild		2009-04-11 22:52:30.581907	2009-04-11 22:52:30.581907	\N
165	United Way of America	United Way America	Nonprofit	USA			http://www.liveunited.org/	http://en.wikipedia.org/wiki/United_Way_of_America		2009-04-11 22:52:30.584393	2009-04-11 22:52:30.584393	\N
167	Green Party (USA)	Green Party (USA)	Political	USA			http://www.gp.org/	http://en.wikipedia.org/wiki/Green_Party_(United_States)		2009-04-11 22:52:30.58923	2009-04-11 22:52:30.58923	\N
168	Libertarian Party (USA)	Libertarian Party	Political	USA			http://www.lp.org/	http://en.wikipedia.org/wiki/Libertarian_Party_(United_States)		2009-04-11 22:52:30.592149	2009-04-11 22:52:30.592149	\N
169	MoveOn.org	MoveOn.org	Political	USA			http://www.moveon.org/	http://en.wikipedia.org/wiki/Moveon		2009-04-11 22:52:30.594796	2009-04-11 22:52:30.594796	\N
172	Massachusetts	Massachusetts	State	USA	Massachusetts		http://www.mass.gov/	http://en.wikipedia.org/wiki/Massachusetts		2009-04-11 22:52:30.65095	2009-04-11 22:52:30.65095	\N
1	Mountain Equipment Co-op	MEC	Co-op	Canada	B.C.	Vancouver	http://mec.ca	http://en.wikipedia.org/wiki/Mountain_Equipment_Co-op		2009-04-11 22:52:28.733021	2009-04-14 18:26:36.981771	Canada
5	Canada	Canada	Country	Canada	Ontario	Ottawa	http://canada.gc.ca/	http://en.wikipedia.org/wiki/Canada		2009-04-11 22:52:28.781104	2009-04-14 18:27:50.163367	Canada
2	Ballard Power Systems	Ballard Power	Corporation	Canada	B.C.	Burnaby	http://www.ballard.com/	http://en.wikipedia.org/wiki/Ballard_Power_Systems	TSX, NASDAQ, BLDP	2009-04-11 22:52:28.773431	2009-04-14 22:09:27.166005	Canada, USA
4	Telus	Telus	Corporation	Canada	B.C.	Burnaby	http://www.telus.com/	http://en.wikipedia.org/wiki/Telus	TSE, T, T.A	2009-04-11 22:52:28.778757	2009-04-14 22:13:32.26464	Canada
10	Classico condo, 1328 W Pender St, Vancouver	Classico	Homeowner	Canada	B.C.	Vancouver	http://www.theclassico.ca/	None as of March 2009	BCS 460. 1328 West Pender Street, Vancouver, BC, Canada V6E 4T1	2009-04-11 22:52:28.79296	2009-04-14 22:21:11.178295	1328 W Pender St
11	B.C. Government & Service Employees Union	BCGSEU	Labour	Canada	B.C.	Burnaby	http://www.bcgeu.bc.ca/		British Columbia Government and Service Employees Union	2009-04-11 22:52:28.857262	2009-04-14 22:23:08.712161	B.C.
12	British Columbia Federation of Labour	BC Fed'n of Labour	Labour	Canada	B.C.	Vancouver	http://www.bcfed.com/	http://en.wikipedia.org/wiki/British_Columbia_Federation_of_Labour		2009-04-11 22:52:28.859759	2009-04-14 22:24:22.928796	B.C.
13	British Columbia Nurses' Union	BC Nurses' Union	Labour	Canada	B.C.	Burnaby	http://www.bcnu.org	None as of January 2009		2009-04-11 22:52:28.862091	2009-04-14 22:26:51.681381	B.C.
14	British Columbia Teachers' Federation	BCTF	Labour	Canada	B.C.	Vancouver	http://www.bctf.ca/	http://en.wikipedia.org/wiki/British_Columbia_Teachers_Federation		2009-04-11 22:52:28.864528	2009-04-14 22:28:24.936541	B.C.
15	Canadian Association of University Teachers	Cdn Ass'n U Teachers	Labour	Canada	Ontario	Ottawa	http://www.caut.ca			2009-04-11 22:52:28.866873	2009-04-14 22:29:38.175171	Canada
16	Canadian Auto Workers	Cdn Auto Workers	Labour	Canada	Ontario	Toronto	http://www.caw.ca	http://en.wikipedia.org/wiki/Canadian_Auto_Workers		2009-04-11 22:52:28.869177	2009-04-14 22:31:01.915785	Canada
17	Canadian Auto Workers Local 111	CAW Local 111	Labour	Canada	B.C.	New Westminster	http://www.caw111.com/	http://en.wikipedia.org/wiki/CAW_Local_111	bus drivers	2009-04-11 22:52:28.8715	2009-04-14 22:32:56.136792	B.C.
18	Canadian Union of Public Employees	CUPE	Labour	Canada	Ontario	Ottawa	http://cupe.ca/	http://en.wikipedia.org/wiki/CUPE		2009-04-11 22:52:28.873948	2009-04-14 22:33:55.742144	Canada
19	Fédération des travailleurs/-euses du Québec	Féd'n trav. Québec	Labour	Canada	Québec	Montréal	http://www.ftq.qc.ca/	http://en.wikipedia.org/wiki/Fédération_des_travailleurs_du_Québec	Fédération des travailleurs et travailleuses du Québec, QFL, Quebec Federation of Labour	2009-04-11 22:52:28.876308	2009-04-14 22:35:46.216394	Québec
20	Hospital Employees' Union (British Columbia)	HospitalEmployees BC	Labour	Canada	B.C.	Burnaby	http://www.heu.org/	http://en.wikipedia.org/wiki/Hospital_Employees%27_Union		2009-04-11 22:52:28.878641	2009-04-14 22:37:01.015563	B.C.
21	Vancouver Police Union	Vancouver Police	Labour	Canada	B.C.	Vancouver	http://www.vpu.ca/	http://en.wikipedia.org/wiki/Vancouver_Police_Union		2009-04-11 22:52:28.880997	2009-04-14 22:37:52.567844	Vancouver
22	Abbotsford	Abbotsford	Municipal	Canada	B.C.	Abbotsford	http://www.abbotsford.ca/site4.aspx	http://en.wikipedia.org/wiki/Abbotsford,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.883328	2009-04-14 22:38:13.809661	Abbotsford
23	Anmore	Anmore	Municipal	Canada	B.C.	Anmore	http://www.anmore.com/	http://en.wikipedia.org/wiki/Anmore	GVRD, Metro Vancouver	2009-04-11 22:52:28.919529	2009-04-14 22:38:30.579094	Anmore
24	Belcarra	Belcarra	Municipal	Canada	B.C.	Belcarra	http://www.belcarra.ca/	http://en.wikipedia.org/wiki/Belcarra,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.922082	2009-04-14 22:38:47.306129	Belcarra
25	Bowen Island	Bowen Island	Municipal	Canada	B.C.	Bowen Island	http://www.bowenisland.com/	http://en.wikipedia.org/wiki/Bowen_island	GVRD, Metro Vancouver	2009-04-11 22:52:28.924434	2009-04-14 22:39:06.244046	Bowen Island
26	Burnaby	Burnaby	Municipal	Canada	B.C.	Burnaby	http://www.city.burnaby.bc.ca/Home.html	http://en.wikipedia.org/wiki/Burnaby	GVRD, Metro Vancouver	2009-04-11 22:52:28.926755	2009-04-14 22:39:46.461018	Burnaby
27	Chilliwack	Chilliwack	Municipal	Canada	B.C.	Chilliwack	http://www.gov.chilliwack.bc.ca/main/	http://en.wikipedia.org/wiki/Chilliwack,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.929069	2009-04-14 22:40:06.000641	Chilliwack
28	Coquitlam	Coquitlam	Municipal	Canada	B.C.	Coquitlam	http://www.coquitlam.ca/default.htm	http://en.wikipedia.org/wiki/Coquitlam	GVRD, Metro Vancouver	2009-04-11 22:52:28.931399	2009-04-14 22:40:24.046413	Coquitlam
55	White Rock	White Rock	Municipal	Canada	B.C.	White Rock	http://www.city.whiterock.bc.ca/	http://en.wikipedia.org/wiki/White_Rock,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29.057011	2009-04-14 22:40:41.422626	White Rock
56	British Columbia Automobile Association	BC Auto Association	Nonprofit	Canada	B.C.	Burnaby	http://www.bcaa.com	None as of January 2009		2009-04-11 22:52:29.059803	2009-04-14 22:41:32.50837	B.C.
57	British Columbia Medical Association	BC Medical Ass'n	Nonprofit	Canada	B.C.	Vancouver	http://www.bcma.org/	None as of January 2009		2009-04-11 22:52:29.062389	2009-04-14 22:42:39.058459	B.C.
58	Canadian Automobile Association	Canadian Auto Ass'n	Nonprofit	Canada	Ontario	Ottawa	http://www.caa.ca/	http://en.wikipedia.org/wiki/Canadian_Automobile_Association		2009-04-11 22:52:29.064841	2009-04-14 22:45:17.269499	Canada
62	Coal Harbour Residents Association	Coal Harbour Res.	Nonprofit	Canada	B.C.	Vancouver	http://www.ch-ra.ca/	http://en.wikipedia.org/wiki/Coal_Harbour		2009-04-11 22:52:29.074609	2009-04-14 22:46:01.156383	Vancouver
63	Downtown Eastside Residents’ Association	Dntn Eastside Res.	Nonprofit	Canada	B.C.	Vancouver	http://www.dera.bc.ca/	http://en.wikipedia.org/wiki/Downtown_Eastside_Residents_Association		2009-04-11 22:52:29.077159	2009-04-14 22:46:30.743106	Vancouver
96	University of Victoria Students’ Society	UVic Students' Soc.	Student	Canada	B.C.	Victoria	http://www.uvss.uvic.ca/	None as of January 2009		2009-04-11 22:52:30.072951	2009-04-14 22:48:10.31733	Victoria
98	Greenpeace	Greenpeace	Nonprofit	Netherlands		Amsterdam	http://www.greenpeace.org	http://en.wikipedia.org/wiki/Greenpeace	28 autonomous branches	2009-04-11 22:52:30.077898	2009-04-14 22:53:54.836364	International
99	International Corporate Governance Network	ICGN	Nonprofit	United Kingdom	London	London	http://www.icgn.org/	None as of January 2009		2009-04-11 22:52:30.08033	2009-04-14 22:54:47.25649	International
100	Red Cross & Red Crescent Societies (Int'l Fed'n)	Red Cross/Crescent	Nonprofit	Switzerland		Geneva	http://www.ifrc.org/	http://en.wikipedia.org/wiki/International_Federation_of_Red_Cross_and_Red_Crescent_Societies	International Federation of Red Cross and Red Crescent Societies	2009-04-11 22:52:30.082937	2009-04-14 22:56:07.448405	International
101	Servas International	Servas International	Nonprofit	Switzerland			http://joomla.servas.org/	http://en.wikipedia.org/wiki/Servas_Open_Doors	open doors	2009-04-11 22:52:30.085933	2009-04-14 23:00:48.248942	International
103	Transparency International	Transparency Int'l	Nonprofit	Germany	Berlin	Berlin	http://www.transparency.org/	http://en.wikipedia.org/wiki/Transparency_International		2009-04-11 22:52:30.091261	2009-04-14 23:04:49.192887	International
104	VoterMedia.org	VoterMedia.org	Nonprofit	Canada	B.C.	Vancouver	http://votermedia.org	None as of January 2009		2009-04-11 22:52:30.093859	2009-04-14 23:05:22.417045	International
106	UK Shareholders' Association	UK Shareholders Assn	Nonprofit	United Kingdom		Chislehurst	http://www.uksa.org.uk/index.htm			2009-04-11 22:52:30.099063	2009-04-14 23:09:08.260176	United Kingdom
107	Harvard/MIT Cooperative Society	Harvard/MIT Coop	Co-op	USA	Massachusetts	Cambridge	http://www.thecoop.com/	http://en.wikipedia.org/wiki/Harvard/MIT_Cooperative_Society		2009-04-11 22:52:30.101564	2009-04-14 23:11:29.33928	Cambridge, Boston
108	Recreational Equipment Inc.	REI	Co-op	USA	Washington	Seattle	http://www.rei.com/	http://en.wikipedia.org/wiki/REI		2009-04-11 22:52:30.104278	2009-04-14 23:12:04.821559	USA
97	Conference Board	Conference Board	Nonprofit	USA	New York	New York	http://www.conference-board.org/	http://en.wikipedia.org/wiki/Conference_Board		2009-04-11 22:52:30.075448	2009-04-14 23:12:39.570076	International
159	Consumers Union	Consumers Union	Nonprofit	USA	New York	Yonkers	http://www.consumersunion.org/	http://en.wikipedia.org/wiki/Consumers_Union		2009-04-11 22:52:30.534643	2009-04-14 23:13:01.141748	USA, Canada
102	Toastmasters International	Toastmasters	Nonprofit	USA	California	Rancho Santa Margarita	http://www.toastmasters.org/	http://en.wikipedia.org/wiki/Toastmasters_International		2009-04-11 22:52:30.088523	2009-04-14 23:13:17.017123	International
105	Wikimedia Foundation	Wikimedia Foundation	Nonprofit	USA	California	San Francisco	http://wikimediafoundation.org/wiki/Home	http://en.wikipedia.org/wiki/Wikimedia		2009-04-11 22:52:30.096345	2009-04-14 23:13:35.318779	International
111	United States of America	USA	Country	USA	DC	Washington	http://www.usa.gov/	http://en.wikipedia.org/wiki/Usa		2009-04-11 22:52:30.112439	2009-04-14 23:14:13.397455	USA
112	American Century Investments	American Century	Investor	USA	Missouri	Kansas City	https://www.americancentury.com/	http://en.wikipedia.org/wiki/American_Century_Investments		2009-04-11 22:52:30.114987	2009-04-14 23:15:43.353126	USA
154	American Association of Individual Investors	AAII	Nonprofit	USA	Illinois	Chicago	http://www.aaii.com/	http://en.wikipedia.org/wiki/AAII		2009-04-11 22:52:30.522338	2009-04-14 23:17:18.801567	USA
166	Democratic Party (USA)	Democratic Party	Political	USA	DC	Washington	http://www.democrats.org/	http://en.wikipedia.org/wiki/Democratic_Party_(United_States)		2009-04-11 22:52:30.586837	2009-04-14 23:19:00.662519	USA
170	Republican Party (USA)	GOP	Political	USA	DC	Washington	http://www.gop.com/	http://en.wikipedia.org/wiki/Republican_Party_(United_States)		2009-04-11 22:52:30.635452	2009-04-14 23:19:56.069831	USA
171	California	California	State	USA	California	Sacramento	http://www.ca.gov/	http://en.wikipedia.org/wiki/Massachusetts		2009-04-11 22:52:30.645339	2009-04-14 23:20:32.830849	California
173	Washington State	Washington	State	USA	Washington	Olympia	http://access.wa.gov/	http://en.wikipedia.org/wiki/Washington		2009-04-11 22:52:30.653493	2009-04-14 23:22:05.443329	Washington State
174	Associated Students of Stanford University	Stanford Students	Student	USA	California	Stanford	http://assu.stanford.edu/home/	None as of January 2009		2009-04-11 22:52:30.686249	2009-04-14 23:24:46.057036	Stanford
176	Associated Students of University of Washington	Assoc Students of UW	Student	USA	Washington	Seattle	http://www.asuw.org/	http://en.wikipedia.org/wiki/Associated_Students_of_the_University_of_Washington	Associated Students of the University of Washington	2009-04-11 22:52:30.691301	2009-04-14 23:25:19.704656	Seattle
175	Associated Students of U. of California, Berkeley	Assoc Students of UC	Student	USA	California	Berkeley	http://www.asuc.org/	http://en.wikipedia.org/wiki/Associated_Students_of_the_University_of_California	Associated Students of the University of California, Berkeley	2009-04-11 22:52:30.688866	2009-04-14 23:25:48.065095	Berkeley
177	Associated Students of Western Washington Univ.	Assoc. Students WWU	Student	USA	Washington	Bellingham	http://www.as.wwu.edu/	None as of January 2009	Associated Students of Western Washington University	2009-04-11 22:52:30.693735	2009-04-14 23:26:09.407288	Bellingham
178	Harvard Undergraduate Council	Harvard Undergrads	Student	USA	Massachusetts	Cambridge	http://www.uc.fas.harvard.edu/	None as of January 2009		2009-04-11 22:52:30.696612	2009-04-14 23:26:45.688674	Cambridge, Boston
179	MIT Undergraduate Association	MIT Undergrad Ass'n	Student	USA	Massachusetts	Cambridge	http://ua.mit.edu/	None as of January 2009	Massachusetts Institute of Technology Undergraduate Association	2009-04-11 22:52:30.699403	2009-04-14 23:27:06.577704	Cambridge
180	United States Student Association	US Student Ass'n	Student	USA	DC	Washington	http://www.usstudents.org/	http://en.wikipedia.org/wiki/United_States_Student_Association		2009-04-11 22:52:30.702023	2009-04-14 23:27:55.502411	USA
29	Delta	Delta	Municipal	Canada	B.C.	Delta	http://www.delta.com/	http://en.wikipedia.org/wiki/Delta,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.933838	2009-04-17 21:57:29.732036	Delta
30	Gibsons	Gibsons	Municipal	Canada	B.C.	Gibsons	http://www.gibsons.ca/	http://en.wikipedia.org/wiki/Gibsons,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.936198	2009-04-17 22:01:01.37751	Gibsons
181	British Columbia School Trustees' Association	B.C. School Trustees	Nonprofit	Canada	B.C.	Vancouver	http://www.bcsta.org	None as of April 2009		2009-04-19 05:38:47.495456	2009-04-19 05:41:26.674009	B.C.
182	Cyberphyber Media	Cyber	Other	Canada	BC	Vancouver	www.cyberphyber.com		webdesign technical writing video production 	2009-04-20 00:00:00	2009-04-20 06:52:33.91475	Vancouver BC Canada
109	Microsoft	Microsoft	Corporation	USA	Washington	Redmond	http://www.microsoft.com	http://en.wikipedia.org/wiki/Microsoft	NASDAQ; MSFT	2009-04-11 22:52:30.106784	2009-04-25 23:59:05.930728	International
82	University of British Columbia Alma Mater Society	UBC AMS	Student	Canada	B.C.	Vancouver	http://www.amsubc.ca/	http://en.wikipedia.org/wiki/Alma_Mater_Society_of_the_University_of_British_Columbia	Alma Mater Society of the University of British Columbia	2009-04-11 22:52:30.006212	2009-04-26 16:22:07.940547	Vancouver
31	Harrison Hot Springs	Harrison Hot Springs	Municipal	Canada	B.C.	Harrison Hot Springs	http://www.harrisonhotsprings.ca/	http://en.wikipedia.org/wiki/Harrison_Hot_Springs	GVRD, Metro Vancouver	2009-04-11 22:52:28.938574	2009-04-26 17:31:38.892451	Harrison Hot Springs
51	Vancouver	Vancouver	Municipal	Canada	B.C.	Vancouver	http://www.vancouver.ca/	http://en.wikipedia.org/wiki/Vancouver	GVRD, Metro Vancouver	2009-04-11 22:52:29.046943	2009-04-27 01:36:06.378781	Vancouver
81	British Columbia	British Columbia	Province	Canada	B.C.	Victoria	http://www.gov.bc.ca/	http://en.wikipedia.org/wiki/British_Columbia		2009-04-11 22:52:29.963613	2009-04-27 03:46:56.577419	B.C.
183	Google	Google	Corporation	USA	California	Mountain View	http://www.google.com/corporate	http://en.wikipedia.org/wiki/Google		2009-04-27 05:25:53.78648	2009-04-27 05:25:53.78648	International
35	Langley (District Municipality)	Langley (District)	Municipal	Canada	B.C.	Langley (District)	http://www.tol.bc.ca/	http://en.wikipedia.org/wiki/Langley,_British_Columbia_(district_municipality)	Langley District Municipality (also called Langley Township) is not to be confused with the smaller "<a href="./34">City of Langley</a>".  GVRD, Metro Vancouver	2009-04-11 22:52:28.978159	2009-04-27 16:38:28.517528	Langley (District)
34	Langley (City)	Langley (City)	Municipal	Canada	B.C.	Langley (City)	http://www.city.langley.bc.ca/	http://en.wikipedia.org/wiki/Langley,_British_Columbia_(city)	The City of Langley is not to be confused with the larger "<a href="./35">Township of Langley</a>" (also called "Langley District Municipality"). GVRD, Metro Vancouver.	2009-04-11 22:52:28.975541	2009-04-27 16:39:10.421462	Langley (City)
42	North Vancouver (District Municipality)	North Van (District)	Municipal	Canada	B.C.	North Vancouver (District)	http://www.district.north-van.bc.ca/	http://en.wikipedia.org/wiki/North_Vancouver,_British_Columbia_(district_municipality)	The City of North Vancouver is distinct from the adjacent <a href="./41">District of North Vancouver</a>. GVRD, Metro Vancouver.	2009-04-11 22:52:28.994659	2009-04-27 17:01:10.012916	North Vancouver (District)
41	North Vancouver (City)	North Van (City)	Municipal	Canada	B.C.	North Vancouver (City)	http://www.cnv.org/	http://en.wikipedia.org/wiki/North_Vancouver,_British_Columbia_(city)	The City of North Vancouver is distinct from the adjacent <a href="./42">District of North Vancouver</a>. GVRD, Metro Vancouver.	2009-04-11 22:52:28.992266	2009-04-27 17:01:39.762516	North Vancouver (City)
184	Claremont	Claremont	Municipal	USA	California	Claremont	http://www.ci.claremont.ca.us/	http://en.wikipedia.org/wiki/Claremont,_California		2009-04-27 18:58:20.199139	2009-04-27 18:58:59.137851	Claremont
185	Upland	Upland	Municipal	USA	California	Upland	http://www.ci.upland.ca.us/	http://en.wikipedia.org/wiki/Upland,_California		2009-04-27 19:05:42.941165	2009-04-27 19:05:42.941165	Upland
186	Monrovia	Monrovia	Municipal	USA	California	Monrovia	http://www.ci.monrovia.ca.us/	http://en.wikipedia.org/wiki/Monrovia,_California		2009-04-27 19:13:36.786708	2009-04-27 19:13:36.786708	Monrovia
187	Los Angeles	Los Angeles	Municipal	USA	California	Los Angeles	http://www.lacity.org/	http://en.wikipedia.org/wiki/Los_angeles		2009-04-27 19:17:47.746	2009-04-27 19:17:47.746	Los Angeles
3	Canadian Broadcasting Corporation	CBC	Corporation	Canada	Ontario	Ottawa	http://www.cbc.radio-canada.ca/	http://en.wikipedia.org/wiki/Canadian_Broadcasting_Corporation	CBC is a crown corporation, not a publicly traded corporation. So its voter community is all citizens of Canada.	2009-04-11 22:52:28.776363	2009-04-27 19:36:09.392158	Canada
188	Nanaimo	Nanaimo	Municipal	Canada	B.C.	Nanaimo	http://www.nanaimo.ca/	http://en.wikipedia.org/wiki/Nanaimo	Vancouver Island	2009-04-27 21:45:07.563685	2009-04-27 21:48:31.763897	Nanaimo
189	London	London	Municipal	Canada	Ontario	London	http://www.london.ca/	http://en.wikipedia.org/wiki/London,_Ontario		2009-04-27 22:37:47.313488	2009-04-27 22:39:09.128676	London
190	Knoxville	Knoxville	Municipal	USA	Tennessee	Knoxville	http://www.cityofknoxville.org/	http://en.wikipedia.org/wiki/Knoxville		2009-04-27 22:46:06.951347	2009-04-27 22:51:26.801025	Knoxville
191	Chattanooga	Chattanooga	Municipal	USA	Tennessee	Chattanooga	http://www.chattanooga.gov/	http://en.wikipedia.org/wiki/Chattanooga		2009-04-27 22:55:44.777298	2009-04-27 22:57:02.75595	Chattanooga
192	Tennessee	Tennessee	State	USA	Tennessee	Nashville	http://www.tennessee.gov/	http://en.wikipedia.org/wiki/Tennessee		2009-04-27 22:58:42.867428	2009-04-27 22:58:42.867428	Tennessee
193	Nashville	Nashville	Municipal	USA	Tennessee	Nashville				2009-04-27 23:19:05.107022	2009-04-27 23:19:05.107022	Nashville
194	Ontario Teachers' Federation	Ontario Teachers	Labour	Canada	Ontario	Toronto	http://www.otffeo.on.ca/	http://en.wikipedia.org/wiki/Ontario_Teachers%27_Federation	OTF-FEO. Fédération des enseignantes et des enseignants de l'Ontario.	2009-05-02 17:09:22.009663	2009-05-02 18:27:53.99997	Ontario
195	Ontario Teachers' Pension Plan	OTPP	Investor	Canada	Ontario	Toronto	http://www.otpp.com/	http://en.wikipedia.org/wiki/Ontario_Teachers%27_Pension_Plan		2009-05-02 18:31:28.837986	2009-05-02 18:32:09.625099	Ontario
196	British Columbia Investment Management Corporation	BCIMC	Investor	Canada	B.C.	Victoria	http://www.bcimc.com/	None as of 2009-05-02		2009-05-02 18:34:41.490623	2009-05-02 18:37:04.762008	B.C.
197	Ontario	Ontario	Province	Canada	Ontario	Toronto	http://www.ontario.ca/	http://en.wikipedia.org/wiki/Ontario		2009-05-02 19:42:26.505419	2009-05-02 19:44:03.396687	Ontario
198	Toronto	Toronto	Municipal	Canada	Ontario	Toronto	http://www.toronto.ca/	http://en.wikipedia.org/wiki/Toronto		2009-05-02 19:45:07.204811	2009-05-02 19:45:48.247626	Toronto
199	Ottawa	Ottawa	Municipal	Canada	Ontario	Ottawa	http://www.ottawa.ca/	http://en.wikipedia.org/wiki/Ottawa		2009-05-02 19:47:02.80887	2009-05-02 19:47:48.818344	Ottawa
200	Alberta	Alberta	Province	Canada	Alberta	Edmonton	http://alberta.ca/	http://en.wikipedia.org/wiki/Alberta		2009-05-02 19:50:02.498541	2009-05-02 19:50:50.775505	Alberta
201	Edmonton	Edmonton	Municipal	Canada	Alberta	Edmonton	http://www.edmonton.ca/	http://en.wikipedia.org/wiki/Edmonton		2009-05-02 19:52:42.760044	2009-05-02 19:53:24.251954	Edmonton
202	Calgary	Calgary	Municipal	Canada	Alberta	Calgary	http://www.calgary.ca/	http://en.wikipedia.org/wiki/Calgary		2009-05-02 19:55:13.45492	2009-05-02 19:55:59.54196	Calgary
203	San Francisco	San Francisco	Municipal	USA	California	San Francisco	http://www.sfgov.org/	http://en.wikipedia.org/wiki/San_francisco		2009-05-02 19:57:14.627282	2009-05-02 19:58:27.878016	San Francisco
6	Coast Capital Savings	Coast Capital	Credit&nbsp;Union	Canada	B.C.	Surrey	https://www.coastcapitalsavings.com/	http://en.wikipedia.org/wiki/Coast_Capital_Savings		2009-04-11 22:52:28.783539	2009-05-04 06:24:53.158216	B.C.
7	North Shore Credit Union	North Shore CU	Credit&nbsp;Union	Canada	B.C.	North Vancouver	https://www.nscu.com/	http://en.wikipedia.org/wiki/North_Shore_Credit_Union		2009-04-11 22:52:28.785897	2009-05-04 06:27:22.856726	B.C.
8	Vancouver City Savings Credit Union	Vancity	Credit&nbsp;Union	Canada	B.C.	Vancouver	https://www.vancity.com/	http://en.wikipedia.org/wiki/Vancity		2009-04-11 22:52:28.788238	2009-05-04 06:27:45.927362	B.C.
9	Westminster Savings Credit Union	Westminster Savings	Credit&nbsp;Union	Canada	B.C.	New Westminster	https://www.wscu.com	None as of January 2009		2009-04-11 22:52:28.790541	2009-05-04 06:28:07.877946	B.C.
48	Sechelt	Sechelt	Municipal	Canada	B.C.	Sechelt	http://www.district.sechelt.bc.ca/	http://en.wikipedia.org/wiki/Sechelt	GVRD, Metro Vancouver	2009-04-11 22:52:29.039923	2009-05-06 00:21:40.462841	Sechelt
157	American Medical Association	AMA	Nonprofit	USA			http://www.ama-assn.org/	http://en.wikipedia.org/wiki/American_Medical_Association		2009-04-11 22:52:30.52971	2009-05-06 00:23:13.068775	USA
\.


--
-- Data for Name: faqs; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY faqs (id, category, "sequence", importance, question, answer, created_at, updated_at) FROM stdin;
14	Reasoning	7.4000000000000004	7	Wouldn’t some media award contestants be biased, corrupted by bribery or other influence?	Yes, there are likely to be such biases, just as there are in our current news media. But voter funding will add a new incentive for media to build reputations for serving the public interest, so we can expect them to produce better information.	2009-05-02 02:29:10.848869	2009-05-02 05:09:12.304152
21	Mechanics	3.2999999999999998	7	How are the communities in VoterMedia chosen? What sort of communities should I add?	VoterMedia.org website users and administrators choose what communities to add to the system. We recommend adding communities with over 1,000 voters and annual budgets over US$200,000. That gives enough scale to make a voted ranking of competing websites/blogs a worthwhile benefit to the community.	2009-05-02 03:23:48.451379	2009-05-02 05:07:19.085697
22	Mechanics	3.3999999999999999	7	How are the listed websites/blogs chosen? What sort of websites/blogs should I add?	VoterMedia.org website users and administrators decide which websites/blogs to add to a community's list. You should add websites that you think provide a service to that voter community. These can be blogs, or websites for other media like newspapers, radio, TV.\r\n\r\nBut it need not be limited to media. You could add websites/blogs from organizations that provide other community benefits that voters may want to support, including charities, events or whatever.	2009-05-02 03:29:21.41655	2009-05-02 05:07:44.618566
8	Organization	1.3999999999999999	7	How do you make money? How do you plan to make money?	Our goal is saving the world, not making money. However, money can help get things done, so we invite donations from individuals, foundations, and the communities served by VoterMedia.org. So far the main donor to this project has been Mark Latham.\r\n\r\nIn the long run, we expect most donations to come from the communities we serve. Most of those funds will flow through as awards to the websites/blogs serving those communities, ranked by voters. Donors will be able to designate which community's website ranking the funds will flow to, and whether to donate for the expenses of VoterMedia.org.	2009-05-02 02:21:38.064092	2009-05-02 05:08:19.763134
20	Reasoning	7.2999999999999998	7	How does this website help achieve the goals of the VoterMedia project?	This website builds support, exposure and reputation of websites/blogs that many voters consider beneficial. They may also receive financial support, when we get donations.\r\n\r\nThese different kinds of support encourage websites/blogs to help voter communities. We think an important type of community benefit they will provide is a check and balance on the power of elected leaders, increasing accountability and thus improving the leaders' policies, decisions and administration.	2009-05-02 03:20:48.255361	2009-05-02 05:08:54.244
19	Voting	5.5999999999999996	6	What benefit do top-ranked websites get?	As of 2009-05-01 there are no cash awards yet, though we hope this will change soon. But for now, higher ranked websites/blogs get bragging rights and exposure, presumably bringing more readers and more credibility.	2009-05-02 03:15:44.19245	2009-05-02 05:10:55.22098
18	Voting	5.5	7	By what criteria should I judge the websites when I vote? What do you mean by "Which websites/blogs deserve more support from the ... voter community?"	You can vote based on any criteria you want. The impact of your vote is to push websites you support upward in the ranking. That means more people will probably read them. And if there are cash awards for higher-ranked blogs (which there were not as of 2009-05-01), then your supported websites might get more funding. So presumably you should vote for websites that you think benefit you more than those currently ranked above them. You might also want to consider whether some websites/blogs are already receiving voter community funds (support) through other channels.\r\n\r\nVoterMedia.org is designed to direct funding to websites/blogs that benefit the voter community. Those that are seen as beneficial by the most voters would thus be ranked higher.	2009-05-02 03:06:45.964231	2009-05-02 20:25:22.158867
15	Reasoning	7.7000000000000002	5	How do we know whether voter-funded media will actually be beneficial?	No one knows for sure. There have only been a few trials so far; see an assessment in <a href="http://votermedia.blogspot.com/2009/02/ubc-ams-vfm-voting-results.html">this blog post</a>. The arguments in the paper "<a href="http://votermedia.org/publications/GlobalVoterMediaPlatform.pdf">Global Voter Media Platform</a>" are plausible, but the only way to find out is to try it. If voter funding for media is beneficial, we can apply it throughout democratic politics as well as for shareowner voting in corporations. So the potential benefits are huge compared to the cost of trying it out.	2009-05-02 02:29:44.589277	2009-05-02 20:27:37.146961
13	Reasoning	7.5	7	Why would voter-supported news media be any different from the news media we have now?	Voting is a community service. Information to help people vote better is a public good. So it is not surprising that commercial markets do not supply enough of this public good, especially in terms of its quality. Commercial markets supply goods with personal benefits that people will pay for individually.\r\n\r\nMany experts and other citizens agree that we need to improve our public-interest media (see for example <a href="http://freepress.net">freepress.net</a>). The usual way to pay for public goods is with public funds. Normally public funds are controlled by politicians, but for political information that would be a conflict of interest, so voters should control that funding directly.\r\n\r\nThe incentives that determine which media you pay for individually are different from the incentives for voting public funds. It makes sense to pay for your own entertainment, but when you are influencing the media going to all citizens, it is not in your interest to vote for entertainment for everyone, since most of that wouldn’t benefit you. However, information that helps everyone vote more intelligently does benefit you. It is a public good that lacks the private benefit of entertainment. It is rational to be unwilling to pay as an individual for a public good, but to be willing to vote for everyone to pay for it. So the same citizens who buy <i>People</i> magazine at the checkout stand will vote public funds for serious investigative reporting.	2009-05-02 02:28:26.315419	2009-05-02 20:31:52.162036
1	Organization	1.1000000000000001	8	What the heck is VoterMedia.org? What's it for? Who is behind this? Why are you doing this? What are your goals? Who is funding it? Who is working on it?	Uh... relax, OK? VoterMedia.org is a public interest project for improving the policies of the world's organizations (governments, corporations, unions, nonprofits etc.) by developing better voter information systems. We are implementing voter funded media as explained in the paper Global Voter Media Platform and our other publications.\r\nThis website is built by a group of volunteers, led by <a href="/about_contact">Mark Latham</a>. We plan to create a nonprofit organization to manage the project, with a board of directors elected by the website's users. We are already practising what we preach, by <a href="/communities/104">inviting websites/blogs to critique VoterMedia.org</a>.\r\nThere's a lot more info on <a href="http://votermedia.org">our old website</a>, which we are gradually copying here to build our next release.	2009-05-02 02:11:00.123558	2009-05-02 20:36:02.763214
12	Voting	5.2999999999999998	7	How often should/can I vote?	You can vote as often as you like. We count your latest vote for each website/blog. We suggest voting about once a week.	2009-05-02 02:26:39.965393	2009-05-02 21:11:28.008472
11	Voting	5.2000000000000002	8	How many websites/blogs should/can I vote for?	You can vote for as many websites/blogs as you like. Voting for more websites/blogs does not decrease the weight of each of your votes.\r\n\r\nOf course, it makes the most sense to vote for websites/blogs that you know something about. We suggest voting for those that you think should be ranked higher than they are now.	2009-05-02 02:25:15.952006	2009-05-02 21:13:21.628968
17	Voting	5.3499999999999996	5	How often do you count the votes?	As of 2009-05-01, we were tallying every vote in real time, updating the ranking in response. (We may adjust this at any time though, and might not update this answer right away.)	2009-05-02 03:03:08.771944	2009-05-02 21:13:38.079917
10	Mechanics	3.2000000000000002	5	Can I use the VoterMedia.org website without a login? What difference does it make whether I have a login here or not?	Yes, you can use the site without a login. Most functions are available without logging in, including browsing the rankings, voting, adding communities and adding websites.\r\n\r\nWe will gradually be adding more functions, and some of them will need you to log in, e.g. to customize your user interface in various ways.\r\n\r\nAs you become comfortable with using the site, we invite you to create a login and participate more fully in the VoterMedia.org community. We plan to elect a board of directors to oversee the website, and our voting members will be active users with logins.	2009-05-02 02:22:50.554336	2009-05-02 22:10:59.830844
16	Voting	5.4000000000000004	7	How are votes tallied?	We sometimes adjust our tallying method. Here's a description as of 2009-05-01, but it may have been adjusted since then:\r\n\r\nWe count your latest vote for each website/blog, subject to "vote decay through time", which means that votes are weighted according to how old they are. Zero through 10 days old gets 100% weight. After 10 days, a vote's weight diminishes by 2% per day, so that its weight falls to zero when it's 60 days old.\r\n\r\nSo if you vote about once a week (as we suggest), your latest vote will always have 100% weight.	2009-05-02 02:58:51.371802	2009-05-03 20:56:42.849505
9	Reasoning	7.2000000000000002	7	Why should I care about VoterMedia? Why should I use the VoterMedia website? How should I use the VoterMedia website?	VoterMedia.org is designed to benefit you by improving accountability of elected leaders. But we need your help to make that happen. Please add relevant blogs and communities to our system, check out some websites/blogs that serve your communities, and vote for those you think deserve higher rankings. Encourage your communities to fund their top-ranked websites/blogs.	2009-05-02 02:22:19.799531	2009-05-04 06:07:06.026648
23	Voting	5.4500000000000002	7	Do I have to be a member of that particular community to vote on its website/blog ranking?	No. You can vote in any community you care about. Later, we plan to also develop rankings based on votes from community members only, and let users see both rankings. Creating a member-votes-only ranking will require some coordination with the community's administration.	2009-05-04 19:43:24.132957	2009-05-06 00:28:35.414625
\.


--
-- Data for Name: pubs; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY pubs (id, date_sequence, date_text, title, country, journal, created_at, updated_at) FROM stdin;
1	2009-02-12	February 2009	<a href="/publications/GlobalVoterMediaPlatform.pdf">Global Voter Media Platform</a>	Canada	[working paper]	2009-05-03 03:41:25.919416	2009-05-03 03:43:36.241175
3	1988-06-07	June 1988	<a href="/publications/VFMidea19880607.pdf">First voter-funded media idea</a>	USA	[letter]	2009-05-03 04:18:10.585402	2009-05-03 04:18:10.585402
2	2007-04-13	April 2007	<a href="/publications/VoterFundedMedia.pdf">Voter-Funded Media: Governance Reform for Democracies and Corporations</a>	Canada	[working paper]	2009-05-03 04:00:14.109741	2009-05-03 04:20:16.95101
4	2007-01-01	January 2007	<a href="/publications/ProxyVotingBrandCompetition.pdf">Proxy Voting Brand Competition</a>	USA	<a href="http://www.joim.com/">Journal of Investment Management</a>	2009-05-03 05:04:16.650616	2009-05-03 05:05:00.544369
5	2006-11-15	November 2006	<a href="/publications/HowUBCCanChangeTheWorld.pdf">How UBC Can Change the World</a>	Canada	[press release]	2009-05-03 05:09:41.278637	2009-05-03 05:09:41.278637
6	2003-04-15	April 2003	<a href="/publications/DemocracyAndInfomediaries.pdf">Democracy and Infomediaries</a>	UK	<a href="http://www.blackwellpublishing.com/journal.asp?ref=0964-8410&site=1">Corporate Governance: An International Review</a>	2009-05-03 05:13:44.314156	2009-05-03 05:13:44.314156
7	1999-01-01	January 1999	<a href="/publications/CorporateMonitoringFirm.pdf">The Corporate Monitoring Firm</a>	UK	<a href="http://www.blackwellpublishing.com/journal.asp?ref=0964-8410&site=1">Corporate Governance: An International Review</a>	2009-05-03 05:21:05.020991	2009-05-03 05:21:05.020991
8	1998-09-30	Sept/Oct 1998	<a href="/publications/CorporateMonitoringNewShareholderPowerTool.pdf">Corporate Monitoring: New Shareholder Power Tool</a>	USA	<a href="http://www.cfapubs.org/loi/faj">Financial Analysts Journal</a>	2009-05-03 05:22:34.131199	2009-05-03 05:23:16.600557
9	1993-07-15	July 1993	<a href="/publications/ManagementAuditingFirm.pdf">The Management Auditing Firm</a>	USA	[working paper]	2009-05-03 05:25:23.434478	2009-05-03 05:25:23.434478
10	1997-09-30	Sept/Oct 1997	<a href="/publications/ProposedGovernanceMonitor.pdf">Proposed: A Governance "Monitor"</a>	USA	<a href="http://www.corporateboard.com/">The Corporate Board</a>	2009-05-03 05:27:37.461462	2009-05-03 05:27:37.461462
11	1998-09-26	Sept 1998	<a href="/publications/HowToTransformAFailedJapaneseBank.pdf">How To Transform a Failed Japanese Bank</a>	USA	[working paper]	2009-05-03 05:29:31.368004	2009-05-03 05:30:35.32268
13	2005-05-21	May 2005	<a href="/publications/VoteYourStock.pdf">Vote Your Stock</a> <span style="font-weight: normal">[superseded by <a href="/publications/ProxyVotingBrandCompetition.pdf">Proxy Voting Brand Competition</a>]</span>	Canada	[working paper]	2009-05-03 22:43:41.583743	2009-05-03 22:47:20.393321
14	2004-06-12	June 2004	<a href="http://www.citizensassembly.bc.ca/resources/submissions/csharman-10_0406151124-834.pdf">Presentation favouring STV over MMP</a>	Canada	<a href="http://www.citizensassembly.bc.ca/">British Columbia Citizens' Assembly on Electoral Reform</a>	2009-05-03 22:49:51.037782	2009-05-03 22:53:54.700573
15	2000-06-15	June 2000	<a href="/publications/InternetWillDriveCorporateMonitoring.pdf">The Internet Will Drive Corporate Monitoring</a>	China (Hong&nbsp;Kong)	<a href="http://www.hkics.org.hk/index.php?_room=10&searchDone=1&_action=detail&_page=39">Corporate Governance International</a>	2009-05-03 22:58:27.474599	2009-05-05 21:40:11.341913
12	1999-09-15	Sept 1999	<a href="/publications/CollectiveAction.pdf">Collective Action for Dispersed Shareowners</a>	China (Hong&nbsp;Kong)	<a href="http://www.hkics.org.hk/index.php?_room=10&searchDone=1&_action=detail&_page=39">Corporate Governance International</a>	2009-05-03 05:36:45.238489	2009-05-05 21:40:31.166249
\.


--
-- Data for Name: rankings; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY rankings (id, community_id, website_id, rank, created_at, updated_at) FROM stdin;
4	81	7	2	2009-04-26 03:31:26.670711	2009-04-26 03:33:39.239403
6	81	9	0	2009-04-26 03:34:10.258173	2009-04-25 20:45:48.32263
2	51	5	1	2009-04-26 03:28:14.985658	2009-04-26 03:51:32.740477
7	51	10	0	2009-04-26 04:01:50.324939	2009-04-26 04:01:50.324939
9	51	12	0	2009-04-26 04:04:59.405157	2009-04-26 04:04:59.405157
11	51	14	0	2009-04-26 04:05:45.166779	2009-04-26 04:05:45.166779
12	51	15	0	2009-04-26 04:06:04.264213	2009-04-26 04:06:04.264213
3	51	6	1	2009-04-26 03:28:49.235068	2009-04-26 04:06:40.197502
15	51	18	0	2009-04-26 04:10:22.820453	2009-04-26 04:10:22.820453
16	51	19	0	2009-04-26 04:13:11.929084	2009-04-26 04:13:11.929084
17	81	20	0	2009-04-26 04:13:44.980972	2009-04-26 04:13:44.980972
25	47	28	0	2009-04-26 04:24:57.647541	2009-04-26 04:24:57.647541
26	50	29	0	2009-04-26 04:25:39.695932	2009-04-26 04:25:39.695932
29	82	32	0	2009-04-26 04:29:55.442211	2009-04-26 04:29:55.442211
32	82	35	0	2009-04-26 04:30:53.399567	2009-04-26 04:30:53.399567
33	82	36	0	2009-04-26 04:31:12.730541	2009-04-26 04:31:12.730541
28	82	31	1	2009-04-26 04:29:36.549209	2009-04-26 04:31:34.647266
30	82	33	1	2009-04-26 04:30:12.397586	2009-04-26 04:31:45.094693
34	82	37	0	2009-04-26 04:33:08.955204	2009-04-26 04:33:08.955204
35	81	38	0	2009-04-26 04:35:00.603925	2009-04-26 04:35:00.603925
36	84	39	0	2009-04-26 04:39:24.276154	2009-04-26 04:39:24.276154
37	85	40	0	2009-04-26 04:39:51.535455	2009-04-26 04:39:51.535455
38	14	41	1	2009-04-26 04:40:34.205842	2009-04-26 04:40:50.154602
39	181	42	1	2009-04-26 04:42:56.886046	2009-04-26 04:46:40.635983
40	3	43	1	2009-04-26 04:53:57.355461	2009-04-26 04:54:02.42596
31	82	34	1	2009-04-26 04:30:30.862622	2009-04-27 05:30:34.816801
8	51	11	1	2009-04-26 04:04:22.050182	2009-04-27 05:53:35.101378
42	35	45	1	2009-04-27 16:27:45.69945	2009-04-27 16:28:03.145666
43	35	46	0	2009-04-27 16:32:50.156501	2009-04-27 16:32:50.156501
44	34	47	1	2009-04-27 16:34:21.824588	2009-04-27 16:34:28.913515
45	42	48	0	2009-04-27 16:56:41.455953	2009-04-27 16:56:41.455953
46	41	49	0	2009-04-27 16:57:06.099788	2009-04-27 16:57:06.099788
47	54	50	1	2009-04-27 18:22:52.498443	2009-04-27 18:23:26.895104
48	184	51	1	2009-04-27 18:59:31.076605	2009-04-27 18:59:44.370751
49	185	52	0	2009-04-27 19:06:13.840957	2009-04-27 19:06:13.840957
50	186	53	1	2009-04-27 19:14:40.625855	2009-04-27 19:14:48.494546
51	171	54	1	2009-04-27 19:15:24.060417	2009-04-27 19:15:34.611098
52	187	55	1	2009-04-27 19:18:25.166866	2009-04-27 19:18:33.987585
56	3	59	0	2009-04-27 19:33:22.008086	2009-04-27 19:33:22.008086
55	3	58	1	2009-04-27 19:28:44.106692	2009-04-27 19:33:34.43369
57	188	60	0	2009-04-27 21:45:42.115482	2009-04-27 21:45:42.115482
58	188	61	0	2009-04-27 21:47:01.318818	2009-04-27 21:47:01.318818
59	3	62	1	2009-04-27 21:52:36.462633	2009-04-27 21:52:53.03447
62	111	65	1	2009-04-27 22:34:15.452204	2009-04-27 22:34:26.833115
63	189	66	1	2009-04-27 22:38:04.2886	2009-04-27 22:39:18.581882
64	190	67	1	2009-04-27 22:50:19.877971	2009-04-27 22:50:29.169953
65	191	68	1	2009-04-27 22:56:09.909669	2009-04-27 22:57:14.327736
66	192	69	2	2009-04-27 22:59:12.239764	2009-04-27 23:09:23.602092
68	190	71	1	2009-04-27 23:16:29.426343	2009-04-27 23:17:00.103382
69	193	72	1	2009-04-27 23:19:22.129989	2009-04-27 23:19:41.604318
70	81	73	0	2009-04-28 03:17:07.33159	2009-04-28 03:17:07.33159
71	104	74	0	2009-04-28 03:46:25.374014	2009-04-28 03:46:25.374014
24	5	27	1	2009-04-26 04:20:25.001683	2009-04-29 10:05:57.539067
61	51	64	1	2009-04-27 21:54:25.858281	2009-04-29 15:15:38.946013
13	51	16	1	2009-04-26 04:06:24.086496	2009-04-29 15:16:04.492577
14	51	17	2	2009-04-26 04:09:48.687333	2009-04-29 15:16:12.343931
20	81	23	2	2009-04-26 04:16:31.662783	2009-04-29 15:16:34.59051
5	81	8	2	2009-04-26 03:32:03.030836	2009-04-29 15:22:01.686121
54	3	57	1	2009-04-27 19:25:58.2686	2009-04-29 16:18:07.436448
27	82	30	1	2009-04-26 04:29:13.576852	2009-04-29 16:34:00.995228
41	109	44	1	2009-04-26 05:20:07.087537	2009-04-29 16:34:36.330299
1	109	4	1	2009-04-25 20:39:59.679721	2009-04-29 16:36:01.324613
23	5	26	2	2009-04-26 04:20:00.488142	2009-04-29 16:42:01.529955
21	81	24	2	2009-04-26 04:17:45.773059	2009-04-29 17:57:27.760896
60	5	63	1	2009-04-27 21:53:29.66462	2009-04-29 18:20:56.367502
67	191	70	1	2009-04-27 23:10:24.28752	2009-05-01 18:58:02.458847
22	81	25	1	2009-04-26 04:18:06.840899	2009-05-02 20:03:22.634292
72	111	75	1	2009-05-03 16:20:00.645521	2009-05-03 16:20:12.177001
10	51	13	1	2009-04-26 04:05:24.601069	2009-05-03 21:32:03.778407
53	3	56	1	2009-04-27 19:22:16.353083	2009-05-04 03:33:00.012511
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
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY votes (id, ip_address, community_id, website_id, support, created_at, updated_at) FROM stdin;
4	24.85.86.192	109	4	\N	2009-04-26 01:49:37.363608	2009-04-26 01:49:37.363608
5	24.85.86.192	109	4	\N	2009-04-26 01:49:57.073294	2009-04-26 01:49:57.073294
7	24.85.86.192	109	4	\N	2009-04-26 02:05:40.282635	2009-04-26 02:05:40.282635
8	24.85.86.192	81	7	\N	2009-04-26 03:31:32.96909	2009-04-26 03:31:32.96909
9	24.85.86.192	81	8	\N	2009-04-26 03:33:26.722239	2009-04-26 03:33:26.722239
10	24.85.86.192	81	7	\N	2009-04-26 03:33:36.397254	2009-04-26 03:33:36.397254
11	24.85.86.192	51	5	\N	2009-04-26 03:51:32.329199	2009-04-26 03:51:32.329199
12	24.85.86.192	51	6	\N	2009-04-26 04:06:37.624845	2009-04-26 04:06:37.624845
13	24.85.86.192	5	26	\N	2009-04-26 04:20:30.394237	2009-04-26 04:20:30.394237
14	24.85.86.192	82	30	\N	2009-04-26 04:31:21.13658	2009-04-26 04:31:21.13658
15	24.85.86.192	82	31	\N	2009-04-26 04:31:32.018142	2009-04-26 04:31:32.018142
16	24.85.86.192	82	33	\N	2009-04-26 04:31:40.188782	2009-04-26 04:31:40.188782
17	24.85.86.192	82	30	\N	2009-04-26 04:31:49.805371	2009-04-26 04:31:49.805371
18	24.85.86.192	14	41	\N	2009-04-26 04:40:50.1178	2009-04-26 04:40:50.1178
19	24.85.86.192	181	42	\N	2009-04-26 04:46:38.811455	2009-04-26 04:46:38.811455
20	24.85.86.192	3	43	\N	2009-04-26 04:54:00.460082	2009-04-26 04:54:00.460082
21	24.85.86.192	109	44	\N	2009-04-26 05:20:10.238236	2009-04-26 05:20:10.238236
22	24.85.86.192	109	44	\N	2009-04-26 05:20:17.207917	2009-04-26 05:20:17.207917
23	24.85.86.192	82	34	\N	2009-04-27 05:30:31.190657	2009-04-27 05:30:31.190657
24	24.85.86.192	51	11	\N	2009-04-27 05:53:29.88	2009-04-27 05:53:29.88
25	24.85.86.192	35	45	\N	2009-04-27 16:27:58.983806	2009-04-27 16:27:58.983806
26	24.85.86.192	34	47	\N	2009-04-27 16:34:26.989208	2009-04-27 16:34:26.989208
27	24.85.86.192	54	50	\N	2009-04-27 18:23:24.84924	2009-04-27 18:23:24.84924
28	24.85.86.192	184	51	\N	2009-04-27 18:59:42.483086	2009-04-27 18:59:42.483086
29	24.85.86.192	186	53	\N	2009-04-27 19:14:48.432294	2009-04-27 19:14:48.432294
30	24.85.86.192	171	54	\N	2009-04-27 19:15:30.298698	2009-04-27 19:15:30.298698
31	24.85.86.192	187	55	\N	2009-04-27 19:18:31.593527	2009-04-27 19:18:31.593527
32	24.85.86.192	3	58	\N	2009-04-27 19:33:31.861075	2009-04-27 19:33:31.861075
33	24.85.86.192	51	17	\N	2009-04-27 21:33:15.497857	2009-04-27 21:33:15.497857
34	24.85.86.192	3	62	\N	2009-04-27 21:52:46.090881	2009-04-27 21:52:46.090881
35	24.85.86.192	81	23	\N	2009-04-27 22:04:27.651116	2009-04-27 22:04:27.651116
36	24.85.86.192	111	65	\N	2009-04-27 22:34:24.078567	2009-04-27 22:34:24.078567
37	24.85.86.192	189	66	\N	2009-04-27 22:39:15.551751	2009-04-27 22:39:15.551751
38	24.85.86.192	190	67	\N	2009-04-27 22:50:26.46676	2009-04-27 22:50:26.46676
39	24.85.86.192	191	68	\N	2009-04-27 22:57:11.069163	2009-04-27 22:57:11.069163
40	24.85.86.192	192	69	\N	2009-04-27 22:59:18.880959	2009-04-27 22:59:18.880959
41	24.85.86.192	192	69	\N	2009-04-27 23:09:23.331613	2009-04-27 23:09:23.331613
42	24.85.86.192	190	71	\N	2009-04-27 23:16:56.055555	2009-04-27 23:16:56.055555
43	24.85.86.192	193	72	\N	2009-04-27 23:19:39.681979	2009-04-27 23:19:39.681979
44	90.55.145.200	5	27	\N	2009-04-29 10:05:54.645021	2009-04-29 10:05:54.645021
45	90.55.145.200	5	26	\N	2009-04-29 10:06:06.260198	2009-04-29 10:06:06.260198
46	90.55.145.200	5	26	\N	2009-04-29 10:06:15.490978	2009-04-29 10:06:15.490978
47	90.55.14.198	1	1	\N	2009-04-29 14:20:18.241224	2009-04-29 14:20:18.241224
48	90.55.14.198	1	1	\N	2009-04-29 14:21:40.925325	2009-04-29 14:21:40.925325
49	90.55.14.198	1	1	\N	2009-04-29 14:23:30.341305	2009-04-29 14:23:30.341305
50	90.55.14.198	1	1	\N	2009-04-29 14:26:29.840722	2009-04-29 14:26:29.840722
51	90.55.14.198	1	1	\N	2009-04-29 14:26:36.571074	2009-04-29 14:26:36.571074
52	90.55.14.198	1	1	\N	2009-04-29 14:26:41.186949	2009-04-29 14:26:41.186949
53	90.55.14.198	1	1	\N	2009-04-29 14:26:46.584599	2009-04-29 14:26:46.584599
54	90.55.14.198	1	1	\N	2009-04-29 14:28:25.852945	2009-04-29 14:28:25.852945
55	90.55.14.198	1	1	\N	2009-04-29 14:28:29.562285	2009-04-29 14:28:29.562285
56	90.55.14.198	1	1	\N	2009-04-29 14:29:54.252886	2009-04-29 14:29:54.252886
57	90.55.14.198	1	1	\N	2009-04-29 14:30:37.522258	2009-04-29 14:30:37.522258
58	90.55.14.198	1	1	\N	2009-04-29 14:30:42.544833	2009-04-29 14:30:42.544833
59	90.55.14.198	1	1	\N	2009-04-29 14:30:48.523034	2009-04-29 14:30:48.523034
60	90.55.14.198	1	1	\N	2009-04-29 14:34:40.694737	2009-04-29 14:34:40.694737
61	90.55.14.198	1	1	\N	2009-04-29 14:35:59.648177	2009-04-29 14:35:59.648177
62	90.55.14.198	1	1	\N	2009-04-29 14:43:15.359967	2009-04-29 14:43:15.359967
63	90.55.14.198	1	1	\N	2009-04-29 14:46:42.229528	2009-04-29 14:46:42.229528
64	90.55.14.198	1	1	\N	2009-04-29 14:46:47.555803	2009-04-29 14:46:47.555803
65	90.55.14.198	1	1	\N	2009-04-29 15:01:55.936373	2009-04-29 15:01:55.936373
66	90.55.14.198	1	1	\N	2009-04-29 15:02:02.753393	2009-04-29 15:02:02.753393
67	90.55.14.198	1	1	\N	2009-04-29 15:10:33.455987	2009-04-29 15:10:33.455987
68	90.55.14.198	51	64	\N	2009-04-29 15:15:35.25564	2009-04-29 15:15:35.25564
69	90.55.14.198	51	64	\N	2009-04-29 15:15:52.059951	2009-04-29 15:15:52.059951
70	90.55.14.198	51	16	\N	2009-04-29 15:16:01.789687	2009-04-29 15:16:01.789687
71	90.55.14.198	51	17	\N	2009-04-29 15:16:12.192367	2009-04-29 15:16:12.192367
72	90.55.14.198	81	23	\N	2009-04-29 15:16:31.875508	2009-04-29 15:16:31.875508
73	90.55.14.198	81	23	\N	2009-04-29 15:16:45.53324	2009-04-29 15:16:45.53324
74	90.55.14.198	81	24	\N	2009-04-29 15:21:50.322727	2009-04-29 15:21:50.322727
75	90.55.14.198	81	8	\N	2009-04-29 15:22:01.663642	2009-04-29 15:22:01.663642
76	24.85.86.192	3	43	\N	2009-04-29 16:17:56.10822	2009-04-29 16:17:56.10822
77	24.85.86.192	3	57	\N	2009-04-29 16:18:04.598229	2009-04-29 16:18:04.598229
78	24.85.86.192	3	57	\N	2009-04-29 16:18:14.080844	2009-04-29 16:18:14.080844
79	24.85.86.192	82	33	\N	2009-04-29 16:33:45.951582	2009-04-29 16:33:45.951582
80	24.85.86.192	82	30	\N	2009-04-29 16:34:00.690041	2009-04-29 16:34:00.690041
81	24.85.86.192	109	4	\N	2009-04-29 16:34:21.908601	2009-04-29 16:34:21.908601
82	24.85.86.192	109	44	\N	2009-04-29 16:34:36.309585	2009-04-29 16:34:36.309585
83	24.85.86.192	109	44	\N	2009-04-29 16:35:49.943302	2009-04-29 16:35:49.943302
84	24.85.86.192	109	4	\N	2009-04-29 16:35:59.275879	2009-04-29 16:35:59.275879
85	24.85.86.192	81	8	\N	2009-04-29 16:36:21.288552	2009-04-29 16:36:21.288552
86	24.85.86.192	51	17	\N	2009-04-29 16:37:44.406988	2009-04-29 16:37:44.406988
87	24.85.86.192	51	6	\N	2009-04-29 16:37:51.516286	2009-04-29 16:37:51.516286
88	24.85.86.192	51	11	\N	2009-04-29 16:40:28.488549	2009-04-29 16:40:28.488549
89	24.85.86.192	5	26	\N	2009-04-29 16:42:01.479607	2009-04-29 16:42:01.479607
90	24.85.86.192	81	24	\N	2009-04-29 17:57:25.647577	2009-04-29 17:57:25.647577
91	24.85.86.192	109	44	\N	2009-04-29 18:17:42.605233	2009-04-29 18:17:42.605233
92	24.85.86.192	5	63	\N	2009-04-29 18:20:54.463878	2009-04-29 18:20:54.463878
93	24.85.86.192	191	70	\N	2009-05-01 18:58:00.271538	2009-05-01 18:58:00.271538
94	24.85.86.192	81	25	\N	2009-05-02 20:03:22.4112	2009-05-02 20:03:22.4112
95	24.85.86.192	111	75	\N	2009-05-03 16:20:07.008123	2009-05-03 16:20:07.008123
96	24.85.86.192	51	13	\N	2009-05-03 21:32:01.935916	2009-05-03 21:32:01.935916
97	24.85.86.192	51	13	\N	2009-05-03 21:32:11.976477	2009-05-03 21:32:11.976477
98	96.49.64.179	3	56	\N	2009-05-04 03:32:57.292451	2009-05-04 03:32:57.292451
99	96.49.64.179	3	56	\N	2009-05-04 03:33:14.521603	2009-05-04 03:33:14.521603
100	96.49.64.179	3	56	\N	2009-05-04 03:33:22.77909	2009-05-04 03:33:22.77909
\.


--
-- Data for Name: websites; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY websites (id, url, title, created_at, updated_at) FROM stdin;
1	http://thecrandreagoupr.blogspot.com/	Activism - The Crandrea Group	2009-04-25 01:31:44.406356	2009-04-25 01:31:44.406356
2	http://www.networkworld.com/community/blog/1926	Microsoft Subnet Blog	2009-04-25 02:42:54.585305	2009-04-25 02:42:54.585305
3	http://thecrandreagoupr.blogspot.com/	Activism - The Crandrea Group	2009-04-25 03:37:43.550101	2009-04-25 03:37:43.550101
8	http://www.publiceyeonline.com/	Public Eye Online	2009-04-26 03:32:02.988548	2009-04-26 03:32:02.988548
9	http://billtieleman.blogspot.com/	Bill Tieleman	2009-04-26 03:34:09.857606	2009-04-26 03:34:09.857606
15	http://pricetags.wordpress.com/	Price Tags	2009-04-26 04:06:04.239695	2009-04-26 04:06:04.239695
17	http://hummingbird604.com/	Hummingbird604.com	2009-04-26 04:09:48.576112	2009-04-26 04:09:48.576112
18	http://thebernermonologues.blogspot.com/	David Talks/The Berner Monologues	2009-04-26 04:10:22.810026	2009-04-26 04:10:22.810026
19	http://jnarvey.com/	Currents	2009-04-26 04:13:11.919331	2009-04-26 04:13:11.919331
20	http://jnarvey.com/	Currents	2009-04-26 04:13:44.972037	2009-04-26 04:13:44.972037
27	http://jnarvey.com/	Currents	2009-04-26 04:20:24.992919	2009-04-26 04:20:24.992919
30	http://ubcspectator.blogspot.com/	The UBC Spectator	2009-04-26 04:29:13.5683	2009-04-26 04:29:13.5683
32	http://ubcstudentmedia.wordpress.com/	UBC Student Media	2009-04-26 04:29:55.43279	2009-04-26 04:29:55.43279
33	http://ubcinsiders.blogspot.com/	UBC Insiders	2009-04-26 04:30:12.388076	2009-04-26 04:30:12.388076
35	http://fairvoteubc.wordpress.com/	Fair Vote UBC	2009-04-26 04:30:53.390624	2009-04-26 04:30:53.390624
38	http://www.bcvote.ca/	BC Vote	2009-04-26 04:35:00.595335	2009-04-26 04:35:00.595335
39	http://oncampus.macleans.ca/education	Macleans OnCampus	2009-04-26 04:39:24.26765	2009-04-26 04:39:24.26765
40	http://oncampus.macleans.ca/education	Macleans OnCampus	2009-04-26 04:39:51.488459	2009-04-26 04:39:51.488459
44	http://www.networkworld.com/community/blog/1926	Microsoft Subnet Blog	2009-04-26 05:20:07.030718	2009-04-26 05:20:07.030718
45	http://www.langleypolitics.com/	Langley Politics Dotcom	2009-04-27 16:27:44.440782	2009-04-27 16:27:44.440782
46	http://www.kimrichter.com/Blog/langleyfreepress.html	Langley Free Press	2009-04-27 16:32:50.107279	2009-04-27 16:32:50.107279
47	http://www.kimrichter.com/Blog/langleyfreepress.html	Langley Free Press	2009-04-27 16:34:21.756654	2009-04-27 16:34:21.756654
51	http://claremontca.blogspot.com/	Claremont Insider	2009-04-27 18:59:30.948576	2009-04-27 18:59:30.948576
52	http://www.allthingsupland.com/	All Things Upland	2009-04-27 19:06:13.83117	2009-04-27 19:06:13.83117
53	http://thefcblog.com/	The Foothill Cities Blog	2009-04-27 19:14:40.54208	2009-04-27 19:14:40.54208
54	http://thefcblog.com/	The Foothill Cities Blog	2009-04-27 19:15:23.916696	2009-04-27 19:15:23.916696
55	http://thefcblog.com/	The Foothill Cities Blog	2009-04-27 19:18:25.15654	2009-04-27 19:18:25.15654
56	http://publicbroadcasting.ca	publicbroadcasting.ca	2009-04-27 19:22:16.343991	2009-04-27 19:22:16.343991
57	http://peterjanes.homeip.net/cbc/	Planet CBC	2009-04-27 19:25:58.259955	2009-04-27 19:25:58.259955
58	http://teamakers.blogspot.com/	The Tea Makers	2009-04-27 19:28:44.098236	2009-04-27 19:28:44.098236
59	http://peterjanes.ca/blog/	Petroglyphs	2009-04-27 19:33:21.998794	2009-04-27 19:33:21.998794
60	http://nanaimosouthendvotes.wordpress.com/	South End Votes	2009-04-27 21:45:41.937125	2009-04-27 21:45:41.937125
61	http://www.gonanaimo.com/blog/	Go Nanaimo Blog	2009-04-27 21:47:01.309096	2009-04-27 21:47:01.309096
62	http://worththefeetoreadit.wordpress.com/	Worth the Fee to Read It	2009-04-27 21:52:35.425928	2009-04-27 21:52:35.425928
63	http://worththefeetoreadit.wordpress.com/	Worth the Fee to Read It	2009-04-27 21:53:29.609918	2009-04-27 21:53:29.609918
64	http://worththefeetoreadit.wordpress.com/	Worth the Fee to Read It	2009-04-27 21:54:25.848351	2009-04-27 21:54:25.848351
65	http://www.michaelbutler.com/blog/civic/	MB Civic	2009-04-27 22:34:13.944714	2009-04-27 22:34:13.944714
66	http://thelondonfog.blogspot.com/	The London Fog	2009-04-27 22:38:04.247657	2009-04-27 22:38:04.247657
67	http://knoxvilletennesseeblog.com/	Knoxville Tennessee Blog	2009-04-27 22:50:19.038134	2009-04-27 22:50:19.038134
68	http://civicforum.chattablogs.com/	TennesseeTicket.com	2009-04-27 22:56:09.789962	2009-04-27 22:56:09.789962
69	http://civicforum.chattablogs.com/	TennesseeTicket.com	2009-04-27 22:59:12.200103	2009-04-27 22:59:12.200103
70	http://chattarati.com/	Chattarati, Chattanooga news and opinion	2009-04-27 23:10:24.173053	2009-04-27 23:10:24.173053
71	http://knoxify.com/	Knoxify - The insider’s take on what makes Knoxville great	2009-04-27 23:16:29.387581	2009-04-27 23:16:29.387581
72	http://nashvillest.com/	Nashvillest	2009-04-27 23:19:22.120124	2009-04-27 23:19:22.120124
73	http://bc2009.com/	BC Election 2009	2009-04-28 03:17:07.25782	2009-04-28 03:17:07.25782
74	http://votermedia.blogspot.com/	VoterMedia Democracy Blog	2009-04-28 03:46:24.290436	2009-04-28 03:46:24.290436
75	http://factcheck.org/	FactCheck.org	2009-05-03 16:19:59.928711	2009-05-03 16:19:59.928711
16	http://www.miss604.com/	Vancouver Blog Miss 604 by Rebecca Bollwitt	2009-04-26 04:06:24.077052	2009-05-03 14:04:17.38986
13	http://www.paulhillsdon.com/blog/	paulhillsdon.com	2009-04-26 04:05:24.59175	2009-05-04 04:35:52.248343
11	http://thetyee.ca/	Tyee Home :: thetyee.ca	2009-04-26 04:04:22.039986	2009-05-04 04:44:24.378037
23	http://thetyee.ca/	Tyee Home :: thetyee.ca	2009-04-26 04:16:31.653647	2009-05-04 04:45:37.152132
25	http://www.paulhillsdon.com/blog/	paulhillsdon.com	2009-04-26 04:18:06.827087	2009-05-04 04:46:09.24218
7	http://stephenrees.wordpress.com/	Stephen Rees's blog	2009-04-26 03:31:26.604305	2009-05-04 04:48:09.099606
24	http://davideby.blogspot.com/	David Eby - Blog	2009-04-26 04:17:45.715795	2009-05-04 04:48:30.591219
6	http://www.francesbula.com/	Frances Bula &#8212; Vancouver city life and politics	2009-04-26 03:28:49.225825	2009-05-04 04:50:36.560812
5	http://stephenrees.wordpress.com/	Stephen Rees's blog	2009-04-26 03:28:13.969479	2009-05-04 04:55:26.134479
14	http://www.beyondrobson.com/	Beyond Robson | Vancouver blog	2009-04-26 04:05:45.023351	2009-05-04 04:56:15.857592
12	http://davideby.blogspot.com/	David Eby - Blog	2009-04-26 04:04:59.395141	2009-05-04 04:57:13.935325
10	http://www.thevancouverobserver.com/	Vancouver  Observer: Frontpage	2009-04-26 04:01:50.159167	2009-05-04 04:58:44.444759
34	http://www.knollubc.ca/	http://www.knollubc.ca/	2009-04-26 04:30:30.853872	2009-05-04 05:02:02.213059
31	http://radicalbeer.wordpress.com/	The Radical Beer Tribune	2009-04-26 04:29:36.540135	2009-05-04 05:02:33.824523
37	http://blogs.ubc.ca/phoebeyu	UBC Years - Phoebe Yu » The loquacious musings of a caffeinated UBC student	2009-04-26 04:33:08.94648	2009-05-04 05:03:15.714885
36	http://www.ubcdevil.com/	UBC Devil's Advocate	2009-04-26 04:31:12.721146	2009-05-04 05:04:04.509911
43	http://www.earsay.com/standonguardforcbc/	About Us | Stand On Guard For CBC	2009-04-26 04:53:57.174347	2009-05-04 05:07:40.066872
4	http://thecrandreagoupr.blogspot.com/	Activism-The Crandrea Group	2009-04-25 20:39:59.598613	2009-05-04 05:10:26.249179
26	http://thetyee.ca/	Tyee Home :: thetyee.ca	2009-04-26 04:20:00.479713	2009-05-04 05:17:25.186805
41	http://communities.canada.com/vancouversun/blogs/reportcard/default.aspx	Report Card - Vancouver Sun blogs	2009-04-26 04:40:34.140233	2009-05-04 05:19:04.098488
49	http://northvancouverpolitics.com/	northvancouverpolitics.com	2009-04-27 16:57:05.839583	2009-05-04 05:20:52.400877
48	http://northvancouverpolitics.com/	northvancouverpolitics.com	2009-04-27 16:56:40.042032	2009-05-04 05:21:27.063035
28	http://stephenrees.wordpress.com/	Stephen Rees's blog	2009-04-26 04:24:57.606095	2009-05-04 05:22:03.577318
29	http://www.paulhillsdon.com/blog/	paulhillsdon.com	2009-04-26 04:25:39.601611	2009-05-04 05:22:44.409977
50	http://www.piquenewsmagazine.com/	Pique newsmagazine| Whistler, CANADA	2009-04-27 18:22:52.440678	2009-05-04 05:23:34.085806
42	http://communities.canada.com/vancouversun/blogs/reportcard/default.aspx	Report Card - Vancouver Sun blogs	2009-04-26 04:42:56.877205	2009-05-04 05:24:43.09906
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

