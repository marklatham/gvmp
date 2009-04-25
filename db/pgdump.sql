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

SELECT pg_catalog.setval('communities_id_seq', 182, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: app62414; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO app62414;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app62414
--

ALTER TABLE communities ALTER COLUMN id SET DEFAULT nextval('communities_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY communities (id, name, short_name, category, country, prov_state, city, official_url, wiki_url, description, created_at, updated_at, scope) FROM stdin;
31	Harrison Hot Springs	Harrison Hot Springs	Municipal	Canada	B.C.	Harrison Hot Springs	http://www.harrisonhotsprings.ca/	http://en.wikipedia.org/wiki/Harrison_Hot_Springs	GVRD, Metro Vancouver	2009-04-11 22:52:28.938574	2009-04-11 22:52:28.938574	\N
32	Hope	Hope	Municipal	Canada	B.C.	Hope	http://www.hopebc.ca/	http://en.wikipedia.org/wiki/Hope,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.940921	2009-04-11 22:52:28.940921	\N
33	Kent	Kent	Municipal	Canada	B.C.	Kent	http://www.district.kent.bc.ca/	http://en.wikipedia.org/wiki/Kent,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.943268	2009-04-11 22:52:28.943268	\N
34	Langley (City)	Langley (City)	Municipal	Canada	B.C.	Langley (City)	http://www.city.langley.bc.ca/	http://en.wikipedia.org/wiki/Langley,_British_Columbia_(city)	GVRD, Metro Vancouver	2009-04-11 22:52:28.975541	2009-04-11 22:52:28.975541	\N
35	Langley (District Municipality)	Langley (District)	Municipal	Canada	B.C.	Langley (District)	http://www.tol.bc.ca/	http://en.wikipedia.org/wiki/Langley,_British_Columbia_(district_municipality)	GVRD, Metro Vancouver	2009-04-11 22:52:28.978159	2009-04-11 22:52:28.978159	\N
36	Lillooet	Lillooet	Municipal	Canada	B.C.	Lillooet	http://www.lillooetbc.com/	http://en.wikipedia.org/wiki/Lillooet,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.980576	2009-04-11 22:52:28.980576	\N
37	Lions Bay	Lions Bay	Municipal	Canada	B.C.	Lions Bay	http://www.lionsbay.citymax.com/page/page/479914.htm	http://en.wikipedia.org/wiki/Lions_Bay	GVRD, Metro Vancouver	2009-04-11 22:52:28.982881	2009-04-11 22:52:28.982881	\N
38	Maple Ridge	Maple Ridge	Municipal	Canada	B.C.	Maple Ridge	http://www.mapleridge.org/EN/index.html	http://en.wikipedia.org/wiki/Maple_Ridge	GVRD, Metro Vancouver	2009-04-11 22:52:28.985242	2009-04-11 22:52:28.985242	\N
39	Mission	Mission	Municipal	Canada	B.C.	Mission	http://www.mission.ca/site3.aspx	http://en.wikipedia.org/wiki/District_of_Mission	GVRD, Metro Vancouver	2009-04-11 22:52:28.987557	2009-04-11 22:52:28.987557	\N
40	New Westminster	New Westminster	Municipal	Canada	B.C.	New Westminster	http://www.newwestcity.ca/	http://en.wikipedia.org/wiki/New_Westminster	GVRD, Metro Vancouver	2009-04-11 22:52:28.989892	2009-04-11 22:52:28.989892	\N
41	North Vancouver (City)	North Van (City)	Municipal	Canada	B.C.	North Vancouver	http://www.cnv.org/	http://en.wikipedia.org/wiki/North_Vancouver,_British_Columbia_(city)	GVRD, Metro Vancouver	2009-04-11 22:52:28.992266	2009-04-11 22:52:28.992266	\N
42	North Vancouver (District Municipality)	North Van (District)	Municipal	Canada	B.C.	North Vancouver	http://www.district.north-van.bc.ca/article.asp?c=78	http://en.wikipedia.org/wiki/North_Vancouver,_British_Columbia_(district_municipality)	GVRD, Metro Vancouver	2009-04-11 22:52:28.994659	2009-04-11 22:52:28.994659	\N
43	Pemberton	Pemberton	Municipal	Canada	B.C.	Pemberton	http://www.pemberton.ca/	http://en.wikipedia.org/wiki/Pemberton,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.997016	2009-04-11 22:52:28.997016	\N
44	Pitt Meadows	Pitt Meadows	Municipal	Canada	B.C.	Pitt Meadows	http://www.pittmeadows.bc.ca/	http://en.wikipedia.org/wiki/Pitt_Meadows	GVRD, Metro Vancouver	2009-04-11 22:52:28.999333	2009-04-11 22:52:28.999333	\N
45	Port Coquitlam	Port Coquitlam	Municipal	Canada	B.C.	Port Coquitlam	http://www.city.port-coquitlam.bc.ca/Home_Page.htm	http://en.wikipedia.org/wiki/Port_Coquitlam	GVRD, Metro Vancouver	2009-04-11 22:52:29.001676	2009-04-11 22:52:29.001676	\N
46	Port Moody	Port Moody	Municipal	Canada	B.C.	Port Moody	http://www.cityofportmoody.com/default.htm	http://en.wikipedia.org/wiki/Port_Moody	GVRD, Metro Vancouver	2009-04-11 22:52:29.004144	2009-04-11 22:52:29.004144	\N
47	Richmond	Richmond	Municipal	Canada	B.C.	Richmond	http://www.richmond.ca/home.htm	http://en.wikipedia.org/wiki/Richmond,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29.037383	2009-04-11 22:52:29.037383	\N
48	Sechelt	Sechelt	Municipal	Canada	B.C.	Sechelt	http://www.district.sechelt.bc.ca/	http://en.wikipedia.org/wiki/Sechelt	GVRD, Metro Vancouver	2009-04-11 22:52:29.039923	2009-04-11 22:52:29.039923	\N
49	Squamish	Squamish	Municipal	Canada	B.C.	Squamish	http://www.squamish.ca/	http://en.wikipedia.org/wiki/Squamish	GVRD, Metro Vancouver	2009-04-11 22:52:29.042291	2009-04-11 22:52:29.042291	\N
50	Surrey	Surrey	Municipal	Canada	B.C.	Surrey	http://www.surrey.ca/default.htm	http://en.wikipedia.org/wiki/Surrey,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:29.044617	2009-04-11 22:52:29.044617	\N
51	Vancouver	Vancouver	Municipal	Canada	B.C.	Vancouver	http://www.vancouver.ca/	http://en.wikipedia.org/wiki/Vancouver	GVRD, Metro Vancouver	2009-04-11 22:52:29.046943	2009-04-11 22:52:29.046943	\N
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
81	British Columbia	British Columbia	Province	Canada	B.C.		http://www.gov.bc.ca/	http://en.wikipedia.org/wiki/British_Columbia		2009-04-11 22:52:29.963613	2009-04-11 22:52:29.963613	\N
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
109	Microsoft	Microsoft	Corporation	USA	Washington	Redmond	http://www.microsoft.com	http://en.wikipedia.org/wiki/Microsoft	NASDAQ	2009-04-11 22:52:30.106784	2009-04-11 22:52:30.106784	\N
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
157	American Medical Association	AMA	Nonprofit	USA			http://www.ama-assn.org/	http://en.wikipedia.org/wiki/American_Medical_Association		2009-04-11 22:52:30.52971	2009-04-11 22:52:30.52971	\N
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
3	Canadian Broadcasting Corporation	CBC	Corporation	Canada	Ontario	Ottawa	http://www.cbc.radio-canada.ca/	http://en.wikipedia.org/wiki/Canadian_Broadcasting_Corporation	CBC is a crown corporation, not a publicly-traded corporation. So its voter community is all citizens of Canada.	2009-04-11 22:52:28.776363	2009-04-14 22:11:59.889464	Canada
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
82	Alma Mater Society of the U. of British Columbia	UBC AMS	Student	Canada	B.C.	Vancouver	http://www.amsubc.ca/	http://en.wikipedia.org/wiki/Alma_Mater_Society_of_the_University_of_British_Columbia	Alma Mater Society of the University of British Columbia	2009-04-11 22:52:30.006212	2009-04-14 22:47:42.042216	Vancouver
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
9	Westminster Savings Credit Union	Westminster Savings	Credit Union	Canada	B.C.	New Westminster	https://www.wscu.com	None as of January 2009		2009-04-11 22:52:28.790541	2009-04-16 22:30:58.326039	B.C.
7	North Shore Credit Union	North Shore CU	Credit Union	Canada	B.C.	North Vancouver	https://www.nscu.com/	http://en.wikipedia.org/wiki/North_Shore_Credit_Union		2009-04-11 22:52:28.785897	2009-04-16 22:31:33.658048	B.C.
6	Coast Capital Savings	Coast Capital	Credit Union	Canada	B.C.	Surrey	https://www.coastcapitalsavings.com/	http://en.wikipedia.org/wiki/Coast_Capital_Savings		2009-04-11 22:52:28.783539	2009-04-16 22:31:50.178061	B.C.
8	Vancouver City Savings Credit Union	Vancity	Credit Union	Canada	B.C.	Vancouver	https://www.vancity.com/	http://en.wikipedia.org/wiki/Vancity		2009-04-11 22:52:28.788238	2009-04-17 18:29:31.604502	B.C.
29	Delta	Delta	Municipal	Canada	B.C.	Delta	http://www.delta.com/	http://en.wikipedia.org/wiki/Delta,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.933838	2009-04-17 21:57:29.732036	Delta
30	Gibsons	Gibsons	Municipal	Canada	B.C.	Gibsons	http://www.gibsons.ca/	http://en.wikipedia.org/wiki/Gibsons,_British_Columbia	GVRD, Metro Vancouver	2009-04-11 22:52:28.936198	2009-04-17 22:01:01.37751	Gibsons
181	British Columbia School Trustees' Association	B.C. School Trustees	Nonprofit	Canada	B.C.	Vancouver	http://www.bcsta.org	None as of April 2009		2009-04-19 05:38:47.495456	2009-04-19 05:41:26.674009	B.C.
182	Cyberphyber Media	Cyber	Other	Canada	BC	Vancouver	www.cyberphyber.com		webdesign technical writing video production 	2009-04-20 00:00:00	2009-04-20 06:52:33.91475	Vancouver BC Canada
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: app62414
--

COPY schema_migrations (version) FROM stdin;
20090411224116
20090411224737
20090414164116
\.


--
-- Name: communities_pkey; Type: CONSTRAINT; Schema: public; Owner: app62414; Tablespace: 
--

ALTER TABLE ONLY communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: app62414; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

