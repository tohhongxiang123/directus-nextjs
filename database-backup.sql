--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50) NOT NULL,
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    "group" integer,
    translations json,
    note text
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize integer,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    "limit" integer
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    filters json,
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    module_list json,
    collection_list json,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid NOT NULL,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(10) DEFAULT '#00C897'::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128) NOT NULL,
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(8) DEFAULT 'en-US'::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255)
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url text,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections text
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    date_created timestamp with time zone,
    date_updated timestamp with time zone,
    price real NOT NULL,
    description text,
    image uuid NOT NULL,
    name character varying(255) NOT NULL,
    featured boolean DEFAULT false NOT NULL,
    custom_fields json DEFAULT '[]'::json,
    seo json DEFAULT '[]'::json NOT NULL,
    sale_price real,
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_categories (
    id integer NOT NULL,
    products_id integer,
    categories_id integer
);


ALTER TABLE public.products_categories OWNER TO postgres;

--
-- Name: products_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_categories_id_seq OWNER TO postgres;

--
-- Name: products_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_categories_id_seq OWNED BY public.products_categories.id;


--
-- Name: products_directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_directus_files (
    id integer NOT NULL,
    products_id integer,
    directus_files_id uuid
);


ALTER TABLE public.products_directus_files OWNER TO postgres;

--
-- Name: products_directus_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_directus_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_directus_files_id_seq OWNER TO postgres;

--
-- Name: products_directus_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_directus_files_id_seq OWNED BY public.products_directus_files.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories ALTER COLUMN id SET DEFAULT nextval('public.products_categories_id_seq'::regclass);


--
-- Name: products_directus_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_directus_files ALTER COLUMN id SET DEFAULT nextval('public.products_directus_files_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
8	anime
9	furniture
10	miscellaneous
11	food
12	art
13	paintings
14	cars
15	computers
16	test
17	john
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment) FROM stdin;
1	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-13 14:59:30.571508+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
2	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-13 22:27:04.825284+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	users	\N
3	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-13 22:27:48.222104+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	users	\N
4	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-13 22:27:48.258074+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	1	\N
5	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-13 23:03:37.032001+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	users	\N
6	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-13 23:03:39.672349+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	accounts	\N
7	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-13 23:03:41.811053+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	sessions	\N
8	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-13 23:03:43.783145+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	verification_requests	\N
9	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:12:23.16128+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	users	\N
10	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:12:23.16128+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	1	\N
11	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:12:23.16128+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	2	\N
12	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:12:23.16128+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	3	\N
13	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:12:23.16128+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	4	\N
14	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:12:23.16128+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	5	\N
15	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:13:44.308362+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	6	\N
16	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:12.471589+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	7	\N
17	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:17.551637+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	6	\N
18	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:20.876778+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	7	\N
19	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:24.252259+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	1	\N
20	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:24.25767+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	6	\N
21	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:24.262074+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	3	\N
22	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:24.266036+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	5	\N
23	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:24.270827+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	7	\N
24	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:25.205572+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	1	\N
25	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:25.209066+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	6	\N
26	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:25.215866+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	7	\N
27	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:25.220127+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	3	\N
28	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:14:25.22532+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	5	\N
29	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:16:13.873393+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	2	\N
30	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:16:14.764681+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	3	\N
31	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:16:15.900386+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	4	\N
32	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:16:17.849055+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	5	\N
33	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:27:14.729342+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	users	\N
34	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:27:40.465021+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	users	\N
35	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:27:40.465021+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	8	\N
36	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:27:40.465021+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	9	\N
37	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:27:40.465021+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	10	\N
38	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:10.589228+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	11	\N
39	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:38.069742+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	12	\N
40	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:42.164388+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	8	\N
41	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:42.168024+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	11	\N
42	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:42.173597+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	9	\N
43	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:42.178167+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	10	\N
44	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:42.18175+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	12	\N
45	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:43.228667+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	8	\N
46	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:43.232596+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	12	\N
47	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:43.235872+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	11	\N
48	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:43.240757+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	9	\N
49	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:43.244204+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	10	\N
50	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:44.699732+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	8	\N
51	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:44.703365+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	11	\N
52	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:44.707293+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	12	\N
53	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:44.710534+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	9	\N
54	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:28:44.713762+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	10	\N
55	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:29:52.01056+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	6	\N
56	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:29:53.020939+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	7	\N
57	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:29:53.678656+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	8	\N
58	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:29:54.430294+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	9	\N
61	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-14 21:48:37.477248+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	8	\N
62	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:06:45.391596+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
63	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:07:52.81063+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	6	\N
64	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:07:54.088685+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	8	\N
65	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:07:55.089378+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	9	\N
68	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:10:25.43434+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
69	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:10:56.243534+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
72	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:12:55.92177+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
74	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:35:26.310581+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	products	\N
75	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:35:26.310581+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	13	\N
76	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:35:26.310581+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	14	\N
77	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:35:26.310581+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	15	\N
78	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:36:35.323189+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	16	\N
79	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:37:00.653932+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	17	\N
80	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:37:31.533855+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	18	\N
81	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:38:17.549548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	19	\N
82	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:04.8194+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	19	\N
83	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:04.824667+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	13	\N
84	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:04.830265+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	14	\N
85	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:04.83617+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	15	\N
86	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:04.840273+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	16	\N
87	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:04.845214+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	17	\N
88	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:04.8492+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	18	\N
89	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:06.735452+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	19	\N
90	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:06.738937+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	17	\N
91	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:06.742324+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	13	\N
92	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:06.747575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	14	\N
93	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:06.75192+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	15	\N
94	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:06.755405+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	16	\N
95	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:06.758855+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	18	\N
96	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:07.991307+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	19	\N
97	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:07.998727+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	17	\N
98	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:08.00269+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	16	\N
99	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:08.006983+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	13	\N
100	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:08.011717+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	14	\N
101	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:08.015758+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	15	\N
102	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:08.019337+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	18	\N
103	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:09.602392+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	19	\N
104	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:09.605817+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	17	\N
105	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:09.609019+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	16	\N
106	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:09.613206+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	18	\N
107	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:09.616692+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	13	\N
108	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:09.619977+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	14	\N
109	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:09.623177+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	15	\N
110	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:11.748415+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	19	\N
111	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:11.752266+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	17	\N
112	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:11.755767+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	16	\N
113	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:11.759818+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	18	\N
114	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:11.765398+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	14	\N
115	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:11.769013+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	15	\N
116	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:39:11.773414+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	13	\N
117	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:40:47.819075+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_files	f3823afc-873e-4b97-ae46-b06f19c9bd6b	\N
118	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:40:55.185648+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	products	1	\N
119	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:42:43.529412+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	10	\N
120	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:42:53.785923+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	7	\N
121	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:44:52.968612+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
122	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:44:53.862728+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
123	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:44:54.755826+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
124	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:47:50.43955+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
125	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:48:54.691746+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
126	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:48:54.697527+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
127	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:51:14.124424+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
128	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:51:15.136652+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
129	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:52:03.496654+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
130	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:52:05.21995+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
131	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:52:13.939896+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
132	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:52:15.604727+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
133	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:52:49.221706+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
134	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:52:50.841466+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
135	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:53:13.502053+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
136	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:53:14.641014+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
137	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:53:52.364963+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
138	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:56:43.593304+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
139	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:56:45.232464+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
140	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:57:26.353207+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
141	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:57:27.994109+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
142	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:57:53.58746+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
143	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:57:55.286292+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
144	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:58:11.778158+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
145	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:58:13.351615+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
146	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:58:49.321887+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
147	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 11:59:20.485813+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
148	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:00:19.720386+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
149	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:00:22.187555+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
150	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:00:23.776245+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
151	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:00:37.607645+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
152	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:00:39.1903+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
153	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:12.039312+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	17	\N
154	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:15.000943+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	19	\N
155	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:15.005716+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	17	\N
156	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:15.008788+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	16	\N
157	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:15.012362+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	18	\N
158	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:15.016758+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	14	\N
159	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:15.020675+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	15	\N
160	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:15.024553+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	13	\N
161	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:18.670519+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
162	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:19.052608+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
163	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:19.870145+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
164	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:21.538659+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
165	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:33.197263+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
166	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:34.825863+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
167	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:47.574791+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
168	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:01:55.389561+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
169	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:02:22.701682+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
170	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:02:26.680038+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
171	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:02:28.261607+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
172	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:02:41.840945+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
173	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:03:00.326961+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
174	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:03:33.524186+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
175	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:04:46.380648+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
176	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:05:19.666889+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
177	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:05:20.861514+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
178	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:05:22.442117+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
179	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:07:09.926965+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
180	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:07:10.034542+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
181	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:07:10.120593+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
182	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:07:11.045032+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
183	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:07:11.155792+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
184	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:08:08.794757+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
185	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:08:09.716796+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
186	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:08:10.041272+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
187	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:09:11.647715+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_files	9cc7df02-0672-4443-a285-99d472fc2a9c	\N
188	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:09:18.725677+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	products	2	\N
189	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:09:26.950106+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
190	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:09:27.308386+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
191	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:09:27.955734+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
192	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:09:29.808329+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
193	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:09:29.980849+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
194	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:10:47.424123+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
195	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:10:47.523161+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
196	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:10:52.508621+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
197	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:10:54.174384+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
198	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:10:54.35177+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
199	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:11:09.821043+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
200	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:11:09.935704+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
201	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:11:14.231287+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
202	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:14:26.827254+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
203	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:14:44.221631+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
204	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:15:01.603269+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
205	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:16:03.224359+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
206	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:16:31.886489+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
207	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:18:48.943054+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	20	\N
208	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:18:48.996349+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	products_directus_files	\N
209	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:18:48.996349+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	21	\N
210	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:18:49.069958+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	22	\N
211	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:18:49.069205+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	23	\N
212	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:19:13.028177+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_files	e672ef34-dcd8-4979-a15d-ae8003247965	\N
213	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:19:13.029871+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_files	63856db5-5c43-44cd-b0db-4cc71536763b	\N
216	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:19:20.06054+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	products	1	\N
217	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:19:34.865341+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
218	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:20:03.151701+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
219	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:20:30.123579+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
220	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:22:14.811671+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
221	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:23:32.88566+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
222	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:23:42.4918+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
223	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:23:44.182435+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
224	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:24:54.680743+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
225	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:24:57.275495+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
226	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:24:59.258869+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
227	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:25:40.09461+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	20	\N
228	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:25:42.558448+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
229	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:25:44.534646+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
230	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:25:46.215664+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
231	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:25:59.732035+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
232	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:26:57.697727+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	categories	\N
233	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:26:57.697727+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	24	\N
234	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:27:07.353811+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	25	\N
235	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:27:18.635362+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	categories	1	\N
236	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:27:22.988777+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	categories	2	\N
237	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:27:28.344735+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	categories	3	\N
238	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:01.03159+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	26	\N
239	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:01.081505+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	products_categories	\N
240	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:01.081505+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	27	\N
241	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:01.129989+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	28	\N
242	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:01.15209+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	29	\N
245	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:25.930041+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	products	1	\N
247	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:33.108127+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	products	2	\N
248	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:36.59831+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
249	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:37.42683+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
250	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:28:39.389329+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
251	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:29:42.25304+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
252	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:30:03.823845+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
253	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:30:14.555446+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
254	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:30:58.515241+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	30	\N
255	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:30:58.56638+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	categories_products	\N
256	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:30:58.56638+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	31	\N
257	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:30:58.627702+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	32	\N
258	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:30:58.629383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	33	\N
259	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:31:14.217406+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
264	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:31:29.835089+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	products	1	\N
265	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:31:48.126636+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
266	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:35:00.125567+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
267	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:36:00.653425+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
268	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:36:14.855106+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
269	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:36:38.892425+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	categories_products	\N
270	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:36:48.668269+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	products_categories	\N
271	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:36:54.019415+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	products_directus_files	\N
272	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:36:56.08442+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
273	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:36:56.688851+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
274	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:36:58.402395+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
275	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:38:04.978399+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	34	\N
276	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:38:05.020852+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	products_categories	\N
277	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:38:05.020852+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	35	\N
278	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:38:05.093217+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	37	\N
279	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:38:05.090037+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	36	\N
280	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:38:05.108749+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	38	\N
283	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:38:21.285396+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	products	1	\N
284	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:39:10.422268+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
285	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:39:35.845548+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
286	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:40:16.860992+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
287	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:41:04.416237+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
288	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:41:24.977867+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
289	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:41:34.038055+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
290	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:41:44.491092+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
291	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:43:35.734587+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
292	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:43:40.850273+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
293	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:44:43.583822+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
294	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:44:51.696179+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
295	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:45:14.937449+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
296	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:45:46.010153+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
297	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:46:25.669801+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
298	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:46:29.889936+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
299	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:46:31.563214+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
300	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:46:35.866308+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
301	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:47:25.161548+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
302	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:48:07.058428+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
303	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:48:51.176921+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
304	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 12:50:02.073579+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
305	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:05:10.02352+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
306	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:05:20.755537+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	11	\N
307	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:07:41.989398+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
308	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:07:48.388236+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
309	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:07:53.420322+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
310	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:07:58.417589+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
311	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:08:03.417947+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
312	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:08:06.289414+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
313	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:08:07.600158+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
314	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:09:19.812068+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	12	\N
315	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:09:21.536812+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
316	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:12:26.515455+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
317	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:12:48.657531+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
318	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:14:51.32468+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_files	63856db5-5c43-44cd-b0db-4cc71536763b	\N
319	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:14:51.32468+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_files	e672ef34-dcd8-4979-a15d-ae8003247965	\N
320	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:16:54.943387+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	34	\N
321	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:22:16.502524+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	39	\N
322	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:22:16.548382+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_collections	products_directus_files	\N
323	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:22:16.548382+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	40	\N
324	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:22:16.612284+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	41	\N
325	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:22:16.635602+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_fields	42	\N
326	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:22:25.456619+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	13	\N
327	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:22:45.859251+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
328	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:23:21.366963+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
329	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:23:36.289419+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36	directus_permissions	14	\N
330	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:23:46.55+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
331	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:23:47.277131+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
332	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:23:49.168654+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
333	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:29:09.226083+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
334	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:30:40.254984+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
335	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:30:42.10424+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
336	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:31:34.092071+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
337	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:31:35.923409+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
338	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:32:10.973883+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
339	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:32:13.149371+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
340	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:33:21.942953+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
341	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:33:22.503754+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
342	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:33:24.505091+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
343	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:34:21.210385+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
344	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:34:21.396092+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
345	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:34:23.355394+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
346	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:39:33.61953+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
347	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:39:35.324124+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
348	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:39:57.131906+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
349	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:40:13.155833+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
350	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:40:14.842924+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
351	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:40:25.75505+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
352	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:42:36.038293+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
353	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 13:48:45.626175+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
354	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 15:04:48.462474+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
387	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:16:17.08228+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
388	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:16:18.955291+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
389	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:16:24.527489+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
390	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:16:30.375036+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
391	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:26:02.056206+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	04d834e9-796f-4e0d-b8de-ca4290172522	\N
392	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:26:02.057422+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	404c81db-212b-4806-98c1-b13cdcbc4566	\N
393	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:26:05.143794+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	1	\N
394	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:26:05.143794+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	2	\N
395	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:26:05.143794+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	1	\N
396	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:30:40.265385+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
397	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:43:19.975258+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
398	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:43:21.488208+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
399	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:43:22.510094+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
400	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:44:44.651992+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	39	\N
401	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:45:08.454254+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	39	\N
402	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:46:09.955629+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
403	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:46:10.310091+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
404	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:46:11.22208+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
405	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:46:40.540606+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
406	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:46:52.493451+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
407	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:46:53.520262+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
408	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:48:17.816995+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
409	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:48:18.786746+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
410	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:49:25.864854+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
411	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:52:01.423275+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
412	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:53:19.245216+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
413	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:53:21.230037+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
414	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:53:44.732863+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
415	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 16:56:47.08229+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
416	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:04:47.48831+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
417	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:05:15.936009+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
418	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:07:50.320006+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
419	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:07:52.493485+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
420	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:18:49.401157+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
421	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:18:52.336057+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
422	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:18:54.132569+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
423	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:20:11.143238+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
424	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:24:12.673725+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
425	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:24:50.189408+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
426	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:24:56.809061+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
427	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:25:01.5577+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
428	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:25:03.282312+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
430	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:26:55.024105+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	2	\N
431	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:26:57.02075+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
432	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:27:00.050545+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
433	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:27:01.689742+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
434	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 17:28:00.042172+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
435	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 18:08:25.939469+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
436	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 18:11:58.835574+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
437	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 18:12:11.662431+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
438	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 19:48:51.103561+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
439	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 19:52:22.475226+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
440	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 19:52:27.531719+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
441	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 19:54:05.700761+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
442	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:00:29.579926+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
443	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:00:32.194941+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
444	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:00:35.448506+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
445	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:00:57.998281+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
446	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:00:59.921927+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
447	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:01:24.051463+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
448	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:01:26.570101+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
449	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:01:56.05948+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
450	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:01:57.717615+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
451	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:03:26.722977+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
452	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:10:37.078848+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
453	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:11:16.715941+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
454	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:13:21.028693+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
455	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:13:22.810523+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
456	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:14:17.601167+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
457	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:14:19.37868+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
458	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:14:20.567427+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
459	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:14:33.771614+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
460	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:15:26.390407+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
461	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:15:28.241536+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
462	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:15:33.928375+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
463	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:17:12.028652+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
464	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:17:12.051471+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
465	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:17:13.836413+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
466	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:17:25.263389+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
467	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:17:27.006074+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
468	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:17:59.208817+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
469	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:18:00.788032+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
470	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:18:51.888007+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
471	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:18:54.600901+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
472	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:18:56.391881+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
473	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:19:22.650138+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
474	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:19:24.363579+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
475	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:19:27.119248+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
476	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:19:29.682625+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
477	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:20:07.124376+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
478	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:20:08.893769+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
479	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:20:26.065146+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
480	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:25:27.958757+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
481	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:25:55.676117+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
482	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:28:54.106955+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
483	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:28:58.589939+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
484	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:29:01.701823+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
485	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:29:03.736138+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
486	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:31:02.772397+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
487	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:31:04.673373+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
488	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:33:59.718836+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
489	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:34:01.99762+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
490	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:36:18.894812+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
491	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:36:42.880453+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
492	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:40:39.544889+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
493	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:41:13.348894+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
494	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:41:23.46453+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
495	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:41:56.487495+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
496	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:42:07.188736+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
497	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:42:39.87202+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
498	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:43:00.843713+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
499	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:44:06.89105+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
500	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:46:39.694115+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
501	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:47:33.030226+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
502	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:53:40.24709+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
503	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:55:53.220995+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
504	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:57:56.796709+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
505	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 20:59:50.154134+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
506	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:02:34.325778+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
507	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:02:36.899727+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
508	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:04:24.602234+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
509	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:04:27.108494+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
510	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:10:44.313621+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
511	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:11:03.871628+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
512	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:13:55.698925+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
513	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:18:24.47752+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
514	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:18:33.54267+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
515	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:18:34.292281+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
516	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:18:55.722581+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
517	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:18:58.236275+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
518	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:19:37.545888+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
519	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:19:39.879531+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
520	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:19:41.674017+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
521	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:20:12.208169+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
522	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:20:49.520421+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
523	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:21:24.295022+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
524	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:22:58.733081+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
525	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:23:28.645964+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
526	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:23:30.842823+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
527	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:23:42.604989+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
528	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:23:42.686518+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
529	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:23:43.144804+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
530	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:23:43.472892+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
531	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:23:45.711256+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
532	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:23:45.808722+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
533	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:24:38.987996+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
534	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:25:25.631138+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
535	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:25:46.539284+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
536	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:25:49.21526+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
537	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:25:50.428542+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
538	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:27:01.189603+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
539	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:27:03.513552+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
540	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:27:04.728862+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
541	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:27:20.708334+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
542	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:27:29.599415+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
543	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:28:15.244052+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
544	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:30:00.347246+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
545	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:32:35.648468+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
546	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:32:55.878006+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
547	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:33:21.445703+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
548	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:33:50.98332+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
549	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:34:41.360788+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
550	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:35:03.640558+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
551	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:35:05.598323+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
552	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:36:40.607394+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
553	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:39:41.203554+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
554	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:42:18.175094+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
555	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:42:37.833741+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
556	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:43:16.737041+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
557	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:43:51.509524+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
558	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:43:57.814013+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
559	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:44:15.158039+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
560	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:44:17.041659+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
561	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:44:58.446155+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
562	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:46:31.814611+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
563	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:48:03.867661+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
564	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:48:56.483528+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
565	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:49:25.992449+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
566	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:49:55.917541+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
567	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:52:21.814721+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
568	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:52:57.307784+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
569	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:56:14.973268+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
570	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:56:16.94135+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
571	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:57:23.36306+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
572	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:59:02.719238+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
573	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 21:59:42.869615+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
574	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:02:01.121835+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
575	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:03:16.481447+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
576	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:03:29.567239+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
577	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:03:58.444044+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
578	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:06:50.843015+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
579	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:06:51.679795+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
580	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:09:14.659608+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
581	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:09:17.16555+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
582	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:10:03.918406+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
583	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:10:06.001632+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
584	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:12:11.316395+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
585	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:12:11.320475+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
586	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:12:13.386666+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
587	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:13:44.809609+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
588	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:22:05.425281+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
589	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:22:48.071395+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
590	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:24:01.342377+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
591	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:25:09.474262+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
592	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:25:10.371786+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
593	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:26:56.840026+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
594	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:29:40.548572+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
595	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:33:29.253745+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
596	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:34:48.980181+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
597	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:35:26.775974+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
598	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:35:28.929397+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
599	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:36:42.900082+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
600	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:36:45.824852+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
601	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:37:06.293462+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
602	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:37:08.228225+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
603	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:37:16.48097+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
604	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:37:17.075624+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
605	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:37:19.011779+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
606	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:37:38.909978+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
607	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:39:01.426464+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
608	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:43:56.865601+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
609	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:44:39.999913+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
610	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:44:40.093193+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
611	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:44:40.175303+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
612	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:44:43.982849+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
613	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:49:13.780147+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
614	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:01.357671+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	d1c51664-d812-4993-ba7e-d5c9e179af89	\N
615	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:01.391515+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	5623c169-b933-4ae9-8396-d414a6f3ab5f	\N
616	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:01.400081+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	f6d8a8bd-dc0c-411e-b727-10daee024495	\N
617	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:01.406574+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	a0646cd0-a6a7-4b37-b369-ca13e721a221	\N
618	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:01.429227+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	33bbe137-38ec-41d0-ad22-55037cbc0ea4	\N
619	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:01.475373+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	59d162d7-2acd-4fc1-8f69-c90563bcf1b4	\N
620	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:01.672084+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	0530a422-4e08-4bfa-b8b5-acb5aa9d693b	\N
621	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	1	\N
622	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	2	\N
623	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	3	\N
624	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	4	\N
625	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	5	\N
626	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	6	\N
627	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	7	\N
628	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	8	\N
629	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	9	\N
630	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:05.040383+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	1	\N
631	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:09.480685+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
632	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:10.632512+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
633	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:50:13.199679+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
634	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:51:15.91359+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
635	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:52:29.608157+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
636	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:52:34.592533+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
637	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:52:36.81085+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
638	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:53:11.967928+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
639	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:53:14.029831+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
640	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:54:58.305756+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_files	033a7930-4693-4000-a260-5b381cb47dd0	\N
641	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:55:51.493288+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_directus_files	10	\N
642	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:55:51.493288+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	3	\N
643	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:56:30.550205+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	categories	4	\N
645	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:56:30.550205+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	3	\N
646	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:56:39.165262+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
647	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:56:43.778963+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
648	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:56:44.823359+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
649	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:56:47.246437+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
650	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:57:57.926225+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
651	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:58:00.11199+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
652	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 22:58:45.212049+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
653	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:39:03.05182+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
654	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:41:31.564009+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
655	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:42:41.75744+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	43	\N
656	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:42:41.806451+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	categories_products	\N
657	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:42:41.806451+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	44	\N
658	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:42:41.88649+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	45	\N
659	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:42:41.888893+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	46	\N
660	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:43:37.128166+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	43	\N
661	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:45:30.317925+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
662	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:46:00.334347+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	34	\N
667	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:46:35.767909+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	1	\N
669	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:46:48.352549+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	2	\N
671	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:46:57.63872+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	3	\N
676	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:47:29.882813+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	1	\N
677	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:47:38.768599+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
678	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:47:40.479571+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
679	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:47:55.983907+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
680	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:50:07.663309+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
681	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:50:10.528563+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
682	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:50:10.992294+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
683	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:50:32.993928+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	34	\N
684	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:52:53.502328+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
685	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:53:56.897135+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
686	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:53:59.409948+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
687	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:54:11.014733+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
689	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:54:31.470225+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	categories	1	\N
690	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:54:38.539728+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
691	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:54:41.210673+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
692	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:54:42.812243+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
693	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:55:06.129793+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_permissions	15	\N
694	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:55:18.770352+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
695	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:55:21.465902+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
696	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:57:07.800051+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
697	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:57:09.803345+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
698	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:57:14.210957+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
700	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:59:05.845459+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	categories	1	\N
703	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:59:15.56977+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	1	\N
705	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:59:20.342187+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	2	\N
707	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:59:24.331894+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	3	\N
709	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-15 23:59:35.831774+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	1	\N
710	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:00:40.989043+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	47	\N
711	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:00:41.030594+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories_1	\N
712	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:00:41.030594+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	48	\N
713	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:00:41.089842+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	49	\N
714	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:00:41.094633+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	50	\N
715	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:00:41.115478+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	51	\N
718	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:01:19.00689+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	1	\N
719	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:01:27.03619+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
720	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:01:27.499334+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
721	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:02.366061+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_permissions	16	\N
722	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:09.693111+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_permissions	11	\N
723	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:24.886076+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories	\N
724	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:29.944671+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories_1	\N
725	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:57.351213+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	52	\N
726	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:57.395861+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories	\N
727	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:57.395861+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	53	\N
728	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:57.45866+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	54	\N
729	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:57.457877+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	55	\N
730	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:02:57.460077+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	56	\N
731	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:03:39.110846+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	52	\N
734	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:03:52.768286+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	1	\N
735	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:04:06.656983+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
736	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:04:16.549422+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_permissions	17	\N
737	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:04:19.734152+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
738	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:04:21.768842+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
739	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:05:36.366683+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	52	\N
740	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:06:30.11048+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	57	\N
741	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:06:30.150159+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	categories_products_1	\N
742	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:06:30.150159+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	58	\N
743	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:06:30.201981+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	59	\N
744	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:06:30.202518+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	60	\N
745	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:06:50.089819+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	categories_products	\N
746	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:06:53.264779+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	categories_products_1	\N
747	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:06:55.933468+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories	\N
758	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:14.446761+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	categories_products	\N
759	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:16.67882+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories	\N
748	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:07:27.805987+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	61	\N
749	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:07:27.856105+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories	\N
750	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:07:27.856105+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	62	\N
751	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:07:27.908775+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	63	\N
752	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:07:27.91004+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	64	\N
753	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:04.229888+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	65	\N
754	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:04.271668+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	categories_products	\N
755	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:04.271668+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	66	\N
756	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:04.321635+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	67	\N
757	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:04.326196+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	68	\N
760	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:42.059351+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	69	\N
761	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:42.104181+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories	\N
762	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:42.104181+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	70	\N
763	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:42.151602+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	71	\N
764	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:08:42.152617+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	72	\N
765	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:09:06.13199+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	73	\N
766	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:09:37.121481+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	69	\N
767	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:10:48.881772+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
768	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:10:49.157654+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
769	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:11:32.886759+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories	\N
770	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:11:47.649468+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	74	\N
771	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:11:47.691084+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_collections	products_categories	\N
772	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:11:47.691084+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	75	\N
773	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:11:47.745734+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	76	\N
774	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:11:47.744645+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	77	\N
775	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:11:47.745192+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_fields	78	\N
776	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:12:02.609399+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_categories	1	\N
777	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:12:02.609399+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_categories	2	\N
778	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:12:02.609399+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	1	\N
779	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:12:10.07501+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_categories	3	\N
780	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:12:10.07501+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_categories	4	\N
781	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:12:10.07501+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_categories	5	\N
782	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:12:10.07501+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_categories	6	\N
783	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:12:10.07501+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	3	\N
784	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:13:17.585596+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
785	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:13:34.605004+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	directus_permissions	18	\N
786	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:13:39.781414+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
787	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:13:42.044034+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
788	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:15:03.589926+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
789	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:16:04.550946+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
790	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:16:10.159887+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
791	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:17:05.953905+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
792	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:17:20.187794+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
793	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:18:30.834421+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
794	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:19:45.960011+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
795	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:19:47.883617+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
796	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:21:06.003581+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
797	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:22:50.44058+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
798	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:23:13.609256+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
799	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:26:15.62787+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
800	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:27:51.436953+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
801	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:28:18.668754+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
802	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:29:22.674823+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
803	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:31:33.446366+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
804	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:31:57.941229+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
805	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:32:27.984188+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
806	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:36:46.330833+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_categories	7	\N
807	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:36:46.330833+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	categories	5	\N
808	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:36:46.330833+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_categories	8	\N
809	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:36:46.330833+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products_categories	7	\N
810	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:36:46.330833+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.101 Safari/537.36	products	2	\N
811	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:36:57.361417+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
812	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:36:59.755325+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
813	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:37:02.416903+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
814	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:39:32.123815+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
815	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:39:34.593266+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
816	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:39:58.485466+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
817	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:40:00.615961+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
818	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:40:50.610768+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
819	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:40:52.860631+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
820	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:41:15.172257+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
821	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:41:17.173399+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
822	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:41:57.438642+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
823	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:41:59.686854+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
824	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:42:29.200589+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
825	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:42:32.337169+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
826	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:43:29.132481+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
827	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:43:52.145102+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
828	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:43:53.547187+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
829	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:43:56.484976+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
830	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:45:43.748926+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
831	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:45:45.882389+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
832	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 00:46:56.784386+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
833	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:26:46.666111+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
834	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:35:23.69117+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
835	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:39:05.308477+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
836	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:39:34.80309+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
837	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:39:55.351776+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
838	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:40:07.996401+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
839	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:41:29.208628+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
840	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:43:21.355451+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
841	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:44:22.283428+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
842	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:44:28.558228+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
843	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:44:41.54669+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
844	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:45:21.935872+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
845	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:48:32.515667+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
846	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:49:02.046021+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
847	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:51:00.533196+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
848	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:52:52.932591+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
849	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:56:14.090415+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
850	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:59:16.404315+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
851	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 09:59:25.075724+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
852	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-16 10:00:18.879505+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
853	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:01:56.655145+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
854	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:02:00.818863+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
855	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:03:33.547841+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
856	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:03:39.313361+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
857	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:04:06.996324+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
858	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:04:27.594308+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
859	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:04:27.675515+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
860	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:04:37.562521+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
861	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:04:37.739289+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
862	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:04:37.808653+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
863	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:09:04.378308+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
864	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:11:26.94174+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
865	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:11:29.565739+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
866	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:12:01.287521+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
867	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:14:30.045063+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
868	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:14:32.634528+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
869	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:53:48.633358+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
870	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 13:53:52.826292+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
871	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:00:36.324679+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
872	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:00:38.857157+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
873	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:00:39.629375+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
874	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:00:41.35549+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
875	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:00:42.179294+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
876	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:07:54.764156+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
877	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:08:14.095061+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
878	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:08:14.34411+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
879	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:08:55.44775+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
880	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:11:31.590606+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
881	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:12:13.839777+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
882	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:15:52.847993+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
883	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:16:24.918359+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
884	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:17:41.308918+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
885	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:17:42.588008+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
886	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:17:51.107693+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
887	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:18:50.090494+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
888	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:19:04.480964+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
889	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:19:09.023702+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
890	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:19:26.668648+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
891	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:19:41.450259+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
892	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:19:51.285166+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
893	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:20:07.563716+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
894	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:20:38.015893+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
895	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:20:39.170835+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
896	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:21:00.832118+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
897	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:21:09.446973+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
898	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:21:28.95513+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
899	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:22:50.495419+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
900	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:25:53.029197+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
901	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:25:54.411261+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
902	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:26:12.528639+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
903	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:26:50.02705+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
904	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:27:26.381628+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
905	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:27:28.609544+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
906	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:31:40.139524+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
907	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:32:16.23154+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
908	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:32:42.236584+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
909	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:33:53.123947+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
910	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:35:19.153314+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
911	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:35:21.215696+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
912	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:35:23.997356+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
913	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:36:05.616257+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
914	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:36:07.544722+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
915	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:36:40.480542+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
916	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:36:56.524571+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
917	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:38:18.900706+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
918	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:38:56.653914+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
919	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:39:36.477654+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
920	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:39:48.647552+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
921	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:39:56.423732+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
922	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:40:51.861684+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
923	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:41:00.859656+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
924	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:41:36.09183+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
925	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:41:58.875303+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
926	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:42:16.052985+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
927	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:42:30.408983+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
928	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:43:56.744603+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
929	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:43:58.130792+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
930	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:44:13.072722+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
931	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:44:32.344872+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
932	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:44:38.225399+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
933	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:44:44.199867+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
934	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:45:12.835477+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
935	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:45:34.717781+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
936	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:45:54.219674+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
937	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:46:11.01016+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
938	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:46:20.651238+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
939	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:46:31.431972+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
940	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:46:37.363875+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
941	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:46:46.109255+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
942	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:46:53.653485+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
943	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:46:59.261349+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
944	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:47:03.344914+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
945	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:47:36.880178+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
946	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:47:39.453882+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
947	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:47:55.546756+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
948	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:48:05.488026+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
949	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:48:31.172145+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
950	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:49:32.273728+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
951	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:50:32.980604+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
952	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 14:51:20.332655+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
953	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:52:57.642009+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
954	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:52:57.76033+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
955	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:52:59.717196+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
956	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:54:34.84209+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
957	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:54:41.795608+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
958	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:54:50.69937+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
959	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:54:57.490805+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
960	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:55:04.890616+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
961	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:55:56.935841+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
962	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:56:18.559386+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
963	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 15:57:11.635875+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
964	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:00:47.201968+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
965	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:01:03.238296+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
966	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:01:18.464073+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
967	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:01:56.37888+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
968	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:01:57.900752+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
969	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:04:19.56559+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
970	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:04:54.021009+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
971	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:04:56.969601+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
972	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:05:18.73037+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
973	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:10:37.105894+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
974	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:10:38.518226+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
975	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:11:00.751839+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
976	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:13:48.995905+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
977	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:13:50.357554+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
978	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:15:17.944655+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
979	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:15:36.411243+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
980	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:15:49.184485+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
981	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:16:01.499029+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
982	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:16:16.349424+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
983	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:17:47.579594+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
984	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:17:50.089429+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
985	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:17:58.821314+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
986	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:18:11.129612+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
987	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:18:28.076284+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
988	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:18:34.369296+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
989	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:18:37.910282+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
990	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:19:26.200159+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
991	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:19:46.857493+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
992	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:20:34.35278+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
993	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:21:13.426742+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
994	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:21:37.038627+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
995	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:21:48.057539+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
996	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:21:51.307173+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
997	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:22:18.127881+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
998	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:22:40.622218+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
999	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:25:44.263613+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1000	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:27:37.913384+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1001	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:29:35.871108+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1002	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:29:43.477131+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1003	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:29:56.224641+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1004	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:30:15.836296+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1005	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:30:51.299756+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1006	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:31:07.657834+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1007	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:31:31.278472+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1008	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:31:59.770726+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1009	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:32:15.82885+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1010	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:32:26.724996+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1011	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:36:15.357611+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1012	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:36:26.235416+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1013	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:36:45.09867+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1014	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:37:26.964341+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1015	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:37:34.457621+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1016	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:37:45.211701+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1017	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:37:53.735472+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1018	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:39:14.190448+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1019	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:42:14.612365+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1020	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:44:00.898799+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1021	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:45:37.810652+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1022	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:46:37.115906+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1023	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:47:08.037338+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1024	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:48:05.127191+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1025	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:48:41.62796+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1026	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:49:11.052532+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1027	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:49:22.171731+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1028	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:49:42.521518+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1029	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:49:50.301535+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1030	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:50:01.635939+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1031	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:50:33.070118+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1032	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:50:42.774047+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1033	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:51:23.073837+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1034	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:53:19.756785+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1035	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:53:33.882429+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1036	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:53:40.897933+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1037	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:53:48.686815+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1038	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:54:13.479192+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1039	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:55:14.753185+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1040	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:56:21.780142+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1041	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:57:08.226751+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1042	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:57:49.035226+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1043	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:57:58.124447+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1044	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:58:06.683415+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1045	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:58:15.337553+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1046	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:59:09.095279+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1047	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:59:23.185193+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1048	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 16:59:35.72638+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1049	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:00:16.754408+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1050	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:00:40.298463+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1051	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:01:19.869653+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1052	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:01:38.603955+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1053	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:01:46.433552+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1054	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:01:57.888459+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1055	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:02:04.981983+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1056	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:02:16.454331+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1057	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:02:20.859615+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1058	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:02:57.574855+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1059	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:03:05.082945+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1060	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:04:40.739694+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1061	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:05:13.622377+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1062	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:06:18.121664+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1063	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:07:01.813612+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1064	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:07:25.630262+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1065	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:07:49.171549+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1066	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:08:20.302769+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1067	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:08:33.155114+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1068	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:09:37.817018+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1069	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:10:06.998514+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1070	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:10:14.266976+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1071	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:10:43.880321+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1072	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:10:58.044734+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1073	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:11:41.38622+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1074	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:12:04.452315+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1075	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:12:10.295619+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1076	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:12:28.706563+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1077	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:12:40.671275+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1078	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:12:53.894853+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1079	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:13:03.008081+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1080	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:13:13.946379+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1081	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:13:23.049633+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1082	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:13:41.237079+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1083	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:14:15.270946+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1084	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:14:32.9097+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1085	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:19:38.837425+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1086	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:19:40.161792+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1087	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:20:59.069289+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1088	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:23:22.419961+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1089	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:23:39.454371+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1090	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:23:45.724013+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1091	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:23:53.033125+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1092	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:24:01.30752+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1093	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:24:41.046371+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1094	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:24:51.142013+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1095	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:25:02.896929+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1096	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:25:16.89433+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1097	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:25:39.058394+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1098	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:27:30.940617+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1099	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:27:48.249274+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1100	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:27:55.410346+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1101	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:29:23.049911+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1102	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:29:24.00636+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1103	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:29:29.273677+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1104	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:29:34.803979+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1105	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:29:43.682206+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1106	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:29:51.362974+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1107	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:29:58.254957+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1108	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:30:07.234654+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1109	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:30:11.727114+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1110	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:31:08.129649+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1111	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:31:21.916781+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1112	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:31:28.724965+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1113	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:31:39.463123+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1114	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:31:49.377958+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1115	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:38:46.592987+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1116	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:38:57.340611+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1117	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:39:07.31647+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1118	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:42:16.459904+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1119	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:42:23.900608+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1120	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:43:12.256084+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1121	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:43:34.415837+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1122	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:45:19.263259+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1123	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:45:26.763384+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1124	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:47:26.493916+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1125	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:47:46.869057+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1126	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:47:51.944149+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1127	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:48:13.47758+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1128	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:48:27.857273+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1129	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:48:37.360326+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1130	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:49:13.675927+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1131	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:52:20.751487+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1132	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:52:26.653302+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1133	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:52:52.362809+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1134	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:53:01.411357+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1135	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:53:12.276058+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1136	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:53:16.178102+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1137	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:53:38.648496+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1138	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:53:50.257503+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1139	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:53:57.791308+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1140	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:55:07.741921+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1141	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:55:56.386342+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1142	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:57:06.776025+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1143	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:57:26.670179+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1144	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 17:59:31.655692+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1145	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:01:34.563138+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1146	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:01:50.434941+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1147	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:02:09.94726+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1148	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:02:25.63019+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1149	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:02:31.15198+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1150	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:04:15.51135+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1151	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:04:17.401412+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1152	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:05:00.764327+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1153	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:05:27.656135+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1154	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:05:32.870647+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1155	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:05:54.156824+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1156	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:06:31.186015+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1157	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:08:13.949395+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1158	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:10:48.201524+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1159	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:11:07.869403+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1160	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:11:14.110766+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1161	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:11:24.813189+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1162	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:12:06.296274+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1163	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:12:35.89495+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1164	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:13:15.75773+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1165	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:13:50.590033+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1166	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:17:15.109546+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1167	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:17:33.199177+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1168	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:17:37.95116+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1169	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:17:50.89214+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1170	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:18:30.281798+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1171	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:20:11.036804+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1172	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:21:14.221439+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1173	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:22:35.961135+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1174	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:22:44.979256+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1175	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:22:48.098092+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1176	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:22:54.71864+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1177	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:26:18.276231+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1178	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:26:33.648687+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1179	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:27:14.205844+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1180	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:27:53.541759+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1181	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:28:19.481001+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1182	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:28:31.301638+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1183	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:29:54.784906+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1184	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:30:05.658837+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1185	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:30:32.29953+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1186	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:31:45.30683+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1187	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:33:49.449666+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1188	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:34:07.187167+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1189	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:34:53.767098+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1190	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:36:08.93566+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1191	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:36:25.500578+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1192	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:37:02.698824+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1193	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:37:33.957636+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1194	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:37:42.24181+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1195	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:38:04.711789+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1196	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:38:52.470397+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1197	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:39:00.1349+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1198	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:39:32.469236+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1199	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:40:41.75489+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1200	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:41:03.108272+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1201	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:41:46.689001+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1202	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:42:09.749817+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1203	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:42:28.617028+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1204	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:42:46.653685+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1205	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:43:16.997972+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1206	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:46:21.77531+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1207	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:50:47.276505+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1208	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:51:35.350695+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1209	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:52:30.738624+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1210	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:52:34.129768+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1211	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:52:55.871316+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1212	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:53:23.912419+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1213	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:53:27.839956+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1214	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:54:44.904303+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1215	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:56:06.322464+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1216	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:56:43.115381+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1217	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:57:08.257747+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1218	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:57:35.054096+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1219	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 18:58:17.489401+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1220	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 19:00:46.916324+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1221	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 19:01:18.272514+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1222	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 19:49:10.545575+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1223	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 19:53:10.441917+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1224	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 19:53:59.849986+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1225	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 19:54:03.212614+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1226	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 19:54:29.945721+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1227	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 19:54:32.04786+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1228	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 20:02:01.290335+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1229	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 20:09:03.695209+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1230	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 20:09:07.928938+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1231	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 20:12:01.017736+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1232	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 20:18:22.08219+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1233	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 20:24:07.498681+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1234	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 20:29:28.845929+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1235	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-17 20:29:34.539156+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1236	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:34:14.097162+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	53d9357e-d5e0-4ad6-90d0-dc7a2e57ae8c	\N
1237	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:34:53.49647+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	6	\N
1238	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:34:53.49647+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	9	\N
1239	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:34:53.49647+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	10	\N
1240	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:34:53.49647+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	7	\N
1241	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:34:53.49647+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	11	\N
1242	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:34:53.49647+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	4	\N
1243	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:35:55.446222+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	7	\N
1244	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:36:06.704238+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	12	\N
1245	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:36:06.704238+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	9	\N
1246	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:36:06.704238+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	6	\N
1247	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.16965+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_roles	d44694c8-9479-4272-8eee-3cf6e0bd7a67	\N
1248	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	19	\N
1249	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	20	\N
1250	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	21	\N
1251	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	22	\N
1252	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	23	\N
1253	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	24	\N
1254	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	25	\N
1255	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	26	\N
1256	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	27	\N
1257	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	28	\N
1258	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:09.204558+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	29	\N
1259	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:16.232317+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	30	\N
1260	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:22.31648+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	31	\N
1261	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:23.496806+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	32	\N
1262	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:26.685109+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	33	\N
1263	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:27.686534+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	34	\N
1264	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:28.594951+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	35	\N
1265	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:29.679535+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	36	\N
1266	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:30.480604+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	37	\N
1267	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:31.585498+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	38	\N
1268	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:32.450139+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	39	\N
1269	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:33.294436+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	40	\N
1270	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:34.043238+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	41	\N
1271	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:36.361485+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	42	\N
1272	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:37.220897+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	43	\N
1273	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:38.186353+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	44	\N
1274	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:39.055759+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_permissions	45	\N
1275	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:37:56.729575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_roles	d44694c8-9479-4272-8eee-3cf6e0bd7a67	\N
1276	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:38:43.892048+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_users	561ff389-b9ee-4551-a5d8-460d82093bfc	\N
1277	authenticate	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-19 23:39:06.228455+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_users	561ff389-b9ee-4551-a5d8-460d82093bfc	\N
1278	update	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-19 23:46:27.233498+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	11	\N
1279	update	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-19 23:46:27.233498+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	9	\N
1280	update	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-19 23:46:27.233498+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	4	\N
1281	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:47:42.286583+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1282	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:48:07.22212+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1283	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:48:51.357914+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	74	\N
1284	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:49:10.441555+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	4	\N
1285	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:49:55.271754+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	1	\N
1286	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:49:55.271754+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	2	\N
1287	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:49:55.271754+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	3	\N
1288	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	f6d8a8bd-dc0c-411e-b727-10daee024495	\N
1289	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	a0646cd0-a6a7-4b37-b369-ca13e721a221	\N
1290	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	53d9357e-d5e0-4ad6-90d0-dc7a2e57ae8c	\N
1291	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	033a7930-4693-4000-a260-5b381cb47dd0	\N
1292	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	0530a422-4e08-4bfa-b8b5-acb5aa9d693b	\N
1293	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	59d162d7-2acd-4fc1-8f69-c90563bcf1b4	\N
1294	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	33bbe137-38ec-41d0-ad22-55037cbc0ea4	\N
1295	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	f3823afc-873e-4b97-ae46-b06f19c9bd6b	\N
1296	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	9cc7df02-0672-4443-a285-99d472fc2a9c	\N
1297	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	04d834e9-796f-4e0d-b8de-ca4290172522	\N
1298	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	404c81db-212b-4806-98c1-b13cdcbc4566	\N
1299	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	d1c51664-d812-4993-ba7e-d5c9e179af89	\N
1300	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:50:37.731548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	5623c169-b933-4ae9-8396-d414a6f3ab5f	\N
1301	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:51:18.942488+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	d5eca683-11e4-4ef7-ab0d-13fc53d43a93	\N
1302	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:51:32.465028+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	5	\N
1303	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:53:12.052348+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	76	\N
1304	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:53:47.190546+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	76	\N
1305	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:55:47.545667+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	13	\N
1306	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:55:47.545667+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	14	\N
1307	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:55:47.545667+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	5	\N
1308	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:56:11.448096+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	1	\N
1309	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:56:11.448096+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	2	\N
1310	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:56:11.448096+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	3	\N
1311	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:56:11.448096+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	4	\N
1312	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:56:11.448096+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	5	\N
1313	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:56:11.448096+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	6	\N
1314	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:56:28.487192+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	8	\N
1315	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:57:20.511554+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	9	\N
1316	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:57:28.519309+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	10	\N
1317	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:58:26.634758+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	d9ef52a9-a363-430b-aa4d-7f3e42556e71	\N
1318	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:58:35.448159+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	15	\N
1319	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:58:35.448159+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	16	\N
1320	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:58:35.448159+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	17	\N
1321	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:58:35.448159+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	6	\N
1322	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:59:08.194887+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	18	\N
1323	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:59:08.194887+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	5	\N
1324	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:59:19.326387+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	6	\N
1325	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 00:00:15.669268+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	cfc63c8f-bf12-4a95-8104-273da350be8f	\N
1326	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 00:00:22.740297+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	19	\N
1327	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 00:00:22.740297+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	7	\N
1328	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 00:00:53.083651+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	5	\N
1329	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:23:41.687735+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	79	\N
1330	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:25:11.294014+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	f10c637b-a843-4362-aef4-41a17bc19dad	\N
1331	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:25:41.99967+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	0917ba65-ba7c-4c76-af36-a99da02b16f7	\N
1332	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:25:43.810216+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_directus_files	11	\N
1333	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:25:43.810216+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	11	\N
1334	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:25:43.810216+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	20	\N
1335	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:25:43.810216+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	8	\N
1336	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:26:12.665583+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	74	\N
1337	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:41:22.677274+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	21	\N
1338	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:41:22.677274+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	19	\N
1339	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:41:22.677274+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	7	\N
1340	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:49:23.619783+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	18	\N
1341	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:49:23.619783+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	12	\N
1342	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:49:23.619783+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	22	\N
1343	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:49:23.619783+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	5	\N
1344	authenticate	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:14:11.715612+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_users	561ff389-b9ee-4551-a5d8-460d82093bfc	\N
1345	update	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:14:20.323578+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_users	561ff389-b9ee-4551-a5d8-460d82093bfc	\N
1346	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:14:56.669125+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	1a3c07ca-a810-4f8d-b0f2-3a3b484442a2	\N
1347	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:15:27.693334+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	23	\N
1348	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:15:27.693334+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	24	\N
1349	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:15:27.693334+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	categories	13	\N
1350	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:15:27.693334+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	25	\N
1351	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:15:27.693334+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	9	\N
1352	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:17:11.529155+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_files	7f82fb20-b725-43f3-9d2d-982eebb223b4	\N
1353	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:17:31.705348+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	26	\N
1354	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:17:31.705348+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	27	\N
1355	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:17:31.705348+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	28	\N
1356	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:17:31.705348+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	29	\N
1357	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:17:31.705348+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	30	\N
1358	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:17:31.705348+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_categories	31	\N
1359	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:17:31.705348+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	10	\N
1360	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:24:25.447876+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_directus_files	12	\N
1361	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:24:25.447876+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_directus_files	13	\N
1362	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:24:25.447876+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_directus_files	14	\N
1363	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:24:25.447876+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_directus_files	15	\N
1364	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:24:25.447876+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_directus_files	16	\N
1365	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:24:25.447876+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_directus_files	17	\N
1366	create	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:24:25.447876+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products_directus_files	18	\N
1367	update	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:24:25.447876+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	products	10	\N
1368	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:01.552999+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1369	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.512409+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	19	\N
1370	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.519572+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	17	\N
1371	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.524715+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	16	\N
1372	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.528754+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	18	\N
1373	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.534752+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	39	\N
1374	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.538907+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	14	\N
1375	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.542685+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	15	\N
1376	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.546931+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	13	\N
1377	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.552364+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	74	\N
1378	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:44.556486+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	79	\N
1379	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.597431+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	19	\N
1380	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.602712+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	17	\N
1381	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.60697+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	16	\N
1382	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.610695+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	18	\N
1383	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.616096+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	39	\N
1384	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.620226+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	74	\N
1385	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.624091+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	14	\N
1386	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.628489+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	15	\N
1387	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.633412+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	13	\N
1388	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:46.637835+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	79	\N
1389	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.961636+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	19	\N
1390	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.966321+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	17	\N
1391	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.970149+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	16	\N
1392	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.974369+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	18	\N
1393	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.978361+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	39	\N
1394	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.982865+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	74	\N
1395	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.987622+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	79	\N
1396	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.99134+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	14	\N
1397	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.994801+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	15	\N
1398	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-21 12:18:47.998309+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36	directus_fields	13	\N
1399	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:32:50.53697+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	80	\N
1400	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:34:04.410293+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	81	\N
1401	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:37:43.512607+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1402	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:38:23.167043+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	74	\N
1403	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:38:55.4152+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	products	5	\N
1404	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:41:06.920468+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1405	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:42:38.118826+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	products	7	\N
1406	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:42:38.118826+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	products	8	\N
1407	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:42:38.118826+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	products	9	\N
1408	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:42:38.118826+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	products	10	\N
1409	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 02:42:38.263741+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1410	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 05:34:46.637038+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	products	8	\N
1411	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 18:45:24.389378+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_collections	users	\N
1412	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 20:56:04.876492+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1413	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 21:40:07.571281+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1414	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 21:44:50.75187+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1415	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:17:47.140429+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1416	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:21:16.421522+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1417	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:27:26.10243+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1418	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:27:26.157807+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	12	\N
1419	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:29:04.495856+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1420	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:29:04.529495+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	8	\N
1421	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:30:18.848688+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1422	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:30:18.886082+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	8	\N
1423	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:30:27.261375+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1424	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:30:27.289932+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	12	\N
1425	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:33:29.150161+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1426	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:33:29.22402+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	12	\N
1427	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:36:50.364989+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1428	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:36:50.402041+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	12	\N
1429	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:37:27.19359+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1430	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:37:27.228198+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	12	\N
1431	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:37:39.638901+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1432	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:37:39.680682+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	12	\N
1433	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:38:06.554237+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1434	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:38:06.588754+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	12	\N
1435	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:41:03.485801+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1436	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:41:03.537082+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	12	\N
1437	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:42:00.34966+08	::ffff:127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1438	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-24 22:42:00.387425+08	127.0.0.1	node-fetch/1.0 (+https://github.com/bitinn/node-fetch)	products	8	\N
1439	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-26 19:50:53.522012+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	categories	14	\N
1440	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-26 19:51:44.272453+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	categories	15	\N
1441	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 16:57:11.906695+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1442	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 16:58:22.690551+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1443	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:01:27.155575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1444	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:02:40.44331+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1445	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:02:58.031678+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1446	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:04:53.608555+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1447	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:05:20.116615+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1448	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:06:16.976596+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_collections	test	\N
1449	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:06:16.976596+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	83	\N
1450	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:07:17.15868+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	84	\N
1451	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:08:27.030102+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	84	\N
1452	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:09:07.62706+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	84	\N
1453	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:09:36.824041+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	84	\N
1455	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:10:08.732811+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	84	\N
1456	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:10:58.817928+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	84	\N
1457	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:20:45.90345+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	85	\N
1459	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:23:03.827388+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	85	\N
1461	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:24:14.121598+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	85	\N
1462	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:25:02.659297+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	85	\N
1463	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:26:23.428924+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	85	\N
1464	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:27:13.095009+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	85	\N
1466	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:27:58.927462+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_permissions	46	\N
1467	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:30:24.911598+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	85	\N
1468	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:30:49.045827+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	85	\N
1469	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:31:01.690698+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	85	\N
1470	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:37:39.206321+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1471	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:37:45.457862+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1472	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:39:00.549615+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	82	\N
1473	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:43:05.599648+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	86	\N
1474	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:43:52.779107+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	products	8	\N
1475	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:46:22.980655+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	86	\N
1476	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:46:39.116762+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	86	\N
1477	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:48:38.189327+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	directus_fields	87	\N
1478	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 17:49:10.06575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	products	8	\N
1479	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-28 18:38:25.398982+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36	products	10	\N
1480	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:41:49.006736+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_webhooks	1	\N
1481	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:42:17.852233+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_webhooks	1	\N
1482	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:46:16.666453+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_files	303497c1-8bd8-4a7d-ae7b-70162fda89f1	\N
1483	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:46:33.326135+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	32	\N
1484	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:46:33.326135+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	33	\N
1485	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:46:33.326135+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	11	\N
1486	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:48:11.485922+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	11	\N
1487	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:48:34.174747+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	12	\N
1488	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:49:48.27341+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	12	\N
1489	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:50:03.642031+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_files	86d4b808-9719-41fd-83bb-7ebc4195bc6c	\N
1490	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:50:45.440226+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	34	\N
1491	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:50:45.440226+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	35	\N
1492	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:50:45.440226+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	categories	16	\N
1493	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:50:45.440226+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	36	\N
1494	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:50:45.440226+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	13	\N
1495	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:54:06.247545+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_files	f392a698-f64b-4084-a5cc-6b82082e3977	\N
1496	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:54:15.760112+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_files	4d8df203-e142-45dc-b825-658fc01763ac	\N
1497	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:54:15.762798+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_files	2d512394-43e8-44d8-8c11-dcecd6f76bb1	\N
1498	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:55:17.760293+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_directus_files	19	\N
1499	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:55:17.760293+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_directus_files	20	\N
1500	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:55:17.760293+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	37	\N
1501	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:55:17.760293+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	38	\N
1502	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:55:17.760293+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	categories	17	\N
1503	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:55:17.760293+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	39	\N
1504	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:55:17.760293+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	14	\N
1505	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	40	\N
1506	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	41	\N
1507	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	42	\N
1508	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	43	\N
1509	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	44	\N
1510	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	45	\N
1511	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	46	\N
1512	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	47	\N
1513	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	48	\N
1514	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_categories	49	\N
1515	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:57:49.011575+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	15	\N
1516	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:59:50.411062+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_files	cc5509ea-08e4-4218-a490-e7d7361cee33	\N
1517	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:59:55.854801+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_directus_files	21	\N
1518	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:59:55.854801+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_directus_files	22	\N
1519	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:59:55.854801+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products_directus_files	23	\N
1520	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:59:55.854801+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	15	\N
1521	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 22:32:47.965965+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_fields	18	\N
1522	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-03 15:03:30.758105+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	10	\N
1523	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-03 15:04:17.390698+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	13	\N
1524	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-03 15:04:17.390698+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	8	\N
1525	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-03 15:05:14.689589+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	9	\N
1526	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-03 15:05:14.689589+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	14	\N
1527	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-03 15:05:19.977521+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	7	\N
1529	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-03 15:09:17.183338+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	5	\N
1530	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-10 14:28:30.41129+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_fields	87	\N
1531	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-10 14:29:01.776499+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_fields	87	\N
1532	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-10 14:29:14.159548+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	15	\N
1533	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-10 14:31:17.227047+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_files	94ae648c-94ca-4335-bae4-8cb4dc849db4	\N
1534	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-10 14:31:26.522554+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	16	\N
1535	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-10 14:33:05.609577+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	16	\N
1536	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-13 18:04:11.474006+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	directus_fields	88	\N
1537	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-13 18:05:30.018955+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36	products	16	\N
1538	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:35.757683+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	89	\N
1539	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.414819+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	19	\N
1540	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.420028+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	17	\N
1541	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.424653+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	16	\N
1542	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.42873+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	89	\N
1543	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.432088+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	39	\N
1544	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.436509+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	79	\N
1545	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.441002+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	14	\N
1546	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.444194+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	15	\N
1547	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.447295+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	13	\N
1548	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.451087+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	18	\N
1549	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.455721+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	74	\N
1550	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.459166+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	87	\N
1551	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:40.462487+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	88	\N
1552	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:03:57.139365+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	89	\N
1553	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-22 12:08:18.081988+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	products	16	\N
1554	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-24 18:47:32.921297+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36	products	16	\N
1555	authenticate	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-08-06 17:42:10.959996+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_users	36214230-3431-4f3f-8c99-1f66e0019bdc	\N
1556	create	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-08-06 17:42:59.889448+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_fields	90	\N
1557	delete	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-08-06 17:43:17.348195+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	directus_collections	test	\N
1558	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-08-06 17:52:44.771987+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	products	16	\N
1559	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-08-06 17:53:10.379288+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	products	15	\N
1560	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-08-06 17:57:59.261394+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	products	15	\N
1561	update	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-08-06 18:02:47.687368+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36	products	15	\N
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color) FROM stdin;
products	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N
categories	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N
products_directus_files	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N
products_categories	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, "group", translations, note) FROM stdin;
88	products	seo	json	list	{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","interface":"input"}},{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","interface":"input"}}]}	raw	\N	f	f	13	full	\N	\N	\N
76	categories	products	m2m	list-m2m	\N	related-values	\N	f	f	\N	full	\N	\N	\N
89	products	sale_price	\N	input	{"min":0,"step":"0.01"}	raw	\N	f	f	4	full	\N	\N	\N
90	products	hidden	boolean	boolean	\N	boolean	{"labelOn":"Hidden","labelOff":"Shown"}	f	f	\N	full	\N	\N	Whether the product is hidden or not
19	products	name	\N	input	\N	raw	\N	f	f	1	full	\N	\N	\N
17	products	description	\N	input-rich-text-html	\N	formatted-value	\N	f	f	2	full	\N	\N	\N
16	products	price	\N	input	{"min":0}	raw	\N	f	f	3	full	\N	\N	\N
39	products	secondary_images	files	list-m2m	{"template":"{{directus_files_id.id}}"}	related-values	\N	f	f	5	full	\N	\N	\N
79	products	featured	boolean	\N	\N	raw	\N	f	f	6	full	\N	\N	\N
14	products	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N
15	products	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	8	half	\N	\N	\N
13	products	id	\N	input	\N	\N	\N	t	t	9	full	\N	\N	\N
18	products	image	\N	file-image	\N	image	\N	f	f	10	full	\N	\N	\N
74	products	categories	m2m	list-m2m	{"template":"{{categories_id.name}}"}	related-values	{"template":"{{categories_id.name}}"}	f	f	11	full	\N	\N	\N
24	categories	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N
25	categories	name	\N	input	\N	raw	\N	f	f	\N	full	\N	\N	\N
87	products	custom_fields	json	list	{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","width":"full","type":"string","note":"Name of custom field (Example: \\"size\\", \\"color\\", \\"shape\\")","interface":"input"}},{"field":"options","name":"options","type":"json","meta":{"field":"options","width":"full","type":"json","note":"Available options for field","interface":"tags"}}]}	raw	\N	f	f	12	full	\N	\N	\N
40	products_directus_files	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N
41	products_directus_files	products_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N
42	products_directus_files	directus_files_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N
75	products_categories	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N
77	products_categories	products_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N
78	products_categories	categories_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
1a3c07ca-a810-4f8d-b0f2-3a3b484442a2	local	1a3c07ca-a810-4f8d-b0f2-3a3b484442a2.png	m0bv61rf4im51.png	M0bv61rf4im51	image/png	\N	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:14:56.669125+08	\N	2021-06-21 01:14:57.102+08	\N	12397646	3840	2160	\N	\N	\N	\N	\N	{}
7f82fb20-b725-43f3-9d2d-982eebb223b4	local	7f82fb20-b725-43f3-9d2d-982eebb223b4.jpeg	bp2hrqbemwc61.jpg	Bp2hrqbemwc61	image/jpeg	\N	561ff389-b9ee-4551-a5d8-460d82093bfc	2021-06-21 01:17:11.529155+08	\N	2021-06-21 01:17:11.579+08	\N	451808	2348	4175	\N	\N	\N	\N	\N	{}
303497c1-8bd8-4a7d-ae7b-70162fda89f1	local	303497c1-8bd8-4a7d-ae7b-70162fda89f1.png	hx9kjvmx37871.png	Hx9kjvmx37871	image/png	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:46:16.666453+08	\N	2021-07-01 21:46:17.53+08	\N	9608421	5120	2880	\N	\N	\N	\N	\N	{"icc":{"version":"2.1","intent":"Perceptual","cmm":"Lino","deviceClass":"Monitor","colorSpace":"RGB","connectionSpace":"XYZ","platform":"Microsoft","manufacturer":"IEC","model":"sRGB","creator":"HP","copyright":"Copyright (c) 1998 Hewlett-Packard C","description":"sRGB IEC61966-2.1","deviceModelDescription":"IEC 61966-2.1 Default RGB colour space - sRGB","viewingConditionsDescription":"Reference Viewing Condition in IEC61966-2.1"}}
86d4b808-9719-41fd-83bb-7ebc4195bc6c	local	86d4b808-9719-41fd-83bb-7ebc4195bc6c.png	hx9kjvmx37871.png	Hx9kjvmx37871	image/png	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:50:03.642031+08	\N	2021-07-01 21:50:03.785+08	\N	9608421	5120	2880	\N	\N	\N	\N	\N	{"icc":{"version":"2.1","intent":"Perceptual","cmm":"Lino","deviceClass":"Monitor","colorSpace":"RGB","connectionSpace":"XYZ","platform":"Microsoft","manufacturer":"IEC","model":"sRGB","creator":"HP","copyright":"Copyright (c) 1998 Hewlett-Packard C","description":"sRGB IEC61966-2.1","deviceModelDescription":"IEC 61966-2.1 Default RGB colour space - sRGB","viewingConditionsDescription":"Reference Viewing Condition in IEC61966-2.1"}}
f392a698-f64b-4084-a5cc-6b82082e3977	local	f392a698-f64b-4084-a5cc-6b82082e3977.jpeg	Vladimir-Putin-HD-Desktop.jpg	Vladimir Putin HD Desktop	image/jpeg	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:54:06.247545+08	\N	2021-07-01 21:54:06.301+08	\N	515621	2000	1000	\N	\N	\N	\N	\N	{}
2d512394-43e8-44d8-8c11-dcecd6f76bb1	local	2d512394-43e8-44d8-8c11-dcecd6f76bb1.png	biotoday-maple-syrup.png	Biotoday Maple Syrup	image/png	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:54:15.762798+08	\N	2021-07-01 21:54:15.785+08	\N	380840	1100	720	\N	\N	\N	\N	\N	{}
4d8df203-e142-45dc-b825-658fc01763ac	local	4d8df203-e142-45dc-b825-658fc01763ac.jpeg	maple-syrup-732x549-thumbnail.jpg	Maple Syrup 732x549 Thumbnail	image/jpeg	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:54:15.760112+08	\N	2021-07-01 21:54:15.813+08	\N	129660	732	549	\N	\N	\N	\N	\N	{"exif":{"image":{}},"iptc":{}}
d5eca683-11e4-4ef7-ab0d-13fc53d43a93	local	d5eca683-11e4-4ef7-ab0d-13fc53d43a93.jpeg	e7kyrc43cq471.jpg	E7kyrc43cq471	image/jpeg	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:51:18.942488+08	\N	2021-06-19 23:51:19.105+08	\N	597998	2000	1422	\N	\N	\N	\N	\N	{}
d9ef52a9-a363-430b-aa4d-7f3e42556e71	local	d9ef52a9-a363-430b-aa4d-7f3e42556e71.jpeg	bp2hrqbemwc61.jpg	Bp2hrqbemwc61	image/jpeg	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-19 23:58:26.634758+08	\N	2021-06-19 23:58:26.654+08	\N	451808	2348	4175	\N	\N	\N	\N	\N	{}
cfc63c8f-bf12-4a95-8104-273da350be8f	local	cfc63c8f-bf12-4a95-8104-273da350be8f.jpeg	ST_20160823_NATHAN23_2541950.jpg	St 20160823 Natha N23 2541950	image/jpeg	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 00:00:15.669268+08	\N	2021-06-20 00:00:15.678+08	\N	80172	860	573	\N	\N	\N	\N	\N	{}
f10c637b-a843-4362-aef4-41a17bc19dad	local	f10c637b-a843-4362-aef4-41a17bc19dad.png	biotoday-maple-syrup.png	Biotoday Maple Syrup	image/png	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:25:11.294014+08	\N	2021-06-20 14:25:11.453+08	\N	380840	1100	720	\N	\N	\N	\N	\N	{}
0917ba65-ba7c-4c76-af36-a99da02b16f7	local	0917ba65-ba7c-4c76-af36-a99da02b16f7.jpeg	maple-syrup-732x549-thumbnail.jpg	Maple Syrup 732x549 Thumbnail	image/jpeg	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-06-20 14:25:41.99967+08	\N	2021-06-20 14:25:42.02+08	\N	129660	732	549	\N	\N	\N	\N	\N	{"exif":{"image":{}},"iptc":{}}
cc5509ea-08e4-4218-a490-e7d7361cee33	local	cc5509ea-08e4-4218-a490-e7d7361cee33.jpeg	starry_night_full.jpg	Starry Night Full	image/jpeg	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-01 21:59:50.411062+08	\N	2021-07-01 21:59:50.436+08	\N	434357	1280	1014	\N	\N	\N	\N	\N	{}
94ae648c-94ca-4335-bae4-8cb4dc849db4	local	94ae648c-94ca-4335-bae4-8cb4dc849db4.jpeg	pac6hwtyzkn61.jpg	Pac6hwtyzkn61	image/jpeg	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-07-10 14:31:17.227047+08	\N	2021-07-10 14:31:17.363+08	\N	442409	1794	3505	\N	\N	\N	\N	\N	{"icc":{"version":"2.1","intent":"Perceptual","cmm":"lcms","deviceClass":"Monitor","colorSpace":"RGB","connectionSpace":"XYZ","platform":"Apple","creator":"lcms","description":"c2","copyright":""}}
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2021-06-10 20:36:23.195161+08
20201029A	Remove System Relations	2021-06-10 20:36:23.200199+08
20201029B	Remove System Collections	2021-06-10 20:36:23.202605+08
20201029C	Remove System Fields	2021-06-10 20:36:23.210956+08
20201105A	Add Cascade System Relations	2021-06-10 20:36:23.253347+08
20201105B	Change Webhook URL Type	2021-06-10 20:36:23.256854+08
20210225A	Add Relations Sort Field	2021-06-10 20:36:23.260477+08
20210304A	Remove Locked Fields	2021-06-10 20:36:23.263392+08
20210312A	Webhooks Collections Text	2021-06-10 20:36:23.267348+08
20210331A	Add Refresh Interval	2021-06-10 20:36:23.270217+08
20210415A	Make Filesize Nullable	2021-06-10 20:36:23.273742+08
20210416A	Add Collections Accountability	2021-06-10 20:36:23.278278+08
20210422A	Remove Files Interface	2021-06-10 20:36:23.281169+08
20210506A	Rename Interfaces	2021-06-10 20:36:23.305523+08
20210510A	Restructure Relations	2021-06-10 20:36:23.325506+08
20210518A	Add Foreign Key Constraints	2021-06-10 20:36:23.33931+08
20210519A	Add System Fk Triggers	2021-06-10 20:36:23.358848+08
20210521A	Add Collections Icon Color	2021-06-10 20:36:23.36177+08
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields, "limit") FROM stdin;
10	\N	products	read	\N	\N	\N	*	\N
12	\N	categories	read	\N	\N	\N	*	\N
13	\N	products_directus_files	read	\N	\N	\N	*	\N
14	\N	directus_files	read	\N	\N	\N	*	\N
18	\N	products_categories	read	\N	\N	\N	*	\N
19	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_files	create	{}	\N	\N	*	\N
20	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_files	read	{}	\N	\N	*	\N
21	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_files	update	{}	\N	\N	*	\N
22	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_files	delete	{}	\N	\N	*	\N
23	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_folders	create	{}	\N	\N	*	\N
24	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_folders	read	{}	\N	\N	*	\N
25	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_folders	update	{}	\N	\N	*	\N
26	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_folders	delete	{}	\N	\N	\N	\N
27	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_users	read	{}	\N	\N	*	\N
28	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_users	update	{"id":{"_eq":"$CURRENT_USER"}}	\N	\N	first_name,last_name,email,password,location,title,description,avatar,language,theme	\N
29	d44694c8-9479-4272-8eee-3cf6e0bd7a67	directus_roles	read	{}	\N	\N	*	\N
30	d44694c8-9479-4272-8eee-3cf6e0bd7a67	categories	create	\N	\N	\N	*	\N
31	d44694c8-9479-4272-8eee-3cf6e0bd7a67	categories	read	\N	\N	\N	*	\N
32	d44694c8-9479-4272-8eee-3cf6e0bd7a67	categories	update	\N	\N	\N	*	\N
33	d44694c8-9479-4272-8eee-3cf6e0bd7a67	categories	delete	\N	\N	\N	*	\N
34	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products	create	\N	\N	\N	*	\N
35	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products	read	\N	\N	\N	*	\N
36	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products	update	\N	\N	\N	*	\N
37	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products	delete	\N	\N	\N	*	\N
38	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products_categories	delete	\N	\N	\N	*	\N
39	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products_categories	update	\N	\N	\N	*	\N
40	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products_categories	read	\N	\N	\N	*	\N
41	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products_categories	create	\N	\N	\N	*	\N
42	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products_directus_files	create	\N	\N	\N	*	\N
43	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products_directus_files	read	\N	\N	\N	*	\N
44	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products_directus_files	update	\N	\N	\N	*	\N
45	d44694c8-9479-4272-8eee-3cf6e0bd7a67	products_directus_files	delete	\N	\N	\N	*	\N
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, filters, layout, layout_query, layout_options, refresh_interval) FROM stdin;
2	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	\N	products	\N	\N	tabular	{"tabular":{"fields":["id","name","description","image","price","categories","secondary_images","featured","quantity","date_created","date_updated","options","custom_fields","hidden"],"page":1,"sort":"-featured"}}	{"calendar":{"viewInfo":{"type":"dayGridMonth","startDateStr":"2021-06-01T00:00:00+08:00"}},"tabular":{"widths":{"id":75,"image":100,"price":109,"categories":119,"secondary_images":152,"featured":115,"date_created":133}}}	\N
3	\N	36214230-3431-4f3f-8c99-1f66e0019bdc	\N	categories	\N	\N	tabular	{"tabular":{"fields":["id","name","products"]}}	\N	\N
4	\N	561ff389-b9ee-4551-a5d8-460d82093bfc	\N	products	\N	\N	tabular	{"tabular":{"fields":["description","image","name","price","featured"]}}	\N	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
28	products_categories	categories_id	categories	products	\N	\N	products_id	\N	delete
3	products	image	directus_files	\N	\N	\N	\N	\N	nullify
13	products_directus_files	directus_files_id	directus_files	\N	\N	\N	products_id	\N	nullify
12	products_directus_files	products_id	products	secondary_images	\N	\N	directus_files_id	\N	nullify
29	products_categories	products_id	products	categories	\N	\N	categories_id	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
5	118	products	1	{"name":"Starry Night Painting","description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","price":"79.99","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","id":1}	{"name":"Starry Night Painting","description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","price":"79.99","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","id":1}	\N
6	188	products	2	{"name":"Anime Girl Poster","description":"<p>A cute little anime girl poster</p>","price":"15.99","image":"9cc7df02-0672-4443-a285-99d472fc2a9c","id":2}	{"name":"Anime Girl Poster","description":"<p>A cute little anime girl poster</p>","price":"15.99","image":"9cc7df02-0672-4443-a285-99d472fc2a9c","id":2}	\N
9	216	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T12:19:20+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","images2":[1,2]}	{"date_updated":"2021-06-15T04:19:20.060Z"}	\N
10	235	categories	1	{"name":"paintings","id":1}	{"name":"paintings","id":1}	\N
11	236	categories	2	{"name":"furniture","id":2}	{"name":"furniture","id":2}	\N
12	237	categories	3	{"name":"food","id":3}	{"name":"food","id":3}	\N
87	806	products_categories	7	{"products_id":2,"categories_id":5,"id":7}	{"products_id":2,"categories_id":5,"id":7}	88
15	245	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T12:28:25+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","categories":[1,2]}	{"date_updated":"2021-06-15T04:28:25.930Z"}	\N
28	395	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T16:26:05+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","categories":[1,2],"secondary_images":[1,2]}	{"date_updated":"2021-06-15T08:26:05.144Z"}	\N
26	393	products_directus_files	1	{"directus_files_id":"404c81db-212b-4806-98c1-b13cdcbc4566","products_id":"1","id":1}	{"directus_files_id":"404c81db-212b-4806-98c1-b13cdcbc4566","products_id":"1","id":1}	28
88	807	categories	5	{"name":"miscellaneous","products":[{"products_id":2}],"id":5}	{"name":"miscellaneous","products":[{"products_id":2}],"id":5}	89
17	247	products	2	{"id":2,"date_created":"2021-06-15T12:09:18+08:00","date_updated":"2021-06-15T12:28:33+08:00","price":15.99,"description":"<p>A cute little anime girl poster</p>","image":"9cc7df02-0672-4443-a285-99d472fc2a9c","name":"Anime Girl Poster","categories":[3]}	{"date_updated":"2021-06-15T04:28:33.108Z"}	\N
27	394	products_directus_files	2	{"directus_files_id":"04d834e9-796f-4e0d-b8de-ca4290172522","products_id":"1","id":2}	{"directus_files_id":"04d834e9-796f-4e0d-b8de-ca4290172522","products_id":"1","id":2}	28
91	810	products	2	{"id":2,"date_created":"2021-06-15T12:09:18+08:00","date_updated":"2021-06-16T00:36:46+08:00","price":15.99,"description":"<p>A cute little anime girl poster</p>","image":"9cc7df02-0672-4443-a285-99d472fc2a9c","name":"Anime Girl Poster","secondary_images":[],"categories":[8]}	{"date_updated":"2021-06-15T16:36:46.331Z"}	\N
22	264	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T12:31:29+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","categories":[4,5]}	{"date_updated":"2021-06-15T04:31:29.835Z"}	\N
30	430	products	2	{"id":2,"date_created":"2021-06-15T12:09:18+08:00","date_updated":"2021-06-15T17:26:55+08:00","price":15.99,"description":"<p>A cute little anime girl poster</p>","image":"9cc7df02-0672-4443-a285-99d472fc2a9c","name":"Anime Girl Poster","categories":[3],"secondary_images":[]}	{"date_updated":"2021-06-15T09:26:55.024Z"}	\N
25	283	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T12:38:21+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","categories":[1,2]}	{"date_updated":"2021-06-15T04:38:21.285Z"}	\N
31	621	products_directus_files	1	{"id":1,"products_id":1,"directus_files_id":"404c81db-212b-4806-98c1-b13cdcbc4566"}	{"products_id":"1"}	40
32	622	products_directus_files	2	{"id":2,"products_id":1,"directus_files_id":"04d834e9-796f-4e0d-b8de-ca4290172522"}	{"products_id":"1"}	40
59	676	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T23:47:29+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","secondary_images":[1,2,3,4,5,6,7,8,9],"categories":[7,8]}	{"date_updated":"2021-06-15T15:47:29.883Z"}	\N
63	700	categories	1	{"id":1,"name":"paintings","products":[]}	{}	\N
66	703	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T23:59:15+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","secondary_images":[1,2,3,4,5,6,7,8,9],"categories":[]}	{"date_updated":"2021-06-15T15:59:15.569Z"}	\N
40	630	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T22:50:05+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","categories":[1,2],"secondary_images":[1,2,3,4,5,6,7,8,9]}	{"date_updated":"2021-06-15T14:50:05.040Z"}	\N
33	623	products_directus_files	3	{"directus_files_id":"d1c51664-d812-4993-ba7e-d5c9e179af89","products_id":"1","id":3}	{"directus_files_id":"d1c51664-d812-4993-ba7e-d5c9e179af89","products_id":"1","id":3}	40
34	624	products_directus_files	4	{"directus_files_id":"5623c169-b933-4ae9-8396-d414a6f3ab5f","products_id":"1","id":4}	{"directus_files_id":"5623c169-b933-4ae9-8396-d414a6f3ab5f","products_id":"1","id":4}	40
35	625	products_directus_files	5	{"directus_files_id":"f6d8a8bd-dc0c-411e-b727-10daee024495","products_id":"1","id":5}	{"directus_files_id":"f6d8a8bd-dc0c-411e-b727-10daee024495","products_id":"1","id":5}	40
36	626	products_directus_files	6	{"directus_files_id":"a0646cd0-a6a7-4b37-b369-ca13e721a221","products_id":"1","id":6}	{"directus_files_id":"a0646cd0-a6a7-4b37-b369-ca13e721a221","products_id":"1","id":6}	40
37	627	products_directus_files	7	{"directus_files_id":"33bbe137-38ec-41d0-ad22-55037cbc0ea4","products_id":"1","id":7}	{"directus_files_id":"33bbe137-38ec-41d0-ad22-55037cbc0ea4","products_id":"1","id":7}	40
38	628	products_directus_files	8	{"directus_files_id":"59d162d7-2acd-4fc1-8f69-c90563bcf1b4","products_id":"1","id":8}	{"directus_files_id":"59d162d7-2acd-4fc1-8f69-c90563bcf1b4","products_id":"1","id":8}	40
39	629	products_directus_files	9	{"directus_files_id":"0530a422-4e08-4bfa-b8b5-acb5aa9d693b","products_id":"1","id":9}	{"directus_files_id":"0530a422-4e08-4bfa-b8b5-acb5aa9d693b","products_id":"1","id":9}	40
42	642	products	3	{"name":"Lorem Ipsum","description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at egestas nibh, quis aliquet metus. Nam ullamcorper interdum enim quis rhoncus. Aliquam ultrices, nisi ac pellentesque consequat, ipsum sapien hendrerit leo, semper tempus diam est suscipit dolor. Ut semper laoreet lorem, a eleifend dolor tempus quis. Nunc at aliquet massa. Vivamus et ullamcorper sapien. Suspendisse placerat mauris imperdiet, ultricies mi et, facilisis nulla. Duis dui nibh, vulputate id commodo non, cursus id odio. Integer a elementum nibh.</p>","price":"99.99","image":"033a7930-4693-4000-a260-5b381cb47dd0","categories":[],"secondary_images":[{"directus_files_id":"f6d8a8bd-dc0c-411e-b727-10daee024495"}],"id":3}	{"name":"Lorem Ipsum","description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at egestas nibh, quis aliquet metus. Nam ullamcorper interdum enim quis rhoncus. Aliquam ultrices, nisi ac pellentesque consequat, ipsum sapien hendrerit leo, semper tempus diam est suscipit dolor. Ut semper laoreet lorem, a eleifend dolor tempus quis. Nunc at aliquet massa. Vivamus et ullamcorper sapien. Suspendisse placerat mauris imperdiet, ultricies mi et, facilisis nulla. Duis dui nibh, vulputate id commodo non, cursus id odio. Integer a elementum nibh.</p>","price":"99.99","image":"033a7930-4693-4000-a260-5b381cb47dd0","categories":[],"secondary_images":[{"directus_files_id":"f6d8a8bd-dc0c-411e-b727-10daee024495"}],"id":3}	\N
41	641	products_directus_files	10	{"directus_files_id":"f6d8a8bd-dc0c-411e-b727-10daee024495","products_id":3,"id":10}	{"directus_files_id":"f6d8a8bd-dc0c-411e-b727-10daee024495","products_id":3,"id":10}	42
89	808	products_categories	8	{"categories_id":{"name":"miscellaneous","products":[{"products_id":2}]},"products_id":"2","id":8}	{"categories_id":{"name":"miscellaneous","products":[{"products_id":2}]},"products_id":"2","id":8}	91
90	809	products_categories	7	{"id":7,"products_id":null,"categories_id":5}	{"products_id":null}	91
45	645	products	3	{"id":3,"date_created":"2021-06-15T22:55:51+08:00","date_updated":"2021-06-15T22:56:30+08:00","price":99.99,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at egestas nibh, quis aliquet metus. Nam ullamcorper interdum enim quis rhoncus. Aliquam ultrices, nisi ac pellentesque consequat, ipsum sapien hendrerit leo, semper tempus diam est suscipit dolor. Ut semper laoreet lorem, a eleifend dolor tempus quis. Nunc at aliquet massa. Vivamus et ullamcorper sapien. Suspendisse placerat mauris imperdiet, ultricies mi et, facilisis nulla. Duis dui nibh, vulputate id commodo non, cursus id odio. Integer a elementum nibh.</p>","image":"033a7930-4693-4000-a260-5b381cb47dd0","name":"Lorem Ipsum","categories":[4],"secondary_images":[10]}	{"date_updated":"2021-06-15T14:56:30.550Z"}	\N
100	1246	categories	6	{"id":6,"name":"anime","products":[9,12]}	{}	\N
98	1244	products_categories	12	{"products_id":2,"categories_id":"6","id":12}	{"products_id":2,"categories_id":"6","id":12}	100
99	1245	products_categories	9	{"id":9,"products_id":4,"categories_id":6}	{"categories_id":"6"}	100
50	667	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T23:46:35+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","secondary_images":[1,2,3,4,5,6,7,8,9],"categories":[5,6]}	{"date_updated":"2021-06-15T15:46:35.768Z"}	\N
105	1305	products_categories	13	{"categories_id":1,"products_id":"5","id":13}	{"categories_id":1,"products_id":"5","id":13}	107
106	1306	products_categories	14	{"categories_id":6,"products_id":"5","id":14}	{"categories_id":6,"products_id":"5","id":14}	107
108	1314	categories	8	{"name":"anime","id":8}	{"name":"anime","id":8}	\N
52	669	products	2	{"id":2,"date_created":"2021-06-15T12:09:18+08:00","date_updated":"2021-06-15T23:46:48+08:00","price":15.99,"description":"<p>A cute little anime girl poster</p>","image":"9cc7df02-0672-4443-a285-99d472fc2a9c","name":"Anime Girl Poster","secondary_images":[],"categories":[3]}	{"date_updated":"2021-06-15T15:46:48.352Z"}	\N
109	1315	categories	9	{"name":"furniture","id":9}	{"name":"furniture","id":9}	\N
54	671	products	3	{"id":3,"date_created":"2021-06-15T22:55:51+08:00","date_updated":"2021-06-15T23:46:57+08:00","price":99.99,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at egestas nibh, quis aliquet metus. Nam ullamcorper interdum enim quis rhoncus. Aliquam ultrices, nisi ac pellentesque consequat, ipsum sapien hendrerit leo, semper tempus diam est suscipit dolor. Ut semper laoreet lorem, a eleifend dolor tempus quis. Nunc at aliquet massa. Vivamus et ullamcorper sapien. Suspendisse placerat mauris imperdiet, ultricies mi et, facilisis nulla. Duis dui nibh, vulputate id commodo non, cursus id odio. Integer a elementum nibh.</p>","image":"033a7930-4693-4000-a260-5b381cb47dd0","name":"Lorem Ipsum","secondary_images":[10],"categories":[4]}	{"date_updated":"2021-06-15T15:46:57.638Z"}	\N
61	689	categories	1	{"id":1,"name":"paintings","products":[1]}	{}	\N
43	643	categories	4	{"name":"people","id":4}	{"name":"people","id":4}	\N
68	705	products	2	{"id":2,"date_created":"2021-06-15T12:09:18+08:00","date_updated":"2021-06-15T23:59:20+08:00","price":15.99,"description":"<p>A cute little anime girl poster</p>","image":"9cc7df02-0672-4443-a285-99d472fc2a9c","name":"Anime Girl Poster","secondary_images":[],"categories":[]}	{"date_updated":"2021-06-15T15:59:20.342Z"}	\N
92	1237	categories	6	{"name":"anime","id":6}	{"name":"anime","id":6}	93
70	707	products	3	{"id":3,"date_created":"2021-06-15T22:55:51+08:00","date_updated":"2021-06-15T23:59:24+08:00","price":99.99,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at egestas nibh, quis aliquet metus. Nam ullamcorper interdum enim quis rhoncus. Aliquam ultrices, nisi ac pellentesque consequat, ipsum sapien hendrerit leo, semper tempus diam est suscipit dolor. Ut semper laoreet lorem, a eleifend dolor tempus quis. Nunc at aliquet massa. Vivamus et ullamcorper sapien. Suspendisse placerat mauris imperdiet, ultricies mi et, facilisis nulla. Duis dui nibh, vulputate id commodo non, cursus id odio. Integer a elementum nibh.</p>","image":"033a7930-4693-4000-a260-5b381cb47dd0","name":"Lorem Ipsum","secondary_images":[10],"categories":[]}	{"date_updated":"2021-06-15T15:59:24.332Z"}	\N
94	1239	products_categories	10	{"products_id":2,"categories_id":7,"id":10}	{"products_id":2,"categories_id":7,"id":10}	95
72	709	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-15T23:59:35+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","secondary_images":[1,2,3,4,5,6,7,8,9],"categories":[9]}	{"date_updated":"2021-06-15T15:59:35.831Z"}	\N
95	1240	categories	7	{"name":"anime","products":[{"products_id":2}],"id":7}	{"name":"anime","products":[{"products_id":2}],"id":7}	96
97	1242	products	4	{"name":"Anime tiddies","description":"<p>These are some cool <strong><em>tiddies</em></strong></p>","price":"1","image":"53d9357e-d5e0-4ad6-90d0-dc7a2e57ae8c","categories":[{"categories_id":{"name":"anime"}},{"categories_id":{"name":"anime","products":[{"products_id":2}]}}],"id":4}	{"name":"Anime tiddies","description":"<p>These are some cool <strong><em>tiddies</em></strong></p>","price":"1","image":"53d9357e-d5e0-4ad6-90d0-dc7a2e57ae8c","categories":[{"categories_id":{"name":"anime"}},{"categories_id":{"name":"anime","products":[{"products_id":2}]}}],"id":4}	\N
75	718	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-16T00:01:19+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","secondary_images":[1,2,3,4,5,6,7,8,9],"categories":[1,2]}	{"date_updated":"2021-06-15T16:01:19.007Z"}	\N
93	1238	products_categories	9	{"categories_id":{"name":"anime"},"products_id":4,"id":9}	{"categories_id":{"name":"anime"},"products_id":4,"id":9}	97
96	1241	products_categories	11	{"categories_id":{"name":"anime","products":[{"products_id":2}]},"products_id":4,"id":11}	{"categories_id":{"name":"anime","products":[{"products_id":2}]},"products_id":4,"id":11}	97
78	734	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-16T00:03:52+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","secondary_images":[1,2,3,4,5,6,7,8,9],"categories":[1,2]}	{"date_updated":"2021-06-15T16:03:52.768Z"}	\N
103	1280	products	4	{"id":4,"date_created":"2021-06-19T23:34:53+08:00","date_updated":"2021-06-19T23:46:27+08:00","price":1,"description":"<p>These are some cool <strong><em>tiddies</em></strong></p>","image":"53d9357e-d5e0-4ad6-90d0-dc7a2e57ae8c","name":"Anime tiddies","secondary_images":[],"categories":[11]}	{"date_updated":"2021-06-19T15:46:27.233Z"}	\N
101	1278	products_categories	11	{"id":11,"products_id":4,"categories_id":null}	{"products_id":"4"}	103
81	778	products	1	{"id":1,"date_created":"2021-06-15T11:40:55+08:00","date_updated":"2021-06-16T00:12:02+08:00","price":79.99,"description":"<p>Vincent Van Gogh's&nbsp;<strong>amazing</strong> starry night</p>","image":"f3823afc-873e-4b97-ae46-b06f19c9bd6b","name":"Starry Night Painting","secondary_images":[1,2,3,4,5,6,7,8,9],"categories":[1,2]}	{"date_updated":"2021-06-15T16:12:02.609Z"}	\N
79	776	products_categories	1	{"categories_id":1,"products_id":"1","id":1}	{"categories_id":1,"products_id":"1","id":1}	81
80	777	products_categories	2	{"categories_id":4,"products_id":"1","id":2}	{"categories_id":4,"products_id":"1","id":2}	81
86	783	products	3	{"id":3,"date_created":"2021-06-15T22:55:51+08:00","date_updated":"2021-06-16T00:12:10+08:00","price":99.99,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at egestas nibh, quis aliquet metus. Nam ullamcorper interdum enim quis rhoncus. Aliquam ultrices, nisi ac pellentesque consequat, ipsum sapien hendrerit leo, semper tempus diam est suscipit dolor. Ut semper laoreet lorem, a eleifend dolor tempus quis. Nunc at aliquet massa. Vivamus et ullamcorper sapien. Suspendisse placerat mauris imperdiet, ultricies mi et, facilisis nulla. Duis dui nibh, vulputate id commodo non, cursus id odio. Integer a elementum nibh.</p>","image":"033a7930-4693-4000-a260-5b381cb47dd0","name":"Lorem Ipsum","secondary_images":[10],"categories":[3,4,5,6]}	{"date_updated":"2021-06-15T16:12:10.075Z"}	\N
82	779	products_categories	3	{"categories_id":1,"products_id":"3","id":3}	{"categories_id":1,"products_id":"3","id":3}	86
83	780	products_categories	4	{"categories_id":2,"products_id":"3","id":4}	{"categories_id":2,"products_id":"3","id":4}	86
84	781	products_categories	5	{"categories_id":3,"products_id":"3","id":5}	{"categories_id":3,"products_id":"3","id":5}	86
85	782	products_categories	6	{"categories_id":4,"products_id":"3","id":6}	{"categories_id":4,"products_id":"3","id":6}	86
102	1279	products_categories	9	{"id":9,"products_id":null,"categories_id":6}	{"products_id":null}	103
104	1302	products	5	{"name":"Lorem Ipsum","description":"<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>","price":"100","image":"d5eca683-11e4-4ef7-ab0d-13fc53d43a93","id":5}	{"name":"Lorem Ipsum","description":"<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>","price":"100","image":"d5eca683-11e4-4ef7-ab0d-13fc53d43a93","id":5}	\N
110	1316	categories	10	{"name":"miscellaneous","id":10}	{"name":"miscellaneous","id":10}	\N
128	1341	categories	12	{"name":"art","id":12}	{"name":"art","id":12}	129
161	1426	products	12	\N	{"quantity":3,"date_updated":"2021-06-24T14:33:29.224Z"}	\N
107	1307	products	5	{"id":5,"date_created":"2021-06-19T23:51:32+08:00","date_updated":"2021-06-19T23:55:47+08:00","price":100,"description":"<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>","image":"d5eca683-11e4-4ef7-ab0d-13fc53d43a93","name":"Lorem Ipsum","categories":[13,14],"secondary_images":[]}	{"date_updated":"2021-06-19T15:55:47.545Z"}	\N
114	1321	products	6	{"name":"Another Product","description":"<p>Testing another product</p>","price":"24","image":"d9ef52a9-a363-430b-aa4d-7f3e42556e71","categories":[{"categories_id":8},{"categories_id":9},{"categories_id":10}],"id":6}	{"name":"Another Product","description":"<p>Testing another product</p>","price":"24","image":"d9ef52a9-a363-430b-aa4d-7f3e42556e71","categories":[{"categories_id":8},{"categories_id":9},{"categories_id":10}],"id":6}	\N
111	1318	products_categories	15	{"categories_id":8,"products_id":6,"id":15}	{"categories_id":8,"products_id":6,"id":15}	114
112	1319	products_categories	16	{"categories_id":9,"products_id":6,"id":16}	{"categories_id":9,"products_id":6,"id":16}	114
113	1320	products_categories	17	{"categories_id":10,"products_id":6,"id":17}	{"categories_id":10,"products_id":6,"id":17}	114
116	1323	products	5	{"id":5,"date_created":"2021-06-19T23:51:32+08:00","date_updated":"2021-06-19T23:59:08+08:00","price":100,"description":"<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>","image":"d5eca683-11e4-4ef7-ab0d-13fc53d43a93","name":"Lorem Ipsum","categories":[18],"secondary_images":[]}	{"date_updated":"2021-06-19T15:59:08.195Z"}	\N
115	1322	products_categories	18	{"categories_id":8,"products_id":"5","id":18}	{"categories_id":8,"products_id":"5","id":18}	116
118	1327	products	7	{"name":"Another product","description":"<p>This is the lack of a description</p>","price":"23","image":"cfc63c8f-bf12-4a95-8104-273da350be8f","categories":[{"categories_id":9}],"id":7}	{"name":"Another product","description":"<p>This is the lack of a description</p>","price":"23","image":"cfc63c8f-bf12-4a95-8104-273da350be8f","categories":[{"categories_id":9}],"id":7}	\N
117	1326	products_categories	19	{"categories_id":9,"products_id":7,"id":19}	{"categories_id":9,"products_id":7,"id":19}	118
119	1328	products	5	{"id":5,"date_created":"2021-06-19T23:51:32+08:00","date_updated":"2021-06-20T00:00:53+08:00","price":100,"description":"<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\\n<ul>\\n<li>1</li>\\n<li>2</li>\\n<li>3</li>\\n</ul>","image":"d5eca683-11e4-4ef7-ab0d-13fc53d43a93","name":"Lorem Ipsum","categories":[18],"secondary_images":[]}	{"description":"<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\\n<ul>\\n<li>1</li>\\n<li>2</li>\\n<li>3</li>\\n</ul>","date_updated":"2021-06-19T16:00:53.083Z"}	\N
121	1333	categories	11	{"name":"food","id":11}	{"name":"food","id":11}	122
123	1335	products	8	{"name":"Maple Syrup","description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat nibh a ex suscipit, nec lobortis est efficitur. Nullam vehicula erat pellentesque rutrum iaculis. Maecenas placerat erat vel erat blandit blandit. Cras purus mauris, bibendum non posuere ut, faucibus sed mauris. Etiam posuere congue augue, at vulputate felis blandit at.</p>","price":"25","image":"f10c637b-a843-4362-aef4-41a17bc19dad","featured":true,"categories":[{"categories_id":{"name":"food"}}],"secondary_images":[{"directus_files_id":"0917ba65-ba7c-4c76-af36-a99da02b16f7"}],"id":8}	{"name":"Maple Syrup","description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat nibh a ex suscipit, nec lobortis est efficitur. Nullam vehicula erat pellentesque rutrum iaculis. Maecenas placerat erat vel erat blandit blandit. Cras purus mauris, bibendum non posuere ut, faucibus sed mauris. Etiam posuere congue augue, at vulputate felis blandit at.</p>","price":"25","image":"f10c637b-a843-4362-aef4-41a17bc19dad","featured":true,"categories":[{"categories_id":{"name":"food"}}],"secondary_images":[{"directus_files_id":"0917ba65-ba7c-4c76-af36-a99da02b16f7"}],"id":8}	\N
120	1332	products_directus_files	11	{"directus_files_id":"0917ba65-ba7c-4c76-af36-a99da02b16f7","products_id":8,"id":11}	{"directus_files_id":"0917ba65-ba7c-4c76-af36-a99da02b16f7","products_id":8,"id":11}	123
122	1334	products_categories	20	{"categories_id":{"name":"food"},"products_id":8,"id":20}	{"categories_id":{"name":"food"},"products_id":8,"id":20}	123
126	1339	products	7	{"id":7,"date_created":"2021-06-20T00:00:22+08:00","date_updated":"2021-06-20T14:41:22+08:00","price":23,"description":"<p>This is the lack of a description</p>","image":"cfc63c8f-bf12-4a95-8104-273da350be8f","name":"Another product","featured":false,"categories":[19,21],"secondary_images":[]}	{"date_updated":"2021-06-20T06:41:22.677Z"}	\N
124	1337	products_categories	21	{"categories_id":10,"products_id":"7","id":21}	{"categories_id":10,"products_id":"7","id":21}	126
125	1338	products_categories	19	{"id":19,"products_id":7,"categories_id":9}	{"products_id":"7"}	126
130	1343	products	5	{"id":5,"date_created":"2021-06-19T23:51:32+08:00","date_updated":"2021-06-20T14:49:23+08:00","price":100,"description":"<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\\n<ul>\\n<li>1</li>\\n<li>2</li>\\n<li>3</li>\\n</ul>","image":"d5eca683-11e4-4ef7-ab0d-13fc53d43a93","name":"Lorem Ipsum","featured":false,"categories":[18,22],"secondary_images":[]}	{"date_updated":"2021-06-20T06:49:23.619Z"}	\N
127	1340	products_categories	18	{"id":18,"products_id":5,"categories_id":8}	{"products_id":"5"}	130
129	1342	products_categories	22	{"categories_id":{"name":"art"},"products_id":"5","id":22}	{"categories_id":{"name":"art"},"products_id":"5","id":22}	130
133	1349	categories	13	{"name":"paintings","id":13}	{"name":"paintings","id":13}	134
135	1351	products	9	{"name":"Test Product","description":"<p>This is a test</p>","price":"25.99","image":"1a3c07ca-a810-4f8d-b0f2-3a3b484442a2","featured":true,"categories":[{"categories_id":9},{"categories_id":12},{"categories_id":{"name":"paintings"}}],"id":9}	{"name":"Test Product","description":"<p>This is a test</p>","price":"25.99","image":"1a3c07ca-a810-4f8d-b0f2-3a3b484442a2","featured":true,"categories":[{"categories_id":9},{"categories_id":12},{"categories_id":{"name":"paintings"}}],"id":9}	\N
131	1347	products_categories	23	{"categories_id":9,"products_id":9,"id":23}	{"categories_id":9,"products_id":9,"id":23}	135
132	1348	products_categories	24	{"categories_id":12,"products_id":9,"id":24}	{"categories_id":12,"products_id":9,"id":24}	135
134	1350	products_categories	25	{"categories_id":{"name":"paintings"},"products_id":9,"id":25}	{"categories_id":{"name":"paintings"},"products_id":9,"id":25}	135
142	1359	products	10	{"name":"Lorem ipsum dolor sit amet","description":"<p>No</p>","price":"123456.789","image":"7f82fb20-b725-43f3-9d2d-982eebb223b4","categories":[{"categories_id":8},{"categories_id":9},{"categories_id":10},{"categories_id":11},{"categories_id":12},{"categories_id":13}],"id":10}	{"name":"Lorem ipsum dolor sit amet","description":"<p>No</p>","price":"123456.789","image":"7f82fb20-b725-43f3-9d2d-982eebb223b4","categories":[{"categories_id":8},{"categories_id":9},{"categories_id":10},{"categories_id":11},{"categories_id":12},{"categories_id":13}],"id":10}	\N
136	1353	products_categories	26	{"categories_id":8,"products_id":10,"id":26}	{"categories_id":8,"products_id":10,"id":26}	142
137	1354	products_categories	27	{"categories_id":9,"products_id":10,"id":27}	{"categories_id":9,"products_id":10,"id":27}	142
138	1355	products_categories	28	{"categories_id":10,"products_id":10,"id":28}	{"categories_id":10,"products_id":10,"id":28}	142
139	1356	products_categories	29	{"categories_id":11,"products_id":10,"id":29}	{"categories_id":11,"products_id":10,"id":29}	142
140	1357	products_categories	30	{"categories_id":12,"products_id":10,"id":30}	{"categories_id":12,"products_id":10,"id":30}	142
141	1358	products_categories	31	{"categories_id":13,"products_id":10,"id":31}	{"categories_id":13,"products_id":10,"id":31}	142
150	1367	products	10	{"id":10,"date_created":"2021-06-21T01:17:31+08:00","date_updated":"2021-06-21T01:24:25+08:00","price":123457,"description":"<p>No</p>","image":"7f82fb20-b725-43f3-9d2d-982eebb223b4","name":"Lorem ipsum dolor sit amet","featured":false,"categories":[26,27,28,29,30,31],"secondary_images":[12,13,14,15,16,17,18]}	{"date_updated":"2021-06-20T17:24:25.447Z"}	\N
143	1360	products_directus_files	12	{"directus_files_id":"7f82fb20-b725-43f3-9d2d-982eebb223b4","products_id":"10","id":12}	{"directus_files_id":"7f82fb20-b725-43f3-9d2d-982eebb223b4","products_id":"10","id":12}	150
144	1361	products_directus_files	13	{"directus_files_id":"1a3c07ca-a810-4f8d-b0f2-3a3b484442a2","products_id":"10","id":13}	{"directus_files_id":"1a3c07ca-a810-4f8d-b0f2-3a3b484442a2","products_id":"10","id":13}	150
145	1362	products_directus_files	14	{"directus_files_id":"0917ba65-ba7c-4c76-af36-a99da02b16f7","products_id":"10","id":14}	{"directus_files_id":"0917ba65-ba7c-4c76-af36-a99da02b16f7","products_id":"10","id":14}	150
146	1363	products_directus_files	15	{"directus_files_id":"f10c637b-a843-4362-aef4-41a17bc19dad","products_id":"10","id":15}	{"directus_files_id":"f10c637b-a843-4362-aef4-41a17bc19dad","products_id":"10","id":15}	150
147	1364	products_directus_files	16	{"directus_files_id":"cfc63c8f-bf12-4a95-8104-273da350be8f","products_id":"10","id":16}	{"directus_files_id":"cfc63c8f-bf12-4a95-8104-273da350be8f","products_id":"10","id":16}	150
148	1365	products_directus_files	17	{"directus_files_id":"d9ef52a9-a363-430b-aa4d-7f3e42556e71","products_id":"10","id":17}	{"directus_files_id":"d9ef52a9-a363-430b-aa4d-7f3e42556e71","products_id":"10","id":17}	150
149	1366	products_directus_files	18	{"directus_files_id":"d5eca683-11e4-4ef7-ab0d-13fc53d43a93","products_id":"10","id":18}	{"directus_files_id":"d5eca683-11e4-4ef7-ab0d-13fc53d43a93","products_id":"10","id":18}	150
151	1403	products	5	{"id":5,"date_created":"2021-06-19T23:51:32+08:00","date_updated":"2021-06-24T02:38:55+08:00","price":100,"description":"<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\\n<ul>\\n<li>1</li>\\n<li>2</li>\\n<li>3</li>\\n</ul>","image":"d5eca683-11e4-4ef7-ab0d-13fc53d43a93","name":"Lorem Ipsum","featured":false,"quantity":0,"options":{"color":"black|blue|brown"},"secondary_images":[],"categories":[18,22]}	{"options":"{\\"color\\":\\"black|blue|brown\\"}","date_updated":"2021-06-23T18:38:55.414Z"}	\N
152	1405	products	7	{"id":7,"date_created":"2021-06-20T00:00:22+08:00","date_updated":"2021-06-24T02:42:38+08:00","price":23,"description":"<p>This is the lack of a description</p>","image":"cfc63c8f-bf12-4a95-8104-273da350be8f","name":"Another product","featured":false,"quantity":0,"options":{},"secondary_images":[],"categories":[19,21]}	{"options":"{}","date_updated":"2021-06-23T18:42:38.118Z"}	\N
153	1406	products	8	{"id":8,"date_created":"2021-06-20T14:25:43+08:00","date_updated":"2021-06-24T02:42:38+08:00","price":25,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat nibh a ex suscipit, nec lobortis est efficitur. Nullam vehicula erat pellentesque rutrum iaculis. Maecenas placerat erat vel erat blandit blandit. Cras purus mauris, bibendum non posuere ut, faucibus sed mauris. Etiam posuere congue augue, at vulputate felis blandit at.</p>","image":"f10c637b-a843-4362-aef4-41a17bc19dad","name":"Maple Syrup","featured":true,"quantity":0,"options":{},"secondary_images":[11],"categories":[20]}	{"options":"{}","date_updated":"2021-06-23T18:42:38.118Z"}	\N
157	1418	products	12	\N	{"quantity":3,"date_updated":"2021-06-24T14:27:26.159Z"}	\N
162	1428	products	12	\N	{"quantity":3,"date_updated":"2021-06-24T14:36:50.402Z"}	\N
154	1407	products	9	{"id":9,"date_created":"2021-06-21T01:15:27+08:00","date_updated":"2021-06-24T02:42:38+08:00","price":25.99,"description":"<p>This is a test</p>","image":"1a3c07ca-a810-4f8d-b0f2-3a3b484442a2","name":"Test Product","featured":true,"quantity":0,"options":{},"secondary_images":[],"categories":[23,24,25]}	{"options":"{}","date_updated":"2021-06-23T18:42:38.118Z"}	\N
155	1408	products	10	{"id":10,"date_created":"2021-06-21T01:17:31+08:00","date_updated":"2021-06-24T02:42:38+08:00","price":123457,"description":"<p>No</p>","image":"7f82fb20-b725-43f3-9d2d-982eebb223b4","name":"Lorem ipsum dolor sit amet","featured":false,"quantity":0,"options":{},"secondary_images":[12,13,14,15,16,17,18],"categories":[26,27,28,29,30,31]}	{"options":"{}","date_updated":"2021-06-23T18:42:38.118Z"}	\N
156	1410	products	8	{"id":8,"date_created":"2021-06-20T14:25:43+08:00","date_updated":"2021-06-24T05:34:46+08:00","price":25,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat nibh a ex suscipit, nec lobortis est efficitur. Nullam vehicula erat pellentesque rutrum iaculis. Maecenas placerat erat vel erat blandit blandit. Cras purus mauris, bibendum non posuere ut, faucibus sed mauris. Etiam posuere congue augue, at vulputate felis blandit at.</p>","image":"f10c637b-a843-4362-aef4-41a17bc19dad","name":"Maple Syrup","featured":true,"quantity":0,"options":{"age":"1|2|3","size":"small|medium|large"},"secondary_images":[11],"categories":[20]}	{"options":"{\\"age\\":\\"1|2|3\\",\\"size\\":\\"small|medium|large\\"}","date_updated":"2021-06-23T21:34:46.637Z"}	\N
158	1420	products	8	{"id":8,"date_created":"2021-06-20T14:25:43+08:00","date_updated":"2021-06-24T22:29:04+08:00","price":25,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat nibh a ex suscipit, nec lobortis est efficitur. Nullam vehicula erat pellentesque rutrum iaculis. Maecenas placerat erat vel erat blandit blandit. Cras purus mauris, bibendum non posuere ut, faucibus sed mauris. Etiam posuere congue augue, at vulputate felis blandit at.</p>","image":"f10c637b-a843-4362-aef4-41a17bc19dad","name":"Maple Syrup","featured":true,"quantity":3,"options":{"age":"1|2|3","size":"small|medium|large"},"secondary_images":[11],"categories":[20]}	{"quantity":3,"date_updated":"2021-06-24T14:29:04.529Z"}	\N
159	1422	products	8	{"id":8,"date_created":"2021-06-20T14:25:43+08:00","date_updated":"2021-06-24T22:30:18+08:00","price":25,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat nibh a ex suscipit, nec lobortis est efficitur. Nullam vehicula erat pellentesque rutrum iaculis. Maecenas placerat erat vel erat blandit blandit. Cras purus mauris, bibendum non posuere ut, faucibus sed mauris. Etiam posuere congue augue, at vulputate felis blandit at.</p>","image":"f10c637b-a843-4362-aef4-41a17bc19dad","name":"Maple Syrup","featured":true,"quantity":3,"options":{"age":"1|2|3","size":"small|medium|large"},"secondary_images":[11],"categories":[20]}	{"quantity":3,"date_updated":"2021-06-24T14:30:18.886Z"}	\N
160	1424	products	12	\N	{"quantity":3,"date_updated":"2021-06-24T14:30:27.289Z"}	\N
163	1430	products	12	\N	{"quantity":3,"date_updated":"2021-06-24T14:37:27.228Z"}	\N
164	1432	products	12	\N	{"quantity":3,"date_updated":"2021-06-24T14:37:39.681Z"}	\N
165	1434	products	12	\N	{"quantity":3,"date_updated":"2021-06-24T14:38:06.588Z"}	\N
166	1436	products	12	\N	{"quantity":3,"date_updated":"2021-06-24T14:41:03.538Z"}	\N
167	1438	products	8	{"id":8,"date_created":"2021-06-20T14:25:43+08:00","date_updated":"2021-06-24T22:42:00+08:00","price":25,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat nibh a ex suscipit, nec lobortis est efficitur. Nullam vehicula erat pellentesque rutrum iaculis. Maecenas placerat erat vel erat blandit blandit. Cras purus mauris, bibendum non posuere ut, faucibus sed mauris. Etiam posuere congue augue, at vulputate felis blandit at.</p>","image":"f10c637b-a843-4362-aef4-41a17bc19dad","name":"Maple Syrup","featured":true,"quantity":3,"options":{"age":"1|2|3","size":"small|medium|large"},"secondary_images":[11],"categories":[20]}	{"quantity":3,"date_updated":"2021-06-24T14:42:00.387Z"}	\N
168	1439	categories	14	{"name":"cars","id":14}	{"name":"cars","id":14}	\N
169	1440	categories	15	{"name":"computers","id":15}	{"name":"computers","id":15}	\N
174	1474	products	8	{"id":8,"date_created":"2021-06-20T14:25:43+08:00","date_updated":"2021-06-28T17:43:52+08:00","price":25,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat nibh a ex suscipit, nec lobortis est efficitur. Nullam vehicula erat pellentesque rutrum iaculis. Maecenas placerat erat vel erat blandit blandit. Cras purus mauris, bibendum non posuere ut, faucibus sed mauris. Etiam posuere congue augue, at vulputate felis blandit at.</p>","image":"f10c637b-a843-4362-aef4-41a17bc19dad","name":"Maple Syrup","featured":true,"options":[{"custom_name":"size","available_options":"small|medium|large"},{"custom_name":"color","available_options":"navy blue|crimson red|aquamarine"}],"secondary_images":[11],"categories":[20]}	{"options":"[{\\"custom_name\\":\\"size\\",\\"available_options\\":\\"small|medium|large\\"},{\\"custom_name\\":\\"color\\",\\"available_options\\":\\"navy blue|crimson red|aquamarine\\"}]","date_updated":"2021-06-28T09:43:52.779Z"}	\N
175	1478	products	8	{"id":8,"date_created":"2021-06-20T14:25:43+08:00","date_updated":"2021-06-28T17:49:10+08:00","price":25,"description":"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed placerat nibh a ex suscipit, nec lobortis est efficitur. Nullam vehicula erat pellentesque rutrum iaculis. Maecenas placerat erat vel erat blandit blandit. Cras purus mauris, bibendum non posuere ut, faucibus sed mauris. Etiam posuere congue augue, at vulputate felis blandit at.</p>","image":"f10c637b-a843-4362-aef4-41a17bc19dad","name":"Maple Syrup","featured":true,"custom_fields":[{"name":"size","options":"small|medium|large"},{"name":"quality","options":"inferior|superior"}],"secondary_images":[11],"categories":[20]}	{"custom_fields":"[{\\"name\\":\\"size\\",\\"options\\":\\"small|medium|large\\"},{\\"name\\":\\"quality\\",\\"options\\":\\"inferior|superior\\"}]","date_updated":"2021-06-28T09:49:10.065Z"}	\N
176	1479	products	10	{"id":10,"date_created":"2021-06-21T01:17:31+08:00","date_updated":"2021-06-28T18:38:25+08:00","price":123457,"description":"<p>No</p>","image":"7f82fb20-b725-43f3-9d2d-982eebb223b4","name":"Lorem ipsum dolor sit amet","featured":false,"custom_fields":[{"name":"size","options":"SM|MD|LG|XL|2XL"}],"secondary_images":[12,13,14,15,16,17,18],"categories":[26,27,28,29,30,31]}	{"custom_fields":"[{\\"name\\":\\"size\\",\\"options\\":\\"SM|MD|LG|XL|2XL\\"}]","date_updated":"2021-06-28T10:38:25.399Z"}	\N
179	1485	products	11	{"name":"Toh Hong Xiang","description":"<p>asdf</p>","price":"22","image":"303497c1-8bd8-4a7d-ae7b-70162fda89f1","categories":[{"categories_id":8},{"categories_id":9}],"id":11}	{"name":"Toh Hong Xiang","description":"<p>asdf</p>","price":"22","image":"303497c1-8bd8-4a7d-ae7b-70162fda89f1","categories":[{"categories_id":8},{"categories_id":9}],"id":11}	\N
177	1483	products_categories	32	{"categories_id":8,"products_id":11,"id":32}	{"categories_id":8,"products_id":11,"id":32}	179
178	1484	products_categories	33	{"categories_id":9,"products_id":11,"id":33}	{"categories_id":9,"products_id":11,"id":33}	179
180	1487	products	12	{"name":"Toh Hong Xiang","description":"<p>asdf</p>","price":"23","id":12}	{"name":"Toh Hong Xiang","description":"<p>asdf</p>","price":"23","id":12}	\N
183	1492	categories	16	{"name":"test","id":16}	{"name":"test","id":16}	184
185	1494	products	13	{"name":"Toh Hong Xiang","price":1,"description":"<p>This is a test</p>","image":"86d4b808-9719-41fd-83bb-7ebc4195bc6c","featured":true,"categories":[{"categories_id":8},{"categories_id":9},{"categories_id":{"name":"test"}}],"custom_fields":[{"name":"size","options":"small|medium|large|xtra"}],"id":13}	{"name":"Toh Hong Xiang","price":1,"description":"<p>This is a test</p>","image":"86d4b808-9719-41fd-83bb-7ebc4195bc6c","featured":true,"categories":[{"categories_id":8},{"categories_id":9},{"categories_id":{"name":"test"}}],"custom_fields":[{"name":"size","options":"small|medium|large|xtra"}],"id":13}	\N
181	1490	products_categories	34	{"categories_id":8,"products_id":13,"id":34}	{"categories_id":8,"products_id":13,"id":34}	185
182	1491	products_categories	35	{"categories_id":9,"products_id":13,"id":35}	{"categories_id":9,"products_id":13,"id":35}	185
184	1493	products_categories	36	{"categories_id":{"name":"test"},"products_id":13,"id":36}	{"categories_id":{"name":"test"},"products_id":13,"id":36}	185
190	1502	categories	17	{"name":"john","id":17}	{"name":"john","id":17}	191
192	1504	products	14	{"name":"Toh Hong Xiang","description":"<p>this is a test description</p>","price":"23","image":"f392a698-f64b-4084-a5cc-6b82082e3977","secondary_images":[{"directus_files_id":"4d8df203-e142-45dc-b825-658fc01763ac"},{"directus_files_id":"2d512394-43e8-44d8-8c11-dcecd6f76bb1"}],"featured":true,"categories":[{"categories_id":14},{"categories_id":15},{"categories_id":{"name":"john"}}],"custom_fields":[{"name":"sa","options":"ghgh|ppp"}],"id":14}	{"name":"Toh Hong Xiang","description":"<p>this is a test description</p>","price":"23","image":"f392a698-f64b-4084-a5cc-6b82082e3977","secondary_images":[{"directus_files_id":"4d8df203-e142-45dc-b825-658fc01763ac"},{"directus_files_id":"2d512394-43e8-44d8-8c11-dcecd6f76bb1"}],"featured":true,"categories":[{"categories_id":14},{"categories_id":15},{"categories_id":{"name":"john"}}],"custom_fields":[{"name":"sa","options":"ghgh|ppp"}],"id":14}	\N
186	1498	products_directus_files	19	{"directus_files_id":"4d8df203-e142-45dc-b825-658fc01763ac","products_id":14,"id":19}	{"directus_files_id":"4d8df203-e142-45dc-b825-658fc01763ac","products_id":14,"id":19}	192
187	1499	products_directus_files	20	{"directus_files_id":"2d512394-43e8-44d8-8c11-dcecd6f76bb1","products_id":14,"id":20}	{"directus_files_id":"2d512394-43e8-44d8-8c11-dcecd6f76bb1","products_id":14,"id":20}	192
188	1500	products_categories	37	{"categories_id":14,"products_id":14,"id":37}	{"categories_id":14,"products_id":14,"id":37}	192
189	1501	products_categories	38	{"categories_id":15,"products_id":14,"id":38}	{"categories_id":15,"products_id":14,"id":38}	192
191	1503	products_categories	39	{"categories_id":{"name":"john"},"products_id":14,"id":39}	{"categories_id":{"name":"john"},"products_id":14,"id":39}	192
203	1515	products	15	{"name":"Toh Hong Xiang","description":"<p>asdf</p>","price":"23","categories":[{"categories_id":8},{"categories_id":9},{"categories_id":10},{"categories_id":11},{"categories_id":12},{"categories_id":13},{"categories_id":14},{"categories_id":15},{"categories_id":16},{"categories_id":17}],"custom_fields":[{"name":"color","options":"red|blue|yellow|green|violet"}],"id":15}	{"name":"Toh Hong Xiang","description":"<p>asdf</p>","price":"23","categories":[{"categories_id":8},{"categories_id":9},{"categories_id":10},{"categories_id":11},{"categories_id":12},{"categories_id":13},{"categories_id":14},{"categories_id":15},{"categories_id":16},{"categories_id":17}],"custom_fields":[{"name":"color","options":"red|blue|yellow|green|violet"}],"id":15}	\N
193	1505	products_categories	40	{"categories_id":8,"products_id":15,"id":40}	{"categories_id":8,"products_id":15,"id":40}	203
194	1506	products_categories	41	{"categories_id":9,"products_id":15,"id":41}	{"categories_id":9,"products_id":15,"id":41}	203
195	1507	products_categories	42	{"categories_id":10,"products_id":15,"id":42}	{"categories_id":10,"products_id":15,"id":42}	203
196	1508	products_categories	43	{"categories_id":11,"products_id":15,"id":43}	{"categories_id":11,"products_id":15,"id":43}	203
197	1509	products_categories	44	{"categories_id":12,"products_id":15,"id":44}	{"categories_id":12,"products_id":15,"id":44}	203
198	1510	products_categories	45	{"categories_id":13,"products_id":15,"id":45}	{"categories_id":13,"products_id":15,"id":45}	203
199	1511	products_categories	46	{"categories_id":14,"products_id":15,"id":46}	{"categories_id":14,"products_id":15,"id":46}	203
200	1512	products_categories	47	{"categories_id":15,"products_id":15,"id":47}	{"categories_id":15,"products_id":15,"id":47}	203
201	1513	products_categories	48	{"categories_id":16,"products_id":15,"id":48}	{"categories_id":16,"products_id":15,"id":48}	203
202	1514	products_categories	49	{"categories_id":17,"products_id":15,"id":49}	{"categories_id":17,"products_id":15,"id":49}	203
207	1520	products	15	{"id":15,"date_created":"2021-07-01T21:57:49+08:00","date_updated":"2021-07-01T21:59:55+08:00","price":23,"description":"<p>asdf</p>","image":"cc5509ea-08e4-4218-a490-e7d7361cee33","name":"Toh Hong Xiang","featured":false,"custom_fields":[{"name":"color","options":"red|blue|yellow|green|violet"}],"secondary_images":[21,22,23],"categories":[40,41,42,43,44,45,46,47,48,49]}	{"image":"cc5509ea-08e4-4218-a490-e7d7361cee33","date_updated":"2021-07-01T13:59:55.854Z"}	\N
204	1517	products_directus_files	21	{"directus_files_id":"2d512394-43e8-44d8-8c11-dcecd6f76bb1","products_id":"15","id":21}	{"directus_files_id":"2d512394-43e8-44d8-8c11-dcecd6f76bb1","products_id":"15","id":21}	207
205	1518	products_directus_files	22	{"directus_files_id":"d9ef52a9-a363-430b-aa4d-7f3e42556e71","products_id":"15","id":22}	{"directus_files_id":"d9ef52a9-a363-430b-aa4d-7f3e42556e71","products_id":"15","id":22}	207
206	1519	products_directus_files	23	{"directus_files_id":"0917ba65-ba7c-4c76-af36-a99da02b16f7","products_id":"15","id":23}	{"directus_files_id":"0917ba65-ba7c-4c76-af36-a99da02b16f7","products_id":"15","id":23}	207
208	1532	products	15	{"id":15,"date_created":"2021-07-01T21:57:49+08:00","date_updated":"2021-07-10T14:29:14+08:00","price":23,"description":"<p>asdf</p>","image":"cc5509ea-08e4-4218-a490-e7d7361cee33","name":"Toh Hong Xiang","featured":false,"custom_fields":null,"secondary_images":[21,22,23],"categories":[40,41,42,43,44,45,46,47,48,49]}	{"custom_fields":null,"date_updated":"2021-07-10T06:29:14.159Z"}	\N
209	1534	products	16	{"name":"Long Description","description":"<h1>Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem;</h1>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Primum quid tu dicis breve? Duo Reges: constructio interrete. Nam, ut sint illa vendibiliora, haec uberiora certe sunt. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem. Ergo id est convenienter naturae vivere, a natura discedere. Si longus, levis. Quia, si mala sunt, is, qui erit in iis, beatus non erit. Sed ille, ut dixi, vitiose.</p>\\n<blockquote cite=\\"http://loripsum.net\\">Ergo in iis adolescentibus bonam spem esse dicemus et magnam indolem, quos suis commodis inservituros et quicquid ipsis expediat facturos arbitrabimur?</blockquote>\\n<dl>\\n<dt><dfn>ALIO MODO.</dfn></dt>\\n<dd>Utinam quidem dicerent alium alio beatiorem! Iam ruinas videres.</dd>\\n<dt><dfn>Certe non potest.</dfn></dt>\\n<dd>Id et fieri posse et saepe esse factum et ad voluptates percipiendas maxime pertinere.</dd>\\n<dt><dfn>Venit ad extremum;</dfn></dt>\\n<dd>Ergo id est convenienter naturae vivere, a natura discedere.</dd>\\n</dl>\\n<ol>\\n<li>Aliud est enim po&euml;tarum more verba fundere, aliud ea, quae dicas, ratione et arte distinguere.</li>\\n<li>Ex rebus enim timiditas, non ex vocabulis nascitur.</li>\\n<li>Immo vero, inquit, ad beatissime vivendum parum est, ad beate vero satis.</li>\\n<li>Incommoda autem et commoda-ita enim estmata et dustmata appello-communia esse voluerunt, paria noluerunt.</li>\\n</ol>\\n<ul>\\n<li>Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit?</li>\\n<li>Et hanc quidem primam exigam a te operam, ut audias me quae a te dicta sunt refellentem.</li>\\n<li>Nec enim, omnes avaritias si aeque avaritias esse dixerimus, sequetur ut etiam aequas esse dicamus.</li>\\n<li>Heri, inquam, ludis commissis ex urbe profectus veni ad vesperum.</li>\\n</ul>\\n<p><a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Summum en&iacute;m bonum exposuit vacuitatem doloris;</a> <mark>Que Manilium, ab iisque M.</mark> <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Bonum liberi: misera orbitas.</a> <mark>Prioris generis est docilitas, memoria;</mark> Quod idem cum vestri faciant, non satis magnam tribuunt inventoribus gratiam. Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>\\n<p>Utrum igitur tibi litteram videor an totas paginas commovere? Tu vero, inquam, ducas licet, si sequetur; Uterque enim summo bono fruitur, id est voluptate. Quodcumque in mentem incideret, et quodcumque tamquam occurreret. <strong>Idemne potest esse dies saepius, qui semel fuit?</strong> <code>Cave putes quicquam esse verius.</code> Quid ergo attinet gloriose loqui, nisi constanter loquare? <em>Quid autem habent admirationis, cum prope accesseris?</em> Nescio quo modo praetervolavit oratio.</p>\\n<h2>Inde sermone vario sex illa a Dipylo stadia confecimus.</h2>\\n<p>Callipho ad virtutem nihil adiunxit nisi voluptatem, Diodorus vacuitatem doloris. <em>Si longus, levis dictata sunt.</em> Maximus dolor, inquit, brevis est. Experiamur igitur, inquit, etsi habet haec Stoicorum ratio difficilius quiddam et obscurius. <em>Paria sunt igitur.</em> <strong>Et nemo nimium beatus est;</strong> Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. <em>Confecta res esset.</em></p>\\n<pre>Aliam vero vim voluptatis esse, aliam nihil dolendi, nisi\\nvalde pertinax fueris, concedas necesse est.\\n\\nIs enim, qui occultus et tectus dicitur, tantum abest ut se\\nindicet, perficiet etiam ut dolere alterius improbe facto\\nvideatur.\\n</pre>\\n<p>Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">De illis, cum volemus.</a> Itaque dicunt nec dubitant: mihi sic usus est, tibi ut opus est facto, fac. Quis enim potest istis, quae te, ut ais, delectant, brevibus et acutis auditis de sententia decedere? Zenonis est, inquam, hoc Stoici. Huius, Lyco, oratione locuples, rebus ipsis ielunior. Quis hoc dicit? An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>","price":"2.99","image":"94ae648c-94ca-4335-bae4-8cb4dc849db4","categories":[],"id":16}	{"name":"Long Description","description":"<h1>Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem;</h1>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Primum quid tu dicis breve? Duo Reges: constructio interrete. Nam, ut sint illa vendibiliora, haec uberiora certe sunt. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem. Ergo id est convenienter naturae vivere, a natura discedere. Si longus, levis. Quia, si mala sunt, is, qui erit in iis, beatus non erit. Sed ille, ut dixi, vitiose.</p>\\n<blockquote cite=\\"http://loripsum.net\\">Ergo in iis adolescentibus bonam spem esse dicemus et magnam indolem, quos suis commodis inservituros et quicquid ipsis expediat facturos arbitrabimur?</blockquote>\\n<dl>\\n<dt><dfn>ALIO MODO.</dfn></dt>\\n<dd>Utinam quidem dicerent alium alio beatiorem! Iam ruinas videres.</dd>\\n<dt><dfn>Certe non potest.</dfn></dt>\\n<dd>Id et fieri posse et saepe esse factum et ad voluptates percipiendas maxime pertinere.</dd>\\n<dt><dfn>Venit ad extremum;</dfn></dt>\\n<dd>Ergo id est convenienter naturae vivere, a natura discedere.</dd>\\n</dl>\\n<ol>\\n<li>Aliud est enim po&euml;tarum more verba fundere, aliud ea, quae dicas, ratione et arte distinguere.</li>\\n<li>Ex rebus enim timiditas, non ex vocabulis nascitur.</li>\\n<li>Immo vero, inquit, ad beatissime vivendum parum est, ad beate vero satis.</li>\\n<li>Incommoda autem et commoda-ita enim estmata et dustmata appello-communia esse voluerunt, paria noluerunt.</li>\\n</ol>\\n<ul>\\n<li>Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit?</li>\\n<li>Et hanc quidem primam exigam a te operam, ut audias me quae a te dicta sunt refellentem.</li>\\n<li>Nec enim, omnes avaritias si aeque avaritias esse dixerimus, sequetur ut etiam aequas esse dicamus.</li>\\n<li>Heri, inquam, ludis commissis ex urbe profectus veni ad vesperum.</li>\\n</ul>\\n<p><a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Summum en&iacute;m bonum exposuit vacuitatem doloris;</a> <mark>Que Manilium, ab iisque M.</mark> <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Bonum liberi: misera orbitas.</a> <mark>Prioris generis est docilitas, memoria;</mark> Quod idem cum vestri faciant, non satis magnam tribuunt inventoribus gratiam. Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>\\n<p>Utrum igitur tibi litteram videor an totas paginas commovere? Tu vero, inquam, ducas licet, si sequetur; Uterque enim summo bono fruitur, id est voluptate. Quodcumque in mentem incideret, et quodcumque tamquam occurreret. <strong>Idemne potest esse dies saepius, qui semel fuit?</strong> <code>Cave putes quicquam esse verius.</code> Quid ergo attinet gloriose loqui, nisi constanter loquare? <em>Quid autem habent admirationis, cum prope accesseris?</em> Nescio quo modo praetervolavit oratio.</p>\\n<h2>Inde sermone vario sex illa a Dipylo stadia confecimus.</h2>\\n<p>Callipho ad virtutem nihil adiunxit nisi voluptatem, Diodorus vacuitatem doloris. <em>Si longus, levis dictata sunt.</em> Maximus dolor, inquit, brevis est. Experiamur igitur, inquit, etsi habet haec Stoicorum ratio difficilius quiddam et obscurius. <em>Paria sunt igitur.</em> <strong>Et nemo nimium beatus est;</strong> Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. <em>Confecta res esset.</em></p>\\n<pre>Aliam vero vim voluptatis esse, aliam nihil dolendi, nisi\\nvalde pertinax fueris, concedas necesse est.\\n\\nIs enim, qui occultus et tectus dicitur, tantum abest ut se\\nindicet, perficiet etiam ut dolere alterius improbe facto\\nvideatur.\\n</pre>\\n<p>Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">De illis, cum volemus.</a> Itaque dicunt nec dubitant: mihi sic usus est, tibi ut opus est facto, fac. Quis enim potest istis, quae te, ut ais, delectant, brevibus et acutis auditis de sententia decedere? Zenonis est, inquam, hoc Stoici. Huius, Lyco, oratione locuples, rebus ipsis ielunior. Quis hoc dicit? An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>","price":"2.99","image":"94ae648c-94ca-4335-bae4-8cb4dc849db4","categories":[],"id":16}	\N
210	1535	products	16	{"id":16,"date_created":"2021-07-10T14:31:26+08:00","date_updated":"2021-07-10T14:33:05+08:00","price":2.99,"description":"<h1>Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem;</h1>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Primum quid tu dicis breve? Duo Reges: constructio interrete. Nam, ut sint illa vendibiliora, haec uberiora certe sunt. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem. Ergo id est convenienter naturae vivere, a natura discedere. Si longus, levis. Quia, si mala sunt, is, qui erit in iis, beatus non erit. Sed ille, ut dixi, vitiose.</p>\\n<blockquote cite=\\"http://loripsum.net\\">Ergo in iis adolescentibus bonam spem esse dicemus et magnam indolem, quos suis commodis inservituros et quicquid ipsis expediat facturos arbitrabimur?</blockquote>\\n<dl>\\n<dt><dfn>ALIO MODO.</dfn></dt>\\n<dd>Utinam quidem dicerent alium alio beatiorem! Iam ruinas videres.</dd>\\n<dt><dfn>Certe non potest.</dfn></dt>\\n<dd>Id et fieri posse et saepe esse factum et ad voluptates percipiendas maxime pertinere.</dd>\\n<dt><dfn>Venit ad extremum;</dfn></dt>\\n<dd>Ergo id est convenienter naturae vivere, a natura discedere.</dd>\\n</dl>\\n<ol>\\n<li>Aliud est enim po&euml;tarum more verba fundere, aliud ea, quae dicas, ratione et arte distinguere.</li>\\n<li>Ex rebus enim timiditas, non ex vocabulis nascitur.</li>\\n<li>Immo vero, inquit, ad beatissime vivendum parum est, ad beate vero satis.</li>\\n<li>Incommoda autem et commoda-ita enim estmata et dustmata appello-communia esse voluerunt, paria noluerunt.</li>\\n</ol>\\n<ul>\\n<li>Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit?</li>\\n<li>Et hanc quidem primam exigam a te operam, ut audias me quae a te dicta sunt refellentem.</li>\\n<li>Nec enim, omnes avaritias si aeque avaritias esse dixerimus, sequetur ut etiam aequas esse dicamus.</li>\\n<li>Heri, inquam, ludis commissis ex urbe profectus veni ad vesperum.</li>\\n</ul>\\n<p><a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Summum en&iacute;m bonum exposuit vacuitatem doloris;</a> <mark>Que Manilium, ab iisque M.</mark> <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Bonum liberi: misera orbitas.</a> <mark>Prioris generis est docilitas, memoria;</mark> Quod idem cum vestri faciant, non satis magnam tribuunt inventoribus gratiam. Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>\\n<p>Utrum igitur tibi litteram videor an totas paginas commovere? Tu vero, inquam, ducas licet, si sequetur; Uterque enim summo bono fruitur, id est voluptate. Quodcumque in mentem incideret, et quodcumque tamquam occurreret. <strong>Idemne potest esse dies saepius, qui semel fuit?</strong> <code>Cave putes quicquam esse verius.</code> Quid ergo attinet gloriose loqui, nisi constanter loquare? <em>Quid autem habent admirationis, cum prope accesseris?</em> Nescio quo modo praetervolavit oratio.</p>\\n<h2>Inde sermone vario sex illa a Dipylo stadia confecimus.</h2>\\n<p>Callipho ad virtutem nihil adiunxit nisi voluptatem, Diodorus vacuitatem doloris. <em>Si longus, levis dictata sunt.</em> Maximus dolor, inquit, brevis est. Experiamur igitur, inquit, etsi habet haec Stoicorum ratio difficilius quiddam et obscurius. <em>Paria sunt igitur.</em> <strong>Et nemo nimium beatus est;</strong> Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. <em>Confecta res esset.</em></p>\\n<pre>Aliam vero vim voluptatis esse, aliam nihil dolendi, nisi\\nvalde pertinax fueris, concedas necesse est.\\n\\nIs enim, qui occultus et tectus dicitur, tantum abest ut se\\nindicet, perficiet etiam ut dolere alterius improbe facto\\nvideatur.\\n</pre>\\n<p>Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">De illis, cum volemus.</a> Itaque dicunt nec dubitant: mihi sic usus est, tibi ut opus est facto, fac. Quis enim potest istis, quae te, ut ais, delectant, brevibus et acutis auditis de sententia decedere? Zenonis est, inquam, hoc Stoici. Huius, Lyco, oratione locuples, rebus ipsis ielunior. Quis hoc dicit? An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>","image":"94ae648c-94ca-4335-bae4-8cb4dc849db4","name":"Long Description","featured":false,"custom_fields":[{"name":"size","options":["small","medium","large","extra large"]},{"name":"weight","options":["1kg","2kg","4kg","8kg","16kg","32kg","64kg","128kg"]}],"secondary_images":[],"categories":[]}	{"custom_fields":"[{\\"name\\":\\"size\\",\\"options\\":[\\"small\\",\\"medium\\",\\"large\\",\\"extra large\\"]},{\\"name\\":\\"weight\\",\\"options\\":[\\"1kg\\",\\"2kg\\",\\"4kg\\",\\"8kg\\",\\"16kg\\",\\"32kg\\",\\"64kg\\",\\"128kg\\"]}]","date_updated":"2021-07-10T06:33:05.609Z"}	\N
211	1537	products	16	{"id":16,"date_created":"2021-07-10T14:31:26+08:00","date_updated":"2021-07-13T18:05:30+08:00","price":2.99,"description":"<h1>Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem;</h1>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Primum quid tu dicis breve? Duo Reges: constructio interrete. Nam, ut sint illa vendibiliora, haec uberiora certe sunt. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem. Ergo id est convenienter naturae vivere, a natura discedere. Si longus, levis. Quia, si mala sunt, is, qui erit in iis, beatus non erit. Sed ille, ut dixi, vitiose.</p>\\n<blockquote cite=\\"http://loripsum.net\\">Ergo in iis adolescentibus bonam spem esse dicemus et magnam indolem, quos suis commodis inservituros et quicquid ipsis expediat facturos arbitrabimur?</blockquote>\\n<dl>\\n<dt><dfn>ALIO MODO.</dfn></dt>\\n<dd>Utinam quidem dicerent alium alio beatiorem! Iam ruinas videres.</dd>\\n<dt><dfn>Certe non potest.</dfn></dt>\\n<dd>Id et fieri posse et saepe esse factum et ad voluptates percipiendas maxime pertinere.</dd>\\n<dt><dfn>Venit ad extremum;</dfn></dt>\\n<dd>Ergo id est convenienter naturae vivere, a natura discedere.</dd>\\n</dl>\\n<ol>\\n<li>Aliud est enim po&euml;tarum more verba fundere, aliud ea, quae dicas, ratione et arte distinguere.</li>\\n<li>Ex rebus enim timiditas, non ex vocabulis nascitur.</li>\\n<li>Immo vero, inquit, ad beatissime vivendum parum est, ad beate vero satis.</li>\\n<li>Incommoda autem et commoda-ita enim estmata et dustmata appello-communia esse voluerunt, paria noluerunt.</li>\\n</ol>\\n<ul>\\n<li>Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit?</li>\\n<li>Et hanc quidem primam exigam a te operam, ut audias me quae a te dicta sunt refellentem.</li>\\n<li>Nec enim, omnes avaritias si aeque avaritias esse dixerimus, sequetur ut etiam aequas esse dicamus.</li>\\n<li>Heri, inquam, ludis commissis ex urbe profectus veni ad vesperum.</li>\\n</ul>\\n<p><a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Summum en&iacute;m bonum exposuit vacuitatem doloris;</a> <mark>Que Manilium, ab iisque M.</mark> <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Bonum liberi: misera orbitas.</a> <mark>Prioris generis est docilitas, memoria;</mark> Quod idem cum vestri faciant, non satis magnam tribuunt inventoribus gratiam. Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>\\n<p>Utrum igitur tibi litteram videor an totas paginas commovere? Tu vero, inquam, ducas licet, si sequetur; Uterque enim summo bono fruitur, id est voluptate. Quodcumque in mentem incideret, et quodcumque tamquam occurreret. <strong>Idemne potest esse dies saepius, qui semel fuit?</strong> <code>Cave putes quicquam esse verius.</code> Quid ergo attinet gloriose loqui, nisi constanter loquare? <em>Quid autem habent admirationis, cum prope accesseris?</em> Nescio quo modo praetervolavit oratio.</p>\\n<h2>Inde sermone vario sex illa a Dipylo stadia confecimus.</h2>\\n<p>Callipho ad virtutem nihil adiunxit nisi voluptatem, Diodorus vacuitatem doloris. <em>Si longus, levis dictata sunt.</em> Maximus dolor, inquit, brevis est. Experiamur igitur, inquit, etsi habet haec Stoicorum ratio difficilius quiddam et obscurius. <em>Paria sunt igitur.</em> <strong>Et nemo nimium beatus est;</strong> Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. <em>Confecta res esset.</em></p>\\n<pre>Aliam vero vim voluptatis esse, aliam nihil dolendi, nisi\\nvalde pertinax fueris, concedas necesse est.\\n\\nIs enim, qui occultus et tectus dicitur, tantum abest ut se\\nindicet, perficiet etiam ut dolere alterius improbe facto\\nvideatur.\\n</pre>\\n<p>Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">De illis, cum volemus.</a> Itaque dicunt nec dubitant: mihi sic usus est, tibi ut opus est facto, fac. Quis enim potest istis, quae te, ut ais, delectant, brevibus et acutis auditis de sententia decedere? Zenonis est, inquam, hoc Stoici. Huius, Lyco, oratione locuples, rebus ipsis ielunior. Quis hoc dicit? An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>","image":"94ae648c-94ca-4335-bae4-8cb4dc849db4","name":"Long Description","featured":false,"custom_fields":[{"name":"size","options":["small","medium","large","extra large"]},{"name":"weight","options":["1kg","2kg","4kg","8kg","16kg","32kg","64kg","128kg"]}],"seo":[{"title":"Nice title","description":"Short meta description"}],"secondary_images":[],"categories":[]}	{"seo":"[{\\"title\\":\\"Nice title\\",\\"description\\":\\"Short meta description\\"}]","date_updated":"2021-07-13T10:05:30.019Z"}	\N
212	1553	products	16	{"id":16,"date_created":"2021-07-10T14:31:26+08:00","date_updated":"2021-07-22T12:08:18+08:00","price":2.99,"description":"<h1>Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem;</h1>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Primum quid tu dicis breve? Duo Reges: constructio interrete. Nam, ut sint illa vendibiliora, haec uberiora certe sunt. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem. Ergo id est convenienter naturae vivere, a natura discedere. Si longus, levis. Quia, si mala sunt, is, qui erit in iis, beatus non erit. Sed ille, ut dixi, vitiose.</p>\\n<blockquote cite=\\"http://loripsum.net\\">Ergo in iis adolescentibus bonam spem esse dicemus et magnam indolem, quos suis commodis inservituros et quicquid ipsis expediat facturos arbitrabimur?</blockquote>\\n<dl>\\n<dt><dfn>ALIO MODO.</dfn></dt>\\n<dd>Utinam quidem dicerent alium alio beatiorem! Iam ruinas videres.</dd>\\n<dt><dfn>Certe non potest.</dfn></dt>\\n<dd>Id et fieri posse et saepe esse factum et ad voluptates percipiendas maxime pertinere.</dd>\\n<dt><dfn>Venit ad extremum;</dfn></dt>\\n<dd>Ergo id est convenienter naturae vivere, a natura discedere.</dd>\\n</dl>\\n<ol>\\n<li>Aliud est enim po&euml;tarum more verba fundere, aliud ea, quae dicas, ratione et arte distinguere.</li>\\n<li>Ex rebus enim timiditas, non ex vocabulis nascitur.</li>\\n<li>Immo vero, inquit, ad beatissime vivendum parum est, ad beate vero satis.</li>\\n<li>Incommoda autem et commoda-ita enim estmata et dustmata appello-communia esse voluerunt, paria noluerunt.</li>\\n</ol>\\n<ul>\\n<li>Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit?</li>\\n<li>Et hanc quidem primam exigam a te operam, ut audias me quae a te dicta sunt refellentem.</li>\\n<li>Nec enim, omnes avaritias si aeque avaritias esse dixerimus, sequetur ut etiam aequas esse dicamus.</li>\\n<li>Heri, inquam, ludis commissis ex urbe profectus veni ad vesperum.</li>\\n</ul>\\n<p><a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Summum en&iacute;m bonum exposuit vacuitatem doloris;</a> <mark>Que Manilium, ab iisque M.</mark> <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Bonum liberi: misera orbitas.</a> <mark>Prioris generis est docilitas, memoria;</mark> Quod idem cum vestri faciant, non satis magnam tribuunt inventoribus gratiam. Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>\\n<p>Utrum igitur tibi litteram videor an totas paginas commovere? Tu vero, inquam, ducas licet, si sequetur; Uterque enim summo bono fruitur, id est voluptate. Quodcumque in mentem incideret, et quodcumque tamquam occurreret. <strong>Idemne potest esse dies saepius, qui semel fuit?</strong> <code>Cave putes quicquam esse verius.</code> Quid ergo attinet gloriose loqui, nisi constanter loquare? <em>Quid autem habent admirationis, cum prope accesseris?</em> Nescio quo modo praetervolavit oratio.</p>\\n<h2>Inde sermone vario sex illa a Dipylo stadia confecimus.</h2>\\n<p>Callipho ad virtutem nihil adiunxit nisi voluptatem, Diodorus vacuitatem doloris. <em>Si longus, levis dictata sunt.</em> Maximus dolor, inquit, brevis est. Experiamur igitur, inquit, etsi habet haec Stoicorum ratio difficilius quiddam et obscurius. <em>Paria sunt igitur.</em> <strong>Et nemo nimium beatus est;</strong> Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. <em>Confecta res esset.</em></p>\\n<pre>Aliam vero vim voluptatis esse, aliam nihil dolendi, nisi\\nvalde pertinax fueris, concedas necesse est.\\n\\nIs enim, qui occultus et tectus dicitur, tantum abest ut se\\nindicet, perficiet etiam ut dolere alterius improbe facto\\nvideatur.\\n</pre>\\n<p>Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">De illis, cum volemus.</a> Itaque dicunt nec dubitant: mihi sic usus est, tibi ut opus est facto, fac. Quis enim potest istis, quae te, ut ais, delectant, brevibus et acutis auditis de sententia decedere? Zenonis est, inquam, hoc Stoici. Huius, Lyco, oratione locuples, rebus ipsis ielunior. Quis hoc dicit? An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>","image":"94ae648c-94ca-4335-bae4-8cb4dc849db4","name":"Long Description","featured":false,"custom_fields":[{"name":"size","options":["small","medium","large","extra large"]},{"name":"weight","options":["1kg","2kg","4kg","8kg","16kg","32kg","64kg","128kg"]}],"seo":[{"title":"Nice title","description":"Short meta description"}],"sale_price":1.99,"secondary_images":[],"categories":[]}	{"sale_price":"1.99","date_updated":"2021-07-22T04:08:18.082Z"}	\N
213	1554	products	16	{"id":16,"date_created":"2021-07-10T14:31:26+08:00","date_updated":"2021-07-24T18:47:32+08:00","price":2.99,"description":"<h1>Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem;</h1>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Primum quid tu dicis breve? Duo Reges: constructio interrete. Nam, ut sint illa vendibiliora, haec uberiora certe sunt. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem. Ergo id est convenienter naturae vivere, a natura discedere. Si longus, levis. Quia, si mala sunt, is, qui erit in iis, beatus non erit. Sed ille, ut dixi, vitiose.</p>\\n<blockquote cite=\\"http://loripsum.net\\">Ergo in iis adolescentibus bonam spem esse dicemus et magnam indolem, quos suis commodis inservituros et quicquid ipsis expediat facturos arbitrabimur?</blockquote>\\n<dl>\\n<dt><dfn>ALIO MODO.</dfn></dt>\\n<dd>Utinam quidem dicerent alium alio beatiorem! Iam ruinas videres.</dd>\\n<dt><dfn>Certe non potest.</dfn></dt>\\n<dd>Id et fieri posse et saepe esse factum et ad voluptates percipiendas maxime pertinere.</dd>\\n<dt><dfn>Venit ad extremum;</dfn></dt>\\n<dd>Ergo id est convenienter naturae vivere, a natura discedere.</dd>\\n</dl>\\n<ol>\\n<li>Aliud est enim po&euml;tarum more verba fundere, aliud ea, quae dicas, ratione et arte distinguere.</li>\\n<li>Ex rebus enim timiditas, non ex vocabulis nascitur.</li>\\n<li>Immo vero, inquit, ad beatissime vivendum parum est, ad beate vero satis.</li>\\n<li>Incommoda autem et commoda-ita enim estmata et dustmata appello-communia esse voluerunt, paria noluerunt.</li>\\n</ol>\\n<ul>\\n<li>Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit?</li>\\n<li>Et hanc quidem primam exigam a te operam, ut audias me quae a te dicta sunt refellentem.</li>\\n<li>Nec enim, omnes avaritias si aeque avaritias esse dixerimus, sequetur ut etiam aequas esse dicamus.</li>\\n<li>Heri, inquam, ludis commissis ex urbe profectus veni ad vesperum.</li>\\n</ul>\\n<p><a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Summum en&iacute;m bonum exposuit vacuitatem doloris;</a> <mark>Que Manilium, ab iisque M.</mark> <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Bonum liberi: misera orbitas.</a> <mark>Prioris generis est docilitas, memoria;</mark> Quod idem cum vestri faciant, non satis magnam tribuunt inventoribus gratiam. Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>\\n<p>Utrum igitur tibi litteram videor an totas paginas commovere? Tu vero, inquam, ducas licet, si sequetur; Uterque enim summo bono fruitur, id est voluptate. Quodcumque in mentem incideret, et quodcumque tamquam occurreret. <strong>Idemne potest esse dies saepius, qui semel fuit?</strong> <code>Cave putes quicquam esse verius.</code> Quid ergo attinet gloriose loqui, nisi constanter loquare? <em>Quid autem habent admirationis, cum prope accesseris?</em> Nescio quo modo praetervolavit oratio.</p>\\n<h2>Inde sermone vario sex illa a Dipylo stadia confecimus.</h2>\\n<p>Callipho ad virtutem nihil adiunxit nisi voluptatem, Diodorus vacuitatem doloris. <em>Si longus, levis dictata sunt.</em> Maximus dolor, inquit, brevis est. Experiamur igitur, inquit, etsi habet haec Stoicorum ratio difficilius quiddam et obscurius. <em>Paria sunt igitur.</em> <strong>Et nemo nimium beatus est;</strong> Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. <em>Confecta res esset.</em></p>\\n<pre>Aliam vero vim voluptatis esse, aliam nihil dolendi, nisi\\nvalde pertinax fueris, concedas necesse est.\\n\\nIs enim, qui occultus et tectus dicitur, tantum abest ut se\\nindicet, perficiet etiam ut dolere alterius improbe facto\\nvideatur.\\n</pre>\\n<p>Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">De illis, cum volemus.</a> Itaque dicunt nec dubitant: mihi sic usus est, tibi ut opus est facto, fac. Quis enim potest istis, quae te, ut ais, delectant, brevibus et acutis auditis de sententia decedere? Zenonis est, inquam, hoc Stoici. Huius, Lyco, oratione locuples, rebus ipsis ielunior. Quis hoc dicit? An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>","image":"94ae648c-94ca-4335-bae4-8cb4dc849db4","name":"Long Description","featured":true,"custom_fields":[{"name":"size","options":["small","medium","large","extra large"]},{"name":"weight","options":["1kg","2kg","4kg","8kg","16kg","32kg","64kg","128kg"]}],"seo":[{"title":"Nice title","description":"Short meta description"}],"sale_price":1.99,"secondary_images":[],"categories":[]}	{"featured":true,"date_updated":"2021-07-24T10:47:32.921Z"}	\N
214	1558	products	16	{"id":16,"date_created":"2021-07-10T14:31:26+08:00","date_updated":"2021-08-06T17:52:44+08:00","price":2.99,"description":"<h1>Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem;</h1>\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Primum quid tu dicis breve? Duo Reges: constructio interrete. Nam, ut sint illa vendibiliora, haec uberiora certe sunt. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem. Ergo id est convenienter naturae vivere, a natura discedere. Si longus, levis. Quia, si mala sunt, is, qui erit in iis, beatus non erit. Sed ille, ut dixi, vitiose.</p>\\n<blockquote cite=\\"http://loripsum.net\\">Ergo in iis adolescentibus bonam spem esse dicemus et magnam indolem, quos suis commodis inservituros et quicquid ipsis expediat facturos arbitrabimur?</blockquote>\\n<dl>\\n<dt><dfn>ALIO MODO.</dfn></dt>\\n<dd>Utinam quidem dicerent alium alio beatiorem! Iam ruinas videres.</dd>\\n<dt><dfn>Certe non potest.</dfn></dt>\\n<dd>Id et fieri posse et saepe esse factum et ad voluptates percipiendas maxime pertinere.</dd>\\n<dt><dfn>Venit ad extremum;</dfn></dt>\\n<dd>Ergo id est convenienter naturae vivere, a natura discedere.</dd>\\n</dl>\\n<ol>\\n<li>Aliud est enim po&euml;tarum more verba fundere, aliud ea, quae dicas, ratione et arte distinguere.</li>\\n<li>Ex rebus enim timiditas, non ex vocabulis nascitur.</li>\\n<li>Immo vero, inquit, ad beatissime vivendum parum est, ad beate vero satis.</li>\\n<li>Incommoda autem et commoda-ita enim estmata et dustmata appello-communia esse voluerunt, paria noluerunt.</li>\\n</ol>\\n<ul>\\n<li>Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit?</li>\\n<li>Et hanc quidem primam exigam a te operam, ut audias me quae a te dicta sunt refellentem.</li>\\n<li>Nec enim, omnes avaritias si aeque avaritias esse dixerimus, sequetur ut etiam aequas esse dicamus.</li>\\n<li>Heri, inquam, ludis commissis ex urbe profectus veni ad vesperum.</li>\\n</ul>\\n<p><a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Summum en&iacute;m bonum exposuit vacuitatem doloris;</a> <mark>Que Manilium, ab iisque M.</mark> <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">Bonum liberi: misera orbitas.</a> <mark>Prioris generis est docilitas, memoria;</mark> Quod idem cum vestri faciant, non satis magnam tribuunt inventoribus gratiam. Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>\\n<p>Utrum igitur tibi litteram videor an totas paginas commovere? Tu vero, inquam, ducas licet, si sequetur; Uterque enim summo bono fruitur, id est voluptate. Quodcumque in mentem incideret, et quodcumque tamquam occurreret. <strong>Idemne potest esse dies saepius, qui semel fuit?</strong> <code>Cave putes quicquam esse verius.</code> Quid ergo attinet gloriose loqui, nisi constanter loquare? <em>Quid autem habent admirationis, cum prope accesseris?</em> Nescio quo modo praetervolavit oratio.</p>\\n<h2>Inde sermone vario sex illa a Dipylo stadia confecimus.</h2>\\n<p>Callipho ad virtutem nihil adiunxit nisi voluptatem, Diodorus vacuitatem doloris. <em>Si longus, levis dictata sunt.</em> Maximus dolor, inquit, brevis est. Experiamur igitur, inquit, etsi habet haec Stoicorum ratio difficilius quiddam et obscurius. <em>Paria sunt igitur.</em> <strong>Et nemo nimium beatus est;</strong> Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. <em>Confecta res esset.</em></p>\\n<pre>Aliam vero vim voluptatis esse, aliam nihil dolendi, nisi\\nvalde pertinax fueris, concedas necesse est.\\n\\nIs enim, qui occultus et tectus dicitur, tantum abest ut se\\nindicet, perficiet etiam ut dolere alterius improbe facto\\nvideatur.\\n</pre>\\n<p>Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? <a href=\\"http://loripsum.net/\\" target=\\"_blank\\" rel=\\"noopener\\">De illis, cum volemus.</a> Itaque dicunt nec dubitant: mihi sic usus est, tibi ut opus est facto, fac. Quis enim potest istis, quae te, ut ais, delectant, brevibus et acutis auditis de sententia decedere? Zenonis est, inquam, hoc Stoici. Huius, Lyco, oratione locuples, rebus ipsis ielunior. Quis hoc dicit? An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>","image":"94ae648c-94ca-4335-bae4-8cb4dc849db4","name":"Long Description","featured":true,"custom_fields":[{"name":"size","options":["small","medium","large","extra large"]},{"name":"weight","options":["1kg","2kg","4kg","8kg","16kg","32kg","64kg","128kg"]}],"seo":[{"title":"Nice title","description":"Short meta description"}],"sale_price":1.99,"hidden":true,"secondary_images":[],"categories":[]}	{"hidden":true,"date_updated":"2021-08-06T09:52:44.772Z"}	\N
215	1559	products	15	{"id":15,"date_created":"2021-07-01T21:57:49+08:00","date_updated":"2021-08-06T17:53:10+08:00","price":23,"description":"<p>asdf</p>","image":"cc5509ea-08e4-4218-a490-e7d7361cee33","name":"Toh Hong Xiang","featured":false,"custom_fields":null,"seo":[],"sale_price":null,"hidden":true,"secondary_images":[21,22,23],"categories":[40,41,42,43,44,45,46,47,48,49]}	{"hidden":true,"date_updated":"2021-08-06T09:53:10.379Z"}	\N
216	1560	products	15	{"id":15,"date_created":"2021-07-01T21:57:49+08:00","date_updated":"2021-08-06T17:57:59+08:00","price":23,"description":"<p>asdf</p>","image":"cc5509ea-08e4-4218-a490-e7d7361cee33","name":"Toh Hong Xiang","featured":false,"custom_fields":null,"seo":[],"sale_price":null,"hidden":false,"secondary_images":[21,22,23],"categories":[40,41,42,43,44,45,46,47,48,49]}	{"hidden":false,"date_updated":"2021-08-06T09:57:59.261Z"}	\N
217	1561	products	15	{"id":15,"date_created":"2021-07-01T21:57:49+08:00","date_updated":"2021-08-06T18:02:47+08:00","price":23,"description":"<p>asdf</p>","image":"cc5509ea-08e4-4218-a490-e7d7361cee33","name":"Toh Hong Xiang","featured":false,"custom_fields":null,"seo":[],"sale_price":null,"hidden":true,"secondary_images":[21,22,23],"categories":[40,41,42,43,44,45,46,47,48,49]}	{"hidden":true,"date_updated":"2021-08-06T10:02:47.687Z"}	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, module_list, collection_list, admin_access, app_access) FROM stdin;
c6f75d50-854f-4b67-9294-1a89f0cba110	Administrator	verified	Initial administrative role with unrestricted App/API access	\N	f	\N	\N	t	t
d44694c8-9479-4272-8eee-3cf6e0bd7a67	Editor	supervised_user_circle	Store owner	\N	f	\N	\N	f	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent) FROM stdin;
fxi55m9EIeYfd1Sopyk_xCeM74KlrK2Q3h6r9D4lYHLzLGk9hSfa0E3VkB9hHsN0	36214230-3431-4f3f-8c99-1f66e0019bdc	2021-08-13 17:56:40.271+08	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page) FROM stdin;
561ff389-b9ee-4551-a5d8-460d82093bfc	Toh	Hong Xiang	tohhongxiang@gmail.com	$argon2i$v=19$m=4096,t=3,p=1$iVjbfCY6jtgLN7XmyXvhZQ$4SyYTN6JfF1NJbScG06goW4kjKhVT2vJRZxn6ycdBzE	\N	\N	\N	\N	\N	en-US	auto	\N	active	d44694c8-9479-4272-8eee-3cf6e0bd7a67	\N	2021-06-21 12:17:50.662+08	/collections/products
36214230-3431-4f3f-8c99-1f66e0019bdc	Admin	User	admin@example.com	$argon2i$v=19$m=4096,t=3,p=1$pITtR3eouyZ3dlA1m4VfgA$iJaAuYlYDARLSEcJ8WG5yYj77XNaF7cef/AcWb94jmg	\N	\N	\N	\N	\N	en-US	auto	\N	active	c6f75d50-854f-4b67-9294-1a89f0cba110	\N	2021-08-06 18:02:48.237+08	/collections/products
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, date_created, date_updated, price, description, image, name, featured, custom_fields, seo, sale_price, hidden) FROM stdin;
16	2021-07-10 14:31:26.523+08	2021-08-06 17:52:44.772+08	2.99000001	<h1>Itaque primos congressus copulationesque et consuetudinum instituendarum voluntates fieri propter voluptatem;</h1>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Primum quid tu dicis breve? Duo Reges: constructio interrete. Nam, ut sint illa vendibiliora, haec uberiora certe sunt. Ut necesse sit omnium rerum, quae natura vigeant, similem esse finem, non eundem. Ergo id est convenienter naturae vivere, a natura discedere. Si longus, levis. Quia, si mala sunt, is, qui erit in iis, beatus non erit. Sed ille, ut dixi, vitiose.</p>\n<blockquote cite="http://loripsum.net">Ergo in iis adolescentibus bonam spem esse dicemus et magnam indolem, quos suis commodis inservituros et quicquid ipsis expediat facturos arbitrabimur?</blockquote>\n<dl>\n<dt><dfn>ALIO MODO.</dfn></dt>\n<dd>Utinam quidem dicerent alium alio beatiorem! Iam ruinas videres.</dd>\n<dt><dfn>Certe non potest.</dfn></dt>\n<dd>Id et fieri posse et saepe esse factum et ad voluptates percipiendas maxime pertinere.</dd>\n<dt><dfn>Venit ad extremum;</dfn></dt>\n<dd>Ergo id est convenienter naturae vivere, a natura discedere.</dd>\n</dl>\n<ol>\n<li>Aliud est enim po&euml;tarum more verba fundere, aliud ea, quae dicas, ratione et arte distinguere.</li>\n<li>Ex rebus enim timiditas, non ex vocabulis nascitur.</li>\n<li>Immo vero, inquit, ad beatissime vivendum parum est, ad beate vero satis.</li>\n<li>Incommoda autem et commoda-ita enim estmata et dustmata appello-communia esse voluerunt, paria noluerunt.</li>\n</ol>\n<ul>\n<li>Quis enim confidit semper sibi illud stabile et firmum permansurum, quod fragile et caducum sit?</li>\n<li>Et hanc quidem primam exigam a te operam, ut audias me quae a te dicta sunt refellentem.</li>\n<li>Nec enim, omnes avaritias si aeque avaritias esse dixerimus, sequetur ut etiam aequas esse dicamus.</li>\n<li>Heri, inquam, ludis commissis ex urbe profectus veni ad vesperum.</li>\n</ul>\n<p><a href="http://loripsum.net/" target="_blank" rel="noopener">Summum en&iacute;m bonum exposuit vacuitatem doloris;</a> <mark>Que Manilium, ab iisque M.</mark> <a href="http://loripsum.net/" target="_blank" rel="noopener">Bonum liberi: misera orbitas.</a> <mark>Prioris generis est docilitas, memoria;</mark> Quod idem cum vestri faciant, non satis magnam tribuunt inventoribus gratiam. Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>\n<p>Utrum igitur tibi litteram videor an totas paginas commovere? Tu vero, inquam, ducas licet, si sequetur; Uterque enim summo bono fruitur, id est voluptate. Quodcumque in mentem incideret, et quodcumque tamquam occurreret. <strong>Idemne potest esse dies saepius, qui semel fuit?</strong> <code>Cave putes quicquam esse verius.</code> Quid ergo attinet gloriose loqui, nisi constanter loquare? <em>Quid autem habent admirationis, cum prope accesseris?</em> Nescio quo modo praetervolavit oratio.</p>\n<h2>Inde sermone vario sex illa a Dipylo stadia confecimus.</h2>\n<p>Callipho ad virtutem nihil adiunxit nisi voluptatem, Diodorus vacuitatem doloris. <em>Si longus, levis dictata sunt.</em> Maximus dolor, inquit, brevis est. Experiamur igitur, inquit, etsi habet haec Stoicorum ratio difficilius quiddam et obscurius. <em>Paria sunt igitur.</em> <strong>Et nemo nimium beatus est;</strong> Cupit enim d&iacute;cere nihil posse ad beatam vitam deesse sapienti. <em>Confecta res esset.</em></p>\n<pre>Aliam vero vim voluptatis esse, aliam nihil dolendi, nisi\nvalde pertinax fueris, concedas necesse est.\n\nIs enim, qui occultus et tectus dicitur, tantum abest ut se\nindicet, perficiet etiam ut dolere alterius improbe facto\nvideatur.\n</pre>\n<p>Cur ipse Pythagoras et Aegyptum lustravit et Persarum magos adiit? <a href="http://loripsum.net/" target="_blank" rel="noopener">De illis, cum volemus.</a> Itaque dicunt nec dubitant: mihi sic usus est, tibi ut opus est facto, fac. Quis enim potest istis, quae te, ut ais, delectant, brevibus et acutis auditis de sententia decedere? Zenonis est, inquam, hoc Stoici. Huius, Lyco, oratione locuples, rebus ipsis ielunior. Quis hoc dicit? An ea, quae per vinitorem antea consequebatur, per se ipsa curabit?</p>	94ae648c-94ca-4335-bae4-8cb4dc849db4	Long Description	t	[{"name":"size","options":["small","medium","large","extra large"]},{"name":"weight","options":["1kg","2kg","4kg","8kg","16kg","32kg","64kg","128kg"]}]	[{"title":"Nice title","description":"Short meta description"}]	1.99000001	t
15	2021-07-01 21:57:49.012+08	2021-08-06 18:02:47.687+08	23	<p>asdf</p>	cc5509ea-08e4-4218-a490-e7d7361cee33	Toh Hong Xiang	f	\N	[]	\N	t
\.


--
-- Data for Name: products_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_categories (id, products_id, categories_id) FROM stdin;
11	\N	\N
10	\N	\N
40	15	8
41	15	9
42	15	10
43	15	11
44	15	12
45	15	13
46	15	14
47	15	15
48	15	16
49	15	17
\.


--
-- Data for Name: products_directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_directus_files (id, products_id, directus_files_id) FROM stdin;
2	\N	\N
1	\N	\N
4	\N	\N
6	\N	\N
8	\N	\N
5	\N	\N
10	\N	\N
7	\N	\N
9	\N	\N
3	\N	\N
21	15	2d512394-43e8-44d8-8c11-dcecd6f76bb1
22	15	d9ef52a9-a363-430b-aa4d-7f3e42556e71
23	15	0917ba65-ba7c-4c76-af36-a99da02b16f7
12	\N	7f82fb20-b725-43f3-9d2d-982eebb223b4
13	\N	1a3c07ca-a810-4f8d-b0f2-3a3b484442a2
14	\N	0917ba65-ba7c-4c76-af36-a99da02b16f7
15	\N	f10c637b-a843-4362-aef4-41a17bc19dad
16	\N	cfc63c8f-bf12-4a95-8104-273da350be8f
17	\N	d9ef52a9-a363-430b-aa4d-7f3e42556e71
18	\N	d5eca683-11e4-4ef7-ab0d-13fc53d43a93
11	\N	0917ba65-ba7c-4c76-af36-a99da02b16f7
19	\N	4d8df203-e142-45dc-b825-658fc01763ac
20	\N	2d512394-43e8-44d8-8c11-dcecd6f76bb1
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 17, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 1561, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 90, true);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 46, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 5, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 29, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 217, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, true);


--
-- Name: products_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_categories_id_seq', 49, true);


--
-- Name: products_directus_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_directus_files_id_seq', 23, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 16, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: products_categories products_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_pkey PRIMARY KEY (id);


--
-- Name: products_directus_files products_directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_directus_files
    ADD CONSTRAINT products_directus_files_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_fields(id);


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: products_categories products_categories_categories_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_categories_id_foreign FOREIGN KEY (categories_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: products_categories products_categories_products_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT products_categories_products_id_foreign FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_directus_files products_directus_files_directus_files_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_directus_files
    ADD CONSTRAINT products_directus_files_directus_files_id_foreign FOREIGN KEY (directus_files_id) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: products_directus_files products_directus_files_products_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_directus_files
    ADD CONSTRAINT products_directus_files_products_id_foreign FOREIGN KEY (products_id) REFERENCES public.products(id) ON DELETE SET NULL;


--
-- Name: products products_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id);


--
-- PostgreSQL database dump complete
--

