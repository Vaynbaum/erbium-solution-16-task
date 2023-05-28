--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2023-05-28 23:35:38

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

SET default_table_access_method = heap;

--
-- TOC entry 275 (class 1259 OID 16998)
-- Name: basic_test_statuses; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.basic_test_statuses (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.basic_test_statuses OWNER TO hack_db_3kwr_user;

--
-- TOC entry 274 (class 1259 OID 16997)
-- Name: basic_test_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.basic_test_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basic_test_statuses_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3707 (class 0 OID 0)
-- Dependencies: 274
-- Name: basic_test_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.basic_test_statuses_id_seq OWNED BY public.basic_test_statuses.id;


--
-- TOC entry 285 (class 1259 OID 17048)
-- Name: basic_tests; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.basic_tests (
    id integer NOT NULL,
    basic_test_status_id integer,
    type_basic_test_id integer,
    passed boolean,
    value integer,
    begin timestamp without time zone NOT NULL,
    "end" timestamp without time zone NOT NULL,
    intern_id integer
);


ALTER TABLE public.basic_tests OWNER TO hack_db_3kwr_user;

--
-- TOC entry 284 (class 1259 OID 17047)
-- Name: basic_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.basic_tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basic_tests_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3708 (class 0 OID 0)
-- Dependencies: 284
-- Name: basic_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.basic_tests_id_seq OWNED BY public.basic_tests.id;


--
-- TOC entry 231 (class 1259 OID 16626)
-- Name: branchs; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.branchs (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.branchs OWNER TO hack_db_3kwr_user;

--
-- TOC entry 230 (class 1259 OID 16625)
-- Name: branchs_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.branchs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branchs_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3709 (class 0 OID 0)
-- Dependencies: 230
-- Name: branchs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.branchs_id_seq OWNED BY public.branchs.id;


--
-- TOC entry 287 (class 1259 OID 17070)
-- Name: championships; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.championships (
    id integer NOT NULL,
    value integer,
    comment text,
    selection_id integer,
    passed boolean
);


ALTER TABLE public.championships OWNER TO hack_db_3kwr_user;

--
-- TOC entry 286 (class 1259 OID 17069)
-- Name: championships_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.championships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.championships_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3710 (class 0 OID 0)
-- Dependencies: 286
-- Name: championships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.championships_id_seq OWNED BY public.championships.id;


--
-- TOC entry 225 (class 1259 OID 16544)
-- Name: cities; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    region_id integer
);


ALTER TABLE public.cities OWNER TO hack_db_3kwr_user;

--
-- TOC entry 224 (class 1259 OID 16543)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3711 (class 0 OID 0)
-- Dependencies: 224
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 213 (class 1259 OID 16502)
-- Name: citizenships; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.citizenships (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.citizenships OWNER TO hack_db_3kwr_user;

--
-- TOC entry 212 (class 1259 OID 16501)
-- Name: citizenships_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.citizenships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citizenships_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3712 (class 0 OID 0)
-- Dependencies: 212
-- Name: citizenships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.citizenships_id_seq OWNED BY public.citizenships.id;


--
-- TOC entry 260 (class 1259 OID 16855)
-- Name: conditions; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.conditions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    vacancy_id integer
);


ALTER TABLE public.conditions OWNER TO hack_db_3kwr_user;

--
-- TOC entry 259 (class 1259 OID 16854)
-- Name: conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.conditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conditions_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3713 (class 0 OID 0)
-- Dependencies: 259
-- Name: conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.conditions_id_seq OWNED BY public.conditions.id;


--
-- TOC entry 217 (class 1259 OID 16516)
-- Name: courses; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.courses OWNER TO hack_db_3kwr_user;

--
-- TOC entry 216 (class 1259 OID 16515)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3714 (class 0 OID 0)
-- Dependencies: 216
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 248 (class 1259 OID 16707)
-- Name: curators; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.curators (
    id integer NOT NULL,
    training_direction_id integer
);


ALTER TABLE public.curators OWNER TO hack_db_3kwr_user;

--
-- TOC entry 219 (class 1259 OID 16523)
-- Name: directions; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.directions (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.directions OWNER TO hack_db_3kwr_user;

--
-- TOC entry 218 (class 1259 OID 16522)
-- Name: directions_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.directions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directions_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3715 (class 0 OID 0)
-- Dependencies: 218
-- Name: directions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.directions_id_seq OWNED BY public.directions.id;


--
-- TOC entry 262 (class 1259 OID 16867)
-- Name: duties; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.duties (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    vacancy_id integer
);


ALTER TABLE public.duties OWNER TO hack_db_3kwr_user;

--
-- TOC entry 261 (class 1259 OID 16866)
-- Name: duties_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.duties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.duties_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3716 (class 0 OID 0)
-- Dependencies: 261
-- Name: duties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.duties_id_seq OWNED BY public.duties.id;


--
-- TOC entry 233 (class 1259 OID 16633)
-- Name: employment_types; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.employment_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.employment_types OWNER TO hack_db_3kwr_user;

--
-- TOC entry 232 (class 1259 OID 16632)
-- Name: employment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.employment_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employment_types_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 232
-- Name: employment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.employment_types_id_seq OWNED BY public.employment_types.id;


--
-- TOC entry 250 (class 1259 OID 16723)
-- Name: events; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    date timestamp without time zone NOT NULL,
    speaker_id integer
);


ALTER TABLE public.events OWNER TO hack_db_3kwr_user;

--
-- TOC entry 249 (class 1259 OID 16722)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 249
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 268 (class 1259 OID 16918)
-- Name: history_work_experiences; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.history_work_experiences (
    id integer NOT NULL,
    organization character varying(255) NOT NULL,
    post character varying(255) NOT NULL,
    year_begin integer NOT NULL,
    year_end integer NOT NULL,
    intern_id integer
);


ALTER TABLE public.history_work_experiences OWNER TO hack_db_3kwr_user;

--
-- TOC entry 267 (class 1259 OID 16917)
-- Name: history_work_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.history_work_experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_work_experiences_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 267
-- Name: history_work_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.history_work_experiences_id_seq OWNED BY public.history_work_experiences.id;


--
-- TOC entry 252 (class 1259 OID 16751)
-- Name: hrs; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.hrs (
    id integer NOT NULL,
    organization_id integer
);


ALTER TABLE public.hrs OWNER TO hack_db_3kwr_user;

--
-- TOC entry 229 (class 1259 OID 16589)
-- Name: interns; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.interns (
    id integer NOT NULL,
    university_id integer,
    course_id integer,
    direction_id integer,
    internship_status_id integer,
    training_direction_id integer,
    volunteering boolean,
    about_me text,
    branch_id integer,
    github character varying(255),
    vk character varying(255),
    portfolio character varying(255),
    url_portfolio character varying(255),
    organizations character varying(255),
    work_experience_id integer,
    organization_id integer
);


ALTER TABLE public.interns OWNER TO hack_db_3kwr_user;

--
-- TOC entry 221 (class 1259 OID 16530)
-- Name: internship_statuses; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.internship_statuses (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.internship_statuses OWNER TO hack_db_3kwr_user;

--
-- TOC entry 220 (class 1259 OID 16529)
-- Name: internship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.internship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.internship_statuses_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 220
-- Name: internship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.internship_statuses_id_seq OWNED BY public.internship_statuses.id;


--
-- TOC entry 295 (class 1259 OID 17124)
-- Name: interviews; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.interviews (
    id integer NOT NULL,
    comment text,
    name text NOT NULL,
    answer text,
    value integer,
    type_interview_id integer,
    selection_id integer,
    mentor_id integer,
    passed boolean,
    date timestamp without time zone NOT NULL
);


ALTER TABLE public.interviews OWNER TO hack_db_3kwr_user;

--
-- TOC entry 294 (class 1259 OID 17123)
-- Name: interviews_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.interviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interviews_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 294
-- Name: interviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.interviews_id_seq OWNED BY public.interviews.id;


--
-- TOC entry 305 (class 1259 OID 17328)
-- Name: invations; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.invations (
    code character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role_id integer,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.invations OWNER TO hack_db_3kwr_user;

--
-- TOC entry 273 (class 1259 OID 16967)
-- Name: language_interns; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.language_interns (
    language_id integer NOT NULL,
    intern_id integer NOT NULL
);


ALTER TABLE public.language_interns OWNER TO hack_db_3kwr_user;

--
-- TOC entry 272 (class 1259 OID 16961)
-- Name: languages; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.languages OWNER TO hack_db_3kwr_user;

--
-- TOC entry 271 (class 1259 OID 16960)
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 271
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- TOC entry 298 (class 1259 OID 17197)
-- Name: mentor_reviews; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.mentor_reviews (
    id integer NOT NULL,
    text text NOT NULL,
    value integer NOT NULL,
    mentor_id integer,
    intern_id integer
);


ALTER TABLE public.mentor_reviews OWNER TO hack_db_3kwr_user;

--
-- TOC entry 297 (class 1259 OID 17196)
-- Name: mentor_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.mentor_reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mentor_reviews_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 297
-- Name: mentor_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.mentor_reviews_id_seq OWNED BY public.mentor_reviews.id;


--
-- TOC entry 253 (class 1259 OID 16766)
-- Name: mentors; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.mentors (
    id integer NOT NULL,
    organization_id integer
);


ALTER TABLE public.mentors OWNER TO hack_db_3kwr_user;

--
-- TOC entry 270 (class 1259 OID 16932)
-- Name: metros; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.metros (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.metros OWNER TO hack_db_3kwr_user;

--
-- TOC entry 269 (class 1259 OID 16931)
-- Name: metros_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.metros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metros_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 269
-- Name: metros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.metros_id_seq OWNED BY public.metros.id;


--
-- TOC entry 255 (class 1259 OID 16782)
-- Name: organization_reviews; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.organization_reviews (
    id integer NOT NULL,
    text text NOT NULL,
    value integer NOT NULL,
    organization_id integer,
    intern_id integer
);


ALTER TABLE public.organization_reviews OWNER TO hack_db_3kwr_user;

--
-- TOC entry 254 (class 1259 OID 16781)
-- Name: organization_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.organization_reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organization_reviews_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 254
-- Name: organization_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.organization_reviews_id_seq OWNED BY public.organization_reviews.id;


--
-- TOC entry 235 (class 1259 OID 16640)
-- Name: organization_types; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.organization_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.organization_types OWNER TO hack_db_3kwr_user;

--
-- TOC entry 234 (class 1259 OID 16639)
-- Name: organization_types_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.organization_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organization_types_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 234
-- Name: organization_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.organization_types_id_seq OWNED BY public.organization_types.id;


--
-- TOC entry 247 (class 1259 OID 16684)
-- Name: organizations; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.organizations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    img text,
    address character varying(255) NOT NULL,
    latitude double precision,
    longitude double precision,
    email character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    training_direction_id integer,
    branch_id integer,
    type_id integer
);


ALTER TABLE public.organizations OWNER TO hack_db_3kwr_user;

--
-- TOC entry 246 (class 1259 OID 16683)
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.organizations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizations_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 246
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;


--
-- TOC entry 211 (class 1259 OID 16469)
-- Name: permissions; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.permissions (
    role_id integer NOT NULL,
    url character varying(20) NOT NULL,
    type character varying(6) NOT NULL
);


ALTER TABLE public.permissions OWNER TO hack_db_3kwr_user;

--
-- TOC entry 304 (class 1259 OID 17292)
-- Name: presences; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.presences (
    id integer NOT NULL,
    intern_id integer,
    vacancy_id integer,
    mentor_id integer,
    status character varying(30),
    date timestamp without time zone,
    hour integer
);


ALTER TABLE public.presences OWNER TO hack_db_3kwr_user;

--
-- TOC entry 303 (class 1259 OID 17291)
-- Name: presences_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.presences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presences_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 303
-- Name: presences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.presences_id_seq OWNED BY public.presences.id;


--
-- TOC entry 228 (class 1259 OID 16579)
-- Name: recoveries; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.recoveries (
    code character varying(255) NOT NULL,
    user_id integer,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.recoveries OWNER TO hack_db_3kwr_user;

--
-- TOC entry 215 (class 1259 OID 16509)
-- Name: regions; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.regions OWNER TO hack_db_3kwr_user;

--
-- TOC entry 214 (class 1259 OID 16508)
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 214
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- TOC entry 264 (class 1259 OID 16879)
-- Name: requirements; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.requirements (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    vacancy_id integer
);


ALTER TABLE public.requirements OWNER TO hack_db_3kwr_user;

--
-- TOC entry 263 (class 1259 OID 16878)
-- Name: requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requirements_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 263
-- Name: requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.requirements_id_seq OWNED BY public.requirements.id;


--
-- TOC entry 281 (class 1259 OID 17019)
-- Name: response_statuses; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.response_statuses (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.response_statuses OWNER TO hack_db_3kwr_user;

--
-- TOC entry 280 (class 1259 OID 17018)
-- Name: response_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.response_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.response_statuses_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 280
-- Name: response_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.response_statuses_id_seq OWNED BY public.response_statuses.id;


--
-- TOC entry 291 (class 1259 OID 17098)
-- Name: responses; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.responses (
    id integer NOT NULL,
    comment text,
    response_status_id integer,
    selection_id integer,
    passed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.responses OWNER TO hack_db_3kwr_user;

--
-- TOC entry 290 (class 1259 OID 17097)
-- Name: responses_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.responses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.responses_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 290
-- Name: responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.responses_id_seq OWNED BY public.responses.id;


--
-- TOC entry 210 (class 1259 OID 16395)
-- Name: roles; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.roles OWNER TO hack_db_3kwr_user;

--
-- TOC entry 209 (class 1259 OID 16394)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 209
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 289 (class 1259 OID 17084)
-- Name: scholls; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.scholls (
    id integer NOT NULL,
    value integer,
    comment text,
    passed boolean,
    intern_id integer
);


ALTER TABLE public.scholls OWNER TO hack_db_3kwr_user;

--
-- TOC entry 288 (class 1259 OID 17083)
-- Name: scholls_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.scholls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scholls_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 288
-- Name: scholls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.scholls_id_seq OWNED BY public.scholls.id;


--
-- TOC entry 296 (class 1259 OID 17168)
-- Name: selection_basic_tests; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.selection_basic_tests (
    basic_test_id integer NOT NULL,
    selection_id integer NOT NULL
);


ALTER TABLE public.selection_basic_tests OWNER TO hack_db_3kwr_user;

--
-- TOC entry 283 (class 1259 OID 17026)
-- Name: selections; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.selections (
    id integer NOT NULL,
    vacancy_id integer,
    stage_id integer,
    intern_id integer,
    school_id integer
);


ALTER TABLE public.selections OWNER TO hack_db_3kwr_user;

--
-- TOC entry 282 (class 1259 OID 17025)
-- Name: selections_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.selections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.selections_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3735 (class 0 OID 0)
-- Dependencies: 282
-- Name: selections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.selections_id_seq OWNED BY public.selections.id;


--
-- TOC entry 251 (class 1259 OID 16736)
-- Name: skill_interns; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.skill_interns (
    skill_id integer NOT NULL,
    intern_id integer NOT NULL
);


ALTER TABLE public.skill_interns OWNER TO hack_db_3kwr_user;

--
-- TOC entry 258 (class 1259 OID 16839)
-- Name: skill_vacancies; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.skill_vacancies (
    skill_id integer NOT NULL,
    vacancy_id integer NOT NULL
);


ALTER TABLE public.skill_vacancies OWNER TO hack_db_3kwr_user;

--
-- TOC entry 245 (class 1259 OID 16677)
-- Name: skills; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.skills (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.skills OWNER TO hack_db_3kwr_user;

--
-- TOC entry 244 (class 1259 OID 16676)
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.skills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skills_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3736 (class 0 OID 0)
-- Dependencies: 244
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;


--
-- TOC entry 243 (class 1259 OID 16668)
-- Name: speakers; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.speakers (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    firstname character varying(20) NOT NULL,
    lastname character varying(20) NOT NULL,
    patronymic character varying(20),
    img character varying(255)
);


ALTER TABLE public.speakers OWNER TO hack_db_3kwr_user;

--
-- TOC entry 242 (class 1259 OID 16667)
-- Name: speakers_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.speakers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.speakers_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3737 (class 0 OID 0)
-- Dependencies: 242
-- Name: speakers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.speakers_id_seq OWNED BY public.speakers.id;


--
-- TOC entry 279 (class 1259 OID 17012)
-- Name: stages; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.stages (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.stages OWNER TO hack_db_3kwr_user;

--
-- TOC entry 278 (class 1259 OID 17011)
-- Name: stages_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stages_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3738 (class 0 OID 0)
-- Dependencies: 278
-- Name: stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.stages_id_seq OWNED BY public.stages.id;


--
-- TOC entry 300 (class 1259 OID 17218)
-- Name: tasks; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    vacancy_id integer,
    training_direction_id integer,
    url_portfolio character varying(255),
    mentor_id integer
);


ALTER TABLE public.tasks OWNER TO hack_db_3kwr_user;

--
-- TOC entry 299 (class 1259 OID 17217)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3739 (class 0 OID 0)
-- Dependencies: 299
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- TOC entry 237 (class 1259 OID 16647)
-- Name: training_directions; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.training_directions (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.training_directions OWNER TO hack_db_3kwr_user;

--
-- TOC entry 236 (class 1259 OID 16646)
-- Name: training_directions_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.training_directions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.training_directions_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3740 (class 0 OID 0)
-- Dependencies: 236
-- Name: training_directions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.training_directions_id_seq OWNED BY public.training_directions.id;


--
-- TOC entry 277 (class 1259 OID 17005)
-- Name: type_basic_tests; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.type_basic_tests (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.type_basic_tests OWNER TO hack_db_3kwr_user;

--
-- TOC entry 276 (class 1259 OID 17004)
-- Name: type_basic_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.type_basic_tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_basic_tests_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3741 (class 0 OID 0)
-- Dependencies: 276
-- Name: type_basic_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.type_basic_tests_id_seq OWNED BY public.type_basic_tests.id;


--
-- TOC entry 293 (class 1259 OID 17117)
-- Name: type_interviews; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.type_interviews (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.type_interviews OWNER TO hack_db_3kwr_user;

--
-- TOC entry 292 (class 1259 OID 17116)
-- Name: type_interviews_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.type_interviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_interviews_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3742 (class 0 OID 0)
-- Dependencies: 292
-- Name: type_interviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.type_interviews_id_seq OWNED BY public.type_interviews.id;


--
-- TOC entry 223 (class 1259 OID 16537)
-- Name: universities; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.universities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    city_id integer,
    sub character varying(100)
);


ALTER TABLE public.universities OWNER TO hack_db_3kwr_user;

--
-- TOC entry 222 (class 1259 OID 16536)
-- Name: universities_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.universities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universities_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3743 (class 0 OID 0)
-- Dependencies: 222
-- Name: universities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.universities_id_seq OWNED BY public.universities.id;


--
-- TOC entry 227 (class 1259 OID 16556)
-- Name: users; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    firstname character varying(20) NOT NULL,
    lastname character varying(20) NOT NULL,
    patronymic character varying(20),
    birthdate timestamp without time zone NOT NULL,
    img character varying(255),
    role_id integer NOT NULL,
    city_id integer,
    citizenship_id integer,
    nickname character varying(255) NOT NULL,
    gender boolean,
    is_verified boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO hack_db_3kwr_user;

--
-- TOC entry 226 (class 1259 OID 16555)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3744 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 257 (class 1259 OID 16801)
-- Name: vacancies; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.vacancies (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    min_salary integer DEFAULT 0 NOT NULL,
    max_salary integer DEFAULT 0 NOT NULL,
    date_begin timestamp without time zone NOT NULL,
    date_end timestamp without time zone NOT NULL,
    published boolean NOT NULL,
    work_schedule_id integer NOT NULL,
    organization_id integer NOT NULL,
    employment_type_id integer NOT NULL,
    hr_creater_id integer,
    mentor_id integer,
    work_experience_id integer NOT NULL,
    status_id integer NOT NULL,
    cnt_intern integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.vacancies OWNER TO hack_db_3kwr_user;

--
-- TOC entry 256 (class 1259 OID 16800)
-- Name: vacancies_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.vacancies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vacancies_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3745 (class 0 OID 0)
-- Dependencies: 256
-- Name: vacancies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.vacancies_id_seq OWNED BY public.vacancies.id;


--
-- TOC entry 266 (class 1259 OID 16891)
-- Name: vacancy_reviews; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.vacancy_reviews (
    id integer NOT NULL,
    text text NOT NULL,
    value integer NOT NULL,
    vacancy_id integer,
    intern_id integer
);


ALTER TABLE public.vacancy_reviews OWNER TO hack_db_3kwr_user;

--
-- TOC entry 265 (class 1259 OID 16890)
-- Name: vacancy_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.vacancy_reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vacancy_reviews_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3746 (class 0 OID 0)
-- Dependencies: 265
-- Name: vacancy_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.vacancy_reviews_id_seq OWNED BY public.vacancy_reviews.id;


--
-- TOC entry 302 (class 1259 OID 17240)
-- Name: vacancy_statuses; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.vacancy_statuses (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.vacancy_statuses OWNER TO hack_db_3kwr_user;

--
-- TOC entry 301 (class 1259 OID 17239)
-- Name: vacancy_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.vacancy_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vacancy_statuses_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3747 (class 0 OID 0)
-- Dependencies: 301
-- Name: vacancy_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.vacancy_statuses_id_seq OWNED BY public.vacancy_statuses.id;


--
-- TOC entry 239 (class 1259 OID 16654)
-- Name: work_experiences; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.work_experiences (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.work_experiences OWNER TO hack_db_3kwr_user;

--
-- TOC entry 238 (class 1259 OID 16653)
-- Name: work_experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.work_experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_experiences_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3748 (class 0 OID 0)
-- Dependencies: 238
-- Name: work_experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.work_experiences_id_seq OWNED BY public.work_experiences.id;


--
-- TOC entry 241 (class 1259 OID 16661)
-- Name: work_schedules; Type: TABLE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE TABLE public.work_schedules (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.work_schedules OWNER TO hack_db_3kwr_user;

--
-- TOC entry 240 (class 1259 OID 16660)
-- Name: work_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: hack_db_3kwr_user
--

CREATE SEQUENCE public.work_schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_schedules_id_seq OWNER TO hack_db_3kwr_user;

--
-- TOC entry 3749 (class 0 OID 0)
-- Dependencies: 240
-- Name: work_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hack_db_3kwr_user
--

ALTER SEQUENCE public.work_schedules_id_seq OWNED BY public.work_schedules.id;


--
-- TOC entry 3269 (class 2604 OID 17001)
-- Name: basic_test_statuses id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.basic_test_statuses ALTER COLUMN id SET DEFAULT nextval('public.basic_test_statuses_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 17051)
-- Name: basic_tests id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.basic_tests ALTER COLUMN id SET DEFAULT nextval('public.basic_tests_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 16629)
-- Name: branchs id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.branchs ALTER COLUMN id SET DEFAULT nextval('public.branchs_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 17073)
-- Name: championships id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.championships ALTER COLUMN id SET DEFAULT nextval('public.championships_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 16547)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16505)
-- Name: citizenships id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.citizenships ALTER COLUMN id SET DEFAULT nextval('public.citizenships_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 16858)
-- Name: conditions id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.conditions ALTER COLUMN id SET DEFAULT nextval('public.conditions_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 16519)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16526)
-- Name: directions id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.directions ALTER COLUMN id SET DEFAULT nextval('public.directions_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 16870)
-- Name: duties id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.duties ALTER COLUMN id SET DEFAULT nextval('public.duties_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 16636)
-- Name: employment_types id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.employment_types ALTER COLUMN id SET DEFAULT nextval('public.employment_types_id_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 16726)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 16921)
-- Name: history_work_experiences id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.history_work_experiences ALTER COLUMN id SET DEFAULT nextval('public.history_work_experiences_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16533)
-- Name: internship_statuses id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.internship_statuses ALTER COLUMN id SET DEFAULT nextval('public.internship_statuses_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 17127)
-- Name: interviews id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interviews ALTER COLUMN id SET DEFAULT nextval('public.interviews_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 16964)
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 17200)
-- Name: mentor_reviews id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.mentor_reviews ALTER COLUMN id SET DEFAULT nextval('public.mentor_reviews_id_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 16935)
-- Name: metros id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.metros ALTER COLUMN id SET DEFAULT nextval('public.metros_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 16785)
-- Name: organization_reviews id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organization_reviews ALTER COLUMN id SET DEFAULT nextval('public.organization_reviews_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 16643)
-- Name: organization_types id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organization_types ALTER COLUMN id SET DEFAULT nextval('public.organization_types_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 16687)
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 17295)
-- Name: presences id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.presences ALTER COLUMN id SET DEFAULT nextval('public.presences_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16512)
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 16882)
-- Name: requirements id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.requirements ALTER COLUMN id SET DEFAULT nextval('public.requirements_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 17022)
-- Name: response_statuses id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.response_statuses ALTER COLUMN id SET DEFAULT nextval('public.response_statuses_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 17101)
-- Name: responses id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.responses ALTER COLUMN id SET DEFAULT nextval('public.responses_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16398)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 17087)
-- Name: scholls id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.scholls ALTER COLUMN id SET DEFAULT nextval('public.scholls_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 17029)
-- Name: selections id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.selections ALTER COLUMN id SET DEFAULT nextval('public.selections_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 16680)
-- Name: skills id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 16671)
-- Name: speakers id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.speakers ALTER COLUMN id SET DEFAULT nextval('public.speakers_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 17015)
-- Name: stages id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.stages ALTER COLUMN id SET DEFAULT nextval('public.stages_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 17221)
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 16650)
-- Name: training_directions id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.training_directions ALTER COLUMN id SET DEFAULT nextval('public.training_directions_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 17008)
-- Name: type_basic_tests id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.type_basic_tests ALTER COLUMN id SET DEFAULT nextval('public.type_basic_tests_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 17120)
-- Name: type_interviews id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.type_interviews ALTER COLUMN id SET DEFAULT nextval('public.type_interviews_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 16540)
-- Name: universities id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.universities ALTER COLUMN id SET DEFAULT nextval('public.universities_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16559)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 16804)
-- Name: vacancies id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancies ALTER COLUMN id SET DEFAULT nextval('public.vacancies_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 16894)
-- Name: vacancy_reviews id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancy_reviews ALTER COLUMN id SET DEFAULT nextval('public.vacancy_reviews_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 17243)
-- Name: vacancy_statuses id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancy_statuses ALTER COLUMN id SET DEFAULT nextval('public.vacancy_statuses_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 16657)
-- Name: work_experiences id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.work_experiences ALTER COLUMN id SET DEFAULT nextval('public.work_experiences_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 16664)
-- Name: work_schedules id; Type: DEFAULT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.work_schedules ALTER COLUMN id SET DEFAULT nextval('public.work_schedules_id_seq'::regclass);


--
-- TOC entry 3670 (class 0 OID 16998)
-- Dependencies: 275
-- Data for Name: basic_test_statuses; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.basic_test_statuses (id, name) FROM stdin;
1	Пройти
2	Пройдено
3	Не пройдено
\.


--
-- TOC entry 3680 (class 0 OID 17048)
-- Dependencies: 285
-- Data for Name: basic_tests; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.basic_tests (id, basic_test_status_id, type_basic_test_id, passed, value, begin, "end", intern_id) FROM stdin;
22	2	1	t	63	2023-05-26 15:34:38.569489	2023-09-08 15:34:38.569489	4
24	2	3	t	89	2023-05-26 15:34:38.569489	2023-09-08 15:34:38.569489	4
23	3	2	f	40	2023-05-26 15:34:38.569489	2023-09-08 15:34:38.569489	4
25	2	1	t	86	2023-05-27 20:18:34.831897	2023-09-09 20:18:34.831897	13
26	3	2	f	43	2023-05-27 20:18:34.831897	2023-09-09 20:18:34.831897	13
27	3	3	f	47	2023-05-27 20:18:34.831897	2023-09-09 20:18:34.831897	13
30	2	3	t	84	2023-05-28 17:32:04.925324	2023-09-10 17:32:04.925324	14
29	2	2	t	79	2023-05-28 17:32:04.925324	2023-09-10 17:32:04.925324	14
28	3	1	f	42	2023-05-28 17:32:04.925324	2023-09-10 17:32:04.925324	14
31	2	1	t	71	2023-05-28 17:55:40.822649	2023-09-10 17:55:40.822649	19
32	2	2	t	96	2023-05-28 17:55:40.822649	2023-09-10 17:55:40.822649	19
33	2	3	t	97	2023-05-28 17:55:40.822649	2023-09-10 17:55:40.822649	19
\.


--
-- TOC entry 3626 (class 0 OID 16626)
-- Dependencies: 231
-- Data for Name: branchs; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.branchs (id, name) FROM stdin;
1	Перевозки, логистика, склад, ВЭД
2	Информационные технологии, системная интеграция, интернет
3	Электроника, приборостроение, бытовая техника, компьютеры и оргтехника
4	Телекоммуникации, связь
5	СМИ, маркетинг, реклама, BTL, PR, дизайн, продюсирование
6	Строительство, недвижимость, эксплуатация, проектирование
7	Автомобильный бизнес
8	Лесная промышленность, деревообработка
9	Металлургия, металлообработка
10	Продукты питания
11	Сельское хозяйство
12	Тяжелое машиностроение
13	Химическое производство, удобрения
14	Государственные организации
15	Общественная деятельность, партии, благотворительность, НКО
16	Образовательные учреждения
17	Розничная торговля
18	Товары народного потребления (непищевые)
19	Финансовый сектор
20	Услуги для бизнеса
21	Добывающая отрасль
22	Энергетика
23	Нефть и газ
24	Медицина, фармацевтика, аптеки
25	Услуги для населения
26	Гостиницы, рестораны, общепит, кейтеринг
27	ЖКХ
28	Искусство, культура
29	Промышленное оборудование, техника, станки и комплектующие
30	Управление многопрофильными активами
31	Информационная инфрастрактура
32	Аналитика, Продвижение
33	Экономика
\.


--
-- TOC entry 3682 (class 0 OID 17070)
-- Dependencies: 287
-- Data for Name: championships; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.championships (id, value, comment, selection_id, passed) FROM stdin;
\.


--
-- TOC entry 3620 (class 0 OID 16544)
-- Dependencies: 225
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.cities (id, name, region_id) FROM stdin;
1	Нижний Новгород	1
2	Москва	2
3	Санкт-Петербург	4
12	Севастополь	14
22	Арбаж	19
23	Аркуль	19
24	Архангельское (Кировская область)	19
25	Афанасьево (Кировская область)	19
26	Безбожник	19
27	Белая Холуница	19
28	Бисерово	19
29	Богородское	19
30	Большой Рой	19
31	Вахруши	19
32	Верхосунье	19
33	Верхошижемье	19
34	Вичевщина	19
35	Восточный (Кировская область)	19
36	Вятские Поляны	19
37	Гордино	19
38	Гостовский	19
39	Даровской	19
40	Демьяново	19
41	Залазна	19
42	Заря (Кировская область)	19
43	Зуевка	19
44	Карино	19
45	Кикнур	19
46	Кильмезь (Кировская область)	19
47	Киров (Кировская область)	19
48	Кирово-Чепецк	19
49	Кирс	19
50	Коршик	19
51	Котельнич	19
52	Красная Поляна (Кировская область)	19
53	Кстинино	19
54	Кулыги	19
55	Кумены	19
56	Лаж	19
57	Лазарево (Кировская область)	19
58	Лальск	19
59	Лебяжье (Кировская область)	19
60	Ленинская Искра	19
61	Ленинское	19
62	Лесной (Кировская область)	19
63	Лесные Поляны (Кировская область)	19
64	Лойно	19
65	Луза	19
66	Малмыж	19
67	Маромица	19
68	Медведок	19
69	Мирный (Кировская область)	19
70	Мураши	19
71	Мурыгино	19
72	Мухино	19
73	Нагорск	19
74	Нема	19
75	Нижнеивкино	19
76	Нолинск	19
77	Октябрьский (Кировская область)	19
78	Омутнинск	19
79	Опарино	19
80	Оричи	19
81	Орлов	19
82	Косино	19
83	Пасегово	19
84	Первомайский (Кировская область)	19
85	Песковка	19
86	Пижанка	19
87	Пинюг	19
88	Подосиновец	19
89	Полом	19
90	Рожки	19
91	Рудничный	19
92	Русский Турек	19
93	Санчурск	19
94	Светлополянск	19
95	Свеча	19
96	Синегорье (Кировская область)	19
97	Слободской	19
98	Советск (Кировская область)	19
99	Созимский	19
100	Сосновка	19
101	Среднеивкино	19
102	Средние Шуни	19
103	Стрижи	19
104	Стулово	19
105	Суна	19
106	Тужа	19
107	Уни	19
108	Уржум	19
109	Усть-Люга	19
110	Фалёнки	19
111	Черная Холуница	19
112	Швариха	19
113	Шестаково	19
114	Шурма	19
115	Юрья	19
116	Яранск	19
117	Абабково	1
118	Абрамово	1
119	Азрапино	1
120	Алферьево	1
121	Ардатов (Нижегородская область)	1
122	Арефино	1
123	Арзамас	1
124	Арья	1
125	Афанасьево	1
126	Афонино	1
127	Байково	1
128	Балахна	1
129	Бармино	1
130	Бебяево	1
131	Белавка	1
132	Беласовка	1
133	Березовка (Нижегородская область)	1
134	Ближне-Песочное	1
135	Богородск	1
136	Большая Арать	1
137	Большая Аря	1
138	Большое Болдино	1
139	Большое Козино	1
140	Большое Мурашкино	1
141	Большое Пикино	1
142	Большое Туманово	1
143	Большое Череватово	1
144	Бор	1
145	Буревестник	1
146	Буреполом	1
147	Бутурлино	1
148	Вад	1
149	Вазьянка	1
150	Валтово	1
151	Варнавино	1
152	Васильсурск	1
153	Вахтан	1
154	Вача	1
155	Верхнее Талызино	1
156	Ветлуга	1
157	Ветлужский (Нижегородская область)	1
158	Виля	1
159	Водоватово	1
160	Воздвиженское	1
161	Вознесенское (Нижегородская область)	1
162	Володарск	1
163	Воротынец	1
164	Ворсма	1
165	Воскресенское	1
166	Выездное	1
167	Выкса	1
168	Высокий Оселок	1
169	Гавриловка	1
170	Гагино	1
171	Гидроторф	1
172	Горбатов	1
173	Горбатовка	1
174	Городец	1
175	Гремячево	1
176	Доскино	1
177	Грудцино	1
178	Дальнее Константиново	1
179	Деяново	1
180	Дзержинск (Нижегородская область)	1
181	Дивеево	1
182	Досчатое	1
183	Дружба (Нижегородская область)	1
184	Дружный	1
185	Ждановский	1
186	Заволжье	1
187	Запрудное	1
188	Ильиногорск	1
189	Истомино	1
190	Каменки	1
191	Кантаурово	1
192	Карпуниха	1
193	Катунки	1
194	Княгинино	1
195	Ковернино	1
196	Конново	1
197	Кочетовка	1
198	Кочкурово	1
199	Кочуново	1
200	Красное (Нижегородская область)	1
201	Красные Баки	1
202	Красный Ватрас	1
203	Крюковка	1
204	Кстово	1
205	Кулебаки	1
206	Линда	1
207	Ломовка (Нижегородская область)	1
208	Лукино	1
209	Лукоянов	1
210	Лысково	1
211	Медяна	1
212	Мотовилово	1
213	Мотызлей	1
214	Мошкино	1
215	Мулино	1
216	Мурзицы	1
217	Мухтолово	1
218	Навашино	1
219	Наруксово	1
220	Натальино	1
221	Неверово	1
222	Неклюдово	1
223	Новая Слобода	1
224	Новинки	1
225	Новодмитриевка	1
226	Новоликеево	1
227	Новосмолинский	1
228	Октябрьский (Нижегородская область)	1
229	Останкино	1
230	Ошминское	1
231	Павлово	1
232	Первое Мая	1
233	Первомайск (Нижегородская область)	1
234	Перевоз	1
235	Петряксы	1
236	Пижма	1
237	Пильна	1
238	Плотинка	1
239	Поздняково	1
240	Полховский Майдан	1
241	посёлок Память Парижской Коммуны	1
367	Сотницыно	20
242	Поселок Селекционной Станции	1
243	поселок Степана Разина	1
244	Починки  ( Нижегородская область)	1
245	Прокошево	1
246	Пруды	1
247	Пурех	1
248	Работки	1
249	Рабочий поселок им. Степана Разина	1
250	Редькино	1
251	Решетиха	1
252	Роженцово	1
253	Саваслейка	1
254	Саврасово	1
255	Саконы	1
256	Салганы	1
257	Саров	1
258	Сатис	1
259	Северный (Нижегородская область)	1
260	Селитьба	1
261	Семенов	1
262	Семино	1
263	Семьяны	1
264	Сергач	1
265	Сеченово	1
266	Слизнево	1
267	Смиркино	1
268	Смолино	1
269	Советский (Нижегородская область)	1
270	Сокольское	1
271	Сомовка	1
272	Сосновское	1
273	Спасское	1
274	Старая Рудка	1
275	Суворово	1
276	Суроватиха	1
277	Сухобезводное	1
278	Сухоноска	1
279	Сява	1
280	Тарасиха	1
281	Таремское	1
282	Теплово	1
283	Теша	1
284	Тонкино	1
285	Тоншаево	1
286	Тумботино	1
287	Ужовка	1
288	Уразовка	1
289	Урень	1
290	Уста	1
291	Ушаково	1
292	Федяково (Нижегородская область)	1
293	Филинское	1
294	Хмелевицы	1
295	Хрипуново	1
296	Центральный	1
297	Черновское	1
298	Чернуха	1
299	Чистое Борское	1
300	Чкаловск	1
301	Чулково (Нижегородская область)	1
302	Шагаево	1
303	Шандрово	1
304	Шаранга	1
305	Шатки	1
306	Шатовка	1
307	Шахунья	1
308	Шиморское	1
309	Юбилейный (Нижегородская область)	1
310	Юганец	1
311	Юрьево	1
312	Яново	1
313	Ярымово	1
314	Ясенцы	1
315	Александро-Невский	20
316	Алёшино (Сасовский район)	20
317	Аргамаково (Рязанская область)	20
318	Баграмово	20
319	Бокино	20
320	Большие Можары	20
321	Грязное (Рязанская область)	20
322	Гусь-Железный	20
323	Денежниково (Рязанская область)	20
324	Елатьма	20
325	Ермишь	20
326	Захарово	20
327	Ижевское	20
328	Инякино	20
329	Искра (Рязанский район)	20
330	Истье (Рязанская область)	20
331	Кадом	20
332	Касимов	20
333	Кирицы	20
334	Кораблино	20
335	Криуша (Рязанская область)	20
336	Крутоярский (Рязанская область)	20
337	Кузьминское (Рязанская область)	20
338	Кустаревка (Рязанская область)	20
339	Лакаш	20
340	Лесное Конобеево	20
341	Лесной (Рязанская область)	20
342	Льгово (Рязанская область)	20
343	Меньшие Можары	20
344	Милославское	20
345	Михайлов	20
346	Мосолово (Рязанская область, Шиловский район)	20
347	Мурмино	20
348	Новомичуринск	20
349	Новый Киструс	20
350	Октябрьский (Рязанская область)	20
351	Октябрьское (Рязанская область)	20
352	Павелец	20
353	Пителино	20
354	Подвязье (Рязанская область)	20
355	Поляны	20
356	Придорожный (Рязанская область)	20
357	Пронск	20
358	Путятино	20
359	Рыбное	20
360	Ряжск	20
361	Рязань	20
362	Сапожок	20
363	Сараи	20
364	Сасово	20
365	Сасыкино	20
366	Скопин	20
368	Спас-Клепики	20
369	Спасск-Рязанский	20
370	Старое Березово	20
371	Старожилово	20
372	Троица (Рязанская область)	20
373	Тума	20
374	Ухолово	20
375	Окский	20
376	Ухолово (Рязанская область)	20
377	Центральный (Рязанская область)	20
378	Чернава (Рязанская область, Милославский район)	20
379	Чулково (Рязанская область)	20
380	Чучково	20
381	Шацк (Рязанская область)	20
382	Шилово	20
383	Виловатово	21
384	Волжск	21
385	Звенигово	21
386	Знаменский	21
387	Йошкар-Ола	21
388	Кельмаксола	21
389	Килемары	21
390	Козьмодемьянск	21
391	Красногорский (Республика Марий Эл)	21
392	Краснооктябрьский	21
393	Красный Стекловар	21
394	Куженер	21
395	Кузнецово	21
396	Мариец	21
397	Мари-Турек	21
398	Медведево	21
399	Михайловка (Республика Марий Эл)	21
400	Морки	21
401	Мочалище	21
402	Новый Торъял	21
403	Оршанка	21
404	Параньга	21
405	Пектубаево	21
406	Приволжский (Республика Марий Эл)	21
407	Семеновка (Республика Марий Эл)	21
408	Сернур	21
409	Советский (Республика Марий Эл)	21
410	Сотнур	21
411	Сурок	21
412	Суслонгер	21
413	Юрино	21
414	Силикатный	21
415	Агрыз	6
416	Азнакаево	6
417	Айша	6
418	Аккузово	6
419	Аксубаево	6
420	Актаныш	6
421	Актюбинский	6
422	Алексеевское	6
423	Альметьевск	6
424	Апазово	6
425	Апастово	6
426	Арск	6
427	Асеево	6
428	Атабаево	6
429	Аю	6
430	Бавлы	6
431	Базарные Матаки	6
432	Байряка	6
433	Балтаси	6
434	Бетьки	6
435	Биклянь	6
436	Биляр-Озеро	6
437	Билярск	6
438	Богатые Сабы	6
439	Болгар	6
440	Большая Атня	6
441	Большая Турма	6
442	Большие Кайбицы	6
443	Большие Ключи	6
444	Большие Тарханы	6
445	Большое Афанасово	6
446	Большое Нуркеево	6
447	Большое Подберезье	6
448	Большое Шемякино	6
449	Большой Сухояш	6
450	Большой Чекмак	6
451	Бугульма	6
452	Буинск	6
453	Бураково	6
454	Бухарай	6
455	Васильево	6
456	Верхние Челны	6
457	Верхний Такермен	6
458	Верхний Услон	6
459	Высокая Гора	6
460	Габишево	6
461	Деушево	6
462	Джалиль	6
463	Дубъязы	6
464	Елабуга	6
465	Елантово	6
466	Елаур	6
467	Елхово	6
468	Ерыкла	6
469	Жуково	6
470	Заинск	6
471	Зай-Каратай	6
472	Зеленая Роща	6
473	Зеленодольск (Республика Татарстан)	6
474	Именьково	6
475	Юлтимерово	6
476	Иннополис	6
477	Исенбаево	6
478	Иске-Рязап	6
479	Кадыбаш	6
480	Кадырово	6
481	Каенлы	6
482	Казань	6
483	Какре-Елга	6
484	Калмаш	6
485	Камские Поляны	6
486	Камский Леспромхоз	6
487	Камское Устье	6
488	Карабаш (Республика Татарстан)	6
489	Караталга	6
490	Каргали	6
491	Каркаусь	6
492	Кармалы	6
493	Кият	6
494	Кляшево	6
495	Коноваловка	6
496	Кощаково	6
631	Кама	22
497	Красный Бор (Республика Татарстан)	6
498	Красный Ключ	6
499	Кряш-Шуран	6
500	Кузембетьево	6
501	Куйбышевский Затон	6
502	Кукмор	6
503	Кулаево	6
504	Куркачи	6
505	Кутемели	6
506	Кутлу-Букаш	6
507	Куюки	6
508	Лаишево	6
509	Лениногорск	6
510	Ленино-Кокушкино	6
511	Лубяны	6
512	Мактама	6
513	Макулово	6
514	Малая Елга	6
515	Малая Шильна	6
516	Малые Меми	6
517	Мамадыш	6
518	Мамыково	6
519	Менделеевск	6
520	Мензелинск	6
521	Мокрые Курнали	6
522	Муртыш-Тамак	6
523	Муслюмово	6
524	Мюд	6
525	Набережные Челны	6
526	Нармонка	6
527	Нижнее Алькеево	6
528	Нижнекамск	6
529	Нижние Аты	6
530	Нижние Вязовые	6
531	Нижний Каракитан	6
532	Нижний Таканыш	6
533	Нижняя Мактама	6
534	Новое Ибрайкино	6
535	Новое Каширово	6
536	Новое Шигалиево	6
537	Новошешминск	6
538	Новый Кинер	6
539	Нурлат	6
540	Нурлаты	6
541	Октябрьский (Республика Татарстан)	6
542	Осиново	6
543	Пестрецы	6
544	Песчаные Ковали	6
545	Петровский Завод	6
546	Победа	6
547	Поисево	6
548	Поселок Бирюлинского Зверосовхоза	6
549	Поселок станции Каратун	6
550	Русский Акташ	6
551	Рыбная Слобода	6
552	Саклов-Баш	6
553	Сарманово	6
554	Сатламышево	6
555	Светлое Озеро	6
556	Совхоз Татарстан	6
557	Сокуры	6
558	Старое Альметьево	6
559	Старое Дрожжаное	6
560	Старое Сафарово	6
561	Старое Шаймурзино	6
562	Старошешминск	6
563	Старые Бугады	6
564	Старые Карамалы	6
565	Старые Челны	6
566	Старый Кашир	6
567	Старый Кувак	6
568	Старый Юраш	6
569	Столбище	6
570	Сулеево	6
571	Такталачук	6
572	Татарские Суксы	6
573	Татарские Ямалы	6
574	Татарский Сарсаз	6
575	Татарское Адельшино	6
576	Тенишево	6
577	Теньки	6
578	Терси	6
579	Тетюши	6
580	Тлянче-Тамак	6
581	Тумутук	6
582	Тюлячи	6
583	Тюрнясево	6
584	Убей	6
585	Урняк	6
586	Уруссу	6
587	Урюм	6
588	Усады	6
589	Учалле	6
590	Хозесаново	6
591	Ципья	6
592	Чалпы	6
593	Чепчуги	6
594	Черемшан	6
595	Чистополь	6
596	Чувашское Дрожжаное	6
597	Чэчэкле	6
598	Шапши	6
599	Шеланга	6
600	Шемордан	6
601	Шереметьевка	6
602	Шингальчи	6
603	Шипки	6
604	Шушмабаш	6
605	Ютаза	6
606	Юхмачи	6
607	Алнаши	22
608	Арзамасцево	22
609	Бабино	22
610	Балезино	22
611	Балезино-3	22
612	Большая Уча	22
613	Большое Волково	22
614	Большой Зетым	22
615	Булай	22
616	Вавож	22
617	Водзимонье	22
618	Воткинск	22
619	Глазов	22
620	Грахово	22
621	Дебёсы	22
622	Дизьмино	22
623	Ершовка	22
624	Завьялово	22
625	Засеково	22
626	Зура	22
627	Игра	22
628	Ижевск	22
629	Июльское	22
630	Какмож	22
632	Камбарка	22
633	Камское	22
634	Каракулино	22
635	Каркалай	22
636	Карсовай	22
637	Кварса	22
638	Кватчи	22
639	Кез	22
640	Кигбаево	22
641	Кизнер	22
642	Кильмезь	22
643	Киясово	22
644	Красногорское	22
645	Кулига	22
646	Кыйлуд	22
647	Лынга	22
648	Мазунино	22
649	Малая Пурга	22
650	Менил	22
651	Можга	22
652	Мукши	22
653	Нечкино	22
654	Новая Бия	22
655	Новый Мултан	22
656	Нылга	22
657	Нюрдор-Котья	22
658	Октябрьский (Удмуртская Республика)	22
659	Орловское	22
660	Пирогово	22
661	Подшивалово	22
662	Понино	22
663	Пугачево	22
664	Пудем	22
665	Пычас	22
666	Рябово (Удмуртская Республика)	22
667	Уральский (Удмуртская Республика)	22
668	Сарапул	22
669	Селты	22
670	Сигаево	22
671	Старые Зятцы	22
672	Старые Какси	22
673	Сюмси	22
674	Тарасово	22
675	Ува	22
676	Удугучин	22
677	Укан	22
678	Факел	22
679	Хохряки	22
680	Чепца	22
681	Чур	22
682	Чутырь	22
683	Шаркан	22
684	Юкаменское	22
685	Яган-Докья	22
686	Якшур	22
687	Якшур-Бодья	22
688	Яр	22
689	Айбечи	23
690	Аксарино	23
691	Алатырь	23
692	Аликово	23
693	Алманчиково	23
694	Алтышево	23
695	Анастасово	23
696	Анаткасы	23
697	Атнары	23
698	Атрать	23
699	Батырево	23
700	Бичурга-Баишево	23
701	Богатырево	23
702	Большая Выла	23
703	Большие Алгаши	23
704	Большие Катраси	23
705	Большие Яуши	23
706	Большое Шигаево	23
707	Большое Яниково	23
708	Большой Сундырь	23
709	Верхние Ачаки	23
710	Вурнары	23
711	Вутабоси	23
712	Егоркино	23
713	Еметкино	23
714	Ермошкино	23
715	Ибреси	23
716	Иваньково-Ленино	23
717	Испуханы	23
718	Ишаки	23
719	Ишлеи	23
720	Калинино	23
721	Канаш	23
722	Карабай-Шемурша	23
723	Карабаши	23
724	Карамышево (Чувашская Республика)	23
725	Кильдюшево	23
726	Киря	23
727	Климово (Чувашская Республика)	23
728	Ковали	23
729	Кожары	23
730	Козловка	23
731	Комсомолец (Чувашская Республика)	23
732	Комсомольское (Чувашская Республика)	23
733	Конар	23
734	Кошноруй	23
735	Красноармейское	23
736	Красные Четаи	23
737	Кувакино	23
738	Кугеси	23
739	Лащ-Таяба	23
740	Малая Таяба	23
741	Малое Янгорчино	23
742	Мариинский Посад	23
743	Междуречье (Чувашская Республика)	23
744	Можарки	23
745	Моргауши	23
746	Напольные Котяки	23
747	Нижние Мочары	23
748	Николаевское	23
749	Шимкусы	23
750	Никулино	23
751	Новое Атлашево	23
752	Новочебоксарск	23
753	Новочелны-Сюрбеево	23
754	Новые Лапсары	23
755	Новые Мураты	23
756	Новые Шальтямы	23
757	Новые Шимкусы	23
758	Пандиково	23
759	Первое Чурашево	23
760	Первомайское (Чувашская Республика)	23
761	Пикшики	23
762	Полевые Бикшики	23
763	Порецкое	23
764	Сабанчино	23
765	Синьялы	23
766	Советское (Чувашская Республика)	23
767	Солдыбаево	23
768	Средние Кибечи	23
769	Старые Атаи	23
770	Старые Тиньгеши	23
771	Старые Чукалы	23
772	Стемасы	23
773	Сугуты	23
774	Тарханы	23
775	Тобурданово	23
776	Тойси	23
777	Торханы	23
778	Трехбалтаево	23
779	Тувси	23
780	Тузи-Сярмус	23
781	Турмыши	23
782	Тюмерево	23
783	Тюрлема	23
784	Урмары	23
785	Ходары	23
786	Хыркасы	23
787	Цивильск	23
788	Чадукасы	23
789	Чебоксары	23
790	Челкасы	23
791	Чепкас-Никольское	23
792	Чувашские Тимяши	23
793	Чурачики	23
794	Чутеево	23
795	Шемалаково	23
796	Шемурша	23
797	Шерауты	23
798	Шибылги	23
799	Шигали	23
800	Шихазаны	23
801	Шоркистры	23
802	Шоршелы	23
803	Шумерля	23
804	Шумшеваши	23
805	Шыгырдан	23
806	Эльбарусово	23
807	Юнга	23
808	Юськасы	23
809	Ядрин	23
810	Яльчики	23
811	Янгличи	23
812	Янгорчино	23
813	Янтиково	23
814	Яншихово-Норваши	23
815	Яншихово-Челлы	23
816	Яныши	23
817	Ярославка	23
818	Агинское (Забайкальский АО)	24
819	Акша (Забайкальский край)	24
820	Александровский Завод	24
821	Альбитуй	24
822	Амазар	24
823	Атамановка (Читинский район)	24
824	Бада	24
825	Балей	24
826	Баляга	24
827	Борзя	24
828	Букачача	24
829	Верх-Усугли	24
830	Верх-Чита	24
831	Вершино-Дарасунский	24
832	Вершино-Шахтаминское	24
833	Газимурский Завод	24
834	Горный (Забайкальский край)	24
835	Давенда	24
836	Дарасун (Забайкальский край)	24
837	Домна (Забайкальский край)	24
838	Досатуй	24
839	Дровяная	24
840	Дульдурга	24
841	Жиндо	24
842	Жипхеген	24
843	Жирекен	24
844	Забайкальск	24
845	Золотореченск	24
846	Кадая	24
847	Калга	24
848	Карымское	24
849	Кличка	24
850	Ключевский	24
851	Кокуй (Забайкальский край)	24
852	Краснокаменск	24
853	Красный Чикой	24
854	Ксеньевка	24
855	Куанда	24
856	Курорт-Дарасун	24
857	Кыра	24
858	Маккавеево	24
859	Малета	24
860	Мангут	24
861	Могойтуй	24
862	Могоча	24
863	Нерчинск	24
864	Нерчинский Завод	24
865	Нижний Цасучей	24
866	Николаевское (Забайкальский край)	24
867	Новая Кука	24
868	Новая Чара	24
869	Новокручининский	24
870	Новоорловск	24
871	Новопавловка	24
872	Новоширокинский	24
873	Оловянная	24
874	Первомайский (Забайкальский край)	24
875	Петровск-Забайкальский	24
876	Приаргунск	24
877	Ягодный (Забайкальский край)	24
878	Сбега	24
879	Сретенск	24
880	Тупик	24
881	Улёты	24
882	Урлук	24
883	Урульга	24
884	Усть-Карск	24
885	Хилок	24
886	Холбон	24
887	Хохотуй	24
888	Чара	24
889	Чернышевск	24
890	Чита	24
891	Шелопугино (Забайкальский край)	24
892	Шерловая Гора	24
893	Шилка	24
894	Широкая	24
895	Ясная (Забайкальский край)	24
896	Ясногорск (Забайкальский край)	24
897	Азей	25
898	Алгатуй	25
899	Алексеевск	25
900	Алзамай	25
901	Ангарск	25
902	Артемовский (Иркутская область)	25
903	Бадар	25
904	Байкальск	25
905	Балаганск	25
906	Балахнинский	25
907	Баяндай	25
908	Белореченский	25
909	Березняки	25
910	Бирюсинск	25
911	Бодайбо	25
912	Большая Речка	25
913	Большой Луг	25
914	Бохан	25
915	Братск	25
916	Будагово	25
917	Введенщина	25
918	Верхнемарково	25
919	Видим	25
920	Вихоревка	25
921	Гидростроитель	25
922	Гуран	25
923	Еланцы	25
924	Ербогачен	25
925	Железногорск-Илимский	25
926	Железнодорожный (Иркутская область)	25
927	Жигалово	25
928	Забитуй	25
929	Залари	25
930	Зима	25
931	Икей	25
932	Иркутск	25
933	Каразей	25
934	Карымск	25
935	Качуг	25
936	Квиток	25
937	Кимильтей	25
938	Киренск	25
939	Куйтун	25
940	Култук	25
941	Кутулик	25
942	Лесогорск	25
943	Листвянка	25
944	Магистральный	25
945	Мама	25
946	Мамакан	25
947	Маркова	25
948	Мегет	25
949	Михайловка (Иркутская область)	25
950	Мишелевка	25
951	Нижнеудинск	25
952	Новая Игирма	25
953	Новобирюсинский	25
954	Новонукутский	25
955	Оек	25
956	Октябрьский (Иркутская область)	25
957	Кундуй	25
958	Олонки	25
959	Оса (Иркутская область)	25
960	Покосное	25
961	Речушка	25
962	Рудногорск	25
963	Саянск	25
964	Свирск	25
965	Седаново	25
966	Слюдянка	25
967	Смоленщина	25
968	Средний	25
969	Тайтурка	25
970	Тайшет	25
971	Тангуй	25
972	Тельма	25
973	Тубинский	25
974	Тулун	25
975	Тулюшка	25
976	Тыреть 1-я	25
977	Ук	25
978	Улькан	25
979	Усолье-Сибирское	25
980	Усть-Илимск	25
981	Усть-Кут	25
982	Усть-Ордынский	25
983	Усть-Уда	25
984	Уян	25
985	Харик	25
986	Хомутово (Иркутская область)	25
987	Черемушки	25
988	Черемхово	25
989	Чунский	25
990	Шелехов	25
991	Шелехово	25
992	Шиткино	25
993	Шумский	25
994	Эдучанка	25
995	Юрты	25
996	Янталь	25
997	Абалаково	26
998	Абан	26
999	Агинское	26
1000	Ангарский	26
1001	Артемовск (Красноярский край)	26
1002	Ачинск	26
1003	Байкит	26
1004	Балахта (Красноярский край)	26
1005	Беллык	26
1006	Березовка (Красноярский край)	26
1007	Березовское	26
1008	Боготол	26
1009	Богучаны	26
1010	Большая Иня	26
1011	Большая Ирба	26
1012	Большая Мурта	26
1013	Большая Уря	26
1014	Большой Улуй	26
1015	Бородино	26
1016	Бражное	26
1017	Брянка (Красноярский край)	26
1018	Ванавара	26
1019	Вангаш	26
1020	Волочанка	26
1021	Галанино	26
1022	Георгиевка	26
1023	Дзержинское	26
1024	Дивногорск	26
1025	Диксон	26
1026	Долгий Мост	26
1027	Дрокино	26
1028	Дубинино	26
1029	Дудинка (Красноярский край)	26
1030	Емельяново	26
1031	Енисейск	26
1032	Ермаковское	26
1033	Железногорск (Красноярский край)	26
1034	Заозерный	26
1035	Зеленогорск (Красноярский край)	26
1036	Зеленый Бор	26
1037	Златоруновск	26
1038	Зыково	26
1039	Игарка	26
1040	Идринское	26
1041	Иланский	26
1042	Ильичево	26
1043	Инголь	26
1044	Ирбейское	26
1045	Казачинское	26
1046	Кайеркан	26
1047	Канск	26
1048	Каптырево	26
1049	Каратузское	26
1050	Кедровый (Красноярский край)	26
1051	Кодинск	26
1052	Кожаны	26
1053	Козулька	26
1054	Кордово	26
1055	Кортуз	26
1056	Кошурниково	26
1057	Детлово	26
1058	Красная Сопка	26
1059	Красногорьевский	26
1060	Краснокаменск (Красноярский край)	26
1061	Краснотуранск	26
1062	Красноярск	26
1063	Курагино	26
1064	Лесосибирск	26
1065	Лугавское	26
1066	Манзя	26
1067	Маринино	26
1068	Машуковка	26
1069	Мессояха	26
1070	Миндерла	26
1071	Минусинск	26
1072	Момотово	26
1073	Мотыгино	26
1074	Назарово	26
1075	Нижний Ингаш	26
1076	Нижняя Пойма	26
1077	Новая Солянка	26
1078	Новоангарск	26
1079	Новобирилюссы	26
1080	Новокаргино	26
1081	Новосёлово	26
1082	Новочернореченский	26
1083	Норильск	26
1084	Октябрьский (Красноярский край)	26
1085	Орджоникидзе (Красноярский край)	26
1086	Осиновый Мыс	26
1087	Памяти 13 Борцов	26
1088	Парная	26
1089	Партизанское	26
1090	Первомайск (Красноярский край)	26
1091	Пинчуга	26
1092	Пировское	26
1093	Подгорный	26
1094	Подтесово	26
1095	Потапово	26
1096	Предивинск	26
1097	Раздолинск	26
1098	Российка	26
1099	Саянский	26
1100	Светлогорск (Красноярский край)	26
1101	Северо-Енисейский (Красноярский край)	26
1102	Сизая	26
1103	Снежногорск (Красноярский край)	26
1104	Солнечный (Красноярский край)	26
1105	Сосновоборск	26
1106	Субботино	26
1107	Сухобузимское	26
1108	Таежный	26
1109	Тасеево	26
1110	Тесь	26
1111	Тинской	26
1112	Тура (Красноярский край)	26
1113	Туруханск	26
1114	Тюльково	26
1115	Тюхтет	26
1116	Ужур	26
1117	Урал	26
1118	Усть-Кемь	26
1119	Устьянск	26
1120	Уяр	26
1121	Филимоново	26
1122	Хантайское Озеро	26
1123	Хатанга	26
1124	Черемшанка	26
1125	Чунояр	26
1126	Шалинское	26
1127	Шалоболино	26
1128	Шарыпово	26
1129	Шушенское	26
1130	Элита	26
1131	Южно-Енисейск	26
1132	Ангоя	27
1133	Аршан	27
1134	Бабушкин	27
1135	Багдарин	27
1136	Баргузин	27
1137	Баянгол	27
1138	Бичура	27
1139	Выдрино	27
1140	Горхон	27
1141	Гусиное Озеро	27
1142	Гусиноозерск	27
1143	Джида	27
1144	Заиграево	27
1145	Закаменск	27
1146	Иволгинск	27
1147	Ильинка	27
1148	Илька	27
1149	Итанца	27
1150	Кабанск	27
1151	Каменск	27
1152	Кижинга	27
1153	Кичера	27
1154	Кома	27
1155	Кудара	27
1156	Кудара-Сомон	27
1157	Куйтун (Республика Бурятия)	27
1158	Курумкан	27
1159	Кырен	27
1160	Кяхта	27
1161	Мухоршибирь	27
1162	Наушки	27
1163	Нижнеангарск	27
1164	Нижний Торей	27
1165	Никольск	27
1166	Новая Брянь	27
1167	Новоильинск	27
1168	Новоселенгинск	27
1169	Новый Уоян	27
1170	Онохой	27
1171	Орлик	27
1172	Петропавловка (Республика Бурятия)	27
1173	Подлопатки	27
1174	Саган-Нур	27
1175	Северобайкальск	27
1176	Северомуйск	27
1177	Селенгинск	27
1178	Селендум	27
1179	Сосново-Озерское	27
1180	Таксимо	27
1181	Таловка	27
1182	Тарбагатай	27
1183	Татаурово	27
1184	Тугнуй	27
1185	Турунтаево	27
1186	Улан-Удэ	27
1187	Унэгэтэй	27
1188	Усть-Баргузин	27
1189	Хонхолой	27
1190	Хоринск	27
1191	Хоронхой	27
1192	Татарский Ключ	27
1193	Цолга	27
1194	Шарагол	27
1195	Шаралдай	27
1196	Янчукан	27
1197	Абага	28
1198	Айхал	28
1199	Алдан	28
1200	Алмазный	28
1201	Амга	28
1202	Аргахтах	28
1203	Батагай	28
1204	Батагай-Алыта	28
1205	Бердигестях	28
1206	Беркакит	28
1207	Бестях	28
1208	Болугур	28
1209	Борогонцы	28
1210	Верхневилюйск	28
1211	Верхний Куранах	28
1212	Верхоянск	28
1213	Вилюйск	28
1214	Витим	28
1215	Депутатский	28
1216	Джебарики-Хая	28
1217	Жатай	28
1218	Жиганск	28
1219	Зырянка	28
1220	Иенгра	28
1221	Казачье	28
1222	Кангалассы	28
1223	Кемпендяй	28
1224	Кобяй	28
1225	Кутана	28
1226	Кысыл-Сыр	28
1227	Кюндяде	28
1228	Кюндядя	28
1229	Кюсюр	28
1230	Лебединый	28
1231	Ленинский (Республика Саха (Якутия))	28
1232	Ленск	28
1233	Майя	28
1234	Малыкай	28
1235	Мар	28
1236	Мирный (Республика Саха (Якутия))	28
1237	Мохсоголлох	28
1238	Намцы	28
1239	Нерюнгри	28
1240	Нижнеянск	28
1241	Нижний Бестях	28
1242	Нижний Куранах	28
1243	Нюрба	28
1244	Нюя	28
1245	Огородтах	28
1246	Октемцы	28
1247	Олекминск	28
1248	Оленек	28
1249	Пеледуй	28
1250	Покровск (Якутия)	28
1251	Сангар	28
1252	Саскылах	28
1253	Сасыр	28
1254	Сватай	28
1255	Солнечный (Якутия)	28
1256	Среднеколымск	28
1257	Белая Гора	28
1258	Сунтар	28
1259	Сылгы-Ыытар	28
1260	Тёплый Ключ (Республика Саха)	28
1261	Тербяс	28
1262	Тикси	28
1263	Тойбохой	28
1264	Томмот	28
1265	Томтор	28
1266	Тополиное	28
1267	Тосу	28
1268	Тюнгюлю	28
1269	Удачный	28
1270	Усть-Куйга	28
1271	Усть-Мая	28
1272	Усть-Миль	28
1273	Усть-Нера	28
1274	Усун	28
1275	Хандыга	28
1276	Харбалах	28
1277	Хатын-Сысы	28
1278	Хонуу	28
1279	Чернышевский (Республика Саха (Якутия))	28
1280	Черский	28
1281	Чинеке	28
1282	Чокурдах	28
1283	Чульман	28
1284	Чурапча	28
1285	Шея	28
1286	Ытык-Кюель	28
1287	Эбях	28
1288	Эльгяй	28
1289	Эльдикан	28
1290	Якутск	28
1291	Ак-Довурак	29
1292	Бай-Хаак	29
1293	Каа-Хем	29
1294	Кызыл	29
1295	Кызыл-Мажалык	29
1296	Самагалтай	29
1297	Сарыг-Сеп	29
1298	Тоора-Хем	29
1299	Туран	29
1300	Тээли	29
1301	Хову-Аксы	29
1302	Чадан	29
1303	Шагонар	29
1304	Эрзин	29
1305	Балгазын	29
1306	Абаза	30
1307	Абакан	30
1308	Аскиз	30
1309	Белый Яр (Республика Хакасия)	30
1310	Бельтирское	30
1311	Бея	30
1312	Бирикчуль	30
1313	Бискамжа	30
1314	Боград	30
1315	Вершиина Тёи	30
1316	Копьево	30
1317	Майна (Республика Хакасия)	30
1318	Первомайское (Республика Хакасия)	30
1319	Саяногорск	30
1320	Сорск	30
1321	Таштып	30
1322	Устинкино	30
1323	Усть-Абакан	30
1324	Черногорск	30
1325	Шира	30
1326	Ивановка (Республика Хакасия)	30
1327	Авдеевка	31
1328	Александровка (Донецкая область)	31
1329	Амвросиевка	31
1330	Артемово	31
1331	Артемовск (Донецкая область)	31
1332	Белицкое	31
1333	Белозерское	31
1334	Великая Новоселка	31
1335	Волноваха	31
1336	Володарское (Донецкая область)	31
1337	Горловка	31
1338	Дебальцево	31
1339	Дзержинск (Донецкая область)	31
1340	Димитров	31
1341	Доброполье	31
1342	Докучаевск	31
1343	Донецк	31
1344	Дружковка	31
1345	Енакиево	31
1346	Зугрэс	31
1347	Кировское (Донецкая область)	31
1348	Константиновка	31
1349	Краматорск	31
1350	Красный Лиман	31
1351	Курахово	31
1352	Макеевка	31
1353	Мангуш	31
1354	Мариуполь	31
1355	Марьинка	31
1356	Моспино	31
1357	Новоазовск	31
1358	Новогродовка	31
1359	Покровск (Донецкая область)	31
1360	Родинское	31
1361	Светлодарск	31
1362	Святогорск	31
1363	Северск (Донецкая область)	31
1364	Селидово	31
1365	Славянск	31
1366	Снежное	31
1367	Соледар	31
1368	Старобешево	31
1369	Тельманово	31
1370	Торез	31
1371	Угледар	31
1372	Харцызск	31
1373	Шахтерск (Донецкая область)	31
1374	Ясиноватая	31
1375	Ждановка	31
1376	Алейск	32
1377	Аллак	32
1378	Алтайское	32
1379	Анисимово	32
1380	Антоньевка	32
1381	Ая	32
1382	Баево	32
1383	Барнаул	32
1384	Бастан	32
1385	Безголосово	32
1386	Безрукавка	32
1387	Белоглазово	32
1388	Белокуриха	32
1389	Белоярск	32
1390	Березовка (Алтайский край)	32
1391	Березовка (Первомайский район)	32
1392	Бийск	32
1393	Благовещенка	32
1394	Бобровка (Первомайский район)	32
1395	Бобровка (Шипуновский район)	32
1396	Большеромановка	32
1397	Борзовая Заимка	32
1398	Боровиха	32
1399	Боровлянка	32
1400	Боровское	32
1401	Брусенцево	32
1402	Буканское	32
1403	Буланиха	32
1404	Бураново	32
1405	Бурла	32
1406	Буян	32
1407	Быстрый Исток	32
1408	Быстрянка	32
1409	Велижанка	32
1410	Верх-Ануйское	32
1411	Верх-Камышенка	32
1412	Верх-Катунское	32
1413	Верх-Кучук	32
1414	Верх-Суетка	32
1415	Веселоярск	32
1416	Власиха (Алтайский край)	32
1417	Воеводское	32
1418	Волчиха	32
1419	Волчно-Бурлинская	32
1420	Ворониха	32
1421	Вторая Каменка	32
1422	Вылково	32
1423	Гальбштадт	32
1424	Гилевка	32
1425	Гилев-Лог	32
1426	Гилево	32
1427	Глядень	32
1428	Голуха	32
1429	Гонохово (Завьяловский район)	32
1430	Гонохово (Каменский район)	32
1431	Гордеевский	32
1432	Горняк	32
1433	Гришенское	32
1434	Гришковка	32
1435	Гуселетово	32
1436	Нижняя Суетка	32
1437	Дегтярка	32
1438	Дмитро-Титово	32
1439	Долганка	32
1440	Екатерининское	32
1441	Еланда	32
1442	Елунино	32
1443	Ельцовка	32
1444	Енисейское	32
1445	Жилино	32
1446	Заводское	32
1447	Завьялово (Алтайский край)	32
1448	Зайцево	32
1449	Закладное	32
1450	Заковряшино	32
1451	Залесово	32
1452	Заринск	32
1453	ЗАТО Сибирский	32
1454	Зелёная Дубрава	32
1455	Зеленая Поляна	32
1456	Зеленый Дол	32
1457	Зеркалы	32
1458	Зимари	32
1459	Зимино	32
1460	Златополь	32
1461	Змеиногорск	32
1462	Зональное	32
1463	Зудилово	32
1464	Зятькова Речка	32
1465	Ивановка (Алтайский край)	32
1466	Кабаково (Алтайский край)	32
1467	Кабаново	32
1468	Кадниково	32
1469	Каип	32
1470	Калманка	32
1471	Калмыцкие Мысы	32
1472	Камень-на-Оби	32
1473	Камышенка	32
1474	Карабинка	32
1475	Карамышево (Алтайский край)	32
1476	Карпово Второе	32
1477	Кашино (Алтайский край)	32
1478	Кашкарагаиха	32
1479	Киприно	32
1480	Клепечиха	32
1481	Клочки	32
1482	Ключи (Алтайский край)	32
1483	Кокши	32
1484	Колыванск	32
1485	Комариха	32
1486	Корболиха	32
1487	Корнилово	32
1488	Коробейниково	32
1489	Корчино	32
1490	Косиха	32
1491	Костин Лог	32
1492	Красногорское (Алтайский край)	32
1493	Краснодарское	32
1494	Краснознаменка	32
1495	Краснощёково	32
1496	Краснояры	32
1497	Красный Партизан	32
1498	Крестьянка	32
1499	Крутиха	32
1500	Крутишка	32
1501	Кузьминка	32
1502	Кулунда	32
1503	Курья	32
1504	Кусак	32
1505	Кучук	32
1506	Куяган	32
1507	Кытманово	32
1508	Лаптев Лог	32
1509	Ларичиха	32
1510	Лебяжье (Алтайский край)	32
1511	Леньки	32
1512	Линевский	32
1513	Логовское	32
1514	Луговское	32
1515	Малиновое Озеро	32
1516	Маловолчанка	32
1517	Малоенисейское	32
1518	Малоугренево	32
1519	Малый Бащелак	32
1520	Мамонтово	32
1521	Манжерок	32
1522	Маралиха	32
1523	Мартовка	32
1524	Марушка	32
1525	Масальский	32
1526	Мирный (Зональный район)	32
1527	Мирный (Родинский район)	32
1528	Михайловка (Бурлинский район)	32
1529	Михайловка (Усть-Калманский район)	32
1530	Михайловское	32
1531	Моховское	32
1532	Налобиха	32
1533	Нечунаево	32
1534	Нижне-Озерное	32
1535	Нижне-Чуманка	32
1536	Новиково	32
1537	Новичиха	32
1538	Новоалтайск	32
1539	Новобураново	32
1540	Нововознесенка	32
1541	Новоегорьевское	32
1542	Новоильинка	32
1543	Новокулундинка	32
1544	Новообинка	32
1545	Новообинцево	32
1546	Новоперуново	32
1547	Новопесчаное	32
1548	Новополтава	32
1549	Новороманово	32
1550	Новотырышкино	32
1551	Новошипуново	32
1552	Новоярки	32
1553	Новые Зори	32
1554	Овечкино	32
1555	Огни	32
1556	Озерки (Алтайский край)	32
1683	Бачатский	33
1557	Октябрьский (Алтайский край)	32
1558	Осколково	32
1559	Островное (Алтайский край)	32
1560	Павловск (Алтайский край)	32
1561	Панкрушиха	32
1562	Паново	32
1563	Парфеново	32
1564	Паутово	32
1565	Первокаменка	32
1566	Первомайское (Алтайский край)	32
1567	Первомайское (Бийский район)	32
1568	Переясловка	32
1569	Петропавловское	32
1570	Пещерка	32
1571	Плешково	32
1572	Победа (Алтайский край)	32
1573	Подойниково	32
1574	Подсосново	32
1575	Подстепное	32
1576	Покровка (Алтайский край)	32
1577	Полевое	32
1578	Полуямки	32
1579	Поперечное	32
1580	Поповичи	32
1581	Порожнее	32
1582	Поселок Имени Мамонтова	32
1583	Поспелиха	32
1584	Поспелихинский	32
1585	Протасово	32
1586	Прутской	32
1587	Прыганка	32
1588	Ракиты (Михайловский район)	32
1589	Ракиты (Рубцовский район)	32
1590	Ребриха	32
1591	Редкая Дубрава	32
1592	Ремовский	32
1593	Рогозиха	32
1594	Родино	32
1595	Рожнев Лог	32
1596	Романово	32
1597	Рубцовск	32
1598	Саввушка	32
1599	Самсоново	32
1600	Санниково	32
1601	Сараса	32
1602	Свердловское	32
1603	Селекционное	32
1604	Семеновка (Алтайский край)	32
1605	Сереброполь	32
1606	Сетовка	32
1607	Сибирский	32
1608	Сидоровка	32
1609	Славгород (Алтайский край)	32
1610	Славгородское	32
1611	Смазнево	32
1612	Смоленское	32
1613	Советское (Алтайский край)	32
1614	Соколово	32
1615	Солонешное	32
1616	Солоновка (Волчихинский район)	32
1617	Солоновка (Новичихинский район)	32
1618	Солоновка (Смоленский район)	32
1619	Солтон	32
1620	Сорочий Лог	32
1621	Соузга	32
1622	Среднесибирский	32
1623	Сростки	32
1624	Сросты	32
1625	Станция Озерки (Тальменский район)	32
1626	Староалейское	32
1627	Старобелокуриха	32
1628	Степное Озеро	32
1629	Степное (Родинский район)	32
1630	Стуково	32
1631	Суворовка	32
1632	Суслово	32
1633	Табуны	32
1634	Тальменка	32
1635	Тамбовский	32
1636	Тогул	32
1637	Топчиха	32
1638	Троицкое (Алтайский край)	32
1639	Тугозвоново	32
1640	Тулата	32
1641	Тюменцево	32
1642	Угловское	32
1643	Украинский	32
1644	Урлапово	32
1645	Урожайное (Алтайский край)	32
1646	Урюпино	32
1647	Усть-Калманка	32
1648	Усть-Козлуха	32
1649	Усть-Мосиха	32
1650	Усть-Таловка	32
1651	Усть-Чарышская Пристань	32
1652	Устьянка	32
1653	Усятское	32
1654	Хабары	32
1655	Харитоново	32
1656	Харлово	32
1657	Хлебороб	32
1658	Хлопуново	32
1659	Целинное	32
1660	Чарышское	32
1661	Черемное	32
1662	Черемушкино	32
1663	Черемшанка (Алтайский край)	32
1664	Черная Курья	32
1665	Шалап	32
1666	Шарчино	32
1667	Шахи	32
1668	Шелаболиха	32
1669	Шимолино	32
1670	Шипуниха	32
1671	Шипуново	32
1672	Шубенка	32
1673	Шульгинка	32
1674	Шумановка	32
1675	Шумилиха	32
1676	Южный (Алтайский край)	32
1677	Яготино	32
1678	Яровое	32
1679	Ярославцев Лог	32
1680	Анжеро-Судженск	33
1681	Артышта	33
1682	Атаманово	33
1684	Белово	33
1685	Белогорск (Кемеровская область)	33
1686	Березовский (Кемеровская область)	33
1687	Берикульский	33
1688	Ваганово	33
1689	Верх-Чебула	33
1690	Горскино	33
1691	Грамотеино	33
1692	Гурьевск (Кемеровская область)	33
1693	Евтино	33
1694	Елыкаево	33
1695	Зеленовский	33
1696	Зеленогорский	33
1697	Ижморский	33
1698	Инской	33
1699	Итатский	33
1700	Каз	33
1701	Калинкино	33
1702	Калтан	33
1703	Карагайлинский	33
1704	Кедровка	33
1705	Кемерово	33
1706	Киселевск	33
1707	Колычево	33
1708	Костенково	33
1709	Крапивинский	33
1710	Краснинское	33
1711	Краснобродский	33
1712	Красногорский (Кемеровская область)	33
1713	Красные Орлы	33
1714	Кубитет	33
1715	Кузедеево	33
1716	Ленинск-Кузнецкий	33
1717	Малая Салаирка	33
1718	Малиновка	33
1719	Малопесчанка	33
1720	Мариинск	33
1721	Междуреченск	33
1722	Менчереп	33
1723	Металлплощадка	33
1724	Металлургов	33
1725	Мохово	33
1726	Мундыбаш	33
1727	Мыски	33
1728	Никитинский	33
1729	Новобачаты	33
1730	Новоивановский	33
1731	Новокузнецк	33
1732	Новостройка (Кемеровская область)	33
1733	Новый Городок	33
1734	Окунево	33
1735	Осинники	33
1736	Панфилово (Кемеровская область)	33
1737	Пашково	33
1738	Пермяки	33
1739	Плотниково	33
1740	Комсомольск (Кемеровская область)	33
1741	Поломошное	33
1742	Полуторник	33
1743	Полысаево	33
1744	Преображенка	33
1745	Прокопьевск	33
1746	Промышленная	33
1747	Проскоково	33
1748	Салаир	33
1749	Солнечный (Кемеровская область)	33
1750	Сосновка (Кемеровская область)	33
1751	Станция Арлюк	33
1752	Старобачаты	33
1753	Старопестерево	33
1754	Тайга	33
1755	Тайжина	33
1756	Тамбар	33
1757	Тарасово (Кемеровская область)	33
1758	Таштагол	33
1759	Темиртау (Кемеровская область)	33
1760	Терентьевское	33
1761	Тисуль	33
1762	Топки	33
1763	Трудармейский	33
1764	Тяжинский	33
1765	Усть-Серта	33
1766	Чистогорский	33
1767	Чкаловский	33
1768	Чумай	33
1769	Шабаново	33
1770	Шерегеш	33
1771	Юрга	33
1772	Юргинский	33
1773	Ясногорский	33
1774	Яшкино	33
1775	Яя	33
1776	Баган	8
1777	Барабинск	8
1778	Барлакский	8
1779	Барышево	8
1780	Безменово	8
1781	Белое (Новосибирская область)	8
1782	Бердск	8
1783	Березиково	8
1784	Битки	8
1785	Блюдчанское	8
1786	Бобровка (Новосибирская область)	8
1787	Болотное	8
1788	Буготак	8
1789	Бурмистрово	8
1790	Быстровка	8
1791	Венгерово	8
1792	Верх-Ирмень	8
1793	Верх-Каргат	8
1794	Верх-Тула	8
1795	Верх-Урюм	8
1796	Верх-Чик	8
1797	Веселовское	8
1798	Вознесенка	8
1799	Вьюны	8
1800	Горный	8
1801	Дергаусово	8
1802	Довольное	8
1803	Дорогино	8
1804	Дупленская	8
1805	Евсино	8
1806	Еланка	8
1807	Жуланка	8
1808	Заковряжино	8
1809	Здвинск	8
1810	Зубково	8
1811	Зубовка	8
1812	Зюзя	8
1813	Ирбизино	8
1814	Искитим	8
1815	Казаткуль	8
1816	Казачий Мыс	8
1817	Карасево	8
1818	Карасук	8
1819	Каргат	8
1820	Киик	8
1821	Кирза	8
1822	Ключики	8
1823	Кожурла	8
1824	Козиха	8
1825	Колыбелька	8
1826	Колывань	8
1827	Кольцово (Новосибирская область)	8
1828	Комарье	8
1829	Коурак	8
1830	Коченево	8
1831	Кочки	8
1832	Краснозерское	8
1833	Краснозёрское	8
1834	Краснообск	8
1835	Красный Восток (Новосибирская область)	8
1836	Красноселье	8
1837	Криводановка	8
1838	Кудряшовский	8
1839	Куйбышев	8
1840	Купино	8
1841	Кыштовка	8
1842	Лебедевка	8
1843	Ленинское (Новосибирская область)	8
1844	Линево (Новосибирская область)	8
1845	Листвянский	8
1846	Лянино	8
1847	Майское (Новосибирская область)	8
1848	Маршанское	8
1849	Маслянино	8
1850	Медяково	8
1851	Мохнатый Лог	8
1852	Мочище	8
1853	Мошково	8
1854	Мышланка	8
1855	Нижнекаменка	8
1856	Новокремлевское	8
1857	Новолуговое	8
1858	Новомихайловка	8
1859	Новопервомайское	8
1860	Новопичугово	8
1861	Новосибирск	8
1862	Новый Шарап	8
1863	Обь	8
1864	Озеро Карачи	8
1865	Октябрьский (Новосибирская область)	8
1866	Ордынское	8
1867	Орехов Лог	8
1868	Палецкое	8
1869	Петропавловка 2-я	8
1870	Пихтовка	8
1871	Пойменное	8
1872	Половинное (Новосибирская область)	8
1873	Полойка	8
1874	Посевная	8
1875	Прокудское	8
1876	Раздольное (Новосибирская область)	8
1877	Решеты (Новосибирская область)	8
1878	Садовый (Новосибирская область)	8
1879	Северное (Новосибирская область)	8
1880	Советский (Новосибирская область)	8
1881	Согорное	8
1882	Сокур (Новосибирская область)	8
1883	Спирино	8
1884	Старые Карачи	8
1885	Студеное	8
1886	Сузун	8
1887	Табулга	8
1888	Татарск	8
1889	Ташара	8
1890	Тебисское	8
1891	Тогучин	8
1892	Толмачево	8
1893	Травное	8
1894	Убинское	8
1895	Увальское	8
1896	Ужаниха	8
1897	Улыбино	8
1898	Усть-Каменка	8
1899	Усть-Луковка	8
1900	Усть-Тарка	8
1901	Филиппово	8
1902	Хорошее	8
1903	Чаны	8
1904	Черепаново	8
1905	Чернокурья	8
1906	Чернореченский	8
1907	Чик	8
1908	Чингис	8
1909	Чистоозерное	8
1910	Чулым	8
1911	Чумаково	8
1912	Шагалово	8
1913	Шахта	8
1914	Шурыгино	8
1915	Щербаково	8
1916	Элитный (Новосибирская область)	8
1917	Ярково	8
1918	Азово	9
1919	Аксеново	9
1920	Алабота	9
1921	Александровское (Омская область)	9
1922	Артын	9
1923	Ачаир	9
1924	Ачаирский	9
1925	Баженово	9
1926	Бакшеево	9
1927	Баррикада	9
1928	Белосток	9
1929	Бобринка	9
1930	Боголюбовка	9
1931	Боевой	9
1932	Большегривский	9
1933	Большегривское	9
1934	Большепесчанка	9
1935	Большеречье	9
1936	Большие Уки	9
1937	Большой Атмас	9
1938	Борисовское	9
1939	Буняковка	9
1940	Вольное (Омская область)	9
1941	Ганновка	9
1942	Георгиевка (Омская область)	9
1943	Горьковское	9
1944	Добровольск	9
1945	Дружино	9
1946	Екатеринославка (Омская область)	9
1947	Елизаветинка	9
1948	Еремеевка	9
1949	Ермак	9
1950	Желанное	9
1951	Знаменское (Омская область)	9
1952	Золотая Нива	9
1953	Ивановка (Омская область)	9
1954	Ингалы	9
1955	Иртыш	9
1956	Иртышский	9
1957	Исилькуль	9
1958	Калачинск	9
1959	Калинино (Омская область)	9
1960	Карповка	9
1961	Колосовка	9
1962	Кормиловка	9
1963	Красноярка	9
1964	Красный Яр (Омская область)	9
1965	Крутинка	9
1966	Кутузовка	9
1967	Лежанка	9
1968	Луговое	9
1969	Лузино	9
1970	Лукьяновка	9
1971	Любинский	9
1972	Мангут (Омская область)	9
1973	Маргенау	9
1974	Марьяновка	9
1975	Марьяновский	9
1976	Медвежье	9
1977	Могильно-Посельское	9
1978	Благодаровка	9
1979	Москаленки	9
1980	Москаленский	9
1981	Моховой Привал	9
1982	Муромцево	9
1983	Называевск	9
1984	Неверовка	9
1985	Нижняя Омка	9
1986	Новая Шараповка	9
1987	Нововаршавка	9
1988	Новокарасук	9
1989	Новоомский	9
1990	Новорождественка	9
1991	Новотроицк (Нижнеомский район)	9
1992	Новотроицкое (Омская область)	9
1993	Новоуральский	9
1994	Новоцарицыно	9
1995	Одесское	9
1996	Оконешниково	9
1997	Ольгино	9
1998	Омск	9
1999	Осокино	9
2000	Павлоградка	9
2001	Паутовка	9
2002	Пикетное	9
2003	Победитель	9
2004	Побочино	9
2005	Полтавка	9
2006	Прииртышье	9
2007	Пришиб	9
2008	Путь Социализма	9
2009	Пушкино (Омская область)	9
2010	Репинка	9
2011	Родная Долина	9
2012	Ростовка	9
2013	Русская Поляна	9
2014	Саргатское	9
2015	Седельниково	9
2016	Серебряное	9
2017	Ситниково	9
2018	Солнцевка	9
2019	Соловьевка	9
2020	Соляное	9
2021	Старомалиновка	9
2022	Сухое	9
2023	Сыропятское	9
2024	Таврическое	9
2025	Такмык	9
2026	Тара	9
2027	Тевриз	9
2028	Тумановка	9
2029	Тюкалинск	9
2030	Усть-Заостровка	9
2031	Усть-Ишим	9
2032	Утичье	9
2033	Харламово	9
2034	Хлебодаровка	9
2035	Хомутинка	9
2036	Хортицы	9
2037	Цветнополье	9
2038	Цветочное	9
2039	Центрально-Любинский	9
2040	Черлак (Омская область)	9
2041	Чернолучинский	9
2042	Чистово	9
2043	Шербакуль	9
2044	Элита (Омская область)	9
2045	Южно-Подольск	9
2046	Яман	9
2047	Акташ	34
2048	Горно-Алтайск	34
2049	Иогач	34
2050	Кош-Агач	34
2051	Кызыл-Озек	34
2052	Майма	34
2053	Онгудай	34
2054	Сейка	34
2055	Турочак	34
2056	Улаган	34
2057	Усть-Кан	34
2058	Усть-Кокса	34
2059	Чемал	34
2060	Чоя	34
2061	Шебалино	34
2062	Черга	34
2063	Александровское (Томская область)	35
2064	Асино	35
2065	Бакчар	35
2066	Батурино	35
2067	Белый Яр	35
2068	Богашёво	35
2069	Зональная Станция	35
2070	Зоркальцево	35
2071	Зырянское	35
2072	Каргала	35
2073	Каргасок	35
2074	Катайга	35
2075	Кедровый	35
2076	Кисловка	35
2077	Кожевниково	35
2078	Колпашево	35
2079	Копылово	35
2080	Кривошеино	35
2081	Курлек	35
2082	Мельниково	35
2083	Могочино	35
2084	Молчаново	35
2085	Моряковский Затон	35
2086	Нарга	35
2087	Новый Васюган	35
2088	Парабель	35
2089	Парбиг	35
2090	Первомайское (Томская область)	35
2091	Подгорное	35
2092	Рыбалово	35
2093	Самусь	35
2094	Светлый (Томская область)	35
2095	Северск (Томская область)	35
2096	Средний Васюган	35
2097	Степановка	35
2098	Стрежевой	35
2099	Тегульдет	35
2100	Тимирязевское	35
2101	Тогур	35
2102	Томск	35
2103	Улу-Юл	35
2104	Чажемто	35
2105	Комсомольск (Томская область)	35
2106	Алпатьево	3
2107	Алфимово	3
2108	Андреевка	3
2109	Архангельское (Московская область)	3
2110	Астапово	3
2111	Ашукино	3
2112	Беликово (Московская область)	3
2113	Белоозёрский (Московская область)	3
2114	Боброво	3
2115	Быково (Московская область)	3
2116	Внуковское	3
2117	Воздвиженское (Московская область)	3
2118	Володарского	3
2119	Горки Ленинские	3
2120	Горшково	3
2121	Григорьевское (Московская область)	3
2122	Дединово	3
2123	Десеновское	3
2124	Дмитриевское (Московская область)	3
2125	Дорохово (Московская область)	3
2126	Жилёво	3
2127	Загорянский	3
2128	Зарудня	3
2129	Звёздный Городок	3
2130	Знамя Октября	3
2131	Измайлово	3
2132	Ильинский (Раменский район)	3
2133	Каринское	3
2134	Кожино	3
2135	Колычево (Московская область)	3
2136	Колюбакино	3
2137	Коммунарка	3
2138	Космодемьянский	3
2139	Красная Пахра	3
2140	Красная Пойма	3
2141	Красное (Московская область)	3
2142	Крекшино	3
2143	Крутч-Байгора	3
2144	Куликово	3
2145	Ленинский (Московская область)	3
2146	Летний отдых	3
2147	Ловцы	3
2148	Лоза	3
2149	Лопатино	3
2150	Лотошино	3
2151	Любучаны	3
2152	Малино	3
2153	Микулино	3
2154	Авсюнино	3
2155	Балашиха	3
2156	Большие Дворы	3
2157	Большое Буньково	3
2158	Горки-10 (Московская область, Одинцовский район)	3
2159	Давыдово (Московская область, Орехово-Зуевский район)	3
2160	Демихово (Московская область, Орехово-Зуевский район)	3
2161	Дзержинский	3
2162	Дмитровский Погост	3
2163	Дрезна	3
2164	Железнодорожный	3
2165	Жуковский	3
2166	Котельники	3
2167	Красково	3
2168	Красноармейск (Московская область)	3
2169	Кривандино (Московская область)	3
2170	Куровское	3
2171	Ликино-Дулево	3
2172	Лосино-Петровский	3
2173	Луховицы	3
2174	Лыткарино	3
2175	Люберцы	3
2176	Малаховка (Московская область)	3
2177	Мирный (Московская область, Люберецкий район)	3
2178	Мисайлово	3
2179	Михали (Московская область, городской округ Егорьевск)	3
2180	Мишеронский	3
2181	Монино	3
2182	Ногинск	3
2183	Обухово	3
2184	Октябрьский (Московская область, Люберецкий район)	3
2185	Орехово-Зуево	3
2186	Островцы (Московская область)	3
2187	Павловский Посад	3
2188	Поповская (Московская область)	3
2189	Починки (Московская область, городской округ Егорьевск)	3
2190	Пышлицы	3
2191	Радовицкий	3
2192	Раменки (Московская область)	3
2193	Рахманово	3
2194	Реутов	3
2195	Рошаль	3
2196	Свердловский	3
2197	Старая Купавна	3
2198	Стромынь	3
2199	Фрязино	3
2200	Фряново	3
2201	Черноголовка	3
2202	Чёрное (Московская область)	3
2203	Черусти	3
2204	Шатура	3
2205	Шатурторф	3
2206	Шувое	3
2207	Щелково	3
2208	Электрогорск	3
2209	Электросталь	3
2210	Электроугли	3
2211	Юрцово (Московская область, городской округ Егорьевск)	3
2212	Газопроводск	3
2213	Агрогородок	3
2214	Алабино	3
2215	Баковка	3
2216	Барвиха	3
2217	Большие Вязёмы	3
2218	Большое Сареево	3
2219	Власиха	3
2220	ВНИИССОК	3
2221	Волоколамск	3
2222	Воронки	3
2223	Глебовский	3
2224	Глухово	3
2225	Голицыно	3
2226	Горки-2	3
2227	Дедовск	3
2228	Дмитровское	3
2229	ДСК Мичуринец	3
2230	Жаворонки	3
2231	Заречье (рабочий посёлок, Одинцовский район)	3
2232	Звенигород	3
2233	Зелёный	3
2234	Знаменское	3
2235	Ивановское (Московская область)	3
2236	Ильинское	3
2237	Истра	3
2238	Калчуга	3
2239	Киевский	3
2240	Красногорск	3
2241	Краснознаменск (Московская область)	3
2242	Кубинка	3
2243	Куркино (Московская область)	3
2244	Курсаково	3
2245	Лайково	3
2246	Лапино	3
2247	Лесной Городок	3
2248	Лучинское	3
2249	Малые Вязёмы	3
2250	Мамоново (Московская область)	3
2251	Мечниково	3
2252	Можайск	3
2253	Нахабино	3
2254	Немчиновка	3
2255	Новоивановское	3
2256	Ново-Переделкино	3
2257	Новопетровское	3
2258	Новый	3
2259	Новый Городок (Одинцовский район)	3
2260	Одинцово	3
2261	Павловская Слобода	3
2262	Переделкино	3
2263	Поречье	3
2264	Рублево	3
2265	Руза	3
2266	Румянцево	3
2267	Снегири	3
2268	Солнцево (Московская область)	3
2269	Старый Городок (Одинцовский район)	3
2270	Тучково	3
2271	Уваровка (Московская область)	3
2272	Успенское (Московская область)	3
2273	Часцы	3
2274	Богородское (Московская область)	3
2275	Вербилки	3
2276	Высоковск	3
2277	Деденево	3
2278	Дмитров	3
2279	Долгопрудный	3
2280	Дубна	3
2281	Жуковка (Московская область)	3
2282	Запрудня (Московская область)	3
2283	Зверосовхоз (Московская область)	3
2284	Зеленоград	3
2285	Ивантеевка	3
2286	Икша	3
2287	Клин	3
2288	Королев	3
2289	Краснозаводск	3
2290	Лесной (Московская область, Пушкинский район)	3
2291	Лесные Поляны (Московская область, Пушкинский район)	3
2292	Лобня	3
2293	Марфино (Московская область)	3
2294	Медвежьи Озёра	3
2295	Менделеево	3
2296	Мытищи	3
2297	Пересвет	3
2298	Поварово	3
2299	Подушкино	3
2300	посёлок Биокомбината	3
2301	Правдинский	3
2302	Путилково	3
2303	Пушкино (Московская область)	3
2304	Реммаш	3
2305	Сергиев Посад	3
2306	Солнечногорск	3
2307	Софрино	3
2308	Талдом	3
2309	Химки	3
2310	Хотьково	3
2311	Черкизово (Московская область, Пушкинский район)	3
2312	Юбилейный (Московская область)	3
2313	Ямкино	3
2314	Яхрома	3
2315	Скоропусковский	3
2316	Алачково	3
2317	Апрелевка	3
2318	Атепцево	3
2319	Барабаново	3
2320	Барыбино	3
2321	Белоомут	3
2322	Березнецово	3
2323	Большевик	3
2324	Бронницы	3
2325	Бутурлино (Московская область)	3
2326	Ватутинки	3
2327	Вельяминово	3
2328	Верея	3
2329	Видное	3
2330	Вороновское	3
2331	Воскресенск	3
2332	Горки (Ленинский район)	3
2333	Домодедово	3
2334	Домодедово (село)	3
2335	Дрожжино	3
2336	Егорьевск	3
2337	Житнево	3
2338	Зарайск	3
2339	Ильинский (Московская область)	3
2340	Калининец	3
2341	Кашира	3
2342	Клёново (Московская область)	3
2343	Климовск (Московская область)	3
2344	Кокошкино	3
2345	Коломна	3
2346	Конобеево	3
2347	Красный Путь	3
2348	Кратово	3
2349	Крюково	3
2350	Липицы	3
2351	ЛМС	3
2352	Мещерино	3
2353	Мещерское	3
2354	Михнево (Московская область, Ступинский район)	3
2355	Молоди	3
2356	Молоково	3
2357	Московский	3
2358	Наро-Фоминск	3
2359	Новосёлки (городской округ Кашира)	3
2360	Новый Быт	3
2361	Оболенск	3
2362	Ожерелье	3
2363	Озеры	3
2364	Павловское (городской округ Домодедово)	3
2365	Первомайское (Московская область)	3
2366	Подольск (Московская область)	3
2367	посёлок Володарского (Московская область)	3
2368	Посёлок санатория «Подмосковье»	3
2369	Протвино	3
2370	Птичное	3
2371	Пущино	3
2372	Развилка (Московская область)	3
2373	Раменское	3
2374	Растуново	3
2375	Серпухов	3
2376	Богатищево	3
2377	Ситне-Щелканово	3
2378	Софьино (Раменский район)	3
2379	Столбовая	3
2380	Ступино	3
2381	Татариново	3
2382	Таширово	3
2383	Троицк (Московская область)	3
2384	Троицкое (Московская область)	3
2385	Удельная (Московская область)	3
2386	Хорлово	3
2387	Чехов	3
2388	Чехов-7	3
2389	Щапово (Московская область)	3
2390	Щербинка	3
2391	Электроизолятор	3
2392	Ям	3
2393	Мосрентген	3
2394	Назарьево	3
2395	Нарынка	3
2396	Некрасовский (Московская область)	3
2397	Непецино	3
2398	Нестерово	3
2399	Нижне-Маслово	3
2400	Рыбаки	3
2401	Новинки (Московская область)	3
2402	Новое	3
2403	Новое Гришино	3
2404	Новое Ступино	3
2405	Новоклемово	3
2406	Ново-Синьково	3
2407	Озеро Белое	3
2408	Октябрьский (Московская область)	3
2409	Орево	3
2410	Осташево	3
2411	Поваровка	3
2412	Подосинки	3
2413	Покровское (городской округ Истра)	3
2414	Посёлок имени Воровского	3
2415	Поселок им.Цюрупы	3
2416	Посёлок совхоза имени Ленина	3
2417	Радумля	3
2418	Речицы (Московская область, Раменский район)	3
2419	Решетниково	3
2420	Ржавки	3
2421	Рогачево	3
2422	Родники (Московская область)	3
2423	Рязановский	3
2424	Саввино	3
2425	Селятино	3
2426	Семёновское	3
2427	Сергиевский	3
2428	Серебряные Пруды	3
2429	Скуратово	3
2430	Сосенское	3
2431	Софьино (Наро-Фоминский район)	3
2432	Степаново	3
2433	Сычево	3
2434	Теряево	3
2435	Томилино	3
2436	Трехгорка	3
2437	Узуново	3
2438	Успенский	3
2439	Фруктовая	3
2440	Хатунь	3
2441	Цветковский	3
2442	Шаховская	3
2443	Шевляково	3
2444	Шеметово	3
2445	Шишкин Лес	3
2446	Шугарово	3
2447	Яковлевское	3
2448	Архара	36
2449	Белогорск	36
2450	Березовка (Амурская область)	36
2451	Благовещенск (Амурская область)	36
2452	Бурея (Амурская область)	36
2453	Варваровка	36
2454	Возжаевка	36
2455	Дипкун	36
2456	Екатеринославка (Амурская область)	36
2457	Ерофей Павлович	36
2458	Завитинск	36
2459	Зея	36
2460	Ивановка (Ивановский район, Амурская область)	36
2461	Козьмодемьяновка	36
2462	Константиновка (Амурская область)	36
2463	Магдагачи	36
2464	Невер	36
2465	Новобурейский	36
2466	Новокиевский Увал	36
2467	Новорайчихинск	36
2468	Овсянка	36
2469	Октябрьский (Амурская область)	36
2470	Поздеевка	36
2471	Поярково (Амурская область)	36
2472	Прогресс (Амурская область)	36
2473	Райчихинск	36
2474	Свободный	36
2475	Серышево	36
2476	Сиваки	36
2477	Сковородино	36
2478	Соловьёвск	36
2479	Талакан (Амурская область)	36
2480	Талдан	36
2481	Тамбовка (Амурская область)	36
2482	Томичи	36
2483	Томское	36
2484	Тыгда	36
2485	Тында	36
2486	Уруша	36
2487	Ушумун	36
2488	Февральск (Амурская область)	36
2489	Циолковский	36
2490	Чигири (Амурская область)	36
2491	Шимановск	36
2492	Экимчан	36
2493	Юктали	36
2494	Среднебелая	36
2495	Амурзет	37
2496	Бабстово	37
2497	Биджан	37
2498	Бира	37
2499	Биракан	37
2500	Биробиджан	37
2501	Волочаевка-2	37
2502	Ленинское (Еврейская АО)	37
2503	Николаевка (Еврейская АО)	37
2504	Облучье	37
2505	Приамурский	37
2506	Птичник (Еврейская АО)	37
2507	Смидович (Еврейская АО)	37
2508	Теплоозёрск	37
2509	Известковый	37
2510	Анавгай	38
2511	Вилючинск	38
2512	Вулканный	38
2513	Долиновка	38
2514	Елизово	38
2515	Ивашка	38
2516	Каменское (Камчатский край)	38
2517	Ключи (Камчатский край)	38
2518	Козыревск	38
2519	Коряки (Камчатский край)	38
2520	Лазо	38
2521	Манилы	38
2522	Мильково (Камчатский край)	38
2523	Нагорный (Камчатский край)	38
2524	Николаевка (Камчатский край)	38
2525	Новый (Камчатский край)	38
2526	Озерновский	38
2527	Октябрьский (Камчатский край)	38
2528	Оссора	38
2529	Палана	38
2530	Паратунка	38
2531	Пахачи	38
2532	Петропавловск-Камчатский	38
2533	Пионерский (Камчатский край)	38
2534	Раздольный (Камчатский край)	38
2535	Соболево (Камчатский край)	38
2536	Термальный	38
2537	Тигиль	38
2538	Тиличики	38
2539	Усть-Большерецк	38
2540	Усть-Камчатск	38
2541	Усть-Хайрюзово	38
2542	Хаилино	38
2543	Шаромы	38
2544	Эссо	38
2545	Атласово	38
2546	Дебин	39
2547	Дукат (Магаданская область)	39
2548	Магадан	39
2549	Мяунджа	39
2550	Ола (Магаданская область)	39
2551	Омсукчан	39
2552	Омчак	39
2553	Оротукан	39
2554	Палатка (Магаданская область)	39
2555	Сеймчан	39
2556	Синегорье (Магаданская область)	39
2557	Сокол (Магаданская область)	39
2558	Стекольный	39
2559	Сусуман	39
2560	Талая	39
2561	Уптар	39
2562	Усть-Омчуг	39
2563	Холодный	39
2564	Эвенск	39
2565	Ягодное (Магаданская область)	39
2566	Армань	39
2567	Андреевка (Хасанский район)	40
2568	Анучино	40
2569	Ариадное	40
2570	Арсеньев	40
2571	Артем	40
2572	Барабаш	40
2573	Большой Камень	40
2574	Буссевка	40
2575	Владивосток	40
2576	Владимиро-Александровское	40
2577	Воздвиженка	40
2578	Вольно-Надеждинское	40
2579	Восток	40
2580	Вострецово	40
2581	Врангель	40
2582	Галенки	40
2583	Горные Ключи	40
2584	Дальнегорск	40
2585	Дальнереченск	40
2586	Девица (Приморский край)	40
2587	Дунай	40
2588	Зарубино	40
2589	Ивановка (Приморский край)	40
2590	Кавалерово	40
2591	Камень-Рыболов	40
2592	Кировский (Приморский край)	40
2593	Краскино	40
2594	Краснореченский	40
2595	Лазо (Дальнореченский округ)	40
2596	Лазо (Лазовский район)	40
2597	Лесозаводск	40
2598	Ливадия (Приморский край)	40
2599	Липовцы	40
2600	Лучегорск	40
2601	Малиново	40
2602	Милоградово	40
2603	Михайловка (Приморский край)	40
2604	Моряк-Рыболов	40
2605	Находка	40
2606	Новокачалинск	40
2607	Новоникольск	40
2608	Новопокровка	40
2609	Новостройка	40
2610	Новосысоевка	40
2611	Новошахтинский	40
2612	Новый (Приморский край)	40
2613	Ольга	40
2614	Партизанск	40
2615	Пластун	40
2616	Пограничный (Приморский край)	40
2617	Покровка (Октябрьский район, Приморский край)	40
2618	Посьет	40
2619	Преображение	40
2620	Раздольное (Приморский край)	40
2621	Ракитное (Приморский край)	40
2622	Реттиховка	40
2623	Рощино (Приморский край)	40
2624	Рудная Пристань	40
2625	Русский	40
2626	Сергеевка (Партизанский район)	40
2627	Светлогорье	40
2628	Сергеевка (Пограничный район)	40
2629	Сибирцево (Приморский край)	40
2630	Славянка (Приморский край)	40
2631	Смоляниново	40
2632	Спасск-Дальний	40
2633	Спасское (Приморский край)	40
2634	Тавричанка	40
2635	Терней	40
2636	Трудовое (Приморский край)	40
2637	Углекаменск	40
2638	Уссурийск	40
2639	Фокино (Приморский край)	40
2640	Хороль	40
2641	Хрустальный	40
2642	Черниговка (Приморский край)	40
2643	Чкаловское	40
2644	Чугуевка	40
2645	Шкотово	40
2646	Яковлевка	40
2647	Ярославский	40
2648	Александровск-Сахалинский	41
2649	Анива	41
2650	Быков (Сахалинская область)	41
2651	Вахрушев	41
2652	Горное	41
2653	Горнозаводск (Сахалинская область)	41
2654	Долинск	41
2655	Корсаков	41
2656	Краснополье (Сахалинская область)	41
2657	Курильск	41
2658	Леонидово	41
2659	Лесогорское	41
2660	Макаров (Сахалинская область)	41
2661	Малокурильское	41
2662	Мгачи	41
2663	Москальво	41
2664	Невельск	41
2665	Некрасовка (Сахалинская область)	41
2666	Ноглики	41
2667	Оха	41
2668	Первомайск (Сахалинская область)	41
2669	Поронайск	41
2670	Правда	41
2671	Рейдово	41
2672	Русское (Сахалинская область)	41
2673	Северо-Курильск	41
2674	Синегорск	41
2675	Смирных	41
2676	Сокол (Сахалинская область)	41
2677	Томари	41
2678	Троицкое (Сахалинская область)	41
2679	Тунгор	41
2680	Тымовское	41
2681	Углегорск	41
2682	Холмск	41
2683	Хоэ	41
2684	Чехов (Сахалинская область)	41
2685	Шахтерск (Сахалинская область)	41
2686	Шебунино	41
2687	Южно-Курильск	41
2688	Южно-Сахалинск	41
2689	Бошняково	41
2690	Амурск	42
2691	Берёзовый (Хабаровский край)	42
2692	Бикин	42
2693	Большой Уссурийский	42
2694	Бычиха	42
2695	Ванино	42
2696	Восточное	42
2697	Высокогорный	42
2698	Вяземский	42
2699	Горин	42
2700	Де-Кастри	42
2701	Джонка	42
2702	Дормидонтовка	42
2703	Дружба (Хабаровский край)	42
2704	Дуки	42
2705	Заветы Ильича (Хабаровский край)	42
2706	Ильинка (Хабаровский край)	42
2707	Князе-Волконское	42
2708	Комсомольск-на-Амуре	42
2709	Корфовский	42
2710	Краснореченское	42
2711	Лермонтовка	42
2712	Маго	42
2713	Мариинское	42
2714	Маяк	42
2715	Многовершинный	42
2716	Монгохто	42
2717	Мухен	42
2718	Некрасовка (Хабаровский край)	42
2719	Николаевск-на-Амуре	42
2720	Новокуровка (Хабаровский край)	42
2721	Новый Ургал	42
2722	Октябрьский (Хабаровский край)	42
2723	Охотск	42
2724	Переяславка	42
2725	Поселок ЦЭС	42
2726	Сита	42
2727	Советская Гавань	42
2728	Солнечный	42
2729	Софийск	42
2730	Сулук	42
2731	Тахта	42
2732	Тополево	42
2733	Троицкое (Хабаровский край)	42
2734	Тыр	42
2735	Тырма	42
2736	Хабаровск	42
2737	Херпучи	42
2738	Хор (Хабаровский край)	42
2739	Хурба	42
2740	Хурмули	42
2741	Циммермановка	42
2742	Чегдомын	42
2743	Чёрная Речка (Хабаровский край)	42
2744	Чля	42
2745	Чумикан	42
2746	Эворон	42
2747	Эльбан	42
2748	Лазарев	42
2749	Анадырь	43
2750	Анюйск	43
2751	Беринговский	43
2752	Билибино	43
2753	Илирней	43
2754	Лаврентия	43
2755	Лорино (Чукотский АО)	43
2756	Марково	43
2757	Мыс Шмидта	43
2758	Омолон	43
2759	Островное	43
2760	Певек	43
2761	Провидения	43
2762	Рыткучи	43
2763	Угольные Копи	43
2764	Эгвекинот	43
2765	Кепервеем	43
2766	Акимовка	44
2767	Бердянск	44
2768	Большая Белозерка	44
2769	Васильевка	44
2770	Веселое	44
2771	Вольнянск	44
2772	Гуляйполе	44
2773	Днепрорудное	44
2774	Запорожье	44
2775	Каменка-Днепровская	44
2776	Кирилловка	44
2777	Куйбышево	44
2778	Мелитополь	44
2779	Михайловка (Запорожская область)	44
2780	Молочанск	44
2781	Новониколаевка	44
2782	Орехов	44
2783	Пологи	44
2784	Приазовское	44
2785	Приморск (Запорожская область)	44
2786	Розовка	44
2787	Токмак	44
2788	Черниговка	44
2789	Энергодар	44
2790	Авнюгский	45
2791	Архангельск	45
2792	Белогорский	45
2793	Белушья Губа	45
2794	Березник	45
2795	Брин-Наволок	45
2796	Вельск	45
2797	Верхняя Тойма	45
2798	Вычегодский	45
2799	Двинской	45
2800	Емецк	45
2801	Емца	45
2802	Ерцево	45
2803	Ильинско-Подомское	45
2804	Каменка (Архангельская область)	45
2805	Каргополь	45
2806	Карпогоры	45
2807	Катунино	45
2808	Кизема	45
2809	Кодино	45
2810	Конёво	45
2811	Коноша	45
2812	Коряжма	45
2813	Котлас	45
2814	Красноборск	45
2815	Куликово (Архангельская область)	45
2816	Кулой	45
2817	Лешуконское	45
2818	Луковецкий	45
2819	Малошуйка	45
2820	Мезень	45
2821	Мирный (Архангельская область)	45
2822	Новодвинск	45
2823	Няндома	45
2824	Обозерский	45
2825	Оксовский	45
2826	Октябрьский (Архангельская область)	45
2827	Онега	45
2828	Пинега	45
2829	Плесецк	45
2830	Подюга	45
2831	Приводино	45
2832	Пуксоозера	45
2833	Рочегда	45
2834	Савинский	45
2835	Самодед	45
2836	Северодвинск	45
2837	Североонежск	45
2838	Сия	45
2839	Соловецкий	45
2840	Сольвычегодск	45
2841	Сура	45
2842	Удимский	45
2843	Уемский	45
2844	Урдома	45
2845	Усть-Пинега	45
2846	Холмогоры	45
2847	Черевково	45
2848	Шалакуша	45
2849	Шангалы	45
2850	Шелоховская	45
2851	Шенкурск	45
2852	Шипицыно	45
2853	Яренск	45
2854	Багратионовск	46
2855	Балтийск	46
2856	Большаково	46
2857	Васильково	46
2858	Гвардейск	46
2859	Гурьевск (Калининградская область)	46
2860	Гусев	46
2861	Зеленоградск	46
2862	Калининград	46
2863	Краснознаменск (Калининградская область)	46
2864	Красноторовка	46
2865	Ладушкин	46
2866	Мамоново	46
2867	Неман	46
2868	Нестеров	46
2869	Озерск (Калининградская область)	46
2870	Пионерский	46
2871	Полесск	46
2872	Правдинск (Калининградская область)	46
2873	Приморск	46
2874	Приморье	46
2875	Светлогорск (Калининградская область)	46
2876	Светлый	46
2877	Славск	46
2878	Советск (Калининградская область)	46
2879	Черняховск	46
2880	Южный-1	46
2881	Янтарный	46
2882	Храброво	46
2883	Агалатово	47
2884	Алеховщина	47
2885	Аннино (Ленинградская область)	47
2886	Бегуницы	47
2887	Белогорка	47
2888	Беседа	47
2889	Бокситогорск	47
2890	Большая Вруда	47
2891	Большая Ижора	47
2892	Большая Пустомержа	47
2893	Большие Колпаны	47
2894	Большое Куземкино	47
2895	Большой Сабск	47
2896	Бугры	47
2897	Будогощь	47
2898	Важины	47
2899	Васкелово	47
2900	Виллози	47
2901	Винницы	47
2902	Вистино	47
2903	Вознесенье (Ленинградская область)	47
2904	Войсковицы	47
2905	Войскорово	47
2906	Волосово	47
2907	Волхов	47
2908	Всеволожск	47
2909	Выборг	47
2910	Вындин Остров	47
2911	Вырица	47
2912	Выскатка	47
2913	Высоцк	47
2914	Гарболово	47
2915	Гатчина	47
2916	Гладкое	47
2917	Глажево	47
2918	Глебычево	47
2919	Глобицы	47
2920	Горбунки	47
2921	Гостилицы	47
2922	Громово	47
2923	Дзержинского	47
2924	Дружная Горка (Ленинградская область)	47
2925	Дубровка (Ленинградская область)	47
2926	Елизаветино (Ленинградская область)	47
2927	Ефимовский	47
2928	Заклинье (Ленинградская область)	47
2929	Запорожское	47
2930	Зеленогорск (Ленинградская обл)	47
2931	Зимитицы	47
2932	Ивангород	47
2933	Извара	47
2934	Иннолово	47
2935	Калитино	47
2936	Каменка (Ленинградская область)	47
2937	Каменногорск	47
2938	Кикерино	47
2939	Кингисепп	47
2940	Кингисеппский	47
2941	Кипень	47
2942	Кириши	47
2943	Кобринское	47
2944	Кировск (Ленинградская область)	47
2945	Кисельня	47
2946	Кобралово	47
2947	Колпино	47
2948	Колтуши	47
2949	Колчаново	47
2950	Коммунар	47
2951	Котельский	47
2952	Красная Долина	47
2953	Красное Село	47
2954	Красный Бор (Ленинградская область)	47
2955	Кронштадт	47
2956	Кудрово	47
2957	Кузнечное	47
2958	Кузьмоловский	47
2959	Курск (Волосовский район, Ленинградская область)	47
2960	Лаголово	47
2961	Лебяжье	47
2962	Лесколово	47
2963	Лесогорский	47
2964	Лодейное Поле	47
2965	Ломоносов	47
2966	Лопухинка	47
2967	Луга	47
2968	Любань (Ленинградская область)	47
2969	Малое Верево	47
2970	Малое Карлино	47
2971	Мга	47
2972	Мельниково (Ленинградская область)	47
2973	Металлострой	47
2974	Мичуринское	47
2975	Мурино	47
2976	Мшинская	47
2977	Назия	47
2978	Низино (Ленинградская область)	47
2979	Никольский (Ленинградская область)	47
2980	Никольское	47
2981	Новая Ладога	47
2982	Новое Девяткино	47
2983	Новоселье (Ленинградская область)	47
2984	Новый Свет	47
2985	Новый Учхоз	47
2986	Нурма (Ленинградская область)	47
2987	Озерки (Всеволожский район)	47
2988	Ополье	47
2989	Оредеж	47
2990	Оржицы	47
2991	Осьмино	47
2992	Отрадное (Ленинградская область)	47
2993	Павловск (Ленинградская область)	47
2994	Парголово	47
2995	Паша	47
2996	пгт имени Свердлова	47
2997	Пеники	47
2998	Первомайское (Ленинградская область)	47
2999	Песочный	47
3000	Петергоф	47
3001	Пикалево	47
3002	Плодовое	47
3003	Подпорожье	47
3004	Понтонный	47
3005	посёлок имени Морозова	47
3006	Приладожский	47
3007	Приморск (Ленинградская область)	47
3008	Приозерск	47
3009	Пудомяги	47
3010	Пудость	47
3011	Пушкин	47
3012	Пчевжа	47
3013	Разбегаево (Ленинградская область)	47
3014	Разметелево	47
3015	Рахья	47
3016	Репино	47
3017	Ретюнь	47
3018	Романовка	47
3019	Ромашкинское сельское поселение (Ленинградская область)	47
3020	Рощино (Ленинградская область)	47
3021	Русско-Высоцкое	47
3022	Рябово (Ленинградская область)	47
3023	Садовый (Ленинградская область)	47
3024	Саперное	47
3025	Светогорск	47
3026	Свирьстрой	47
3027	Селезнёво (Ленинградская область)	47
3028	Сельцо (посёлок, Волосовский район)	47
3029	Семиозерье	47
3030	Семрино	47
3031	Сертолово	47
3032	Сестрорецк	47
3033	Сиверский	47
3034	Синявино	47
3035	Славянка	47
3036	Сланцы	47
3037	Советский (Ленинградская область)	47
3038	Сосново	47
3039	Сосновый Бор (Ленинградская область)	47
3040	Старая Ладога	47
3041	Старая (Ленинградская область)	47
3042	Старополье	47
3043	Стеклянный	47
3044	Стрельна	47
3045	Сусанино (Ленинградская область)	47
3046	Суходолье (Ленинградская область)	47
3047	Сяськелево	47
3048	Сясьстрой	47
3049	Тайцы	47
3050	Тарасово (Ленинградская область)	47
3051	Тельмана	47
3052	Терволово	47
3053	Тихвин	47
3054	Токсово	47
3055	Толмачёво (Ленинградская область)	47
3056	Торковичи	47
3057	Тосно	47
3058	Ульяновка (Ленинградская область)	47
3059	Усть-Луга	47
3060	Ушаки	47
3061	Фалилеево	47
3062	Фёдоровское (Ленинградская область)	47
3063	Форносово	47
3064	Хиттолово	47
3065	Шлиссельбург	47
3066	Шугозеро	47
3067	Шум	47
3068	Шушары	47
3069	Щеглово	47
3070	Юкки	47
3071	Ям-Ижора	47
3072	Ям-Тесово	47
3073	Янино-1	47
3074	Алакуртти	48
3075	Апатиты	48
3076	Африканда	48
3077	Белое Море	48
3078	Варзуга	48
3079	Верхнетуломский	48
3080	Видяево	48
3081	Высокий (Мурманская область)	48
3082	Гаджиево	48
3083	Енский	48
3084	Ёнский	48
3085	Заозерск	48
3086	Заполярный	48
3087	Зашеек (Мурманская область)	48
3088	Зеленоборский	48
3089	Кандалакша	48
3090	Кильдинстрой	48
3091	Кировск (Мурманская область)	48
3092	Коашва	48
3093	Ковдор	48
3094	Кола	48
3095	Корзуново	48
3096	Лейпи	48
3097	Лиинахамари	48
3098	Ловозеро	48
3099	Луостари	48
3100	Междуречье (Мурманская область)	48
3101	Мишуково (Мурманская область)	48
3102	Молочный	48
3103	Мончегорск	48
3104	Мурманск	48
3105	Мурмаши	48
3106	Нивский	48
3107	Никель (Мурманская область)	48
3108	Оленегорск	48
3109	Островной	48
3110	Печенга	48
3111	Полярные Зори	48
3112	Полярный	48
3113	Пояконда	48
3114	Пушной (Мурманская область)	48
3115	Раякоски	48
3116	Ревда (Мурманская область)	48
3117	Сафоново (Мурманская область)	48
3118	Североморск	48
3119	Снежногорск	48
3120	Сосновка (Мурманская область)	48
3121	Спутник	48
3122	Териберка	48
3123	Титан (Мурманская область)	48
3124	Тулома	48
3125	Туманный	48
3126	Умба	48
3127	Ура-Губа	48
3128	Шонгуй	48
3129	Щукозеро	48
3130	Краснощелье	48
3131	Амдерма	49
3132	Бугрино (Ненецкий АО)	49
3133	Вангурей	49
3134	Варандей	49
3135	Индига	49
3136	Каратайка	49
3137	Нарыга	49
3138	Нарьян-Мар	49
3139	Несь	49
3140	Носовая	49
3141	Ома (Ненецкий АО)	49
3142	Поселок Искателей	49
3143	Сабетта	49
3144	Усть-Кара	49
3145	Хорей-Вер	49
3146	Батецкий	50
3147	Большая Вишера	50
3148	Борки	50
3149	Боровенка	50
3150	Боровичи	50
3151	Валдай	50
3152	Великий Новгород	50
3153	Волот (Новгородская область)	50
3154	Григорово	50
3155	Демянск	50
3156	Дуброво	50
3157	Едрово	50
3158	Залучье	50
3159	Зарубино (Новгородская область)	50
3160	Ивантеево	50
3161	Кневицы	50
3162	Краснофарфорный	50
3163	Крестцы	50
3164	Кулотино	50
3165	Лычково	50
3166	Любытино	50
3167	Малая Вишера	50
3168	Марёво	50
3169	Медведь	50
3170	Мошенское (Новгородская область)	50
3171	Неболчи	50
3172	Окуловка	50
3173	Опеченский Посад	50
3174	Панковка	50
3175	Парфино	50
3176	Пестово	50
3177	Подберезье	50
3178	Поддорье	50
3179	Пола	50
3180	Полново	50
3181	Пролетарий	50
3182	Сольцы	50
3183	Старая Русса	50
3184	Тесово-Нетыльский	50
3185	Угловка	50
3186	Усть-Волма	50
3187	Уторгош	50
3188	Хвойная	50
3189	Холм	50
3190	Чечулино	50
3191	Чудово	50
3192	Шимск	50
3193	Юбилейный (Новгородская область)	50
3194	Яжелбицы	50
3195	Нагово	50
3196	Бежаницы	51
3197	Великие Луки	51
3198	Верхний Мост	51
3199	Гаврово	51
3200	Гдов	51
3201	Дедовичи	51
3202	Дно	51
3203	Жижица	51
3204	Заплюсье	51
3205	Идрица	51
3206	Карамышево (Псковская область)	51
3207	Красногородск	51
3208	Красный Луч (Псковская область)	51
3209	Кунья	51
3210	Лавры	51
3211	Локня (Псковская область)	51
3212	Невель	51
3213	Новоржев	51
3214	Новосокольники	51
3215	Новохованск	51
3216	Новый Изборск	51
3217	Опочка	51
3218	Остров	51
3219	Павы	51
3220	Палкино (Псковская область)	51
3221	Печоры	51
3222	Плюсса	51
3223	Пожеревицы	51
3224	Полоное	51
3225	Порхов	51
3226	Псков	51
3227	Пустошка	51
3228	Пушкинские Горы	51
3229	Пыталово	51
3230	Родина	51
3231	Родовое	51
3232	Себеж	51
3233	Середка	51
3234	Славковичи	51
3235	Сосновый Бор (Псковская область)	51
3236	Струги Красные	51
3237	Усвяты	51
3238	Усть-Долыссы	51
3239	Хилово	51
3240	Чихачево	51
3241	Ямм	51
3242	Качаново	51
3243	Беломорск	52
3244	Волома	52
3245	Вяртсиля	52
3246	Ильинский (Республика Карелия)	52
3247	Калевала	52
3248	Каменный Бор	52
3249	Кемь	52
3250	Кондопога	52
3251	Костомукша	52
3252	Кривцы	52
3253	Ладва	52
3254	Лахденпохья	52
3255	Лахколампи	52
3256	Ледмозеро	52
3257	Лендеры	52
3258	Лоухи	52
3259	Ляскеля	52
3260	Медвежьегорск	52
3261	Муезерский	52
3262	Надвоицы	52
3263	Найстенъярви	52
3264	Олонец	52
3265	Пенинга	52
3266	Петрозаводск	52
3267	Пиндуши	52
3268	Питкяранта	52
3269	Повенец	52
3270	Поросозеро	52
3271	Пряжа	52
3272	Пудож	52
3273	Пяльма	52
3274	Пяозерский	52
3275	Рускеала	52
3276	Салми	52
3277	Сегежа	52
3278	Сортавала	52
3279	Сосновец	52
3280	Сосновый	52
3281	Суккозеро	52
3282	Суоярви	52
3283	Харлу	52
3284	Хелюля	52
3285	Чална	52
3286	Чупа	52
3287	Шальский	52
3288	Шелтозеро	52
3289	Элисенваара	52
3290	Великая Губа	52
3291	Абезь	53
3292	Айкино	53
3293	Благоево (Коми)	53
3294	Боровой	53
3295	Важгорт	53
3296	Вежью	53
3297	Верхнеижемский	53
3298	Верхняя Инта	53
3299	Верхняя Максаковка	53
3300	Визинга	53
3301	Войвож	53
3302	Воргашор	53
3303	Воркута	53
3304	Вуктыл	53
3305	Выльгорт	53
3306	Гурьевка	53
3307	Дутово	53
3308	Емва	53
3309	Жешарт	53
3310	Замежная	53
3311	Зеленец	53
3312	Зимстан	53
3313	Ижма (Коми)	53
3314	Изъяю	53
3315	Инта	53
3316	Каджером	53
3317	Казлук	53
3318	Кожва	53
3319	Кожмудор	53
3320	Койгородок	53
3321	Койдин	53
3322	Комсомольск-на-Печоре	53
3323	Корткерос	53
3324	Кослан	53
3325	Краснобор	53
3326	Краснозатонский	53
3327	Кузьель	53
3328	Летка	53
3329	Лойма	53
3330	Мадмас	53
3331	Межадор	53
3332	Междуреченск (Коми)	53
3333	Микунь	53
3334	Митрофан-Дикост	53
3335	Мохча	53
3336	Нижний Одес	53
3337	Нижняя Омра	53
3338	Новый Бор	53
3339	Ношуль	53
3340	Объячево	53
3341	Пажга	53
3342	Первомайский (Республика Коми)	53
3343	Печора	53
3344	Подчерье	53
3345	Помоздино	53
3346	Путеец (Коми)	53
3347	Седкыркещ	53
3348	Седью	53
3349	Синдор	53
3350	Сосногорск	53
3351	Подзь	53
3352	Спаспоруб	53
3353	Сторожевск	53
3354	Сыктывкар	53
3355	Том	53
3356	Тракт	53
3357	Троицко-Печорск	53
3358	Трусово	53
3359	Усинск	53
3360	Усогорск	53
3361	Усть-Вымский район	53
3362	Усть-Кулом	53
3363	Усть-Ухта	53
3364	Усть-Цильма	53
3365	Ухта	53
3366	Хабариха	53
3367	Черемуховка	53
3368	Чикшино	53
3369	Чиньяворык	53
3370	Шудаяг	53
3371	Щельяюр	53
3372	Югыдъяг	53
3373	Якша	53
3374	Ярега	53
3375	Велиж	54
3376	Верхнеднепровский	54
3377	Вязьма	54
3378	Гагарин	54
3379	Глинка	54
3380	Голынки	54
3381	Городок	54
3382	Гусино	54
3383	Даурия	54
3384	Демидов	54
3385	Десногорск	54
3386	Дорогобуж	54
3387	Духовщина	54
3388	Ельня	54
3389	Ершичи	54
3390	Кардымово	54
3391	Красный	54
3392	Монастырщина	54
3393	Новодугино	54
3394	Озерный	54
3395	Первомайский (Смоленская область)	54
3396	Печерск	54
3397	Починок	54
3398	Пригорское	54
3399	Рославль	54
3400	Рудня	54
3401	Сафоново	54
3402	Смоленск	54
3403	Стодолище	54
3404	Сычевка	54
3405	Тёмкино	54
3406	Угра	54
3407	Хиславичи	54
3408	Холм-Жирковский	54
3409	Шаталово	54
3410	Шумячи	54
3411	Ярцево	54
3412	Карманово	54
3413	Александров	55
3414	Анопино	55
3415	Бавлены	55
3416	Балакирево	55
3417	Белая Речка	55
3418	Боголюбово	55
3419	Булатниково	55
3420	Бутылицы	55
3421	Великодворский	55
3422	Владимир	55
3423	Вольгинский	55
3424	Второво	55
3425	Вязники	55
3426	Вяткино	55
3427	Городищи	55
3428	Гороховец	55
3429	Григорьево	55
3430	Гусевский	55
3431	Гусь-Хрустальный	55
3432	Дмитриевы Горы	55
3433	Добрятино	55
3434	Достижение	55
3435	Зименки	55
3436	Золотково	55
3437	Иванищи	55
3438	Илькино	55
3439	Камешково	55
3440	Карабаново	55
3441	Карла Маркса	55
3442	Киржач	55
3443	Ковров	55
3444	Колпь	55
3445	Кольчугино	55
3446	Костерево	55
3447	Красная Горбатка	55
3448	Красное Эхо	55
3449	Красный Октябрь	55
3450	Курлово	55
3451	Лакинск	55
3452	Ляхи	55
3453	Максима Горького	55
3454	Малыгино	55
3455	Малышево	55
3456	Мезиновский	55
3457	Меленки	55
3458	Мелехово (Владимирская область)	55
3459	Мошок	55
3460	Мстера (Вязниковский район)	55
3461	Муром	55
3462	Муромский	55
3463	Небылое	55
3464	Никологоры	55
3465	Новки	55
3466	Новлянка	55
3467	Октябрьская (Владимирская область)	55
3468	Октябрьский (Владимирская область)	55
3469	Панфилово (Владимирская область)	55
3470	Паустово	55
3471	Петушки	55
3472	Покров	55
3473	Сима	55
3474	Поселок фабрики им. Войкова	55
3475	Радужный (Владимирская область)	55
3476	Садовый (Владимирская область)	55
3477	Сергеиха	55
3478	Собинка	55
3479	Советское (Владимирская область)	55
3480	Ставрово	55
3481	Станция Мстера (Вязниковский район)	55
3482	Старый Двор	55
3483	Степанцево	55
3484	Струнино	55
3485	Судогда	55
3486	Суздаль	55
3487	Уршельский	55
3488	Фоминки	55
3489	Чаадаево	55
3490	Чулково (Владимирская область)	55
3491	Шихобалово	55
3492	Эсино	55
3493	Юрьев-Польский	55
3494	Якиманская Слобода	55
3495	Анашкино	56
3496	Анненский Мост	56
3497	Аргуново	56
3498	Бабаево	56
3499	База	56
3500	Белозерск	56
3501	Бережное	56
3502	Борисово-Судское	56
3503	Борок	56
3504	Ботово	56
3505	Васильевское	56
3506	Великий Устюг	56
3507	Верховажье	56
3508	Вожега	56
3509	Вологда	56
3510	Воробьево	56
3511	Вохтога	56
3512	Вытегра	56
3513	Городищна	56
3514	Гремячий	56
3515	Грибково	56
3516	Грязовец	56
3517	Девятины	56
3518	Депо	56
3519	Дубровское	56
3520	Ермаково	56
3521	Зубово	56
3522	Кадников	56
3523	Кадниковский	56
3524	Кадуй	56
3525	Кириллов	56
3526	Кичменгский Городок	56
3527	Климовское	56
3528	Коротово	56
3529	Красавино	56
3530	Кубенское	56
3531	Липин Бор	56
3532	Ломоватка	56
3533	Малечкино	56
3534	Можайское	56
3535	Молочное (Вологодская область)	56
3536	Мякса	56
3537	Нижний Енангск	56
3538	Никольск (Вологодская область)	56
3539	Нифантово	56
3540	Новатор	56
3541	Новленское	56
3542	Нюксеница	56
3543	Огарково	56
3544	Остахово	56
3545	Покровка (Вологодская область)	56
3546	Пяжелка	56
3547	Рослятино	56
3548	Сазоново	56
3549	Село имени Бабушкина	56
3550	Семенково	56
3551	Сокол	56
3552	Суда	56
3553	Сурково	56
3554	Сямжа	56
3555	Кокшарка	56
3556	Талицы	56
3557	Тарногский Городок	56
3558	Тоншалово	56
3559	Торопово	56
3560	Тотьма	56
3561	Усть-Алексеево	56
3562	Устье	56
3563	Устюжна	56
3564	Федотово	56
3565	Харовск	56
3566	Хорошево	56
3567	Хохлово	56
3568	Чагода	56
3569	Чаромское	56
3570	Чебсара	56
3571	Череповец	56
3572	Чушевицы	56
3573	Шексна	56
3574	Шуйское	56
3575	Шулма	56
3576	Шухободь	56
3577	Юрово	56
3578	Аньково	57
3579	Архиповка	57
3580	Верхний Ландех	57
3581	Вичуга	57
3582	Выползово	57
3583	Гаврилов Посад	57
3584	Дуляпино	57
3585	Жарковский	57
3586	Заволжск	57
3587	Заречный (Ивановская область)	57
3588	Иваново (Ивановская область)	57
3589	Ильинское-Хованское	57
3590	Калашниково	57
3591	Каменка (Ивановская область)	57
3592	Каминский	57
3593	Кинешма	57
3594	Китово	57
3595	Колобово (Ивановская область)	57
3596	Комсомольск (Ивановская область)	57
3597	Кохма	57
3598	Лежнево	57
3599	Лесное	57
3600	Луговое (Ивановская область)	57
3601	Лух	57
3602	Майдаково	57
3603	Марково (Ивановская область)	57
3604	Медное	57
3605	Наволоки	57
3606	Нерль	57
3607	Новое Леушино	57
3608	Новописцово	57
3609	Ново-Талицы	57
3610	Новые Горки	57
3611	Оленино	57
3612	Осановец	57
3613	Палех	57
3614	Парское	57
3615	Пестяки	57
3616	Петровский	57
3617	Писцово	57
3618	Плес	57
3619	Подозерский	57
3620	Приволжск	57
3621	Пучеж	57
3622	Редкино	57
3623	Решма	57
3624	Родники	57
3625	Савино	57
3626	Сахтыш	57
3627	Семигорье	57
3628	Спирово (Ивановская область)	57
3629	Старая Вичуга	57
3630	Тейково	57
3631	Филино	57
3632	Филисово	57
3633	Фурманов	57
3634	Шекшово	57
3635	Шуя	57
3636	Южа	57
3637	Юрьевец	57
3638	Октябрьский (Ивановская область)	57
3639	Антропово	58
3640	Боговарово	58
3641	Буй	58
3642	Ветлужский	58
3643	Волгореченск	58
3644	Вохма	58
3645	Галич (Костромская область)	58
3646	Георгиевское	58
3647	Горчуха	58
3648	Завражье	58
3649	Зебляки	58
3650	Кадый	58
3651	Караваево	58
3652	Кологрив	58
3653	Кострома	58
3654	Красное-на-Волге	58
3655	Макарьев	58
3656	Мантурово	58
3657	Минское	58
3658	Нерехта	58
3659	Нея	58
3660	Никольское (Костромская область)	58
3661	Островское	58
3662	Павино	58
3663	Парфеньево	58
3664	Поназырево	58
3665	Пронино	58
3666	Пыщуг	58
3667	Рождественское	58
3668	Солигалич	58
3669	Судай	58
3670	Судиславль	58
3671	Сусанино	58
3672	Сухоногово	58
3673	Чистые Боры	58
3674	Чухлома	58
3675	Шарья	58
3676	Николо-Полома	58
3677	Андреаполь	59
3678	Балахта (Тверская область)	59
3679	Бежецк	59
3680	Белый	59
3681	Белый Городок	59
3682	Березайка	59
3683	Бологое	59
3684	Бурашево	59
3685	Весьегонск	59
3686	Вышний Волочек	59
3687	Жарковский (Тверская область)	59
3688	Западная Двина	59
3689	Зубцов	59
3690	Изоплит	59
3691	Калязин	59
3692	Кашин	59
3693	Кесова Гора	59
3694	Кимры	59
3695	Конаково	59
3696	Красномайский	59
3697	Красный Холм	59
3698	Кувшиново	59
3699	Куженкино	59
3700	Лесное (Тверская область)	59
3701	Лихославль	59
3702	Максатиха	59
3703	Медное (Тверская область)	59
3704	Мокшино	59
3705	Молоково (Тверская область)	59
3706	Нелидово	59
3707	Новозавидовский	59
3708	Озерный (Тверская область)	59
3709	Оленино (Тверская область)	59
3710	Осташков	59
3711	Пено	59
3712	Радченко	59
3713	Рамешки	59
3714	Редкино (Тверская область)	59
3715	Ржев	59
3716	Селижарово	59
3717	Сонково	59
3718	Спирово (Тверская область)	59
3719	Старая Торопа	59
3720	Старица	59
3721	Тверь	59
3722	Торжок	59
3723	Торопец	59
3724	Удомля	59
3725	Фирово	59
3726	Шоша	59
3727	Сандово	59
3728	Белогостицы	60
3729	Берендеево	60
3730	Большое Село	60
3731	Борисоглебский	60
3732	Брейтово	60
3733	Бурмакино	60
3734	Варегово	60
3735	Великое	60
3736	Волга	60
3737	Вятское	60
3738	Гаврилов-Ям	60
3739	Глебовское	60
3740	Данилов	60
3741	Дмитриановское	60
3742	Дубки (Ярославская область)	60
3743	Дюдьково	60
3744	Заозерье	60
3745	Ивановское (Ярославская область)	60
3746	Ивняки	60
3747	Каменники	60
3748	Киево	60
3749	Константиновский	60
3750	Красные Ткачи	60
3751	Красный Профинтерн	60
3752	Кубринск	60
3753	Кузнечиха	60
3754	Кукобой	60
3755	Купанское	60
3756	Курба	60
3757	Левашово	60
3758	Лесная Поляна	60
3759	Любим	60
3760	Михайловский	60
3761	Мокеевское	60
3762	Мышкин	60
3763	Нагорный	60
3764	Нагорье	60
3765	Некрасовское	60
3766	Никульское	60
3767	Новый Некоуз	60
3768	Октябрь	60
3769	Октябрьский (Ярославская область)	60
3770	Переславль-Залесский	60
3771	Песочное	60
3772	Пестрецово	60
3773	Петровское (Ярославская область)	60
3774	Покровское (Ярославская область)	60
3775	Пошехонье	60
3776	Пречистое	60
3777	Ростов (Ярославская область)	60
3778	Рыбинск	60
3779	Рязанцево	60
3780	Семеновское (Ярославская область)	60
3781	Семибратово	60
3782	Середа	60
3783	Стогинское	60
3784	Тихменево	60
3785	Туношна	60
3786	Тутаев	60
3787	Углич	60
3788	Климатино	60
3789	Угодичи	60
3790	Шопша	60
3791	Шурскол	60
3792	Щедрино	60
3793	Ярославль	60
3794	Абдулино	61
3795	Адамовка	61
3796	Акбулак	61
3797	Аксаково (Оренбургская область)	61
3798	Аксенкино	61
3799	Алабайтал	61
3800	Аландское	61
3801	Александровка	61
3802	Аниховка	61
3803	Артемьевка	61
3804	Архангеловка	61
3805	Асекеево	61
3806	Барабановка	61
3807	Белоусовка	61
3808	Беляевка (Оренбургская область)	61
3809	Благодарное (Оренбургская область)	61
3810	Большой Сурмет	61
3811	Бугуруслан	61
3812	Бузулук	61
3813	Буланово	61
3814	Буранное	61
3815	Бурлыкский	61
3816	Верхнеигнашкино	61
3817	Верхняя Вязовка	61
3818	Владимировка (Оренбургская область)	61
3819	Второе Имангулово	61
3820	Гай	61
3821	Гамалеевка-1	61
3822	Герасимовка (Оренбургская область)	61
3823	Голубой Факел	61
3824	Грачевка (Оренбургская область)	61
3825	Григорьевка (Оренбургская область)	61
3826	Державино	61
3827	Домбаровский	61
3828	Донецкое	61
3829	Дубенский	61
3830	Елшанка Первая	61
3831	Емельяновка	61
3832	Ефимовка	61
3833	Ждановка (Оренбургская область)	61
3834	Желтое	61
3835	Заглядино	61
3836	Зиянчурино	61
3837	Зубочистка Первая	61
4083	Апраксино	63
3838	Ивановка (Оренбургская область)	61
3839	Изобильное	61
3840	Илек	61
3841	Ириклинский	61
3842	Каменноозерное	61
3843	Караванный	61
3844	Каракудук	61
3845	Карасай	61
3846	Кардаилово	61
3847	Кваркено	61
3848	Кинельский	61
3849	Кинзелька	61
3850	Кирсановка	61
3851	Кирюшкино	61
3852	Кичкасс	61
3853	Ключевка	61
3854	Пронькино	61
3855	Колтубанка	61
3856	Колтубановский	61
3857	Костино (Оренбургская область)	61
3858	Красногвардеец	61
3859	Краснохолм	61
3860	Красноярский	61
3861	Кряжлы	61
3862	Кубанка	61
3863	Кувандык	61
3864	Кулагино	61
3865	Курманаевка	61
3866	Лабазы	61
3867	Лапаз	61
3868	Лекаревка	61
3869	Ленина (Оренбургская область)	61
3870	Линевка	61
3871	Матвеевка	61
3872	Маякское	61
3873	Медногорск	61
3874	Мочегай	61
3875	Мустаево	61
3876	Надеждинка	61
3877	Нежинка	61
3878	Нестеровка	61
3879	Нижнекристалка	61
3880	Нижнеозерное	61
3881	Нижнесакмарский	61
3882	Нижний Гумбет	61
3883	Нижняя Павловка	61
3884	Новоалександровка (Оренбургская область)	61
3885	Нововасильевка	61
3886	Новожедрино	61
3887	Новокаменка	61
3888	Новомусино	61
3889	Новоникольское	61
3890	Новоорск	61
3891	Новорудный	61
3892	Новосергиевка	61
3893	Новотроицк (Оренбургская область)	61
3894	Новоякупово	61
3895	Октябрьское	61
3896	Оренбург	61
3897	Орск	61
3898	Палимовка	61
3899	Первокрасное	61
3900	Первомайский (Оренбургская область)	61
3901	Первомайский (Оренбургский район)	61
3902	Переволоцкий	61
3903	Петрохерсонец	61
3904	Пилюгино	61
3905	Плешаново	61
3906	Погромное	61
3907	Подгородняя Покровка	61
3908	Подколки	61
3909	Подольск (Оренбургская область)	61
3910	Покровка (Новосергиевский район)	61
3911	Покровка (Соль-Илецкий район)	61
3912	Пономарёвка	61
3913	Преображенка (Оренбургская область)	61
3914	Претория	61
3915	Привольное (Оренбургская область)	61
3916	Пригородный	61
3917	Приуральский	61
3918	Пугачевский	61
3919	Пушкинский	61
3920	Разномойка	61
3921	Ратчино (Оренбургская область)	61
3922	Родинский	61
3923	Родничный Дол	61
3924	Ромашкино	61
3925	Рубежинский	61
3926	Русский Кандыз	61
3927	Рязановка	61
3928	Сагарчин	61
3929	Сакмара	61
3930	Сарай-Гир	61
3931	Саракташ	61
3932	Свердлово	61
3933	Светлый (Оренбургская область)	61
3934	Северное	61
3935	Секретарка	61
3936	Село имени 9 января	61
3937	Соль-Илецк	61
3938	Сорочинск	61
3939	Среднеуранский	61
3940	Станционно-Ояшинский	61
3941	Староалександровка	61
3942	Старомукменево	61
3943	Степановка Вторая	61
3944	Степановка (Переволоцкий район)	61
3945	Степановка (Ташлинский район)	61
3946	Струково	61
3947	Студеное (Оренбургская область)	61
3948	Суворовский	61
3949	Таллы	61
3950	Татарская Каргала	61
3951	Ташла	61
3952	Теренсай	61
3953	Толкаевка	61
3954	Тоцкое	61
3955	Тоцкое Второе	61
3956	Тугустемир	61
3957	Тюльган	61
3958	Уральский (Оренбургская область)	61
3959	Халилово (Оренбургская область)	61
3960	Хуторка	61
3961	Чебеньки	61
3962	Черноречье	61
3963	Черный Отрог	61
3964	Чесноковка (Оренбургская область)	61
3965	Чкалов	61
3966	Чкаловский (Оренбургская область)	61
3967	Шарлык	61
3968	Шахтный	61
3969	Шильда	61
3970	Шкуновка	61
3971	Экспериментальный (Оренбургская область)	61
3972	Энергетик	61
3973	Юдинка	61
3974	Япрынцево	61
3975	Ясная Поляна (Оренбургская область)	61
3976	Ясный	61
3977	Ясный (Оренбургская область)	61
3978	Алферьевка	62
3979	Анучино (Пензенская область)	62
3980	Аргамаково (Пензенская область)	62
3981	Башмаково	62
3982	Беково	62
3983	Белинский	62
3984	Богословка	62
3985	Большая Елань	62
3986	Большая Ижмора	62
3987	Большая Лука	62
3988	Большие Хутора	62
3989	Большой Вьяс	62
3990	Вадинск	62
3991	Вазерки	62
3992	Верхний Ломов	62
3993	Верхняя Елюзань	62
3994	Верхозим	62
3995	Головинщино	62
3996	Городище (Пензенская область)	62
3997	Грабово	62
3998	Дубровки	62
3999	Евлашево	62
4000	Ермоловка	62
4001	Заречный (Пензенская область)	62
4002	Засечное	62
4003	Земетчино	62
4004	Золотаревка (Пензенская область)	62
4005	Ива	62
4006	Ильмино	62
4007	Индерка	62
4008	Исса	62
4009	Казанская Арчада	62
4010	Каменка (Пензенская область)	62
4011	Канаевка	62
4012	Кижеватово	62
4013	Кирово (Пензенская область)	62
4014	Клейменовка	62
4015	Колтовское	62
4016	Колышлей	62
4017	Кондоль	62
4018	Корсаевка	62
4019	Красная Горка (Пензенская область)	62
4020	Кувак-Никольское	62
4021	Кузнецк	62
4022	Куракино	62
4023	Леонидовка	62
4024	Лермонтово	62
4025	Лопатино (Пензенская область)	62
4026	Лунино (Пензенская область)	62
4027	Маис	62
4028	Малая Сердоба	62
4029	Махалино	62
4030	Междуречье (Пензенская область)	62
4031	Мокшан	62
4032	Наровчат	62
4033	Наскафтым	62
4034	Невежкино	62
4035	Неверкино	62
4036	Нечаевка (Пензенская область)	62
4037	Пионер	62
4038	Нижний Ломов	62
4039	Нижний Шкафт	62
4040	Нижняя Елюзань	62
4041	Никольск (Пензенская область)	62
4042	Никульевка	62
4043	Ночка	62
4044	Пачелма	62
4045	Пашково (Пензенская область)	62
4046	Пенза	62
4047	Пичевка	62
4048	Поим	62
4049	Покровская Арчада	62
4050	Пригородное	62
4051	Пушанино	62
4052	Рамзай	62
4053	Рощино (Пензенская область)	62
4054	Русский Камешкир	62
4055	Саловка	62
4056	Саполга	62
4057	Свищевка	62
4058	Сердобск	62
4059	Соколка	62
4060	Соседка	62
4061	Спасск	62
4062	Средняя Елюзань	62
4063	Старая Степановка	62
4064	Старый Чирчим	62
4065	Степановка (Пензенская область)	62
4066	Столыпино	62
4067	Студенка	62
4068	Сура (Пензенская область)	62
4069	Сурск	62
4070	Тамала	62
4071	Татаро-Никольское	62
4072	Тимирязево	62
4073	Титово	62
4074	Ушинка	62
4075	Федоровка (Пензенская область)	62
4076	Чаадаевка	62
4077	Чемодановка	62
4078	Черкасское	62
4079	Чернозерье	62
4080	Шемышейка	62
4081	Явлейка	62
4082	Анненково	63
4084	Ардатов	63
4085	Ардатово	63
4086	Атемар	63
4087	Атюрьево	63
4088	Атяшево	63
4089	Береговые Сыреси	63
4090	Болдово	63
4091	Большая Елховка	63
4092	Большие Березники	63
4093	Большие Ремезенки	63
4094	Большое Игнатово	63
4095	Большое Маресево	63
4096	Гуляево	63
4097	Дубенки	63
4098	Ельники	63
4099	Ефаево	63
4100	Зубова-Поляна	63
4101	Инсар	63
4102	Кабаево	63
4103	Кадошкино	63
4104	Кемля	63
4105	Ковылкино	63
4106	Комсомольский (Республика Мордовия)	63
4107	Кочелаево	63
4108	Кочкурово (Республика Мордовия)	63
4109	Краснослободск (Республика Мордовия)	63
4110	Леплей	63
4111	Луховка	63
4112	Лямбирь	63
4113	Мичурино	63
4114	Первомайск (Республика Мордовия)	63
4115	Поводимово	63
4116	Потьма	63
4117	Ромоданово	63
4118	Рузаевка	63
4119	Сабур-Мачкасы	63
4120	Саранск	63
4121	Совхоз Коммунар	63
4122	Старое Синдрово	63
4123	Старое Шайгово	63
4124	Темников	63
4125	Теньгушево	63
4126	Торбеево	63
4127	Троицк (Республика Мордовия)	63
4128	Тургенево	63
4129	Ударный	63
4130	Чамзинка	63
4131	Ширингуши	63
4132	Явас	63
4133	Ялга	63
4134	Старая Федоровка	63
4135	Августовка	13
4136	Алексеевка (Самарская область)	13
4137	Балашейка	13
4138	Безенчук	13
4139	Береговой (Самарская область)	13
4140	Бобровка (Самарская область)	13
4141	Богатое (Самарская область)	13
4142	Богатырь	13
4143	Богдановка	13
4144	Большая Глушица	13
4145	Большая Рязань	13
4146	Большая Черниговка	13
4147	Большое Микушкино	13
4148	Большой Толкай	13
4149	Борискино Игар	13
4150	Борское (Самарская область)	13
4151	Васильевка (Самарская область)	13
4152	Верхние Белозёрки	13
4153	Верхняя Подстепновка	13
4154	Волжский (Самарская область)	13
4155	Волжский Утес	13
4156	Воротнее	13
4157	Георгиевка (Самарская область)	13
4158	Глушицкий	13
4159	Девлезеркино	13
4160	Денискино	13
4161	Домашка	13
4162	Дубовый Умет	13
4163	Екатериновка (Самарская область)	13
4164	Елховка (Самарская область)	13
4165	Жигулевск	13
4166	Жигули	13
4167	Звезда	13
4168	Зольное	13
4169	Ильмень	13
4170	Исаклы	13
4171	Камышла (Самарская область)	13
4172	Кандабулак	13
4173	Кинель	13
4174	Кинель-Черкассы	13
4175	Клявлино	13
4176	Коммунарский	13
4177	Кошки (Самарская область)	13
4178	Красная Глинка	13
4179	Красноармейское (Самарская область)	13
4180	Красносамарское	13
4181	Красносельское (Самарская область)	13
4182	Красный Строитель	13
4183	Красный Яр (Самарская область)	13
4184	Кротовка	13
4185	Курумоч	13
4186	Кутузовский	13
4187	Ленинский (Самарская область)	13
4188	Лопатино (Самарская область)	13
4189	Луначарский (Самарская область)	13
4190	Майское (Самарская область)	13
4191	Малая Малышевка	13
4192	Малая Царевщина	13
4193	Малое Микушкино	13
4194	Марьевка (Самарская область)	13
4195	Тимашево	13
4196	Масленниково	13
4197	Междуреченск (Самарская область)	13
4198	Мехзавод	13
4199	Мирный (Самарская область)	13
4200	Нефтегорск (Самарская область)	13
4201	Никитинка	13
4202	Новая Кармала	13
4203	Новодевичье	13
4204	Новое Ганькино	13
4205	Новое Усманово	13
4206	Новое Якушкино	13
4207	Новокуйбышевск	13
4208	Новокуровка (Самарская область)	13
4209	Новосемейкино	13
4210	Новоспасский	13
4211	Новый Буян	13
4212	Обшаровка	13
4213	Октябрьск	13
4214	Ольгино (Самарская область)	13
4215	Осинки	13
4216	Отрадный (Самарская область)	13
4217	Падовка	13
4218	Пестравка	13
4219	Петра Дубрава	13
4220	Подбельск	13
4221	Подстепки	13
4222	Похвистнево	13
4223	Прибой	13
4224	Прибрежный	13
4225	Приволжье (Самарская область)	13
4226	Придорожный (Самарская область)	13
4227	Прогресс (Самарская область)	13
4228	Просвет (Самарская область)	13
4229	Рождествено	13
4230	Рощинский	13
4231	Рысайкино	13
4232	Савруха	13
4233	Садгород	13
4234	Салейкино	13
4235	Самара	13
4236	Сергиевск	13
4237	Серноводск	13
4238	Смышляевка	13
4239	Солнечная Поляна	13
4240	Сосновый Солонец	13
4241	Спиридоновка	13
4242	Старое Эштебенькино	13
4243	Старый Аманак	13
4244	Стройкерамика	13
4245	Сухая Вязовка	13
4246	Суходол (Самарская область)	13
4247	Сызрань	13
4248	Тольятти	13
4249	Управленческий	13
4250	Усть-Кинельский	13
4251	Утёвка (Самарская область)	13
4252	Фрунзенский	13
4253	Хворостянка (Самарская область)	13
4254	Хилково	13
4255	Хрящёвка	13
4256	Чапаевск	13
4257	Челно-Вершины	13
4258	Черновка	13
4259	Черновский	13
4260	Чубовка	13
4261	Шентала	13
4262	Шигоны	13
4263	Шилан	13
4264	Ширяево (Самарская область)	13
4265	Шпановка	13
4266	Южный (Самарская область)	13
4267	Яблоневый Овраг	13
4268	Ягодное (Самарская область)	13
4269	Акатная Маза	64
4270	Алекса́ндров Гай	64
4271	Аркадак	64
4272	Аткарск	64
4273	Базарный Карабулак	64
4274	Бакуры	64
4275	Балаково	64
4276	Балашов	64
4277	Балтай	64
4278	Безымянное	64
4279	Белогорное	64
4280	Березовая Лука	64
4281	Березовка (Саратовская область)	64
4282	Большие Озерки	64
4283	Большой Карай	64
4284	Большой Мелик	64
4285	Бороно-Михайловка	64
4286	Брыковка	64
4287	Быков Отрог	64
4288	Возрождение	64
4289	Вольск	64
4290	Воскресенское (Саратовская область)	64
4291	Горный (Саратовская область)	64
4292	Дергачи (Саратовская область)	64
4293	Динамовский	64
4294	Донгуз	64
4295	Дубки (Саратовская область)	64
4296	Духовницкое	64
4297	Екатериновка (Саратовская область)	64
4298	Елшанка (Воскресенский район, Саратовская область)	64
4299	Ершов	64
4300	Заволжский	64
4301	Звонаревка	64
4302	Золотое	64
4303	Ивантеевка (Саратовская область)	64
4304	Казанла	64
4305	Казачка	64
4306	Калининск	64
4307	Каменский	64
4308	Клинцовка	64
4309	Колокольцовка	64
4310	Колояр	64
4311	Красноармейск (Саратовская область)	64
4312	Красный Кут	64
4313	Красный Текстильщик	64
4314	Куриловка	64
4315	Липовка (Саратовская область)	64
4316	Луганское	64
4317	Лысые Горы	64
4318	Маркс	64
4319	Михайловка (Саратовская область)	64
4320	Мокроус	64
4321	Мордовский Карай	64
4322	Натальино (Саратовская область)	64
4323	Нижняя Банновка	64
4324	Новопокровское	64
4325	Новопушкинское	64
4326	Новоузенск	64
4327	Новые Бурасы	64
4328	Новые-Выселки	64
4329	Октябрьский Городок	64
4330	Озерки (Саратовская область)	64
4331	Озерное	64
4332	Озинки	64
4333	Орлов Гай	64
4334	Пады	64
4335	Паницкая	64
4336	Первомайское (Саратовская область)	64
4337	Перевесинка	64
4338	Перелюб	64
4339	Петровск	64
4340	Пинеровка	64
4341	Питерка	64
4342	Подлесное (Саратовская область)	64
4343	Поселок им.Карла Маркса	64
4344	Приволжский	64
4345	Пугачев	64
4346	Пушкино (Саратовская область)	64
4347	Расково	64
4348	Ровное	64
4349	Родничок	64
4350	Романовка (Саратовская область)	64
4351	Ртищево	64
4352	Ртищевский	64
4353	Салтыковка	64
4354	Самойловка	64
4355	Саратов	64
4356	Святославка	64
4357	Семеновка (Саратовская область)	64
4358	Сенной (Саратовская область)	64
4359	Сергиевка	64
4360	Синенькие	64
4361	Синодское	64
4362	Сластуха	64
4363	Советское (Саратовская область)	64
4364	Соколовый	64
4365	Сосновая Маза	64
4366	Сосновоборское	64
4367	Соцземледельский	64
4368	Старая Жуковка	64
4369	Степное (Саратовская область, Советский район)	64
4370	Сторожевка	64
4371	Стригай	64
4372	Сухой Карабулак	64
4373	Татищево (Саратовская область)	64
4374	Тепличный	64
4375	Тепловка	64
4376	Тепляковка	64
4377	Турки	64
4378	Узморье	64
4379	Учебный	64
4380	Хвалынск	64
4381	Хватовка	64
4382	Шевыревка	64
4383	Широкий Буерак	64
4384	Шиханы	64
4385	Шняево	64
4386	Энгельс	64
4387	Акшуат	65
4388	Астрадамовка	65
4389	Баевка	65
4390	Базарный Сызган	65
4391	Барыш	65
4392	Бекетовка	65
4393	Белое Озеро	65
4394	Белозерье	65
4395	Большая Кандала	65
4396	Большая Кандарать	65
4397	Большие Ключищи	65
4398	Большое Нагаткино	65
4399	Валгуссы	65
4400	Верхняя Маза (Ульяновская область)	65
4401	Вешкайма	65
4402	Выры	65
4403	Глотовка	65
4404	Димитровград	65
4405	Дмитриево-Помряскино	65
4406	Жадовка	65
4407	Ждамирово	65
4408	Зеленая Роща (Ульяновская область)	65
4409	Игнатовка	65
4410	Измайлово (Ульяновская область)	65
4411	Инза	65
4412	Ишеевка (Ульяновская область)	65
4413	Канадей	65
4414	Каргино	65
4415	Карсун	65
4416	Кезьмино	65
4417	Коржевка	65
4418	Красная Река	65
4419	Красносельск	65
4420	Красный Гуляй	65
4421	Крестово-Городище	65
4422	Криуши	65
4423	Кузоватово	65
4424	Майна (Ульяновская область)	65
4425	Мирный (Ульяновская область)	65
4426	Николаевка (Ульяновская область)	65
4427	Никольское-на-Черемшане	65
4428	Новая Майна	65
4429	Новая Малыкла	65
4430	Новоселки (Ульяновская область)	65
4431	Новоспасское (Ульяновская область)	65
4432	Новоульяновск	65
4433	Новочеремшанск	65
4434	Озерки (Ульяновская область)	65
4435	Октябрьский (Радищевский район)	65
4436	Октябрьский (Чердаклинский район)	65
4437	Оськино	65
4438	Павловка (Павловский район Ульяновской области)	65
4439	Панциревка	65
4440	Подкуровка	65
4441	Радищево (Ульяновская область)	65
4442	Рязаново	65
4443	Сара	65
4444	Сенгилей	65
4445	Силикатный (Ульяновская область)	65
4446	Славкино	65
4447	Мулловка	65
4448	Старая Кулатка	65
4449	Старая Майна	65
4450	Старая Сахча	65
4451	Старотимошкино	65
4452	Студенец	65
4453	Сурское (Ульяновская область)	65
4454	Тагай	65
4455	Татарский Калмаюр	65
4456	Татарский Сайман	65
4457	Тереньга	65
4458	Тетюшское	65
4459	Тимирязевский (Ульяновская область)	65
4460	Труслейка	65
4461	Тушна	65
4462	Ульяновск	65
4463	Ундоры	65
4464	Урено-Карлинское	65
4465	Фабричные Выселки	65
4466	Холстовка	65
4467	Цильна	65
4468	Чердаклы	65
4469	Чуфарово	65
4470	Шаховское	65
4471	Ясашная Ташла	65
4472	Актабан	66
4473	Альменево	66
4474	Барино	66
4475	Батурино (Курганская область)	66
4476	Башкирское	66
4477	Белозерское (Курганская область)	66
4478	Белоярка 1-я	66
4479	Белоярское	66
4480	Большая Рига	66
4481	Большое-Курейное	66
4482	Большое Просеково	66
4483	Боровлянка (Курганская область)	66
4484	Боровское (Курганская область)	66
4485	Варгаши	66
4486	Введенское	66
4487	Верхнее	66
4488	Верхнесуерское	66
4489	Верхняя Теча	66
4490	Вилкино	66
4491	Восточное (Курганская область)	66
4492	Гагарье	66
4493	Галкино	66
4494	Глядянское	66
4495	Горохово	66
4496	Далматово	66
4497	Долговка	66
4498	Долговское	66
4499	Жуково (Курганская область)	66
4500	Журавлево	66
4501	Заманилки	66
4502	Затеченское	66
4503	Звериноголовское	66
4504	Иковка	66
4505	Казаркино	66
4506	Камаган	66
4507	Канаши	66
4508	Караси	66
4509	Каргаполье	66
4510	Катайск	66
4511	Каширино	66
4512	Кетово	66
4513	Кипель	66
4514	Кирово	66
4515	Кислянка	66
4516	Кислянское	66
4517	Ключевское	66
4518	Коврига	66
4519	Кодское	66
4520	Коровье	66
4521	Косолапово	66
4522	Костыгин Лог	66
4523	Красная Звезда	66
4524	Красная Нива	66
4525	Краснознаменское	66
4526	Красномыльское	66
4527	Красный Октябрь (Курганская область)	66
4528	Кривское	66
4529	Крутая Горка	66
4530	Курган	66
4531	Курорт Озеро	66
4532	Травное (Курганская область)	66
4533	Куртамыш	66
4534	Лебяжье (Курганская область)	66
4535	Лесниково	66
4536	Лопатки	66
4537	Макушино	66
4538	Мальцево	66
4539	Маслянское	66
4540	Медведское	66
4541	Медвежье Озеро	66
4542	Менщиково	66
4543	Митино	66
4544	Михалево	66
4545	Мишкино	66
4546	Мокроусово	66
4547	Мостовское	66
4548	Нагорское	66
4549	Нижнее	66
4550	Нижнеполевское	66
4551	Нижнетобольное	66
4552	Новогеоргиевка 2-я	66
4553	Новодостовалово	66
4554	Новопетропавловское	66
4555	Новый Мир	66
4556	Обутковское	66
4557	Окуневское	66
4558	Осиновское	66
4559	Падеринское	66
4560	Памятное	66
4561	Пашково (Курганская область)	66
4562	Песчано-Коледино	66
4563	Песчанское	66
4564	Петухово	66
4565	Погорелка	66
4566	Половинное	66
4567	Прорывное	66
4568	Просвет (Курганская область)	66
4569	Птичье (Курганская область)	66
4570	Раскатиха	66
4571	Рынки	66
4572	Садовое (Курганская область)	66
4573	Сафакулево	66
4574	Сетовное	66
4575	Сиреневый (Курганская область)	66
4576	Скоблино	66
4577	Стариково	66
4578	Старый Просвет	66
4579	Степное (Курганская область)	66
4580	Сухмень	66
4581	Уксянское	66
4582	Усть-Уйское	66
4583	Целинное (Курганская область)	66
4584	Частоозерье	66
4585	Чаши	66
4586	Чистопрудное	66
4587	Чумляк	66
4588	Шадринск	66
4589	Шастово	66
4590	Шатрово	66
4591	Шмаково	66
4592	Шумиха	66
4593	Щучье	66
4594	Юргамыш	66
4595	Ягодная	66
4596	Ялым	66
4597	Александровск (Пермский край)	18
4598	Альняш	18
4599	Андреево	18
4600	Антипина	18
4601	Архангельское (Пермский край)	18
4602	Асово	18
4603	Аспа	18
4604	Ашап	18
4605	Бабка	18
4606	Барда (Пермский край)	18
4607	Белоево	18
4608	Бердышево	18
4609	Березники	18
4610	Берёзовка (Берёзовский район, Пермский край)	18
4611	Бершеть	18
4612	Бисер	18
4613	Бичурино	18
4614	Большая Коча	18
4615	Большая Соснова	18
4616	Большая Уса	18
4617	Большие Кусты	18
4618	Большой Гондыр	18
4619	Бондюг	18
4620	Бородулино	18
4621	Брюхово	18
4622	Буб	18
4623	Буренка	18
4624	Бырма	18
4625	Ваньки	18
4626	Вассята	18
4627	Вая	18
4628	Велва-База	18
4629	Верещагино	18
4630	Верх-Иньва	18
4631	Верхнее Калино	18
4632	Верхнечусовские Городки	18
4633	Верх-Юсьва	18
4634	Верх-Язьва	18
4635	Вильва	18
4636	Вознесенское (Пермский край)	18
4637	Всеволодо-Вильва	18
4638	Гайны (Пермский край)	18
4639	Гамово (Пермский край)	18
4640	Голдыревский	18
4641	Горнозаводск	18
4642	Горы	18
4643	Гремяча	18
4644	Гремячинск	18
4645	Григорьевское (Пермский край)	18
4646	Губаха	18
4647	Деменево	18
4648	Дивья	18
4649	Добрянка	18
4650	Дуброво (Пермский край)	18
4651	Егва	18
4652	Екатерининское (Пермский край)	18
4653	Елово (Пермский край)	18
4654	Елпачиха	18
4655	Ергач	18
4656	Заполье	18
4657	Брюзли	18
4658	Зарубино (Пермский край)	18
4659	Звёздный (Пермский край)	18
4660	Зуевский	18
4661	Зуята	18
4662	Зюкайка	18
4663	Ильинский (Пермский край)	18
4664	Калинино (Пермский край)	18
4665	Калино	18
4666	Карагай (Пермский край)	18
4667	Карьево	18
4668	Карьер Известняк	18
4669	Касиб	18
4670	Керос	18
4671	Керчевский	18
4672	Кизел	18
4673	Кленовка (Пермский край)	18
4674	Комарихинский	18
4675	Комарово	18
4676	Комсомольский (Кунгурский район, Пермский край)	18
4677	Кондратово (Пермский край)	18
4678	Кордон	18
4679	Кормовище	18
4680	Коса (Пермский край)	18
4681	Кочёво	18
4682	Красновишерск	18
4683	Краснокамск	18
4684	Краснояр-1	18
4685	Красный Берег	18
4686	Красный Ясыл	18
4687	Крохалево	18
4688	Крылово	18
4689	Кудымкар	18
4690	Куеда	18
4691	Кукуштан	18
4692	Култаево	18
4693	Кунгур	18
4694	Купрос	18
4695	Курашим	18
4696	Кусье-Александровский	18
4697	Кыласово	18
4698	Кын	18
4699	Лобаново (Пермский край)	18
4700	Лысьва	18
4701	Лямино (Пермский край)	18
4702	Майкор	18
4703	Майский (Пермский край)	18
4704	Малый Ашап	18
4705	Мараты	18
4706	Марковский (Пермский край)	18
4707	Медведка	18
4708	Медянка	18
4709	Менделеево (Пермский край)	18
4710	Моховое	18
4711	Мулянка	18
4712	Насадка	18
4713	Нердва	18
4714	Нижние Муллы	18
4715	Нижний Лып	18
4716	Новоильинский (Пермский край)	18
4717	Новорождественское	18
4718	Новые Ляды	18
4719	Ножовка	18
4720	Ныроб	18
4721	Нытва	18
4722	Обвинск	18
4723	Оверята	18
4724	Октябрьский (Пермский край)	18
4725	Орда (Пермский край)	18
4726	Оса	18
4727	Осинцево	18
4728	Острожка	18
4729	Оханск	18
4730	Очер	18
4731	Ошиб	18
4732	Ошья	18
4733	Павловский	18
4734	Паль	18
4735	Пашия	18
4736	Перемское	18
4737	Пермь	18
4738	Пермякова	18
4739	Пешнигорт	18
4740	Платошино	18
4741	Пожва	18
4742	Полазна	18
4743	Половодово	18
4744	Посад	18
4745	Прикамский	18
4746	Пуксиб	18
4747	Путино	18
4748	Рождественск	18
4749	Рождественское (Пермский край)	18
4750	Романово (Пермский край)	18
4751	Русский Сарс	18
4752	Рябинино	18
4753	Рябки	18
4754	Самково	18
4755	Сараны	18
4756	Сараши	18
4757	Сарс	18
4758	Северный Колчим	18
4759	Северный Коммунар	18
4760	Северный Коспашский	18
4761	Сейва	18
4762	Сенькино	18
4763	Сепыч	18
4764	Серга	18
4765	Сергеевский	18
4766	Серебрянка	18
4767	Сива (Пермский край)	18
4768	Скальный	18
4769	Слудка	18
4770	Соликамск	18
4771	Спасо-Барда	18
4772	Сретенское	18
4773	Старый Шагирт	18
4774	Стряпунята	18
4775	Суда (Пермский край)	18
4776	Суксун	18
4777	Сылва (Пермский край)	18
4778	Таборы (Пермский край)	18
4779	Тауш	18
4780	Теплая	18
4781	Теплая Гора	18
4782	Тохтуева	18
4783	Троельга	18
4784	Трун	18
4785	Тюлькино	18
4786	Тюндюк	18
4787	Тюш	18
4788	Углеуральский	18
4789	Уинское	18
4790	Уральский (Пермский край)	18
4791	Уральское	18
4792	Усолье	18
4793	Усть-Качка	18
4794	Усть-Кишерть	18
4795	Усть-Турка	18
4796	Усть-Черная	18
4797	Усть-Язьва	18
4798	Усьва	18
4799	Ферма	18
4800	Филатово	18
4801	Фоки	18
4802	Харино	18
4803	Центральная усадьба 3-го Госконезавода	18
4804	Чазево	18
4805	Чайковская	18
4806	Чайковский	18
4807	Частые	18
4808	Чердынь	18
4809	Чермоз	18
4810	Черновское (Пермский край)	18
4811	Чернушка	18
4812	Чусовой	18
4813	Шадейка	18
4814	Шумихинский	18
4815	Щучье Озеро	18
4816	Юбилейный (Пермский край)	18
4817	Юг	18
4818	Юговское	18
4819	Юго-Камский	18
4820	Южный Коспашский	18
4821	Юксеево	18
4822	Юм	18
4823	Юрла	18
4824	Юсьва	18
4825	Яйва	18
4826	Абзаново	15
4827	Аблаево	15
4828	Авдон	15
4829	Агидель	15
4830	Аитово	15
4831	Аксаитово	15
4832	Аксаково	15
4833	Аксеново (Республика Башкортостан)	15
4834	Акъяр (Хайбуллинский район, Башкортостан)	15
4835	Алексеевка (Уфимский район, Башкортостан)	15
4836	Алкино-2	15
4837	Амзя (Нефтекамск, Башкортостан)	15
4838	Ангасяк	15
4839	Ариево	15
4840	Арка	15
4841	Артакуль	15
4842	Архангельское (Республика Башкортостан)	15
4843	Аскарово	15
4844	Аскино	15
4845	Асяново	15
4846	Байкалово	15
4847	Баймак	15
4848	Байназарово	15
4849	Бакалы	15
4850	Бала-Четырман	15
4851	Бедеева Поляна	15
4852	Белебей	15
4853	Белорецк	15
4854	Белянка	15
4855	Бижбуляк	15
4856	Бирск	15
4857	Благовещенск (Республика Башкортостан)	15
4858	Большая Ока	15
4859	Большеустьикинское	15
4860	Большой Куганак	15
4861	Бузатово	15
4862	Буздяк	15
4863	Бузовьязы	15
4864	Булгаково	15
4865	Бураево	15
4866	Бурибай	15
4867	Ваныш-Алпаутово	15
4868	Верхнетавлыкаево	15
4869	Верхнеяркеево	15
4870	Верхние Киги	15
4871	Верхние Татышлы	15
4872	Верхний Авзян	15
4873	Вознесенка (Республика Башкортостан)	15
4874	Волостновка	15
4875	Вперед	15
4876	Давлеканово	15
4877	Демский	15
4878	Дияшево	15
4879	Дмитриевка (Уфимский район, Башкортостан)	15
4880	Дуван	15
4881	Дурасово	15
4882	Дуслык	15
4883	Дюмеево	15
4884	Дюртюли	15
4885	Емаши	15
4886	Шафраново	15
4887	Ермекеево	15
4888	Ермолаево (Башкортостан)	15
4889	Ермолкино	15
4890	Ефремкино	15
4891	Зилаир	15
4892	Зильдярово	15
4893	Зирган	15
4894	Зириклы	15
4895	Иглино	15
4896	Идельбаково	15
4897	Ильино-Поляна	15
4898	Имянликулево	15
4899	Инзер	15
4900	Исанбаево	15
4901	Исимово	15
4902	Исмагилово	15
4903	Исмайлово	15
4904	Исянгулово	15
4905	Ишимбай	15
4906	Ишкарово	15
4907	Кабаково (Башкортостан)	15
4908	Кага	15
4909	Калинники	15
4910	Калмашбашево	15
4911	Калтасы (Калтасинский район, Башкортостан)	15
4912	Калтыманово	15
4913	Кальтовка	15
4914	Кальтяево	15
4915	Кананикольское	15
4916	Кандаковка	15
4917	Кандры	15
4918	Караидель	15
4919	Карамалы-Губеево	15
4920	Карача-Елга	15
4921	Карлыханово	15
4922	Кармаскалы	15
4923	Киргиз-Мияки	15
4924	Комсомольск (Республика Башкортостан)	15
4925	Копей-Кубово	15
4926	Корнеевка	15
4927	Кош-Елга	15
4928	Красная Башкирия	15
4929	Красная Горка (Нуримановский район, Башкортостан)	15
4930	Красноусольский	15
4931	Краснохолмский	15
4932	Красный Ключ (Республика Башкортостан)	15
4933	Красный Коммунар	15
4934	Кудеевский	15
4935	Кужанак	15
4936	Кумертау	15
4937	Кумово	15
4938	Курорта	15
4939	Кутерем	15
4940	Кушнаренково	15
4941	Куяново (Башкортостан)	15
4942	Лагерево	15
4943	Леуза	15
4944	Ломовка (Башкортостан)	15
4945	Магинск	15
4946	Макан	15
4947	Макарово	15
4948	Максютово	15
4949	Малояз	15
4950	Мариинский	15
4951	Матраево	15
4952	Маядык	15
4953	Маячный (Башкортостан)	15
4954	Межгорье (Республика Башкортостан)	15
4955	Мелеуз	15
4956	Месели	15
4957	Месягутово	15
4958	Метевбаш	15
4959	Метели	15
4960	Миловка	15
4961	Миндяк	15
4962	Михайловка (Абзелиловский район)	15
4963	Михайловка (Бижбуклякский район)	15
4964	Михайловка (Уфимский район, Башкортостан)	15
4965	Мишкино (Мишкинский район, Башкортостан)	15
4966	Миякитамак	15
4967	Москово	15
4968	Мраково	15
4969	Мраково (Кугарчинский район, Башкортостан)	15
4970	Мурсалимкино	15
4971	Нагаево	15
4972	Наумовка	15
4973	Нефтекамск	15
4974	Нигаматово	15
4975	Нижнебалтачево	15
4976	Нижнетроицкий	15
4977	Нижнечерекулево	15
4978	Нижние Бишинды	15
4979	Нижние Киги	15
4980	Никифарово	15
4981	Николаевка (Благовещенский район, Башкортостан)	15
4982	Николо-Березовка	15
4983	Новобалтачево	15
4984	Новобелокатай	15
4985	Новокутово	15
4986	Новомурапталово	15
4987	Новонагаево	15
4988	Новые Карьявды	15
4989	Новые Чебенки	15
4990	Новый Арта	15
4991	Нордовка	15
4992	Октябрьский (Республика Башкортостан)	15
4993	Осиновка	15
4994	Охлебинино	15
4995	Павловка	15
4996	Первомайский (Республика Башкортостан)	15
4997	Первомайское (Республика Башкортостан)	15
4998	Питяково	15
4999	Подольск (Республика Башкортостан)	15
5000	Прибельский	15
5001	Пришиб (Республика Башкортостан)	15
5002	Приютово	15
5003	Прогресс (Янаульский район, Башкортостан)	15
5004	Раевский (Альшеевский район)	15
5005	Рапатово	15
5006	Резяпово	15
5007	Рсаево	15
5008	Рухтино	15
5009	Рятамак	15
5010	Саитбаба	15
5011	Салават	15
5012	Село 1-е Туркменево	15
5013	Село Иткулово 1-е	15
5014	Село Центральной усадьбы племзавода имени Максима Горького	15
5015	Семилетка	15
5016	Серафимовский	15
5017	Серменево	15
5018	Сибай	15
5019	Сикияз	15
5020	Силантьево	15
5021	Спартак	15
5022	Староакбулатово	15
5023	Старобазаново	15
5024	Старобалтачево	15
5025	Старобаширово	15
5026	Старокалмашево	15
5027	Старокуктово	15
5028	Старокуручево	15
5029	Старосубхангулово	15
5030	Старотавларово	15
5031	Старые Богады	15
5032	Старые Туймазы	15
5033	Старый Курдым	15
5034	Стерлибашево	15
5035	Стерлитамак	15
5036	Субханкулово	15
5037	Суккулово	15
5038	Сухоречка	15
5039	Тавричанка (Республика Башкортостан)	15
5040	Тазларово	15
5041	Таймеево	15
5042	Тайняшево	15
5043	Тарказы	15
5044	Татар-Улканово	15
5045	Ташбулатово	15
5046	Ташкиново	15
5047	Темясово	15
5048	Тирлянский	15
5049	Толбазы	15
5050	Тубинский (Республика Башкортостан)	15
5051	Тузлукушево	15
5052	Туймазы	15
5053	Тукан	15
5054	Тюрюшля	15
5055	Тятер-Арасланово	15
5056	Узян	15
5057	Улукулево	15
5058	Улу-Теляк	15
5059	Ургаза	15
5060	Ургала	15
5061	Ургуш	15
5062	Урзайбаш	15
5063	Урман	15
5064	Урманаево	15
5065	Урметово	15
5066	Урняк (Республика Башкортостан)	15
5067	Усень-Ивановское	15
5068	Уфа	15
5069	Учалы	15
5070	Федоровка (Республика Башкортостан)	15
5071	Халилово	15
5072	Целинный	15
5073	Чекмагуш	15
5074	Чесноковка	15
5075	Чишмы	15
5076	Чураево	15
5077	Шаран	15
5078	Шингак-Куль	15
5079	Шулганово	15
5080	Юлдыбаево	15
5081	Юмагузино (Кугарчинский район, Башкортостан)	15
5082	Юматово	15
5083	Юмашево	15
5084	Юнусово	15
5085	Юсупово	15
5086	Языково	15
5087	Янаул	15
5088	Янгантау	15
5089	Янгельское	15
5090	Яныбаево	15
5091	Ярославка (Республика Башкортостан)	15
5092	Азанка	5
5093	Акбаш (Свердловская область)	5
5094	Алапаевск	5
5095	Арамиль	5
5096	Артемовский (Свердловская область)	5
5097	Арти	5
5098	Асбест	5
5099	Атиг	5
5100	Ачит	5
5101	Аятское	5
5102	Аять	5
5103	Байкалово (Свердловская область)	5
5104	Байны	5
5105	Балтым	5
5106	Бараба	5
5107	Баранникова	5
5108	Баранчинский	5
5109	Басмановское	5
5110	Басьяновский	5
5111	Белоярский (Свердловская область)	5
5112	Березовский (Свердловская область)	5
5113	Билимбай	5
5114	Бисерть	5
5115	Бобровский	5
5116	Богданович	5
5117	Большебрусянское	5
5118	Большой Исток	5
5119	Бруснятское	5
5120	Буланаш	5
5121	Бутка	5
5122	Быньги	5
5123	Валериановск	5
5124	Верхнее Дуброво	5
5125	Верх-Нейвинский	5
5126	Верхние Серги	5
5127	Верхний Тагил	5
5128	Верхняя Пышма	5
5129	Верхняя Салда	5
5130	Верхняя Синячиха	5
5131	Верхняя Сысерть	5
5132	Верхняя Тура	5
5133	Верховино	5
5134	Верхотурье	5
5135	Висим	5
5136	Волчанск (Свердловская область)	5
5137	Восточный	5
5138	Восточный (Свердловская область)	5
5139	Восход (Свердловская область)	5
5140	Гагарский	5
5141	Гари (Свердловская область)	5
5142	Гилёва (Белоярский городской округ)	5
5143	Глинское	5
5144	Голубковское	5
5145	Горноуральский	5
5146	Горный Щит	5
5147	Грязновское	5
5148	Двуреченск	5
5149	Дегтярск	5
5150	Дружинино	5
5151	Екатеринбург	5
5152	Нейво-Рудянка	5
5153	Еланский	5
5154	Ертарский	5
5155	Заводоуспенское	5
5156	Зайково (Свердловская область)	5
5157	Заречный (Свердловская область)	5
5158	Заря (муниципальное образование Алапаевское)	5
5159	Зыряновский	5
5160	Зюзельский	5
5161	Ивдель	5
5162	Илим	5
5163	Ирбит	5
5164	Ис	5
5165	Исеть	5
5166	Исток	5
5167	Калиновка (Байкаловский район)	5
5168	Калиново	5
5169	Калья	5
5170	Каменск-Уральский	5
5171	Камышлов	5
5172	Карпинск	5
5173	Качканар	5
5174	Кашино (Свердловская область)	5
5175	Квашнинское	5
5176	Кедровка (Свердловская область)	5
5177	Кедровое	5
5178	Килачевское	5
5179	Кировград	5
5180	Кировское (Свердловская область)	5
5181	Киселевка (Свердловская область)	5
5182	Кленовское	5
5183	Ключевск	5
5184	Колчедан	5
5185	Кольцово (Свердловская область)	5
5186	Колюткино	5
5187	Конево (Свердловская область)	5
5188	Коптелово	5
5189	Косой Брод	5
5190	Костино	5
5191	Косулино (Свердловская область)	5
5192	Красногвардейский (Артёмовский городской округ)	5
5193	Красноглинный	5
5194	Краснослободское	5
5195	Краснотурьинск	5
5196	Красноуральск	5
5197	Красноуфимск	5
5198	Криулино	5
5199	Крылатовский	5
5200	Кузино	5
5201	Кузнецовский	5
5202	Курорт Самоцвет	5
5203	Курьи	5
5204	Кушва	5
5205	Ларьковка	5
5206	Левиха	5
5207	Ленинский (Свердловская область)	5
5208	Лесной	5
5209	Лобва	5
5210	Лопатково	5
5211	Лосиный	5
5212	Луговской	5
5213	Малышева	5
5214	Маминское	5
5215	Манчаж	5
5216	Марамзино (Свердловская область)	5
5217	Марсяты	5
5218	Мартюш	5
5219	Махнево	5
5220	Михайловск (Свердловская область)	5
5221	Монетный	5
5222	Мурзинка	5
5223	Натальинск	5
5224	Невьянск	5
5225	Нейво-Шайтанский	5
5226	Некрасово (Свердловская область)	5
5227	Нижние Серги	5
5228	Нижний Катарач	5
5229	Нижний Тагил	5
5230	Нижняя Салда	5
5231	Нижняя Тура	5
5232	Николо-Павловское	5
5233	Ницинское	5
5234	Новая Ляля	5
5235	Новая Рассоха (Свердловская область)	5
5236	Новоалексеевское (Свердловская область)	5
5237	Новоасбест	5
5238	Новопышминское	5
5239	Новоуральск	5
5240	Новоуткинск	5
5241	Обуховское	5
5242	Октябрьский (Сысертский городской округ)	5
5243	Оус	5
5244	Павда	5
5245	Патруши (Свердловская область)	5
5246	Пелым	5
5247	Первомайский (Горноуральский городской округ)	5
5248	Первоуральск	5
5249	Петрокаменское	5
5250	Печеркино	5
5251	Пионерский (Свердловская область)	5
5252	Платоново (Свердловская область)	5
5253	Поварня (Свердловская область)	5
5254	Позариха	5
5255	Покровское (Артемовский район)	5
5256	Покровское (Свердловская область)	5
5257	Покровск-Уральский	5
5258	Полдневая	5
5259	Полеводство	5
5260	Полевской	5
5261	Половинный (городской округ Верхний Тагил)	5
5262	Полуночное	5
5263	Поташка	5
5264	Привокзальный (Свердловская область)	5
5265	Прохладный (Свердловская область)	5
5266	Пышма	5
5267	Ревда (Свердловская область)	5
5268	Реж	5
5269	Рефтинский	5
5270	Речкалова	5
5271	Решёты (Свердловская область)	5
5272	Рудничный (Свердловская область)	5
5273	Рудный (Свердловская область)	5
5274	Рудянское	5
5275	Сабик	5
5276	Сагра	5
5277	Садовый (Свердловская область)	5
5278	Сажино	5
5279	Сарана	5
5280	Сарга	5
5281	Свердловское (Свердловская область)	5
5282	Свободный (Свердловская область)	5
5283	Северка (Свердловская область)	5
5284	Североуральск	5
5285	Серов	5
5286	Сладковское	5
5287	Совхозный	5
5288	Сосьва	5
5289	Среднеуральск	5
5290	Средний Бугалыш	5
5291	Станционный-Полевской	5
5292	Старопышминск	5
5293	Староуткинск	5
5294	Сухой Лог	5
5295	Сысерть	5
5296	Таборы (Таборинский район)	5
5297	Таватуй	5
5298	Тавда	5
5299	Талица	5
5300	Тарасково	5
5301	Токарево (Свердловская область)	5
5302	Третий Северный	5
5303	Троицкий (Свердловская область)	5
5304	Трошково	5
5305	Тугулым	5
5306	Туринск	5
5307	Туринская Слобода	5
5308	Уралец	5
5309	Уральский (Свердловская область)	5
5310	Урмикеево	5
5311	Усть-Ницинское	5
5312	Уфимский (Свердловская область)	5
5313	Филатовское	5
5314	Филькино	5
5315	Цементный (Свердловская область)	5
5316	Черданцево	5
5317	Черемисское	5
5318	Черемухово	5
5319	Черновское (Свердловская область)	5
5320	Черноисточинск	5
5321	Шабровский	5
5322	Шайдурово (Свердловская область)	5
5323	Шаля	5
5324	Шамары (Свердловская область)	5
5325	Шиловка (Горноуральский городской округ)	5
5326	Шувакиш	5
5327	Щелкун	5
5328	Юшала	5
5329	Абатское	67
5330	Андреевский (Тюменская область)	67
5331	Антипино	67
5332	Армизонское	67
5333	Аромашево	67
5334	Бердюжье	67
5335	Богандинский	67
5336	Большое	67
5337	Большое Сорокино	67
5338	Боровлянка (Тюменская область)	67
5339	Боровский	67
5340	Буньково	67
5341	Вагай	67
5342	Викулово	67
5343	Винзили	67
5344	Гладилово	67
5345	Голышманово	67
5346	Демьянка (Тюменская область)	67
5347	Емуртла	67
5348	Заводоуковск	67
5349	Исетское	67
5350	Ишим	67
5351	Казанское	67
5352	Каскара	67
5353	Майский (Тюменская область)	67
5354	Малышенка	67
5355	Мальково	67
5356	Масали	67
5357	Маслянский	67
5358	Мелиораторов (Тюменская область)	67
5359	Минино	67
5360	Московский (Тюменская область)	67
5361	Нижняя Тавда	67
5362	Новая Заимка	67
5363	Новоселезнево	67
5364	Новотарманский	67
5365	Октябрьский (Тюменская область)	67
5366	Омутинское	67
5367	Онохино	67
5368	Падун	67
5369	Петелино (Тюменская область)	67
5370	Пятково	67
5371	Ражево	67
5372	Северо-Плетнево	67
5373	Сеяха (Тюменская область)	67
5374	Сладково	67
5375	Суерка	67
5376	Сумкино (Тюменская область)	67
5377	Тарманы	67
5378	Тобольск	67
5379	Туртас	67
5380	Тюмень	67
5381	Уват	67
5382	Уват (Тюменская область)	67
5383	Упорово	67
5384	Успенка	67
5385	Червишево	67
5386	Шорохово	67
5387	Юргинское	67
5388	Ялуторовск	67
5389	Демьянское	67
5390	Ярково (Тюменская область)	67
5391	Агириш	68
5392	Алтай (Ханты-Мансийский АО - Югра)	68
5393	Алябьевский	68
5394	Андра	68
5395	Барсово	68
5396	Белоярский	68
5397	Белый Яр (Ханты-Мансийский АО)	68
5398	Берёзово	68
5399	Болчары	68
5400	Верхнеказымский	68
5401	Высокий	68
5402	Высокий Мыс	68
5403	Горноправдинск	68
5404	Зеленоборск	68
5405	Игрим	68
5406	Излучинск	68
5407	Казым	68
5408	Каркатеевы	68
5409	Карымкары	68
5410	Когалым	68
5411	Коммунистический	68
5412	Кондинское	68
5413	Красноленинский	68
5414	Куминский	68
5415	Куть-Ях	68
5416	Лангепас	68
5417	Ларьяк	68
5418	Локосово	68
5419	Луговой	68
5420	Лыхма	68
5421	Лямина	68
5422	Лянтор	68
5423	Малиновский	68
5424	Малый Атлым	68
5425	Мегион	68
5426	Междуреченский (Ханты-Мансийский АО)	68
5427	Мортка	68
5428	Нефтеюганск	68
5429	Нижневартовск	68
5430	Нижнесортымский	68
5431	Новоаганск	68
5432	Нягань	68
5433	Нялинское	68
5434	Октябрьское (Ханты-Мансийский АО)	68
5435	Перегребное	68
5436	Пионерский (Ханты-Мансийский АО)	68
5437	Пойковский	68
5438	Покачи	68
5439	Полноват	68
5440	Половинка	68
5441	Приобье	68
5442	Приполярный	68
5443	Пыть-Ях	68
5444	Радужный (Ханты-Мансийский АО - Югра)	68
5445	Русскинская	68
5446	Салым	68
5447	Саранпауль	68
5448	Сентябрьский	68
5449	Сергино	68
5450	Советский (Ханты-Мансийский АО)	68
5451	Сорум	68
5452	Солнечный (Ханты-Мансийский АО)	68
5453	Сургут	68
5454	Сытомино	68
5455	Таёжный	68
5456	Талинка	68
5457	Угут	68
5458	Ульт-Ягун	68
5459	Унъюган	68
5460	Урай	68
5461	Усть-Юган	68
5462	Федоровский	68
5463	Ханты-Мансийск	68
5464	Хулимсунт	68
5465	Цингалы	68
5466	Чантырья	68
5467	Шеркалы	68
5468	Шугур	68
5469	Югорск	68
5470	Юмас	68
5471	Агаповка	11
5472	Айлино	11
5473	Алабуга (Челябинская область)	11
5474	Аргаяш	11
5475	Аша	11
5476	Багаряк	11
5477	Байрамгулово	11
5478	Бакал	11
5479	Белоносово	11
5480	Бердяуш	11
5481	Береговой	11
5482	Бобровка (Челябинская область)	11
5483	Богдановское	11
5484	Большой Куяш	11
5485	Бреды	11
5486	Бродокалмак	11
5487	Варламово	11
5488	Варна (Челябинская область)	11
5489	Варшавка	11
5490	Вахрушево (Челябинская область)	11
5491	Великопетровка	11
5492	Верхнеуральск	11
5493	Верхний Уфалей	11
5494	Вишневогорск	11
5495	Гранитный	11
5496	Григорьевка (Челябинская область)	11
5497	Долгодеревенское	11
5498	Еманжелинка	11
5499	Еманжелинск	11
5500	Есаульский	11
5501	Еткуль	11
5502	Заозерное (Челябинская область)	11
5503	Зауральский	11
5504	Златоуст	11
5505	Измайловский	11
5506	Канашево	11
5507	Карабаш (Челябинская область)	11
5508	Карагайский	11
5509	Каратабан	11
5510	Карталы	11
5511	Касли	11
5512	Катав-Ивановск	11
5513	Кидыш	11
5514	Кизильское	11
5515	Кичигино	11
5516	Ключи	11
5517	Коелга	11
5518	Копейск	11
5519	Коркино	11
5520	Краснинский	11
5521	Красногорский (Челябинская область)	11
5522	Кременкуль	11
5523	Кропачево (Челябинская область)	11
5524	Кузнецкое	11
5525	Кулевчи	11
5526	Кулуево	11
5527	Кунашак	11
5528	Куса	11
5529	Кыштым	11
5530	Лазурный	11
5531	Боровое	11
5532	Ларино	11
5533	Локомотивный (Челябинская область)	11
5534	Магнитка (Кусинский район)	11
5535	Магнитогорск	11
5536	Межевой (Саткинский район)	11
5537	Межозёрный (Челябинская область)	11
5538	Метлино	11
5539	Миасс	11
5540	Миасское	11
5541	Миньяр	11
5542	Мирный (Челябинская область)	11
5543	Нагайбакский	11
5544	Нижний Уфалей	11
5545	Новобурино	11
5546	Новогорный	11
5547	Новосинеглазово	11
5548	Новый Кременкуль	11
5549	Нязепетровск	11
5550	Обручевка	11
5551	Огневское	11
5552	Озерск (Челябинская область)	11
5553	Октябрьский (Челябинская область)	11
5554	Октябрьское (Челябинская область)	11
5555	Остроленский	11
5556	Париж	11
5557	Первомайский (Коркинский район)	11
5558	Петропавловский	11
5559	Писклово	11
5560	Пласт	11
5561	Подовинное	11
5562	Полетаево-1	11
5563	Полетаево (Челябинская область)	11
5564	Полоцкое	11
5565	Путь Октября	11
5566	Родники (Челябинская область)	11
5567	Рождественка	11
5568	Роза (Челябинская область)	11
5569	Рощино (Челябинская область)	11
5570	Сатка	11
5571	Селезян	11
5572	Серпиевка	11
5573	Сим	11
5574	Снежинск	11
5575	Спасский	11
5576	Сулея	11
5577	Сыртинский	11
5578	Тимирязевский (Челябинская область)	11
5579	Травники	11
5580	Трехгорный	11
5581	Троицк (Челябинская область)	11
5582	Тургояк	11
5583	Тюбук	11
5584	Увельский	11
5585	Уйское (Челябинская область)	11
5586	Ункурда	11
5587	Усть-Катав	11
5588	Фершампенуаз (Челябинская область)	11
5589	Филимоново (Челябинская область)	11
5590	Чебаркуль	11
5591	Челябинск	11
5592	Черемшанка (Челябинская область)	11
5593	Чесма	11
5594	Шабурово	11
5595	Щербаковка	11
5596	Южноуральск	11
5597	Южный (Челябинская область)	11
5598	Юрюзань	11
5599	Аксарка	69
5600	Антипаюта	69
5601	Бованенково	69
5602	Вынгапуровский	69
5603	Газ-Сале	69
5604	Горки (Ямало-Ненецкий АО)	69
5605	Губкинский	69
5606	Гыда	69
5607	Заполярный (Ямало-Ненецкий АО)	69
5608	Искателей	69
5609	Коротчаево	69
5610	Красноселькуп	69
5611	Лабытнанги	69
5612	Лонгъюган	69
5613	Мужи	69
5614	Муравленко	69
5615	Мыс Каменный	69
5616	Надым	69
5617	Новый Порт	69
5618	Новый Уренгой	69
5619	Ноябрьск	69
5620	Ныда	69
5621	Овгорт	69
5622	Ома (Ямало-Ненецкий АО)	69
5623	Панаевск	69
5624	Пангоды	69
5625	Правохеттинский	69
5626	Приозёрный	69
5627	Пуровск	69
5628	Пурпе	69
5629	Пурпе-1	69
5630	Сабетта (Ямало-Ненецкий АО)	69
5631	Салемал	69
5632	Салехард	69
5633	Самбург	69
5634	Сёяха	69
5635	Сывдарма	69
5636	Тазовский	69
5637	Тарко-Сале	69
5638	Уренгой	69
5639	Халясавэй	69
5640	Ханымей	69
5641	Харп	69
5642	Харута	69
5643	Ямбург (Ямало-Ненецкий АО)	69
5644	Яр-Сале	69
5645	Толька	69
5646	Александровская (Кабардино-Балкарская республика)	70
5647	Алтуд	70
5648	Анзорей	70
5649	Аргудан	70
5650	Аушигер	70
5651	Бабугент	70
5652	Баксан	70
5653	Баксаненок	70
5654	Верхняя Балкария	70
5655	Дыгулыбгей	70
5656	Екатериноградская	70
5657	Жемтала	70
5658	Залукокоаже	70
5659	Заюково	70
5660	Исламей	70
5661	Каменка (Кабардино-Балкария)	70
5662	Каменомостское	70
5663	Карагач (Кабардино-Балкария)	70
5664	Кашхатау	70
5665	Кенделен	70
5666	Кенже	70
5667	Кишпек	70
5668	Котляревская	70
5669	Кременчуг-Константиновское	70
5670	Куба (Кабардино-Балкария)	70
5671	Майский	70
5672	Малка	70
5673	Нальчик	70
5674	Нартан	70
5675	Нарткала	70
5676	Нижний Чегем	70
5677	Ново-Ивановское	70
5678	Пролетарское	70
5679	Прохладный	70
5680	Сармаково	70
5681	Солдатская	70
5682	Терек	70
5683	Терскол	70
5684	Тырныауз	70
5685	Хасанья	70
5686	Чегем	70
5687	Чегем Второй	70
5688	Шалушка	70
5689	Эльбрус (Кабардино-Балкария)	70
5690	Яникой	70
5691	Прималкинское	70
5692	Адыге-Хабль	71
5693	Али-Бердуковский	71
5694	Зеленчукская	71
5695	Икон-Халк	71
5696	Исправная	71
5697	Кавказский	71
5698	Карачаевск	71
5699	Кардоникская	71
5700	Красный Курган (Карачаево-Черкесия)	71
5701	Кумыш	71
5702	Курджиново	71
5703	Медногорский	71
5704	Орджоникидзевский	71
5705	Первомайское (Карачаево-Черкесия)	71
5706	Преградная	71
5707	Псыж	71
5708	Сары-Тюз	71
5709	Сторожевая (Карачаево-Черкесия)	71
5710	Теберда	71
5711	Терезе	71
5712	Усть-Джегута	71
5713	Учкекен	71
5714	Хабез	71
5715	Чапаевское (Карачаево-Черкесия)	71
5716	Черкесск	71
5717	Эркен-Шахар	71
5718	Домбай	71
5719	Абинск	12
5720	Абрау-Дюрсо	12
5721	Агой	12
5722	Агроном (Краснодарский край)	12
5723	Агуй-Шапсуг	12
5724	Адагум	12
5725	Адлер	12
5726	Азовская	12
5727	Александровская (Краснодарский край)	12
5728	Александровский	12
5729	Алексеевская (Краснодарский край)	12
5730	Алексеевский	12
5731	Алексее-Тенгинская	12
5732	Анапа	12
5733	Анапская	12
5734	Анастасиевская	12
5735	Андрее-Дмитриевская	12
5736	Андрюки	12
5737	Апшеронск	12
5738	Армавир	12
5739	Архангельская	12
5740	Архипо-Осиповка	12
5741	Атаманская	12
5742	Афипский	12
5743	Ахметовская	12
5744	Ахтанизовская	12
5745	Ахтарский	12
5746	Ахтырский	12
5747	Ачуево	12
5748	Баговская	12
5749	Бакинская	12
5750	Бараниковский	12
5751	Батуринская	12
5752	Беднягина	12
5753	Безлесный	12
5754	Бейсуг	12
5755	Бейсужек Второй	12
5756	Белая Глина	12
5757	Белозерный	12
5758	Белореченск	12
5759	Беноково	12
5760	Березанская	12
5761	Берёзовый (Краснодарский край)	12
5762	Бесленеевская	12
5763	Бесскорбная	12
5764	Бетта	12
5765	Бичевой	12
5766	Благовещенская	12
5767	Благодарное	12
5768	Бойкопонура	12
5769	Болгов	12
5770	Большой Бейсуг	12
5771	Братский	12
5772	Бриньковская	12
5773	Брюховецкая	12
5774	Брюховецкая станица	12
5775	Бузиновская	12
5776	Ванновское	12
5777	Варениковская	12
5778	Васюринская	12
5779	Новопашковская	12
5780	Великовечное	12
5781	Венцы (Краснодарский край)	12
5782	Верхнебаканский	12
5783	Веселая	12
5784	Веселовка (Краснодарский край)	12
5785	Весёлое (Краснодарский край)	12
5786	Виноградный (Крымский район)	12
5787	Виноградный (муниципальное образование город-курорт Анапа)	12
5788	Виноградный (Темрюкский район)	12
5789	Витязево	12
5790	Владимирская (Краснодарский край)	12
5791	Водный	12
5792	Воздвиженская	12
5793	Вознесенская (Краснодарский край)	12
5794	Воронежская (Краснодарский край)	12
5795	Восточная	12
5796	Восход (Краснодарский край)	12
5797	Выселки	12
5798	Высокое (Краснодарский край)	12
5799	Вышестеблиевская	12
5800	Газырь	12
5801	Гайдук	12
5802	Гайкодзор	12
5803	Галицын	12
5804	Геленджик	12
5805	Гирей	12
5806	Глафировка	12
5926	Нижнебаканская	12
5807	Глебовка (Краснодарский край)	12
5808	Глубокий (Краснодарский край)	12
5809	Головинка	12
5810	Голубицкая	12
5811	Горное Лоо	12
5812	Горькая Балка	12
5813	Горячий Ключ	12
5814	Гостагаевская	12
5815	Гражданский	12
5816	Гречанная Балка	12
5817	Гривенская	12
5818	Гришковское	12
5819	Губская	12
5820	Гулькевичи	12
5821	Дагомыс	12
5822	Двубратский	12
5823	Джигинка	12
5824	Джубга	12
5825	Джумайловка	12
5826	Дивноморское	12
5827	Динская станица	12
5828	Дмитриевская (Краснодарский край)	12
5829	Днепровская	12
5830	Должанская	12
5831	Дядьковская	12
5832	Ейск	12
5833	Ейское Укрепление	12
5834	Екатериновка (Краснодарский край)	12
5835	Елизаветинская	12
5836	Еремизино-Борисовская	12
5837	Железный	12
5838	Заветный	12
5839	Запорожская	12
5840	Заря (Краснодарский край)	12
5841	Зассовская	12
5842	Ивановская	12
5843	Ильинская	12
5844	Ильич	12
5845	Ильский	12
5846	Индустриальный (Краснодарский край)	12
5847	Ирклиевская	12
5848	Кабардинка	12
5849	Кавказская	12
5850	Казанская	12
5851	Каладжинская	12
5852	Калининская	12
5853	Калниболотская	12
5854	Калужская (Краснодарский край)	12
5855	Камышеватская	12
5856	Каневская	12
5857	Канеловская	12
5858	Киевское (Краснодарский край)	12
5859	Кирпильская	12
5860	Кисляковская	12
5861	Ковалевское (Краснодарский край)	12
5862	Комсомольский (Краснодарский край)	12
5863	Коноково	12
5864	Константиновская (Краснодарский край)	12
5865	Копанская	12
5866	Кореновск	12
5867	Коржевский (Славянский район)	12
5868	Коржи	12
5869	Костромская	12
5870	Красная Поляна	12
5871	Краснодар	12
5872	Красное (Краснодарский край)	12
5873	Красносельский (Краснодарский край)	12
5874	Красносельское	12
5875	Кропоткин	12
5876	Крыловская станица (Крыловский район)	12
5877	Крыловская станица (Ленинградский район)	12
5878	Крымск	12
5879	Кубанская	12
5880	Кубанская степь	12
5881	Кубанский (Новопокровский район)	12
5882	Кубань	12
5883	Кугоейская	12
5884	Куликовский	12
5885	Курганинск	12
5886	Курчанская	12
5887	Кутаис	12
5888	Кучугуры	12
5889	Кущевская	12
5890	Кущевская станица	12
5891	Лабинск	12
5892	Ладожская	12
5893	Лазаревское	12
5894	Лебеди	12
5895	Ленина (Краснодарский край)	12
5896	Ленинградская станица	12
5897	Ленинский (Краснодарский край)	12
5898	Лоо	12
5899	Лосево (Краснодарский край)	12
5900	Львовское	12
5901	Ляпино (Краснодарский край)	12
5902	Майкопское	12
5903	Малокубанский	12
5904	Мартанская	12
5905	Марьино	12
5906	Марьинский	12
5907	Марьянская	12
5908	Махошевская	12
5909	Медведовская	12
5910	Меклета	12
5911	Мерчанское	12
5912	Мингрельская	12
5913	Мирской (Кавказский район)	12
5914	Михайловская	12
5915	Молдаванское	12
5916	Молодёжный	12
5917	Мостовской	12
5918	Мысхако	12
5919	Надеждино	12
5920	Надежная	12
5921	Натухаевская	12
5922	Небуг	12
5923	Незамаевская	12
5924	Некрасовская	12
5925	Нефтегорск (Краснодарский край)	12
5927	Нижняя Шиловка	12
5928	Николенское	12
5929	Новоалексеевская	12
5930	Новоалексеевское (Краснодарский край)	12
5931	Новобейсугская	12
5932	Ново-Березанский	12
5933	Нововеличковская	12
5934	Нововладимировская	12
5935	Новодеревянковская	12
5936	Новоджерелиевская	12
5937	Новодмитриевская	12
5938	Новоивановская	12
5939	Новокорсунская	12
5940	Новокубанск	12
5941	Новолабинская	12
5942	Новолеушковская	12
5943	Новолокинская	12
5944	Новомалороссийская	12
5945	Новоминская	12
5946	Новомихайловский	12
5947	Новомышастовская	12
5948	Новониколаевская (Краснодарский край)	12
5949	Новопластуновская	12
5950	Новоплатнировская	12
5951	Новопокровская	12
5952	Новопокровский	12
5953	Новорождественская	12
5954	Новороссийск	12
5955	Новосергиевская	12
5956	Новотитаровская	12
5957	Новоукраинское	12
5958	Новощербиновская	12
5959	Образцовый	12
5960	Октябрьская (Крыловский район,Краснодарский край)	12
5961	Октябрьский (Ейский район)	12
5962	Октябрьский (Красноармейский район, Краснодарский край)	12
5963	Октябрьский (Курганинский район)	12
5964	Октябрьский (Ленинградский район)	12
5965	Октябрьский (Павловский район)	12
5966	Ольгинская	12
5967	Ольгинский	12
5968	Орел-Изумруд (Краснодарский край)	12
5969	Отрадная	12
5970	Отрадо-Кубанское	12
5971	Отрадо-Ольгинское	12
5972	Павловская	12
5973	Павловский (Краснодарский край)	12
5974	Парковый	12
5975	Первая Синюха	12
5976	Первомайский (Горячий Ключ)	12
5977	Первомайский (Краснодарский край)	12
5978	Первомайский (Кущевский район)	12
5979	Первомайский (Ленинградский район)	12
5980	Первореченское	12
5981	Передовая (Краснодарский край)	12
5982	Переправная	12
5983	Переясловская	12
5984	Песчаный (Краснодарский край)	12
5985	Петровская	12
5986	Петропавловская (Краснодарский край)	12
5987	Пластуновская	12
5988	Платнировская	12
5989	Плоская	12
5990	Подгорная	12
5991	Полтавская	12
5992	Попутная	12
5993	Поселок имени Максима Горького	12
5994	Поселок Южный (Усть-Лабинский район)	12
5995	Приазовская	12
5996	Привольная (Краснодарский край)	12
5997	Придорожная	12
5998	Прикубанский	12
5999	Приморско-Ахтарск	12
6000	Приреченский	12
6001	Прогресс (Краснодарский край)	12
6002	Протичка	12
6003	Прочноокопская	12
6004	Псебай	12
6005	Пшада	12
6006	Пшехская	12
6007	Раевская	12
6008	Раздольная (Краснодарский край)	12
6009	Рисовый	12
6010	Роговская	12
6011	Родниковская	12
6012	Роте-Фане	12
6013	Рязанская	12
6014	Саратовская	12
6015	Саукдере	12
6016	Светлогорское	12
6017	Светлый Путь	12
6018	Северин	12
6019	Северо-Енисейский	12
6020	Северская станица	12
6021	Сенной (Краснодарский край)	12
6022	Сириус	12
6023	Славянск-на-Кубани	12
6024	Сладкий	12
6025	Смоленская	12
6026	Советская	12
6027	Советский (Ейский район)	12
6028	Советский (Тимашевский район)	12
6029	Совхозный (Краснодарский край)	12
6030	Соколовское (Краснодарский край)	12
6031	Сочи	12
6032	Спокойная	12
6033	Средний Челбас	12
6034	Ставропольская	12
6035	Старая Станица (Краснодарский край)	12
6036	Старовеличковская	12
6037	Стародеревянковская	12
6038	Староджерелиевская	12
6039	Старокорсунская	12
6040	Старолеушковская	12
6041	Староминская	12
6042	Старомышастовская	12
6043	Старонижестеблиевская	12
6044	Старотитаровская	12
6045	Старощербиновская	12
6046	Степная	12
6047	Стрелка	12
6048	Суворовское	12
6049	Сукко	12
6050	Супсех	12
6051	Су-Псех	12
6052	Таманский	12
6053	Тамань	12
6054	Танцура Крамаренко	12
6055	Тбилисская	12
6056	Тверская	12
6057	Темижбекская	12
6058	Темиргоевская	12
6059	Темрюк	12
6060	Тенгинка	12
6061	Тенгинская	12
6062	Терновская	12
6063	Тимашевск	12
6064	Тихорецк	12
6065	Трехсельское	12
6066	Троицкая	12
6067	Трудобеликовский	12
6068	Туапсе	12
6069	Тюменский	12
6070	Убеженская	12
6071	Удобная	12
6072	Уманский	12
6073	Унароково	12
6074	Упорная	12
6075	Урупский (Отрадненский район)	12
6076	Урупский (Успенский район)	12
6077	Успенская	12
6078	Успенское (Краснодарский край)	12
6079	Усть-Лабинск	12
6080	Фастовецкая	12
6081	Федоровская	12
6082	Фонталовская	12
6083	Хадыженск	12
6084	Холмская	12
6085	Хоперская	12
6086	Хутор Южный (Курганинский район)	12
6087	Цибанобалка	12
6088	Чамлыкская	12
6089	Чебургольская	12
6090	Челбасская	12
6091	Чепигинская	12
6092	Черниговское	12
6093	Черноерковская	12
6094	Черноморский	12
6095	Чернореченская	12
6096	Черный Ерик	12
6097	Шабельское	12
6098	Шедок	12
6099	Шепси	12
6100	Широчанка	12
6101	Шкуринская	12
6102	Щербиновский	12
6103	Эстосадок	12
6104	Юбилейный (Краснодарский край)	12
6105	Южный (Краснодарский край)	12
6106	Юровка (Краснодарский край)	12
6107	Ярославская	12
6108	Ясенская	12
6109	Абадзехская	72
6110	Адыгейск	72
6111	Белое (Адыгея)	72
6112	Блечепсин	72
6113	Вольное (Адыгея)	72
6114	Гиагинская	72
6115	Даховская	72
6116	Дмитриевский	72
6117	Дондуковская	72
6118	Дукмасов	72
6119	Еленовское	72
6120	Зарево	72
6121	Каменномостский	72
6122	Келермесская	72
6123	Кошехабль	72
6124	Красногвардейское (Адыгея)	72
6125	Краснооктябрьский (Адыгея)	72
6126	Кужорская	72
6127	Курджипская	72
6128	Майкоп	72
6129	Натырбово	72
6130	Новая Адыгея	72
6131	Новосвободная	72
6132	Первомайский (Республика Адыгея)	72
6133	Понежукай	72
6134	Прогресс (Республика Адыгея)	72
6135	Пшичо	72
6136	Северо-Восточные Сады	72
6137	Табачный	72
6138	Тамбовский (Республика Адыгея)	72
6139	Тахтамукай	72
6140	Тимирязева	72
6141	Тлюстенхабль	72
6142	Тульский (Адыгея)	72
6143	Уляп	72
6144	Хакуринохабль	72
6145	Ханская	72
6146	Хатукай	72
6147	Ходзь	72
6148	Энем	72
6149	Яблоновский (Республика Адыгея)	72
6150	Большесидоровское	72
6151	Аксай (Дагестан)	73
6152	Акуша	73
6153	Альбурикент	73
6154	Анди	73
6155	Ансалта	73
6156	Ахты	73
6157	Бабаюрт	73
6158	Батаюрт	73
6159	Белиджи	73
6160	Ботлих	73
6161	Буйнакск	73
6162	Верхнее Казанище	73
6163	Геджух	73
6164	Гергебиль	73
6165	Губден	73
6166	Дагестанские Огни	73
6167	Дербент	73
6168	Дубки (Дагестан)	73
6169	Дылым	73
6170	Зубутли-Миатли	73
6171	Избербаш	73
6172	Кака-Шура	73
6173	Карабудахкент	73
6174	Каспийск	73
6175	Касумкент	73
6176	Каякент	73
6177	Кизилюрт	73
6178	Кизляр	73
6179	Комсомольское (Дагестан)	73
6180	Коркмаскала	73
6181	Кочубей (Дагестан)	73
6182	Куруш (Хасавюртовский район)	73
6183	Кяхулай	73
6184	Леваши (Дагестан)	73
6185	Ленинкент (Махачкала)	73
6186	Магарамкент	73
6187	Маджалис	73
6188	Мамедкала	73
6189	Манас	73
6190	Манаскент	73
6191	Махачкала	73
6192	Нечаевка (Дагестан)	73
6193	Нижнее Казанище	73
6194	Нижний Дженгутай	73
6195	Новая Мака	73
6196	Новокаякент	73
6197	Новолакское	73
6198	Новый Кяхулай	73
6199	Новый Сулак	73
6200	Новый Хушет	73
6201	Новый Чиркей	73
6202	Первомайское (Хасавюртовский район)	73
6203	Семендер	73
6204	Сергокала	73
6205	Сулак (Дагестан)	73
6206	Тарки	73
6207	Тарумовка	73
6208	Терекли-Мектеб	73
6209	Тюбе	73
6210	Усиша	73
6211	Арани	73
6212	Хасавюрт	73
6213	Хунзах	73
6214	Чонтаул	73
6215	Шамилькала	73
6216	Шамхал-Термен	73
6217	Южно-Сухокумск	73
6218	Али-Юрт	74
6219	Барсуки (Ингушетия)	74
6220	Верхние Ачалуки	74
6221	Галашки	74
6222	Долаково	74
6223	Инарки	74
6224	Кантышево	74
6225	Карабулак	74
6226	Магас	74
6227	Малгобек	74
6228	Назрань	74
6229	Нестеровская (Ингушетия)	74
6230	Плиево	74
6231	Сагопши	74
6232	Сунжа (Ингушетия)	74
6233	Сурхахи	74
6234	Троицкая (Ингушетия)	74
6235	Экажево	74
6236	Яндаре	74
6237	Алагир	75
6238	Ардон	75
6239	Архонская	75
6240	Беслан	75
6241	Владикавказ	75
6242	Гизель	75
6243	Дигора	75
6244	Заводской (Северная Осетия)	75
6245	Змейская	75
6246	Ир	75
6247	Камбилеевское	75
6248	Карджин	75
6249	Кизляр (Северная Осетия)	75
6250	Луковская (Северная Осетия)	75
6251	Майское (Северная Осетия)	75
6252	Михайловское (Северная Осетия)	75
6253	Моздок	75
6254	Ногир	75
6255	Октябрьское (Пригородный район)	75
6256	Ольгинское (Северная Осетия)	75
6257	Павлодольская	75
6258	Раздольное (Республика Северная Осетия-Алания)	75
6259	Сунжа (Северная Осетия)	75
6260	Тарское	75
6261	Терская	75
6262	Троицкое (Северная Осетия)	75
6263	Хумалаг	75
6264	Чермен	75
6265	Чикола	75
6266	Эльхотово	75
6267	Притеречный	75
6268	Александрийская	76
6269	Александрия (Ставропольский край)	76
6270	Александровское (Ставропольский край)	76
6271	Анджиевский	76
6272	Апанасенковское	76
6273	Арзгир	76
6274	Архангельское (Ставропольский край)	76
6275	Ачикулак	76
6276	Балахоновское	76
6277	Балтийский	76
6278	Барсуковская	76
6279	Безопасное	76
6280	Бекешевская	76
6281	Беломечётская	76
6282	Бешпагир	76
6283	Благодарный	76
6284	Благодатное	76
6285	Большая Джалга	76
6286	Боргустанская	76
6287	Буденновск	76
6288	Бурлацкое (Ставропольский край)	76
6289	Бурукшун	76
6290	Величаевское	76
6291	Верхнерусское	76
6292	Верхнестепной	76
6293	Винсады	76
6294	Вин-Сады	76
6295	Владимировка	76
6296	Водораздел	76
6297	Воздвиженское (Ставропольский край)	76
6298	Вознесеновское	76
6299	Воровсколесская	76
6300	Вревское	76
6301	Высоцкое (Ставропольский край)	76
6302	Галюгаевская	76
6303	Георгиевск	76
6304	Георгиевская	76
6305	Горнозаводское	76
6306	Горькая  Балка	76
6307	Горьковский (Ставропольский край)	76
6308	Горячеводский	76
6309	Гофицкое (Ставропольский край)	76
6310	Гражданское (Ставропольский край)	76
6311	Графский	76
6312	Грачевка	76
6313	Григорополисская	76
6314	Грушевское	76
6315	Девица (Ставропольский край)	76
6316	Демино (Ставропольский край)	76
6317	Дербетовка	76
6318	Дивное (Ставропольский край)	76
6319	Дмитриевское (Ставропольский край)	76
6320	Донская Балка	76
6321	Донское (Ставропольский край)	76
6322	Елизаветинское (Ставропольский край)	76
6323	Ессентуки	76
6324	Ессентукская	76
6325	Железноводск	76
6326	Журавское	76
6327	Заветное (Ставропольский край)	76
6328	Тахта (Ставропольский край)	76
6329	Затеречный	76
6330	Зеленокумск	76
6331	Зимняя Ставка	76
6332	Золотаревка (Ставропольский край)	76
6333	Зольская	76
6334	Зункарь	76
6335	Ивановское (Ставропольский край)	76
6336	Изобильный	76
6337	Иноземцево	76
6338	Ипатово	76
6339	Иргаклы	76
6340	Казгулак	76
6341	Казинка (Андроповский район)	76
6342	Казинка (Шпаковский район)	76
6343	Казьминское	76
6344	Калиновское	76
6345	Камбулат	76
6346	Каменная Балка (Арзгирский район)	76
6347	Каменная балка (Благодарненский район)	76
6348	Каменнобродская	76
6349	Канглы (Ставропольский край)	76
6350	Кара-Тюбе	76
6351	Кармалиновская	76
6352	Каясула	76
6353	Кевсала	76
6354	Кендже-Кулак	76
6355	Киевка	76
6356	Кисловодск	76
6357	Китаевское	76
6358	Коммаяк	76
6359	Комсомолец (Ставропольский край)	76
6360	Константиновская	76
6361	Константиновское	76
6362	Кочубеевское	76
6363	Красногвардейское (Ставропольский край)	76
6364	Красное (Ставропольский край)	76
6365	Краснозоринский	76
6366	Краснокумское	76
6367	Красночервонный	76
6368	Красноярское	76
6369	Красный Маныч	76
6370	Красный Пахарь (Ставропольский край)	76
6371	Красочный	76
6372	Круглолесское	76
6373	Крымгиреевское	76
6374	Крым-Гиреевское	76
6375	Кугульта (Ставропольский край)	76
6376	Кумская Долина	76
6377	Курсавка	76
6378	Курская (Ставропольский край)	76
6379	Куршава	76
6380	Кучерла	76
6381	Ладовская Балка	76
6382	Левокумка	76
6383	Левокумское	76
6384	Лермонтов	76
6385	Летняя Ставка	76
6386	Лысогорская	76
6387	Малая Джалга	76
6388	Малые Ягуры	76
6389	Манычское	76
6390	Марьинская (Ставропольский край)	76
6391	Марьины Колодцы	76
6392	Минеральные Воды	76
6393	Мирный (Ставропольский край)	76
6394	Михайловск (Ставропольский край)	76
6395	Московское (Ставропольский край)	76
6396	Нагутское	76
6397	Надежда (Ставропольский край)	76
6398	Невинномысск	76
6399	Нежинский (Ставропольский край)	76
6400	Незлобная	76
6401	Нефтекумск	76
6402	Николина Балка	76
6403	Николо-Александровское	76
6404	Нины	76
6405	Новая Деревня (Ставропольский край)	76
6406	Новая Жизнь	76
6407	Новоалександровск	76
6408	Новоблагодарное	76
6409	Новозаведенное	76
6410	Новокавказский	76
6411	Новокумский	76
6412	Новомарьевская	76
6413	Новопавловск	76
6414	Новоромановское	76
6415	Новоселицкое	76
6416	Новотроицкая (Ставропольский край)	76
6417	Новый Янкуль	76
6418	Обильное (Ставропольский край)	76
6419	Овощи	76
6420	Октябрьское (Ставропольский край)	76
6421	Ольгино (Ставропольский край)	76
6422	Ореховка	76
6423	Орловка (Кировский район)	76
6424	Орловка (Ставропольский край)	76
6425	Отказное	76
6426	Пелагиада	76
6427	Первомайское (Ставропольский край)	76
6428	Передовой	76
6429	Подкумок	76
6430	Подлесное	76
6431	Покойное	76
6432	Полтавское	76
6433	Поселок имени Кирова	76
6434	Правокумское	76
6435	Прасковея	76
6436	Преградное	76
6437	Привольное	76
6438	Прикалаусский	76
6439	Прикумское	76
6440	Приозерское	76
6441	Просянка	76
6442	Птичье (Ставропольский край)	76
6443	Пятигорск	76
6444	Пятигорский	76
6445	Рагули	76
6446	Радуга	76
6447	Расшеватская	76
6448	Рогатая Балка	76
6449	Родниковское	76
6450	Ростовановское	76
6451	Русское (Ставропольский край)	76
6452	Рыздвяный	76
6453	Саблинское	76
6454	Светлоград	76
6455	Свободы	76
6456	Северное (Ставропольский край)	76
6457	Сенгилеевское	76
6458	Серафимовское	76
6459	Сергиевское	76
6460	Ситниково (Ставропольский край)	76
6461	Советская (Ставропольский край)	76
6462	Советское Руно	76
6463	Солдато-Александровское	76
6464	Солнечнодольск	76
6465	Соломенское	76
6466	Солуно-Дмитриевское	76
6467	Сотниковское	76
6468	Спицевка	76
6469	Ставрополь	76
6470	Стародворцовский	76
6471	Стародубское (Ставропольский край)	76
6472	Староизобильная	76
6473	Старомарьевка (Ставропольский край)	76
6474	Старопавловская	76
6475	Степное (Ставропольский край)	76
6476	Стодеревская	76
6477	Суворовская (Ставропольский край)	76
6478	Султан	76
6479	Сухая Буйвола	76
6480	Татарка (Ставропольский край)	76
6481	Темижбекский	76
6482	Темнолесская	76
6483	Тищенское	76
6484	Томузловское	76
6485	Труновское (Ставропольский край)	76
6486	Тугулук	76
6487	Турксад	76
6488	Урожайное (Ставропольский край)	76
6489	Фельдмаршальский	76
6490	Чернолесское	76
6491	Шаумянский	76
6492	Шведино	76
6493	Эдиссия	76
6494	Этока	76
6495	Юца	76
6496	Янкуль	76
6497	Ясная Поляна (Ставропольский край)	76
6498	Автуры	77
6499	Аллерой (Курчалоевский район)	77
6500	Алхан-Кала	77
6501	Аргун	77
6502	Ассиновская	77
6503	Ачхой-Мартан	77
6504	Бачи-Юрт	77
6505	Гелдаган	77
6506	Герменчук	77
6507	Гехи	77
6508	Гойты	77
6509	Грозный	77
6510	Гудермес	77
6511	Знаменское (Чечня)	77
6512	Катыр-Юрт	77
6513	Курчалой	77
6514	Майртуп	77
6515	Мескер-Юрт	77
6516	Наурская	77
6517	Ножай-Юрт	77
6518	Ойсхара	77
6519	Самашки	77
6520	Серноводское	77
6521	Старые Атаги	77
6522	Урус-Мартан	77
6523	Цоци-Юрт	77
6524	Червлённая	77
6525	Шали	77
6526	Шелковская	77
6527	Александровск (Луганская область)	78
6528	Алмазная	78
6529	Алчевск	78
6530	Антрацит	78
6531	Беловодск	78
6532	Белокуракино	78
6533	Брянка	78
6534	Кировск	78
6535	Краснодон	78
6536	Красный Луч	78
6537	Кременная	78
6538	Лисичанск	78
6539	Луганск	78
6540	Лутугино	78
6541	Марковка	78
6542	Меловое	78
6543	Новоайдар	78
6544	Новопсков	78
6545	Перевальск	78
6546	Попасная	78
6547	Ровеньки	78
6548	Рубежное	78
6549	Сватово	78
6550	Свердловск	78
6551	Северодонецк	78
6552	Славяносербск	78
6553	Станица Луганская	78
6554	Старобельск	78
6555	Стаханов	78
6556	Счастье	78
6557	Троицкое	78
6558	Червонопартизанск	78
6559	Алейниково	79
6560	Алексеевка	79
6561	Анновка	79
6562	Архангельское (Белгородская область)	79
6563	Афанасово	79
6564	Белгород	79
6565	Беленихино	79
6566	Беленькое	79
6567	Беломестное	79
6568	Белый Колодезь	79
6569	Белянка (Белгородская область)	79
6570	Береговое-Второе	79
6571	Березовка (Белгородская область)	79
6572	Бершаково	79
6573	Бессоновка	79
6574	Бирюч	79
6575	Бобрава	79
6576	Бобровы Дворы	79
6577	Большая Халань	79
6578	Большебыково	79
6579	Большетроицкое	79
6580	Большие Липяги	79
6581	Большое Городище	79
6582	Борисовка	79
6583	Булановка	79
6584	Бутово	79
6585	Валуйки	79
6586	Валуйчик	79
6587	Варваровка (Белгородская область)	79
6588	Вейделевка	79
6589	Великомихайловка	79
6590	Венгеровка	79
6591	Верхнее Кузькино	79
6592	Верхняя Покровка	79
6593	Верхопенье	79
6594	Верхососна	79
6595	Веселая Лопань	79
6596	Викторополь	79
6597	Волоконовка	79
6598	Волотово	79
6599	Волчья Александровка	79
6600	Гарбузово	79
6601	Герасимовка	79
6602	Головчино	79
6603	Гостищево	79
6604	Готовье	79
6605	Грайворон	79
6606	Графовка	79
6607	Грузское	79
6608	Губкин	79
6609	Двулучное	79
6610	Дорогощь	79
6611	Дубовое	79
6612	Дунайка	79
6613	Ездочное	79
6614	Жуково (Белгородская область)	79
6615	Журавка-Первая	79
6616	Закутское	79
6617	Засосна	79
6618	Зенино	79
6619	Бехтеевка	79
6620	Ивановка (Белгородская область)	79
6621	Иващенково	79
6622	Ивня	79
6623	Илек Кошары	79
6624	Иловка	79
6625	Истобное	79
6626	Казинка (Белгородская область)	79
6627	Камызино	79
6628	Клименки	79
6629	Козинка	79
6630	Козьмодемьяновка (Белгородская область)	79
6631	Короча	79
6632	Кошлаково	79
6633	Кощеево	79
6634	Красная Яруга	79
6635	Красное (Белгородская область)	79
6636	Кустовое	79
6637	Ладомировка	79
6638	Лапыгино	79
6639	Лесно-Уколово	79
6640	Ливенка	79
6641	Ломово	79
6642	Малакеево	79
6643	Малотроицкое	79
6644	Маслова Пристань	79
6645	Масловка	79
6646	Матрено-Гезово	79
6647	Мешковое	79
6648	Монаково	79
6649	Мощеное	79
6650	Мухоудеровка	79
6651	Нагольное	79
6652	Нагорье (Белгородская область)	79
6653	Насоново	79
6654	Никаноровка	79
6655	Никитовка	79
6656	Новая Безгинка	79
6657	Новая Таволжанка	79
6658	Новенькое	79
6659	Новоалександровка	79
6660	Новопетровка	79
6661	Новоречье	79
6662	Новоуколово	79
6663	Новый Оскол	79
6664	Огибное	79
6665	Октябрьский (Белгородская область)	79
6666	Орлик (Белгородская область)	79
6667	Оскольское	79
6668	Погромец	79
6669	Подсереднее	79
6670	Покровка (Белгородская область)	79
6671	Поповка (Белгородская область)	79
6672	Призначное	79
6673	Принцевка	79
6674	Пролетарский	79
6675	Прохоровка	79
6676	Пятницкое	79
6677	Радьковка	79
6678	Раздорное	79
6679	Разумное	79
6680	Ракитное (Белгородская область)	79
6681	Расховец	79
6682	Ржевка	79
6683	Ровеньки (Белгородская область)	79
6684	Роговатое	79
6685	Русская Халань	79
6686	Сапрыкино	79
6687	Северный	79
6688	Скородное	79
6689	Солдатское	79
6690	Сорокино	79
6691	Старая Безгинка	79
6692	Стариково (Белгородская область)	79
6693	Староивановка	79
6694	Старый Оскол	79
6695	Стрелецкое	79
6696	Стригуны	79
6697	Строитель (Белгородская область)	79
6698	Таврово	79
6699	Тимоново	79
6700	Тишанка	79
6701	Томаровка	79
6702	Троицкий	79
6703	Тростянец (Белгородская область)	79
6704	Уразово	79
6705	Федосеевка	79
6706	Фощеватово	79
6707	Харьковское	79
6708	Хлевище	79
6709	Холодное	79
6710	Чернянка	79
6711	Чуево	79
6712	Шараповка	79
6713	Шаталовка	79
6714	Шебекино	79
6715	Шелаево	79
6716	Шидловка	79
6717	Яблоново	79
6718	Яковлево	79
6719	Ярское	79
6720	Ясные Зори	79
6721	Алтухово (Брянская область)	80
6722	Баклань (Брянская область)	80
6723	Белая Берёзка	80
6724	Белые Берега	80
6725	Брянск	80
6726	Бытошь	80
6727	Выгоничи	80
6728	Вышков (Брянская область)	80
6729	Глинищево	80
6730	Глоднево (Брянская область)	80
6731	Гобики	80
6732	Гордеевка	80
6733	Десятуха	80
6734	Добрунь	80
6735	Дубровка	80
6736	Дятьково	80
6737	Жирятино	80
6738	Жуковка (Брянская область)	80
6739	Злынка	80
6740	Ивот	80
6741	Карачев	80
6742	Клетня	80
6743	Климово (Брянская область)	80
6744	Клинцы	80
6745	Кокино	80
6746	Кокоревка	80
6747	Комаричи	80
6748	Красная Гора	80
6749	Локоть	80
6750	Лопандино	80
6751	Любохна	80
6752	Мглин	80
6753	Меленск	80
6754	Мирный (Брянская область, Гордеевский район)	80
6755	Мичуринский (Брянская область)	80
6756	Мишковка (Брянская область)	80
6757	Навля	80
6758	Нивное (Брянская область)	80
6759	Новозыбков	80
6760	Новый Ропск	80
6761	Овстуг	80
6762	Погар	80
6763	Почеп	80
6764	Путёвка	80
6765	Ржаница	80
6766	Рогнедино	80
6767	Свень	80
6768	Севск	80
6769	Сельцо	80
6770	Сеща	80
6771	Синезерки	80
6772	Слободище (Брянская область)	80
6773	Стародуб	80
6774	Старые Бобовичи	80
6775	Старь	80
6776	Суземка	80
6777	Супонево	80
6778	Сураж	80
6779	Троебортное	80
6780	Летошники	80
6781	Трубчевск	80
6782	Унеча	80
6783	Фокино (Брянская область)	80
6784	Чуровичи	80
6785	1-я Михайловка	17
6786	Абрамовка	17
6787	Александровка Донская	17
6788	Анна	17
6789	Архангельское (Воронежская область)	17
6790	Бабяково	17
6791	Байчурово	17
6792	Березняги	17
6793	Березовка (Воронежская область)	17
6794	Березово (Воронежская область)	17
6795	Ближняя Полубянка	17
6796	Бобров	17
6797	Богучар	17
6798	Бодеевка	17
6799	Боево	17
6800	Большие Базы	17
6801	Большие Ясырки	17
6802	Большой Самовец	17
6803	Бондарево	17
6804	Борисоглебск	17
6805	Братки	17
6806	Бродовое	17
6807	Бутурлиновка	17
6808	Бычок	17
6809	Великоархангельское	17
6810	Веретье	17
6811	Верхнее Турово	17
6812	Верхний Икорец	17
6813	Верхний Карачан	17
6814	Верхний Мамон	17
6815	Верхняя Маза	17
6816	Верхняя Тишанка	17
6817	Верхняя Тойда	17
6818	Верхняя Хава	17
6819	Вишневка	17
6820	Владимировка (Воронежская область)	17
6821	Вознесеновка	17
6822	Воля	17
6823	Воробьёвка	17
6824	Воронеж	17
6825	Воронцовка	17
6826	Вязноватовка	17
6827	Гаврильск	17
6828	Гвазда	17
6829	Гороховка	17
6830	Гремячье	17
6831	Грибановский	17
6832	Давыдовка	17
6833	Данково	17
6834	Девица (Семилукский район)	17
6835	Дерезовка	17
6836	Дерябкино	17
6837	Дроздово	17
6838	Дьяченково	17
6839	Евстратовка	17
6840	Елань-Колено	17
6841	Елань-Коленовский	17
6842	Елизаветино (Воронежская область)	17
6843	Есипово	17
6844	Журавка (Воронежская область)	17
6845	Писаревка (Воронежская область)	17
6846	Заболотовка	17
6847	Заброды	17
6848	Залужное	17
6849	Землянск	17
6850	Калач	17
6851	Калачеевский	17
6852	Каменка (Воронежская область)	17
6853	Кантемировка	17
6854	Карайчевка	17
6855	Караяшник	17
6856	Карпенково	17
6857	Касьяновка	17
6858	Каширское	17
6859	Клеповка	17
6860	Ковалево	17
6861	Колбино	17
6862	Колодезный	17
6863	Коломыцево	17
6864	Колыбелка	17
6865	Кондрашкино	17
6866	Копыл	17
6867	Коротояк	17
6868	Коршево	17
6869	Костенки	17
6870	Костино-Отделец	17
6871	Костово	17
6872	Красное (Воронежская область)	17
6873	Краснолесный	17
6874	Краснолипие	17
6875	Красноселовка	17
6876	Краснофлотское	17
6877	Красный Лиман 2-й	17
6878	Кривоносово	17
6879	Криничное	17
6880	Криуша (Воронежская область)	17
6881	Курбатово	17
6882	Кучеряевка	17
6883	Латная	17
6884	Лесково	17
6885	Лещаное	17
6886	Лизиновка	17
6887	Липовка (Воронежская область)	17
6888	Лиски	17
6889	Лискинское	17
6890	Листопадовка	17
6891	Лозовое	17
6892	Лосево	17
6893	Лофицкое	17
6894	Луговое (Воронежская область)	17
6895	Луки	17
6896	Мамоновка	17
6897	Манино	17
6898	Марки	17
6899	Марьевка	17
6900	Мечетка	17
6901	Митрофановка	17
6902	Михайловка (Воронежская область)	17
6903	Морозовка	17
6904	Мосоловка	17
6905	Мужичье	17
6906	Народное	17
6907	Начало	17
6908	Нижнедевицк	17
6909	Нижний Икорец	17
6910	Нижний Карачан	17
6911	Нижний Кисляй	17
6912	Нижний Мамон	17
6913	Нижний Ольшан	17
6914	Нижняя Байгора	17
6915	Нижняя Ведуга	17
6916	Никольское-1-е	17
6917	Никольское 2-е	17
6918	Никольское (Воронежская область)	17
6919	Новая Жизнь (Воронежская область)	17
6920	Новая Калитва	17
6921	Новая Криуша	17
6922	Новая Усмань	17
6923	Новая Чигла	17
6924	Новобелая	17
6925	Нововоронеж	17
6926	Новогольелань	17
6927	Новогремяченское	17
6928	Новоживотинное	17
6929	Новомарковка	17
6930	Новомеловатка	17
6931	Новонадежденский	17
6932	Новосильское	17
6933	Новосолдатка	17
6934	Новотроицкий	17
6935	Новохоперск	17
6936	Новохопёрск	17
6937	Новый Курлак	17
6938	Новый Лиман	17
6939	Озерки (Воронежская область)	17
6940	Октябрьский (Воронежская область)	17
6941	Ольховатка	17
6942	Опыт	17
6943	Орловка (Воронежская область)	17
6944	Орлово	17
6945	Острогожск	17
6946	Отрадное (Воронежская область)	17
6947	Павловск (Воронежская область)	17
6948	Панино	17
6949	Первомайский (Воронежская область)	17
6950	Первомайское (Воронежская область)	17
6951	Перво-Эртиль	17
6952	Перелешино	17
6953	Перелешинский	17
6954	Пески	17
6955	Петропавловка (Воронежская область)	17
6956	Платава	17
6957	Поворино	17
6958	Подгоренский	17
6959	Подколодновка	17
6960	Покровка (Воронежская область)	17
6961	Поповка (Воронежская область)	17
6962	Почепское	17
6963	Придонской	17
6964	Пузево	17
6965	Пчелиновка	17
6966	Радченское	17
6967	Рамонь	17
6968	Рамонье	17
6969	Репьевка	17
6970	Рогачевка	17
6971	Рождественская Хава	17
6972	Рождественское (Воронежская область)	17
6973	Россошь	17
6974	Ростоши	17
6975	Русаново	17
6976	Русская Буйловка	17
6977	Русская Журавка	17
6978	Сагуны (Подгоренский район, Березовское поселение)	17
6979	Сагуны (Подгоренский район, Сагуновское поселение)	17
6980	свх Масловский	17
6981	Селявное	17
6982	Семено-Александровка	17
6983	Семеновка (Воронежская область)	17
6984	Семидесятное	17
6985	Семилуки	17
6986	Сергеевка (Воронежская область)	17
6987	Сериково	17
6988	Синие Липяги	17
6989	Синявка	17
6990	Слобода	17
6991	Смаглеевка	17
6992	Солнечный (Воронежская область)	17
6993	Солонцы	17
6994	Сомово	17
6995	Средний Икорец	17
6996	Старая Ведуга	17
6997	Старая Калитва	17
6998	Старая Криуша	17
6999	Старая Меловая	17
7000	Старая Тойда	17
7001	Старая Хворостань	17
7002	Старая Чигла	17
7003	Староникольское	17
7004	Сторожевое	17
7005	Стрелица	17
7006	Студеное (Воронежская область)	17
7007	Сухая Березовка	17
7008	Таловая	17
7009	Талы	17
7010	Тамбовка	17
7011	Татарино	17
7012	Терновка (Воронежская область)	17
7013	Титаревка	17
7014	Тойда 1-я	17
7015	Тресоруково	17
7016	Трехстенки	17
7017	Тройня	17
7018	Углянец	17
7019	Урыв-Покровка	17
7020	Усть-Муравлянка	17
7021	Филиппенково	17
7022	Хлебородное	17
7023	Хохол	17
7024	Хохол-Тростянка	17
7025	Хохольский	17
7026	Хреновое	17
7027	Чесменка	17
7028	Чигорак	17
7029	Шапошниковка	17
7030	Шестаково (Воронежская область)	17
7031	Шишовка	17
7032	Шубное	17
7033	Щучинские-Пески	17
7034	Эртиль	17
7035	Юдановка	17
7036	Ямное	17
7037	Ярки	17
7038	Ясенки	17
7039	Алейский	81
7040	Бабынино (Калужская область)	81
7041	Балабаново	81
7042	Барятино (Калужская область)	81
7043	Бебелево	81
7044	Белоусово	81
7045	Березичский Стеклозавод	81
7046	Бетлица	81
7047	Боровск	81
7048	Вихляево	81
7049	Воротынск	81
7050	Ворсино (Калужская область)	81
7051	Высокиничи	81
7052	Детчино	81
7053	Думиничи	81
7054	Еленский	81
7055	Ермолино (Калужская область)	81
7056	Жиздра	81
7057	Жилетово	81
7058	Жуков	81
7059	Заречье (Калужская область)	81
7060	Износки	81
7061	Калуга	81
7062	Киров (Калужская область)	81
7063	Козельск	81
7064	Кондрово	81
7065	Красное (Калужская область)	81
7066	Кременки	81
7067	Кривское (Калужская область)	81
7068	Кудиново	81
7069	Льва Толстого	81
7070	Людиново	81
7071	Малоярославец	81
7072	Маринки	81
7073	Медынь	81
7074	Мещовск	81
7075	Мосальск	81
7076	Мятлево	81
7077	Обнинск	81
7078	Перемышль	81
7079	Победа (Калужская область)	81
7080	Подборки	81
7081	Полотняный Завод	81
7082	Пятовский	81
7083	Середейский	81
7084	Сосенский	81
7085	Спас-Деменск	81
7086	Сухиничи	81
7087	Таруса	81
7088	Товарково (Калужская область)	81
7089	Ульяново (Калужская область)	81
7090	Ферзиково	81
7091	Хвастовичи (Калужская область)	81
7092	Шайковка	81
7093	Юхнов	81
7094	Искра (Калужская область)	81
7095	1-я Семеновка	82
7096	Амосовка	82
7097	Белая	82
7098	Большое Солдатское	82
7099	Верхний Любаж	82
7100	Веселое (Курская область)	82
7101	Возы	82
7102	Ворошнево	82
7103	Гирьи	82
7104	Глушково	82
7105	Горшечное	82
7106	Гуево	82
7107	Дичня	82
7108	Дмитриев-Льговский	82
7109	Дьяконово	82
7110	Железногорск (Курская область)	82
7111	Званное	82
7112	Золотухино	82
7113	Иванино	82
7114	Ивановское (Курская область)	82
7115	Касторное	82
7116	Кировский	82
7117	Конышевка	82
7118	Коренево	82
7119	Коровяковка	82
7120	Курск	82
7121	Курчатов	82
7122	Кшенский	82
7123	Льгов	82
7124	Любимовка	82
7125	Магнитный	82
7126	Малая Локня	82
7127	Мантурово (Курская область)	82
7128	Медвенка	82
7129	Михайловка (Курская область)	82
7130	Нижний Реутец	82
7131	Новокасторное	82
7132	Обоянь	82
7133	Первоавгустовский	82
7134	Поныри	82
7135	Посёлок имени Карла Либкнехта	82
7136	Поселок им.Куйбышева	82
7137	поселок Карла Либкнехта	82
7138	поселок Маршала Жукова	82
7139	Пристень	82
7140	Прямицыно	82
7141	Пушкарное	82
7142	Рыжевка	82
7143	Рыльск	82
7144	Свобода	82
7145	Сейм	82
7146	Селекционный	82
7147	Солнцево (Курская область)	82
7148	Студенок	82
7149	Суджа	82
7150	Сухиновка	82
7151	Тёткино	82
7152	Тим	82
7153	Усланка	82
7154	Олымский	82
7155	Фатеж	82
7156	Хомутовка	82
7157	Черемисиново	82
7158	Черкасское Поречное	82
7159	Черницыно	82
7160	Щигры	82
7161	Агроном (Липецкая область)	83
7162	Березнеговатка	83
7163	Березовка (Липецкая область)	83
7164	Бигильдино	83
7165	Большая Поляна	83
7166	Боринское	83
7167	Ведное	83
7168	Верхний Ломовец	83
7169	Верхний Студенец	83
7170	Верхняя Матренка	83
7171	Верхняя Мосоловка	83
7172	Вислая Поляна	83
7173	Волово	83
7174	Воронец	83
7175	Вторые Тербуны	83
7176	Газопровод	83
7177	Гатище	83
7178	Грязи	83
7179	Данков	83
7180	Демшинка	83
7181	Дмитряшевка	83
7182	Добринка	83
7183	Доброе	83
7184	Долгоруково	83
7185	Донское	83
7186	Дрязги	83
7187	Елец	83
7188	Елецкая Лозовка	83
7189	Жерновное	83
7190	Завальное	83
7191	Задонск	83
7192	Золотуха (Липецкая область)	83
7193	Измалково	83
7194	Ильино	83
7195	Казаки	83
7196	Казинка (Липецкая область)	83
7197	Каликино	83
7198	Колыбельское	83
7199	Конь-Колодезь	83
7200	Коробовка	83
7201	Красное (Липецкая область)	83
7202	Кривополянье	83
7203	Куймань	83
7204	Куликово (Липецкая область)	83
7205	Ламское	83
7206	Лебедянь	83
7207	Ленино (Липецкая область)	83
7208	Липецк	83
7209	Макарово (Липецкая область)	83
7210	Маяк (Липецкая область)	83
7211	Нижняя Матренка	83
7212	Новая Деревня (Липецкая область)	83
7213	Ново-Дубовое	83
7214	Паршиновка	83
7215	Пашково (Липецкая область)	83
7216	Первомайское (Липецкая область)	83
7217	Плавица	83
7218	Поддубровка	83
7219	Политово	83
7220	Средняя Матренка	83
7221	поселок Лев Толстой	83
7222	Пушкино (Липецкая область)	83
7223	Ратчино	83
7224	Скорняково	83
7225	Становое	83
7226	Стегаловка	83
7227	Сторожевские Хутора	83
7228	Стрелец	83
7229	Студенки	83
7230	Талицкий Чамлык	83
7231	Тербуны	83
7232	Троекурово	83
7233	Трубетчино	83
7234	Урицкое	83
7235	Усмань	83
7236	Фащевка	83
7237	Хворостянка (Липецкая область)	83
7238	Хлевное	83
7239	Хмелинец	83
7240	Чаплыгин	83
7241	Частая Дубрава	83
7242	Чернава (Липецкая область)	83
7243	Ярлуково	83
7244	1-й Воин	84
7245	Апальково	84
7246	Болхов	84
7247	Верховье	84
7248	Глазуновка	84
7249	Дмитровск	84
7250	Долгое	84
7251	Дросково	84
7252	Залегощь	84
7253	Здоровец	84
7254	Змиевка	84
7255	Знаменка (Орловская область)	84
7256	Колпна	84
7257	Колпны	84
7258	Коротыш	84
7259	Корсаково	84
7260	Красная Заря	84
7261	Кромы	84
7262	Ливны	84
7263	Малоархангельск	84
7264	Моховое (Орловская область)	84
7265	Мценск	84
7266	Навесное	84
7267	Нарышкино	84
7268	Новосиль	84
7269	Орел	84
7270	Отрадинское	84
7271	Покровское (Орловская область)	84
7272	Росстани	84
7273	Русский Брод	84
7274	Сахзаводской	84
7275	Сергиевское (Орловская область)	84
7276	Сосково	84
7277	Становой Колодезь	84
7278	Стрелецкий	84
7279	Тельчье	84
7280	Тросна	84
7281	Успенское (Орловская область)	84
7282	Хомутово	84
7283	Хотынец	84
7284	Черемошны	84
7285	Шаблыкино	84
7286	Марково (Орловская область)	84
7287	2-я Гавриловка	85
7288	Агеево (Тамбовская область)	85
7289	Алгасово	85
7290	Бахарево	85
7291	Беломестная Двойня	85
7292	Березовка (Тамбовская область)	85
7293	Большая Липовица	85
7294	Большая Ржакса	85
7295	Бондари	85
7296	Вернадовка	85
7297	Верхне-Спасское	85
7298	Верхняя Ярославка	85
7299	Вирятино	85
7300	Вторые Левые Ламки	85
7301	Вяжли	85
7302	Гавриловка Вторая	85
7303	Глазок	85
7304	Горелое	85
7305	Граждановка	85
7306	Гумны	85
7307	Дегтянка	85
7308	Дмитриевка	85
7309	Дуплято-Маслово	85
7310	Екатеринино	85
7311	Жердевка	85
7312	Знаменка (Тамбовская область)	85
7313	Изосимово	85
7314	Иловай Бригадирское	85
7315	Инжавино	85
7316	Калаис	85
7317	Карай-Салтыково	85
7318	Кирсанов	85
7319	Котовск (Тамбовская область)	85
7320	Красненькая	85
7321	Красносвободное	85
7322	Краснослободский	85
7323	Красный Куст	85
7324	Кузьмина-Гать	85
7325	Кулеватово	85
7326	Кулябовка	85
7327	Липовка (Тамбовская область)	85
7328	Максим Горький	85
7329	Малые Кулики	85
7330	Малый Снежеток	85
7331	Мичуринск	85
7332	Мордово	85
7333	Моршанск	85
7334	Мучкапский	85
7335	Нижнеспасское	85
7336	Нижний Шибряй	85
7337	Новая Ляда	85
7338	Новое Грязное	85
7339	Новоюрьево	85
7340	Озерки (Тамбовская область)	85
7341	Пановы Кусты	85
7342	Паревка	85
7343	Пахотный Угол	85
7344	Первомайский (Тамбовская область)	85
7345	Первомайское (Тамбовская область)	85
7346	Пересыпкино 1-е	85
7347	Моисеево-Алабушка	85
7348	Пичаево	85
7349	Платоновка	85
7350	Покрово-Пригородное	85
7351	Ракша	85
7352	Рассказово	85
7353	Ржакса	85
7354	Рождественское (Тамбовская область)	85
7355	Сабуро-Покровское	85
7356	Сампур	85
7357	Сатинка	85
7358	Серповое	85
7359	Сосновка (Тамбовская область)	85
7360	Старосеславино	85
7361	Старо-Хмелевое	85
7362	Староюрьево	85
7363	Столовое	85
7364	Стрельцы	85
7365	Строитель	85
7366	Строитель (Тамбовская область)	85
7367	Тамбов	85
7368	Татаново	85
7369	Токаревка	85
7370	Третьи Левые Ламки	85
7371	Троицкие Росляи	85
7372	Тулиновка	85
7373	Уварово	85
7374	Умёт	85
7375	Хоботово	85
7376	Чакино-1	85
7377	Чащино	85
7378	Шапкино	85
7379	Юрловка	85
7380	Ярославка (Тамбовская область)	85
7381	Агеево (Тульская область)	86
7382	Алексин	86
7383	Арсеньево	86
7384	Архангельское (Тульская область, Каменский район)	86
7385	Барсуки	86
7386	Белев	86
7387	Богородицк	86
7388	Болохово	86
7389	Бородинский	86
7390	Брусянский	86
7391	Венев	86
7392	Волово (Тульская область)	86
7393	Воскресенское (Тульская область, Дубенский район)	86
7394	Головеньковский	86
7395	Гремячее (Тульская область)	86
7396	Грицовский	86
7397	Дедилово	86
7398	Донской	86
7399	Дубна (Тульская область)	86
7400	Дубовка (Тульская область)	86
7401	Епифань	86
7402	Ефремов	86
7403	Заокский	86
7404	Знаменка-1	86
7405	Каменецкий	86
7406	Карамышево (Тульская область, Щёкинский район)	86
7407	Кимовск	86
7408	Киреевск	86
7409	Крапивна (Тульская область)	86
7410	Кривцово	86
7411	Куркино	86
7412	Лазарево (Тульская область)	86
7413	Ленинский (Тульская область)	86
7414	Липки	86
7415	Ломинцевский	86
7416	Молочные Дворы	86
7417	Мордвес	86
7418	Новогуровский	86
7419	Новомосковск (Тульская область)	86
7420	Одоев	86
7421	Октябрьский (Тульская область)	86
7422	Осиновая Гора	86
7423	Партизан	86
7424	Первомайский (Тульская область)	86
7425	Плавск	86
7426	Плеханово	86
7427	Приупский	86
7428	Ревякино	86
7429	Северо-Задонск	86
7430	Славный (Тульская область)	86
7431	Советск (Тульская область)	86
7432	Сокольники	86
7433	Суворов	86
7434	Теплое	86
7435	Товарковский	86
7436	Тула	86
7437	Узловая	86
7438	Хрущево	86
7439	Центральный (Тульская область, Суворовский район)	86
7440	Алёшня	86
7441	Чекалин	86
7442	Черепеть	86
7443	Чернь	86
7444	Шатск	86
7445	Шварцевский	86
7446	Ширинский	86
7447	Щекино	86
7448	Южный (Тульская область)	86
7449	Ясная Поляна (Тульская область)	86
7450	Ясногорск	86
7451	Аксарайский	87
7452	Астрахань	87
7453	Ахтубинск	87
7454	Байбек	87
7455	Бахтемир	87
7456	Бирюковка (Астраханская область)	87
7457	Болхуны	87
7458	Буруны (Астраханская область)	87
7459	Верхний Баскунчак	87
7460	Верхний Бузан	87
7461	Волго-Каспийский	87
7462	Волжский (Астраханская область)	87
7463	Волжское (Астраханская область)	87
7464	Володарский	87
7465	Вольное (Астраханская область)	87
7466	Восток (Астраханская область)	87
7467	Енотаевка	87
7468	Житное (Астраханская область)	87
7469	Заволжское (Астраханская область)	87
7470	Зеленга	87
7471	Зензели	87
7472	Знаменск	87
7473	Золотуха (Астраханская область)	87
7474	Зубовка (Астраханская область)	87
7475	Икряное	87
7476	Ильинка (Икрянинский район)	87
7477	Каменный Яр	87
7478	Камызяк	87
7479	Капустин Яр	87
7480	Карагали	87
7481	Каралат	87
7482	Килинчи	87
7483	Кировский (Астраханская область)	87
7484	Кочковатка (Астраханская область)	87
7485	Красные Баррикады	87
7486	Красный Яр (Астраханская область)	87
7487	Лиман (Астраханская область)	87
7488	Макаровская	87
7489	Марфино (Астраханская область)	87
7490	Михайловка (Астраханская область)	87
7491	Мумра	87
7492	Нариманов	87
7493	Началово	87
7494	Нижний Баскунчак	87
7495	Никольское (Астраханская область)	87
7496	Ново-Николаевка (Астраханская область)	87
7497	Образцово-Травино	87
7498	Оля	87
7499	Оранжереи	87
7500	Осыпной Бугор	87
7501	Прикаспийский	87
7502	Пришиб (Астраханская область)	87
7503	Раздор	87
7504	Разночиновка	87
7505	Растопуловка	87
7506	Сасыколи	87
7507	Селитренное	87
7508	Сокрутовка	87
7509	Солёное Займище (Астраханская область)	87
7510	Солодники	87
7511	Замьяны	87
7512	Солянка	87
7513	Средний Баскунчак	87
7514	Старица (Астраханская область)	87
7515	Старокучергановка	87
7516	Тамбовка (Астраханская область)	87
7517	Татарская Башмаковка	87
7518	Тишково	87
7519	Три Протока	87
7520	Трудфронт	87
7521	Тузуклей	87
7522	Тумак (Астраханская область)	87
7523	Удачное	87
7524	Ушаковка (Астраханская область)	87
7525	Федоровка (Астраханская область)	87
7526	Харабали	87
7527	Хошеутово	87
7528	Черный Яр	87
7529	Яксатово	87
7530	Яндыки	87
7531	Абганерово	10
7532	Аксай (Волгоградская область)	10
7533	Александровка	10
7534	Алексеевская	10
7535	Антиповка	10
7536	Арчединская	10
7537	Атамановка (Волгоградская область)	10
7538	Басакин	10
7539	Бережновка	10
7540	Березовская	10
7541	Береславка	10
7542	Большие Чапурники	10
7543	Большое Судачье	10
7544	Большой Лычак	10
7545	Большой Морец	10
7546	Бузиновка	10
7547	Бурковский	10
7548	Бурлук	10
7549	Быково	10
7550	Вертячий	10
7551	Верхнегнутов	10
7552	Верхнекардаильский	10
7553	Верхнечеренский	10
7554	Верхний Балыклей	10
7555	Верхняя Бузиновка	10
7556	Ветютнев	10
7557	Волгоград	10
7558	Волгодонской	10
7559	Волжский (Волгоградская область)	10
7560	Вязовка	10
7561	Глазуновская	10
7562	Гмелинка	10
7563	Голубинская	10
7564	Горный Балыклей	10
7565	Городище	10
7566	Горьковский	10
7567	Гуляевка (Волгоградская область)	10
7568	Гусевка	10
7569	Даниловка	10
7570	Двойновский	10
7571	Дворянское	10
7572	Деминский	10
7573	Дубовка	10
7574	Дубовое (Волгоградская область)	10
7575	Дубовский	10
7576	Дудаченский	10
7577	Ежовка	10
7578	Елань	10
7579	Ерзовка	10
7580	Жирновск	10
7581	Журавка	10
7582	Жутово 2-е	10
7583	Заплавное	10
7584	Захаров	10
7585	Зензеватка	10
7586	Зимняцкий	10
7587	Золотари	10
7588	Иловля	10
7589	Ильевка	10
7590	Искра (Волгоградская область)	10
7591	Сидоры	10
7592	Калач-на-Дону	10
7593	Калиновский	10
7594	Калмыковский	10
7595	Камышин	10
7596	Качалино	10
7597	Киреево (Волгоградская область)	10
7598	Кирпичный (Волгоградская область)	10
7599	Кислово	10
7600	Кленовка	10
7601	Клетская	10
7602	Колобродов	10
7603	Котельниково	10
7604	Котлубань	10
7605	Котово	10
7606	Краишево	10
7607	Краснокоротковский	10
7608	Краснооктябрьский (Волгоградская область)	10
7609	Краснослободск (Волгоградская область)	10
7610	Красноталовский	10
7611	Красные Липки	10
7612	Красный Яр	10
7613	Кременская	10
7614	Крепинский	10
7615	Кругловка	10
7616	Кумылженская	10
7617	Ленинск	10
7618	Линево	10
7619	Липовка	10
7620	Лог	10
7621	Логовский	10
7622	Лозное	10
7623	Лычак	10
7624	Ляпичев	10
7625	Малодельская	10
7626	Матышево	10
7627	Мачеха	10
7628	Медведицкий	10
7629	Михайловка (Волгоградская область)	10
7630	Морец	10
7631	Нехаевская	10
7632	Нижнегнутов	10
7633	Нижнецепляевский	10
7634	Нижнеяблочный	10
7635	Нижний Чир	10
7636	Нижняя Добринка	10
7637	Николаевск	10
7638	Новая Паника	10
7639	Новоаннинский	10
7640	Новомаксимовский	10
7641	Новониколаевский (Волгоградская область)	10
7642	Новый Рогачик	10
7643	Образцы	10
7644	Октябрьский (Волгоградская область)	10
7645	Октябрьский (Октябрьский район)	10
7646	Ольховка	10
7647	Островская	10
7648	Палласовка	10
7649	Панфилово (Волгоградская область)	10
7650	Паньшино	10
7651	Перекопка	10
7652	Перелазовский	10
7653	Песковатка	10
7654	Петров Вал	10
7655	Писарёвка (Волгоградская область)	10
7656	Покровка (Волгоградская область)	10
7657	Поселок совхоза АМО	10
7658	Преображенская	10
7659	Привольный	10
7660	Пригородный (Волгоградская область)	10
7661	Приморск (Волгоградская область)	10
7662	Путь Ильича (Ленинский район)	10
7663	Путь Ильича (Николаевский район)	10
7664	Пятиморск	10
7665	Распопинская	10
7666	Рахинка	10
7667	Реконструкция	10
7668	Роднички	10
7669	Россошинский	10
7670	Рубёжный	10
7671	Рудня (Волгоградская область)	10
7672	Рябовский	10
7673	Савинка	10
7674	Салтово	10
7675	Салтынский	10
7676	Самофаловка	10
7677	Светлый Яр	10
7678	Себрово	10
7679	Серафимович	10
7680	Сергиевская	10
7681	Сиротинская	10
7682	Солодча	10
7683	Солонка	10
7684	Среднецарицынский	10
7685	Средняя Ахтуба	10
7686	Старая Полтавка	10
7687	Степной	10
7688	Суровикино	10
7689	Терновое	10
7690	Терса	10
7691	Тормосин	10
7692	Тростянка	10
7693	Упорниковская	10
7694	Урюпинск	10
7695	Усть-Бузулукская	10
7696	Усть-Хоперская	10
7697	Филоновская	10
7698	Фролово	10
7699	Харьковка	10
7700	Царев	10
7701	Цаца	10
7702	Черкесовский	10
7703	Чернолагутинский	10
7704	Чернышковский	10
7705	Шелестово	10
7706	Школьный (Волгоградская область)	10
7707	Шуруповский	10
7708	Эльтон	10
7709	Артезиан	88
7710	Большой Царын	88
7711	Городовиковск	88
7712	Ики-Бурул	88
7713	Кетченеры	88
7714	Комсомольский	88
7715	Коробкин	88
7716	Лагань	88
7717	Малые Дербеты	88
7718	Приютное	88
7719	Садовое	88
7720	Солёное (Калмыкия)	88
7721	Троицкое (Республика Калмыкия)	88
7722	Улан-Хол	88
7723	Цаган Аман	88
7724	Шатта (Кетченеровский район)	88
7725	Элиста	88
7726	Яшалта	88
7727	Яшкуль	88
7728	Виноградное (Калмыкия)	88
7729	Аграрное	7
7730	Азовское	7
7731	Алупка	7
7732	Алушта	7
7733	Армянск	7
7734	Аэрофлотский	7
7735	Багерово	7
7736	Балаклава	7
7737	Бахчисарай	7
7738	Белоглинка	7
7739	Белогорск (Крым)	7
7740	Ближнее	7
7741	Бондаренково	7
7742	Верхнесадовое	7
7743	Вилино	7
7744	Виноградное (Республика Крым)	7
7745	Витино	7
7746	Войково	7
7747	Восход (Республика Крым)	7
7748	Гаспра	7
7749	Гвардейское (Республика Крым)	7
7750	Геройское	7
7751	Голубой Залив	7
7752	Грэсовский	7
7753	Гурзуф	7
7754	Далёкое	7
7755	Джанкой	7
7756	Днепровка	7
7757	Доброе (Республика Крым)	7
7758	Донское (Республика Крым)	7
7759	Евпатория	7
7760	Жаворонки (Крым)	7
7761	Желябовка	7
7762	Журавки	7
7763	Заозёрное	7
7764	Зуя	7
7765	Инкерман	7
7766	Калиновка (Республика Крым	7
7767	Каменоломня	7
7768	Каменское (Республика Крым)	7
7769	Карьерное	7
7770	Кацивели	7
7771	Кача	7
7772	Керчь	7
7773	Кировское (Республика Крым)	7
7774	Коктебель	7
7775	Кольчугино (Республика Крым)	7
7776	Комсомольское (Республика Крым)	7
7777	Кореиз	7
7778	Красногвардейское	7
7779	Краснокаменка	7
7780	Красноперекопск	7
7781	Крымское	7
7782	Кубанское	7
7783	Куйбышево (Республика Крым)	7
7784	Курпаты	7
7785	Ленино	7
7786	Ливадия (Республика Крым)	7
7787	Мазанка	7
7788	Малореченское	7
7789	Малый Маяк	7
7790	Марфовка	7
7791	Массандра	7
7792	Межводное	7
7793	Мирное (Республика Крым)	7
7794	Молодежное	7
7795	Морское (Республика Крым)	7
7796	Мраморное	7
7797	Нижнегорский	7
7798	Никита (Республика Крым)	7
7799	Николаевка	7
7800	Новоозерное	7
7801	Новосёловское	7
7802	Новосельское	7
7803	Новофёдоровка	7
7804	Новый Свет (Республика Крым)	7
7805	Октябрьское (Республика Крым)	7
7806	Олива	7
7807	Орджоникидзе (Республика Крым)	7
7808	Ореанда	7
7809	Орехово	7
7810	Останино	7
7811	Отрадное (Республика Крым)	7
7812	Парковое (Республика Крым)	7
7813	Партенит	7
7814	Первомайское (Республика Крым)	7
7815	Перевальное	7
7816	Перово (Республика Крым)	7
7817	Песчаное	7
7818	Петровка	7
7819	Пионерское	7
7820	Пожарское	7
7821	Полтавка (Республика Крым)	7
7822	Понизовка	7
7823	Почтовое	7
7824	Прибрежное	7
7825	Приветное (Республика Крым)	7
7826	Приморский (Республика Крым)	7
7827	Приозёрное	7
7828	Раздольное	7
7829	Родниково	7
7830	Роздольное	7
7831	Садовое (Республика Крым)	7
7832	Саки	7
7833	Сенокосное	7
7834	Симеиз	7
7835	Симоненко	7
7836	Симферополь	7
7837	Скалистое	7
7838	Скворцово (Республика Крым)	7
7839	Советский (Республика Крым)	7
7840	Советское (Республика Крым)	7
7841	Старый Крым	7
7842	Судак	7
7843	Тамбовка (Республика Крым)	7
7844	Топольное	7
7845	Укромное	7
7846	Феодосия	7
7847	Ферсманово	7
7848	Фонтаны	7
7849	Форос	7
7850	Чайкино (Республика Крым)	7
7851	Черноморское	7
7852	Чистенькое	7
7853	Чистополье	7
7854	Чкалово	7
7855	Щебетовка	7
7856	Щёлкино	7
7857	Ялта	7
7858	Янтарное	7
7859	Авило-Успенка	16
7860	Азов	16
7861	Аксай (Ростовская область)	16
7862	Александровка (Ростовская область)	16
7863	Алексеевка (Ростовская область)	16
7864	Алексеево-Лозовское	16
7865	Анастасиевка	16
7866	Андреево-Мелентьево	16
7867	Апаринский	16
7868	Арпачин	16
7869	Багаевская	16
7870	Базковская	16
7871	Балко-Грузский	16
7872	Барило-Крепинская	16
7873	Батайск	16
7874	Белая Калитва	16
7875	Березовка (Ростовская область)	16
7876	Бессергеневская	16
7877	Богураев	16
7878	Божковка	16
7879	Боковская	16
7880	Большая Кирсановка	16
7881	Большая Мартыновка	16
7882	Большая Орловка	16
7883	Большая Таловая	16
7884	Большекрепинская	16
7885	Большие Салы	16
7886	Большой Лог	16
7887	Буденновская	16
7888	Быстрогорский	16
7889	Вареновка	16
7890	Васильево-Шамшево	16
7891	Вербочки	16
7892	Верхнегрушевский	16
7893	Верхнемакеевка	16
7894	Верхнеподпольный	16
7895	Верхнесоленый	16
7896	Верхнетемерницкий	16
7897	Верхний Митякин	16
7898	Верхняковский	16
7899	Весело-Вознесенка	16
7900	Веселый	16
7901	Вешенская	16
7902	Вислый	16
7903	Владимировская	16
7904	Войнов	16
7905	Волгодонск	16
7906	Волошино	16
7907	Гашун	16
7908	Гигант	16
7909	Глубокий	16
7910	Горный (Ростовская область)	16
7911	Горняцкий	16
7912	Григорьевка (Ростовская область)	16
7913	Грушевская	16
7914	Гуково	16
7915	Гуляй-Борисовка	16
7916	Двуречье	16
7917	Дегтево	16
7918	Денисов	16
7919	Поповка	16
7920	Донецк (Ростовская область)	16
7921	Дубенцовская	16
7922	Дубовское	16
7923	Дубровский	16
7924	Егорлыкская	16
7925	Екатериновка (Матвеево-Курганский район)	16
7926	Екатериновка (Сальский район)	16
7927	Елизаветовка	16
7928	Елкин	16
7929	Жирнов	16
7930	Жуково-Татарский	16
7931	Жуковская	16
7932	Жуковское	16
7933	Журавлевка	16
7934	Заветное	16
7935	Задонно-Кагальницкая	16
7936	Займо-Обрыв	16
7937	Заплавская	16
7938	Зверево	16
7939	Зеленолугский	16
7940	Зерноград	16
7941	Зимовники	16
7942	Золотаревка	16
7943	Ивановка (Ростовская область)	16
7944	Индустриальный (Ростовская область)	16
7945	Интернациональный	16
7946	Кавалерский	16
7947	Кагальник	16
7948	Кагальницкая	16
7949	Казанская (Ростовская область)	16
7950	Казачьи Лагери	16
7951	Калинин	16
7952	Калининский	16
7953	Каменная Балка	16
7954	Каменоломни	16
7955	Каменск-Шахтинский	16
7956	Камышев	16
7957	Камышевка	16
7958	Каргинская	16
7959	Кашары	16
7960	Керчик-Савров	16
7961	Киреевка	16
7962	Кировская	16
7963	Клюев	16
7964	Коксовый	16
7965	Колодези	16
7966	Колундаевский	16
7967	Конезавод имени Буденного	16
7968	Константиновск	16
7969	Костино-Быстрянский	16
7970	Красная Поляна (Ростовская область)	16
7971	Красноармейский	16
7972	Красновка	16
7973	Красногорняцкий	16
7974	Красное Знамя	16
7975	Красноярская (Ростовская область)	16
7976	Красный Десант	16
7977	Красный Сулин	16
7978	Красюковская	16
7979	Криворожье	16
7980	Кривянская	16
7981	Кринично-Лугский	16
7982	Круглое (Ростовская область)	16
7983	Кружилинский	16
7984	Крученная Балка	16
7985	Крым (Ростовская область)	16
7986	Кугей	16
7987	Кугейский	16
7988	Куйбышево (Ростовская область)	16
7989	Кулешовка	16
7990	Кульбаково	16
7991	Латоново	16
7992	Ленинаван	16
7993	Ленинский (Ростовская область)	16
7994	Летник	16
7995	Литвиновка	16
7996	Лихой	16
7997	Лозной	16
7998	Лопанка	16
7999	Лысогорка	16
8000	Малокирсановка	16
8001	Малоорловский	16
8002	Мальчевская	16
8003	Манычская	16
8004	Маньково-Березовская	16
8005	Маньково-Калитвенская	16
8006	Маргаритово	16
8007	Маркин	16
8008	Маркинская	16
8009	Марфинка	16
8010	Матвеев-Курган	16
8011	Мелиховская	16
8012	Меркуловский	16
8013	Мечетинская	16
8014	Мешковская	16
8015	Мещеряковский	16
8016	Мигулинская	16
8017	Миллерово	16
8018	Милютинская	16
8019	Мирный (Ростовская область)	16
8020	Митякинская	16
8021	Михайлово-Александровка	16
8022	Мишкинская	16
8023	Можаевка	16
8024	Мокрый Батай	16
8025	Мокрый Гашун	16
8026	Морозовск	16
8027	Недвиговка	16
8028	Нижнедонской	16
8029	Нижне-Кундрюченская	16
8030	Николаевка (Ростовская область)	16
8031	Николаевская	16
8032	Николаевский 2-й	16
8033	Новая Надежда	16
8034	Новобатайск	16
8035	Новобессергеневка	16
8036	Новозарянский	16
8037	Новомирский	16
8038	Новониколаевка (Ростовская область, Азовский район)	16
8039	Новониколаевский	16
8040	Новоперсиановка	16
8041	Новороговская	16
8042	Новоселовка	16
8043	Новоцимлянская	16
8044	Новочеркасск	16
8045	Новошахтинск	16
8046	Новый Егорлык	16
8047	Обливская	16
8048	Объединенный	16
8049	Овощной (Ростовская область)	16
8050	Октябрьский (Ростовская область)	16
8051	Ольгинская (Ростовская область)	16
8052	Ольховчик	16
8053	Ольховый Рог	16
8054	Опенки	16
8055	Орловский	16
8056	Отрадовка	16
8057	Парамонов	16
8058	Первомайское (Ростовская область)	16
8059	Персиановский	16
8060	Песчанокопское	16
8061	Песчаный (Ростовская область)	16
8062	Пешково	16
8063	Победа (Азовский район)	16
8064	Победа (Волгодонский район)	16
8065	Позднеевка	16
8066	Покрово-Марфино	16
8067	Покровское (Ростовская область)	16
8068	Политотдельское	16
8069	Порт-Катон	16
8070	Потапов	16
8071	Приморка	16
8072	Пролетарск	16
8073	Путь Правды	16
8074	Пухляковский	16
8075	Развильное	16
8076	Раздорская	16
8077	Рассвет	16
8078	Ремонтное	16
8079	Роговский	16
8080	Родионово-Несветайская	16
8081	Романовская	16
8082	Ростов-на-Дону	16
8083	Рябичев	16
8084	Ряженое	16
8085	Савоськин	16
8086	Сальск	16
8087	Самарское	16
8088	Самбек	16
8089	Сандата	16
8090	Светлоречное	16
8091	Селивановская	16
8092	Семибалки	16
8093	Семикаракорск	16
8094	Сетраки	16
8095	Синегорский	16
8096	Синявское	16
8097	Сиротский	16
8098	Скосырская	16
8099	Советская (Ростовская область)	16
8100	Солонецкий	16
8101	Сорговый	16
8102	Сохрановка	16
8103	Старая Станица	16
8104	Старочеркасская	16
8105	Стефанидинодар	16
8106	Сулин	16
8107	Сухой	16
8108	Табунщиково	16
8109	Таганрог	16
8110	Таганрогский	16
8111	Тарасовский	16
8112	Тацинская	16
8113	Тополевый	16
8114	Углегорский	16
8115	Углеродовский	16
8116	Усть-Донецкий	16
8117	Хуторской	16
8118	Целина	16
8119	Цимлянск	16
8120	Чалтырь	16
8121	Чапаев	16
8122	Чернышевка	16
8123	Чертково	16
8124	Чирский	16
8125	Чистоозерный	16
8126	Шахты	16
8127	Шептуховка	16
8128	Шолоховский	16
8129	Шумилинская	16
8130	Экспериментальный	16
8131	Южный (Ростовская область)	16
8132	Юловский	16
8133	Яблоновский	16
8134	Белозерка	89
8135	Берислав	89
8136	Великая Александровка	89
8137	Великая Лепетиха	89
8138	Великие Копани	89
8139	Верхний Рогачик	89
8140	Высокополье	89
8141	Геническ	89
8142	Голая Пристань	89
8143	Горностаевка	89
8144	Ивановка (Херсонская область)	89
8145	Каланчак	89
8146	Каховка	89
8147	Нижние Серогозы	89
8148	Новая Каховка	89
8149	Нововоронцовка	89
8150	Новотроицкое	89
8151	Скадовск	89
8152	Таврийск	89
8153	Херсон	89
8154	Цюрупинск	89
8155	Чаплинка	89
\.


--
-- TOC entry 3608 (class 0 OID 16502)
-- Dependencies: 213
-- Data for Name: citizenships; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.citizenships (id, name) FROM stdin;
1	Российская Федерация
2	Республика Беларусь
3	Республика Азербайджан
4	Республика Армения
5	Республика Казахстан
6	Республика Молдовы
\.


--
-- TOC entry 3655 (class 0 OID 16855)
-- Dependencies: 260
-- Data for Name: conditions; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.conditions (id, name, vacancy_id) FROM stdin;
1	Культура открытости и взаимопомощи: у нас работают люди, вовлеченные в процесс и небезразличные к тому, что они делают	1
2	Реальные задачи, которые мы дадим решать во время стажировки	1
3	Реальные задачи, которые мы дадим решать во время	2
4	Стажировки	2
5	Премия за решение сложных кейсов	2
6	Гибкий график	2
7	Реальные задачи, которые мы дадим решать во время	3
8	Стажировки	3
9	Премия за решение сложных кейсов	3
10	Гибкий график	3
11	Гибкий график	4
14	гибкий график	8
15	реальные задачи	8
16	гибкий график	9
17	реальные задачи	9
\.


--
-- TOC entry 3612 (class 0 OID 16516)
-- Dependencies: 217
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.courses (id, name) FROM stdin;
1	1 (бакалавриат)
2	2 (бакалавриат)
3	3 (бакалавриат)
4	4 (бакалавриат)
5	1 (магистратура)
6	2 (магистратура)
\.


--
-- TOC entry 3643 (class 0 OID 16707)
-- Dependencies: 248
-- Data for Name: curators; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.curators (id, training_direction_id) FROM stdin;
1	1
\.


--
-- TOC entry 3614 (class 0 OID 16523)
-- Dependencies: 219
-- Data for Name: directions; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.directions (id, name) FROM stdin;
54	01.03.02 Прикладная математика и информатика
55	01.03.03 Механика и математическое моделирование
56	01.03.04 Прикладная математика
57	01.03.05 Статистика
58	01.04.02 Прикладная математика и информатика
59	01.04.04 Прикладная математика
60	02.03.01 Математика и компьютерные науки
61	02.03.02 Фундаментальная информатика и информационные технологии
62	02.03.03 Математическое обеспечение и администрирование информационных систем
63	02.04.02 Фундаментальная информатика и информационные технологии
64	02.04.03 Математическое обеспечение и администрирование информационных систем
65	09.03.01 Информатика и вычислительная техника
66	09.03.02 Информационные системы и технологии
67	09.03.03 Прикладная информатика
68	09.04.01 Информатика и вычислительная техника
69	09.04.02 Информационные системы и технологии
70	09.04.03 Прикладная информатика
71	10.03.01 Информационная безопасность
72	10.04.01 Информационная безопасность
73	10.05.01 Компьютерная безопасность
74	10.05.03 Информационная безопасность автоматизированных систем
75	11.03.01 Радиотехника
76	11.03.02 Инфокоммуникационные технологии и системы связи
77	11.03.03 Конструирование и технология электронных средств
78	11.03.04 Электроника и наноэлектроника
53	01.03.01 Математика
\.


--
-- TOC entry 3657 (class 0 OID 16867)
-- Dependencies: 262
-- Data for Name: duties; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.duties (id, name, vacancy_id) FROM stdin;
1	Модульная разработка	1
2	Тестирование существующих решений (поиск и устранение)	1
3	Разработка макетов веб-приложений	2
4	Верстка страниц сайта	3
5	Разработка моделей	4
7	Выполнение порученных задач.\nСоставление диаграмм бизнеспроцессо	8
8	Выполнение порученных задач.\nРасчет сметы проектов	9
\.


--
-- TOC entry 3628 (class 0 OID 16633)
-- Dependencies: 233
-- Data for Name: employment_types; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.employment_types (id, name) FROM stdin;
1	Полная занятость
2	Частичная занятость
3	Проектная работа/разовое задание
4	Волонтерство
5	Стажировка
\.


--
-- TOC entry 3645 (class 0 OID 16723)
-- Dependencies: 250
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.events (id, name, description, date, speaker_id) FROM stdin;
\.


--
-- TOC entry 3663 (class 0 OID 16918)
-- Dependencies: 268
-- Data for Name: history_work_experiences; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.history_work_experiences (id, organization, post, year_begin, year_end, intern_id) FROM stdin;
\.


--
-- TOC entry 3647 (class 0 OID 16751)
-- Dependencies: 252
-- Data for Name: hrs; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.hrs (id, organization_id) FROM stdin;
3	2
\.


--
-- TOC entry 3624 (class 0 OID 16589)
-- Dependencies: 229
-- Data for Name: interns; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.interns (id, university_id, course_id, direction_id, internship_status_id, training_direction_id, volunteering, about_me, branch_id, github, vk, portfolio, url_portfolio, organizations, work_experience_id, organization_id) FROM stdin;
5	2	2	69	1	2	t	Городской волонтер, активист в вузе.	4	\N	\N	\N	\N	\N	3	\N
4	1	3	66	2	1	f	Люблю программировать, занимаюсь робототехникой	2	https://github.com/Vaynbaum	https://vk.com/mr.vaynbaum	\N	B/4_portfolio.pdf	НГТУ	3	2
13	8	3	66	1	\N	\N		\N				\N		2	\N
14	1	4	66	1	1	\N	Занимаюсь на базе института front-end разработкой. Участвовал в конкурсах. Опыт в разработке около двух лет.	2		https://vk.com/e.lipatov		\N	Friend Lee	3	2
15	2	3	53	1	4	\N		11				\N		2	\N
16	6	2	76	1	3	\N		4				\N	АНО "Моспром"	3	5
17	1	3	74	1	1	\N		31				\N	АНО "Цифровая трансформация"	3	\N
18	8	4	66	1	1	\N		5				\N	АНО "Агентство креативных индустрий"	3	3
19	1	3	66	1	1	\N	Я макс	31	g	g	d	c/19_portfolio.pdf	Политех	3	2
\.


--
-- TOC entry 3616 (class 0 OID 16530)
-- Dependencies: 221
-- Data for Name: internship_statuses; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.internship_statuses (id, name) FROM stdin;
1	В поисках стажировки
2	Стажируется
3	Окончил стажировку
\.


--
-- TOC entry 3690 (class 0 OID 17124)
-- Dependencies: 295
-- Data for Name: interviews; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.interviews (id, comment, name, answer, value, type_interview_id, selection_id, mentor_id, passed, date) FROM stdin;
\.


--
-- TOC entry 3700 (class 0 OID 17328)
-- Dependencies: 305
-- Data for Name: invations; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.invations (code, email, role_id, created) FROM stdin;
KpOQyeewlTmeVmED36jmXjpet4zehIfAhZh0xP7fvVE	maksim228775@gmail.com	2	2023-05-28 22:03:44.625175
zQRnGU8RjBnQg5HB04tNNaY-kGSsWSNxoWuu1EA66DI	katsumiproo@gmail.com	3	2023-05-28 23:20:12.279153
\.


--
-- TOC entry 3668 (class 0 OID 16967)
-- Dependencies: 273
-- Data for Name: language_interns; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.language_interns (language_id, intern_id) FROM stdin;
\.


--
-- TOC entry 3667 (class 0 OID 16961)
-- Dependencies: 272
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.languages (id, name) FROM stdin;
\.


--
-- TOC entry 3693 (class 0 OID 17197)
-- Dependencies: 298
-- Data for Name: mentor_reviews; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.mentor_reviews (id, text, value, mentor_id, intern_id) FROM stdin;
\.


--
-- TOC entry 3648 (class 0 OID 16766)
-- Dependencies: 253
-- Data for Name: mentors; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.mentors (id, organization_id) FROM stdin;
2	2
\.


--
-- TOC entry 3665 (class 0 OID 16932)
-- Dependencies: 270
-- Data for Name: metros; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.metros (id, name) FROM stdin;
1	Пятницкое шоссе
2	Митино
3	Волоколамская
4	Мякинино
5	Строгино
6	Крылатское
7	Молодежная
8	Кунцевская
9	Славянский бульвар
10	Парк Победы
11	Киевская
12	Смоленская
13	Арбатская
14	Площадь Революции
15	Курская
16	Бауманская
17	Электрозаводская
18	Семеновская
19	Партизанская
20	Измайловская
21	Первомайска
\.


--
-- TOC entry 3650 (class 0 OID 16782)
-- Dependencies: 255
-- Data for Name: organization_reviews; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.organization_reviews (id, text, value, organization_id, intern_id) FROM stdin;
2	Хорошая организация!	4	1	5
5	Хорошая организация!	4	3	4
1	Отличная организация!	5	1	4
3	Не плохая организация	3	2	4
4	Плохая организация	2	2	5
6	Отличная организация!	5	3	5
\.


--
-- TOC entry 3630 (class 0 OID 16640)
-- Dependencies: 235
-- Data for Name: organization_types; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.organization_types (id, name) FROM stdin;
1	Автономная некоммерческая организация (АНО)
2	Акционерное общество (АО)
3	Государственное бюджетное учреждение (ГБУ)
4	Государственное казенное учреждение (ГКУ)
5	Государственное унитарное предприятие (ГУП)
6	Департамент
7	Информационный центр
8	Научно-исследовательский институт (НИИ)
9	Организационно-аналитическое управление
10	Публичное акционерное общество (ПАО)
11	Подведомственное учреждение
\.


--
-- TOC entry 3642 (class 0 OID 16684)
-- Dependencies: 247
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.organizations (id, name, description, img, address, latitude, longitude, email, phone, training_direction_id, branch_id, type_id) FROM stdin;
4	"Технополис Москва"	Создание удобной инфраструктуры для развития инновационных компаний на территории Москвы	data:image/png;base64,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	109316 г. Москва, Волгоградский проспект, д. 42 корп. 13	55.71019	37.721265	office@technomoscow.ru	+74956470818	6	33	2
1	Автономная некоммерческая организация "Московский экспортный центр"	Московский экспортный центр — это «единое окно», где московские предприниматели могут бесплатно получить финансовую и нефинансовую поддержку экспортной деятельности.	https://moscow-export.com/bitrix/templates/addeo_copy/img/new/logo.svg	109028, Россия, Москва,\nХохловский переулок, 10с1	55.756422	37.645618	info@moscow-export.ru	+7 (499) 288-85-01	4	1	1
2	ГБУ "Агентство инноваций Москвы"	Агентство работает над развитием инновационной экосистемы Москвы, формируя бизнес-комьюнити для нетворкинга стартапов, корпораций, инвесторов и города. Наша команда реализует сотрудничество с международными хабами, позволяя открывать новые глобальные технологические рынки для инновационного предпринимательства Москвы.	https://ucare.timepad.ru/2acf4ec0-e7c6-4095-b847-6bc0f26cb2f5/-/preview/280x800/	Москва, ул. Арбат, д.1	55.751817	37.599292	ic@develop.mos.ru	+7 (499) 225 9252	1	31	3
3	АНО "Агентство креативных индустрий"	Агентство креативных индустрий создано Правительством Москвы в 2020 году для поддержки и развития творческого бизнеса. Оно является единым окном для взаимодействия органов власти и представителей креативного предпринимательства.	data:image/png;base64,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	125009, Россия, Москва Вознесенский пер. 11. стр. 2	55.758767	37.604753	info@moscow-creative.ru	+7 495 988-30-80	7	32	1
5	АНО "Агентство стратегического развития города Москвы"	Агентство стратегического развития Москвы, подведомственная организация Департамента экономической политики и развития города Москвы, ключевым направлением работы которого является реализация национального проекта «Производительность труда».	https://ano.msk.ru/images/tild3165-3963-4163-a365-626437653163__logo_ano.svg	г. Москва, Большой Кисловский пер., д. 6	55.754527	37.60664	info@ano.msk.ru	+7 (495) 120-81-41	4	32	1
6	АНО "Московская дирекция транспортного обслуживания"	Автономная некоммерческая организация «Московская дирекция транспортного обслуживания» учреждена в соответствии с распоряжением Мэра Москвы С.С. Собянина от    14 августа 2019 года № 434-РП для совершенствования транспортного обслуживания населения и организаций, осуществляющих проведение развлекательных, культурных, спортивных мероприятий, а также обеспечения транспортом объектов массового посещения в городе Москве.\n\nПравительство Москвы в лице Департамента транспорта и развития дорожно-транспортной инфраструктуры города Москвы осуществляет от имени города Москвы полномочия единственного учредителя автономной некоммерческой организации «Московская дирекция транспортного обслуживания».	https://mdto.ru/assets/img/logo.png	Москва, ул. Никольская, д. 11/13, стр. 4.	55.75705	37.621273	​​mdto@transport.mos.ru	+7 (499) 652-62-40	6	1	1
\.


--
-- TOC entry 3606 (class 0 OID 16469)
-- Dependencies: 211
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.permissions (role_id, url, type) FROM stdin;
\.


--
-- TOC entry 3699 (class 0 OID 17292)
-- Dependencies: 304
-- Data for Name: presences; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.presences (id, intern_id, vacancy_id, mentor_id, status, date, hour) FROM stdin;
2	4	1	2	Был	2023-05-27 00:00:00	5
1	4	1	2	Не был	2023-05-28 00:00:00	0
3	4	1	2	Отпуск	2023-05-26 00:00:00	0
\.


--
-- TOC entry 3623 (class 0 OID 16579)
-- Dependencies: 228
-- Data for Name: recoveries; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.recoveries (code, user_id, created) FROM stdin;
\.


--
-- TOC entry 3610 (class 0 OID 16509)
-- Dependencies: 215
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.regions (id, name) FROM stdin;
1	Нижегородская область
2	Москва
3	Московская область
4	Санкт-Петербург
5	Свердловская область
6	Республика Татарстан
7	Республика Крым
8	Новосибирская область
9	Омская область
10	Волгоградская область
11	Челябинская область
12	Краснодарский край
13	Самарская область
14	Севастополь
15	Республика Башкортостан
16	Ростовская область
17	Воронежская область
18	Пермский край
19	Кировская область
20	Рязанская область
21	Республика Марий Эл
22	Удмуртская Республика
23	Чувашская Республика
24	Забайкальский край
25	Иркутская область
26	Красноярский край
27	Республика Бурятия
28	Республика Саха (Якутия)
29	Республика Тыва
30	Республика Хакасия
31	Донецкая область
32	Алтайский край
33	Кемеровская область
34	Республика Алтай
35	Томская область
36	Амурская область
37	Еврейская АО
38	Камчатский край
39	Магаданская область
40	Приморский край
41	Сахалинская область
42	Хабаровский край
43	Чукотский АО
44	Запорожская область
45	Архангельская область
46	Калининградская область
47	Ленинградская область
48	Мурманская область
49	Ненецкий АО
50	Новгородская область
51	Псковская область
52	Республика Карелия
53	Республика Коми
54	Смоленская область
55	Владимирская область
56	Вологодская область
57	Ивановская область
58	Костромская область
59	Тверская область
60	Ярославская область
61	Оренбургская область
62	Пензенская область
63	Республика Мордовия
64	Саратовская область
65	Ульяновская область
66	Курганская область
67	Тюменская область
68	Ханты-Мансийский АО - Югра
69	Ямало-Ненецкий АО
70	Кабардино-Балкарская республика
71	Карачаево-Черкесская Республика
72	Республика Адыгея
73	Республика Дагестан
74	Республика Ингушетия
75	Республика Северная Осетия-Алания
76	Ставропольский край
77	Чеченская республика
78	Луганская область
79	Белгородская область
80	Брянская область
81	Калужская область
82	Курская область
83	Липецкая область
84	Орловская область
85	Тамбовская область
86	Тульская область
87	Астраханская область
88	Республика Калмыкия
89	Херсонская область
\.


--
-- TOC entry 3659 (class 0 OID 16879)
-- Dependencies: 264
-- Data for Name: requirements; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.requirements (id, name, vacancy_id) FROM stdin;
1	Знание одного из языков программирования (С++, Python, Java, Golang, PHP)	1
2	Отличное знание алгоритмов и структур данных	1
3	Опыт разработки в Unix или Linux (приветствуется)	1
4	Знание основ дизайна	2
5	Опыт работы с Tilda	2
6	Уверенное пользование Figma	2
7	Знание основ python	3
8	Опыт работы с SPA-фреймворками	3
9	Знание CSS, html	3
10	Python	4
11	Знание ML	4
17	высшее или неоконченное высшее образование	8
18	аналитический склад ума, умение структурного представления информации	8
19	внимательность к деталям	8
20	понимание основ баз данных, умение составлять SQLзапросы или запросы MongoDB	8
21	умение составлять диаграммы бизнеспроцессов	8
22	Основы порядка разработки бизнеспланов	9
23	Основ экономики и организации производства	9
\.


--
-- TOC entry 3676 (class 0 OID 17019)
-- Dependencies: 281
-- Data for Name: response_statuses; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.response_statuses (id, name) FROM stdin;
1	На рассмотрение
2	Подтверждено
3	Отказано
\.


--
-- TOC entry 3686 (class 0 OID 17098)
-- Dependencies: 291
-- Data for Name: responses; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.responses (id, comment, response_status_id, selection_id, passed) FROM stdin;
71	\N	3	71	f
72	\N	3	72	f
73	\N	3	73	f
74	\N	3	74	f
78	\N	2	78	t
75	\N	3	75	t
76	\N	3	76	t
77	\N	3	77	t
79	\N	2	79	t
80	\N	2	80	t
69	\N	2	69	t
67	\N	3	67	t
68	\N	3	68	t
70	\N	3	70	t
\.


--
-- TOC entry 3605 (class 0 OID 16395)
-- Dependencies: 210
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.roles (id, name) FROM stdin;
1	Наставник
2	Куратор
3	Кадровый специалист
4	Стажер
\.


--
-- TOC entry 3684 (class 0 OID 17084)
-- Dependencies: 289
-- Data for Name: scholls; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.scholls (id, value, comment, passed, intern_id) FROM stdin;
4	50	\N	t	4
5	50	\N	t	13
6	\N	\N	f	14
7	50	\N	t	19
\.


--
-- TOC entry 3691 (class 0 OID 17168)
-- Dependencies: 296
-- Data for Name: selection_basic_tests; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.selection_basic_tests (basic_test_id, selection_id) FROM stdin;
22	69
23	69
24	69
25	78
26	78
27	78
28	79
29	79
30	79
31	80
32	80
33	80
\.


--
-- TOC entry 3678 (class 0 OID 17026)
-- Dependencies: 283
-- Data for Name: selections; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.selections (id, vacancy_id, stage_id, intern_id, school_id) FROM stdin;
67	2	1	4	\N
68	4	1	4	\N
70	3	1	4	\N
69	1	3	4	4
71	2	1	5	\N
72	4	1	5	\N
73	1	1	5	\N
74	3	1	5	\N
75	2	1	13	\N
76	4	1	13	\N
77	1	1	13	\N
78	3	5	13	5
79	3	2	14	6
80	1	5	19	7
\.


--
-- TOC entry 3646 (class 0 OID 16736)
-- Dependencies: 251
-- Data for Name: skill_interns; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.skill_interns (skill_id, intern_id) FROM stdin;
2	5
40	5
1	4
2	4
3	4
9	4
8	4
1	13
11	4
59	19
\.


--
-- TOC entry 3653 (class 0 OID 16839)
-- Dependencies: 258
-- Data for Name: skill_vacancies; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.skill_vacancies (skill_id, vacancy_id) FROM stdin;
39	1
40	1
34	8
15	8
18	8
50	8
17	9
10	9
2	9
60	9
61	9
\.


--
-- TOC entry 3640 (class 0 OID 16677)
-- Dependencies: 245
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.skills (id, name) FROM stdin;
1	Angular
2	Python
3	C#
4	CSS
5	Java
6	Html
7	Json
8	Docker
9	JavaScript
10	C++
11	DataScients
12	ML
13	Kotlin
14	PostgreSQL
15	MySQL
16	Photoshop
17	MatLab
18	PHP
19	android
20	Баг-трекингы
21	UX/UI
22	Техническая документация
24	Agile
25	Анализ рисков
26	Стратегическое планирование
27	Финансовая модель
28	Юнит-экономика
29	Информационная безопасность
30	DevSecOps
31	Linux
32	Windows
33	Форензика
34	NodeJS
35	Figma
36	Антивирусная защита
37	Настройка ПО
38	Проектирование сетей
39	Техническая поддержка
40	Аналитика
41	Программирование
42	Математика
23	Английский язык
43	Английский язык
46	Adobe Illustrator
47	Креативность
48	Векторная графика
49	Грамотная речь
50	Git
51	Тестирование
52	Backend
53	Frontend
54	Реклама
55	Продвижение бренда
56	PR
57	SMM
58	Пользователь ПК
59	AutoCad
60	Техническая
61	документация
62	null
\.


--
-- TOC entry 3638 (class 0 OID 16668)
-- Dependencies: 243
-- Data for Name: speakers; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.speakers (id, email, password, firstname, lastname, patronymic, img) FROM stdin;
\.


--
-- TOC entry 3674 (class 0 OID 17012)
-- Dependencies: 279
-- Data for Name: stages; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.stages (id, name) FROM stdin;
1	Отклик
4	Кейс-чемпионат
5	Собеседование
2	Тестирование/Карьерная школа
3	Подтверждено
6	Отказано
\.


--
-- TOC entry 3695 (class 0 OID 17218)
-- Dependencies: 300
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.tasks (id, vacancy_id, training_direction_id, url_portfolio, mentor_id) FROM stdin;
3	1	1	r_2_interview.docx	2
4	1	2	q_2_interview.docx	2
\.


--
-- TOC entry 3632 (class 0 OID 16647)
-- Dependencies: 237
-- Data for Name: training_directions; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.training_directions (id, name) FROM stdin;
1	IT-город
2	Медийный город
3	Социальный город
4	Комфортная городская среда
5	Правовое пространство
6	Городская экономика
7	HR-город
\.


--
-- TOC entry 3672 (class 0 OID 17005)
-- Dependencies: 277
-- Data for Name: type_basic_tests; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.type_basic_tests (id, name) FROM stdin;
1	Русский язык
2	Компьютерная грамотность
3	Анализ информации
\.


--
-- TOC entry 3688 (class 0 OID 17117)
-- Dependencies: 293
-- Data for Name: type_interviews; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.type_interviews (id, name) FROM stdin;
1	Кейс
2	Тестирование
3	Собеседование
\.


--
-- TOC entry 3618 (class 0 OID 16537)
-- Dependencies: 223
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.universities (id, name, city_id, sub) FROM stdin;
1	Нижегородский государственный технический университет им. Р.Е. Алексеева	1	НГТУ им. Р.Е. Алексеева
2	Московский государственный технический университет имени Н. Э. Баумана	2	МГТУ им. Н. Э. Баумана
3	Национальный исследовательский университет «Высшая школа экономики»	1	НИУ ВШЭ
4	Национальный исследовательский технологический университет МИСИС	2	МИСИС
5	Санкт-Петербургский государственный университет	3	СПбГУ
6	Университет ИТМО	3	ИТМО
7	Севастопольский государственный университет	12	СевГУ
8	ФГАОУ ВО ННГУ им. Н. И. Лобачевского	1	ННГУ
9	НГСХА	1	НГСХА
10	Нижегородский государственный лингвистический университет им. Н. А. Добролюбова	1	НГЛУ
11	Нижегородский институт управления - филиал РАНХиГС	1	РАНХиГС
\.


--
-- TOC entry 3622 (class 0 OID 16556)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.users (id, email, phone, password, firstname, lastname, patronymic, birthdate, img, role_id, city_id, citizenship_id, nickname, gender, is_verified) FROM stdin;
15	marina.2000@yandex.ru	+74565875164	$2b$12$hxA7GR.sew2UJdWuDaOANe7AQV0tVjgY483YHMYMNJN1e/J.99/cq	Марина	Фёдорова	Викторовна	2002-07-25 00:00:00	F/15.jpg	4	2	1	marina.2000_tornado	\N	f
5	romanova@mail.ru	+7 (990) 454-15-16	$2b$12$KGnsjv.UIgRq5qHUr8jb/.zkYGGq13hAzFx5zctZthhyrO4PhuFlW	Ольга	Романова	Ивановна	2000-11-06 00:00:00	\N	4	2	1	Romanova_o	f	f
17	Sokol.02@mail.ru	+79614752296	$2b$12$8j3BlSu5q2jpUeSeWxNscePTNoddtb/W.3pSXmAhfM4gZR1nzlU/2	Евгений	Соколов	Игоревич	2002-12-12 00:00:00	e/17.jpg	4	1	1	sokol.02_tapir	\N	f
2	volkov@mail.ru	+7 (959) 653-80-21	$2b$12$KGnsjv.UIgRq5qHUr8jb/.zkYGGq13hAzFx5zctZthhyrO4PhuFlW	Андрей	Волков	Андреевич	1988-11-11 00:00:00	\N	1	2	1	volk	t	t
1	kurskaya@mail.ru	+7 (948) 818-80-46	$2b$12$KGnsjv.UIgRq5qHUr8jb/.zkYGGq13hAzFx5zctZthhyrO4PhuFlW	Анна	Курская	Васильевна	1998-04-11 00:00:00	\N	2	2	1	A_kursk	f	t
18	Leo.Var@yandex.ru	+79157462359	$2b$12$LP07JEe1666XolJe94MrQOWIsyvoy6t2lrdDG3nKEoXG9CBKKP.zy	Варвара	Леонтьева	Сергеевна	2001-02-01 00:00:00	W/18.jpg	4	1	1	leo.var_situation	f	f
14	e.lipatov@mail.ru	+79568475123	$2b$12$lWue23FCzXHntEjqDe8JhOWXszzhpwLiPB1fNpeoT/p0q4xrh7/E2	Евгений	Липатов	Дмитриевич	2001-05-12 00:00:00	m/14.jpg	4	1	1	e.lipatov_dumpling	t	f
16	vas.lena@gmail.com	+79637518569	$2b$12$.LuL/CvlTlL9U7CsT69Yq.DVEPVermGnXaLkzIv5z00o7pHl2k6wS	Елена	Васнецова	Петровна	2003-08-15 00:00:00	b/16.jpg	4	2	1	vas.lena_politics	\N	f
3	burova@mail.ru	+7 (916) 802-68-43	$2b$12$KGnsjv.UIgRq5qHUr8jb/.zkYGGq13hAzFx5zctZthhyrO4PhuFlW	Анастасия	Бурова	Андреевна	1995-01-10 00:00:00	\N	3	2	1	burova	f	t
19	maksim228775@gmail.com	+79290513941	$2b$12$s335G4fZKg8zkzF5fqtHQ.Nb7/JkjkVCPI9OS4CqwJV04dTu0n1Ly	Максим	Исаев	Александрович	2002-02-20 00:00:00	j/19.jpg	4	2	1	maksim228775_family	t	t
4	mr.vaynbaum@mail.ru	+7 (952) 462-16-55	$2b$12$p2FI4cK4J.2bqi/W2oONEO2M1CQk8CWaJMb1ShkJSpjocIbxUpqbe	Денис	Вайнбаум	Алексеевич	2003-01-16 00:00:00	i/4.jpg	4	144	1	mr.vaynbaum_rabbit	t	t
13	vaynbaum50@gmail.com	89308165479	$2b$12$PXtX9V7nKNUFxDz2WFb0meJjrbpl2RWobQjmFHN2WcUyF8cRRdTm2	Иван	Иванов	Иванович	1999-07-16 00:00:00	\N	4	144	1	vaynbaum50_dangerous	t	f
\.


--
-- TOC entry 3652 (class 0 OID 16801)
-- Dependencies: 257
-- Data for Name: vacancies; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.vacancies (id, name, description, min_salary, max_salary, date_begin, date_end, published, work_schedule_id, organization_id, employment_type_id, hr_creater_id, mentor_id, work_experience_id, status_id, cnt_intern) FROM stdin;
8	Стажер-аналитик	Необходим стажер-аналитик. При положительных результатах стажировки мы предложим должность младшего аналитика и подготовим план индивидуального развития.	10000	30000	2023-09-06 00:00:00	2023-07-17 00:00:00	f	3	2	5	3	\N	3	2	2
1	Стажер-разработчик по backend-разработке	Если вам интересно заниматься решениями для масштабных проектов, приходите к нам. Здесь вам предстоит работать с высоконагруженными отказоустойчивыми системами и сталкиваться с действительно интересными инженерными задачами.	0	0	2023-06-01 00:00:00	2023-09-13 00:00:00	t	3	2	5	3	2	3	3	1
2	UX/UI-дизайнер	Необходим дизайнер для разработки макетов сложных веб-приложений. Опыт работы приветствуется.	0	0	2023-06-01 00:00:00	2023-09-13 00:00:00	t	3	1	5	\N	\N	2	3	2
3	Стажер-разработчик по frotend-разработке	Ищем фротенд-разработчика. Опыт работы и портфолио приветствуются.	0	0	2023-06-01 00:00:00	2023-09-13 00:00:00	t	3	1	5	\N	\N	3	3	2
4	Стажер по ml-разработке	Ищем ml-разработчика. Предлагаем обучение и карьерный рост.	0	0	2023-06-01 00:00:00	2023-09-13 00:00:00	t	3	3	5	\N	\N	2	3	3
9	Стажер-экономист	Если вам интересна экономика и вы хотите развиваться в этой сфере, то мы Вас ждем!	12000	30000	2023-05-27 00:00:00	2023-08-25 00:00:00	f	3	2	5	3	\N	2	1	1
\.


--
-- TOC entry 3661 (class 0 OID 16891)
-- Dependencies: 266
-- Data for Name: vacancy_reviews; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.vacancy_reviews (id, text, value, vacancy_id, intern_id) FROM stdin;
\.


--
-- TOC entry 3697 (class 0 OID 17240)
-- Dependencies: 302
-- Data for Name: vacancy_statuses; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.vacancy_statuses (id, name) FROM stdin;
1	На рассмотрении
2	Корректировка
3	Опубликовано
4	Отказано
\.


--
-- TOC entry 3634 (class 0 OID 16654)
-- Dependencies: 239
-- Data for Name: work_experiences; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.work_experiences (id, name) FROM stdin;
2	Нет опыта
3	От 1 года до 3 лет
4	От 3 до 6 лет
5	Более 6 лет
\.


--
-- TOC entry 3636 (class 0 OID 16661)
-- Dependencies: 241
-- Data for Name: work_schedules; Type: TABLE DATA; Schema: public; Owner: hack_db_3kwr_user
--

COPY public.work_schedules (id, name) FROM stdin;
1	Полный день
2	Сменный график
3	Гибкий график
4	Удаленная работа
5	Вахтовый метод
\.


--
-- TOC entry 3750 (class 0 OID 0)
-- Dependencies: 274
-- Name: basic_test_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.basic_test_statuses_id_seq', 1, false);


--
-- TOC entry 3751 (class 0 OID 0)
-- Dependencies: 284
-- Name: basic_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.basic_tests_id_seq', 33, true);


--
-- TOC entry 3752 (class 0 OID 0)
-- Dependencies: 230
-- Name: branchs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.branchs_id_seq', 31, true);


--
-- TOC entry 3753 (class 0 OID 0)
-- Dependencies: 286
-- Name: championships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.championships_id_seq', 1, false);


--
-- TOC entry 3754 (class 0 OID 0)
-- Dependencies: 224
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.cities_id_seq', 8155, true);


--
-- TOC entry 3755 (class 0 OID 0)
-- Dependencies: 212
-- Name: citizenships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.citizenships_id_seq', 8, true);


--
-- TOC entry 3756 (class 0 OID 0)
-- Dependencies: 259
-- Name: conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.conditions_id_seq', 17, true);


--
-- TOC entry 3757 (class 0 OID 0)
-- Dependencies: 216
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, false);


--
-- TOC entry 3758 (class 0 OID 0)
-- Dependencies: 218
-- Name: directions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.directions_id_seq', 81, true);


--
-- TOC entry 3759 (class 0 OID 0)
-- Dependencies: 261
-- Name: duties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.duties_id_seq', 8, true);


--
-- TOC entry 3760 (class 0 OID 0)
-- Dependencies: 232
-- Name: employment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.employment_types_id_seq', 5, true);


--
-- TOC entry 3761 (class 0 OID 0)
-- Dependencies: 249
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- TOC entry 3762 (class 0 OID 0)
-- Dependencies: 267
-- Name: history_work_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.history_work_experiences_id_seq', 1, false);


--
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 220
-- Name: internship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.internship_statuses_id_seq', 1, false);


--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 294
-- Name: interviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.interviews_id_seq', 1, false);


--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 271
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.languages_id_seq', 1, false);


--
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 297
-- Name: mentor_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.mentor_reviews_id_seq', 1, false);


--
-- TOC entry 3767 (class 0 OID 0)
-- Dependencies: 269
-- Name: metros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.metros_id_seq', 21, true);


--
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 254
-- Name: organization_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.organization_reviews_id_seq', 1, false);


--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 234
-- Name: organization_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.organization_types_id_seq', 1, false);


--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 246
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.organizations_id_seq', 6, true);


--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 303
-- Name: presences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.presences_id_seq', 3, true);


--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 214
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.regions_id_seq', 89, true);


--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 263
-- Name: requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.requirements_id_seq', 23, true);


--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 280
-- Name: response_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.response_statuses_id_seq', 1, false);


--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 290
-- Name: responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.responses_id_seq', 80, true);


--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 209
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 288
-- Name: scholls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.scholls_id_seq', 7, true);


--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 282
-- Name: selections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.selections_id_seq', 80, true);


--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 244
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.skills_id_seq', 62, true);


--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 242
-- Name: speakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.speakers_id_seq', 1, false);


--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 278
-- Name: stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.stages_id_seq', 1, false);


--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 299
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.tasks_id_seq', 4, true);


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 236
-- Name: training_directions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.training_directions_id_seq', 1, false);


--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 276
-- Name: type_basic_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.type_basic_tests_id_seq', 1, false);


--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 292
-- Name: type_interviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.type_interviews_id_seq', 1, false);


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 222
-- Name: universities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.universities_id_seq', 12, true);


--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.users_id_seq', 25, true);


--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 256
-- Name: vacancies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.vacancies_id_seq', 9, true);


--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 265
-- Name: vacancy_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.vacancy_reviews_id_seq', 1, false);


--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 301
-- Name: vacancy_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.vacancy_statuses_id_seq', 1, false);


--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 238
-- Name: work_experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.work_experiences_id_seq', 5, true);


--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 240
-- Name: work_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hack_db_3kwr_user
--

SELECT pg_catalog.setval('public.work_schedules_id_seq', 5, true);


--
-- TOC entry 3360 (class 2606 OID 17003)
-- Name: basic_test_statuses basic_test_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.basic_test_statuses
    ADD CONSTRAINT basic_test_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 17053)
-- Name: basic_tests basic_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.basic_tests
    ADD CONSTRAINT basic_tests_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 16631)
-- Name: branchs branchs_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.branchs
    ADD CONSTRAINT branchs_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 17077)
-- Name: championships championships_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.championships
    ADD CONSTRAINT championships_pkey PRIMARY KEY (id);


--
-- TOC entry 3302 (class 2606 OID 16549)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 16507)
-- Name: citizenships citizenships_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.citizenships
    ADD CONSTRAINT citizenships_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 16860)
-- Name: conditions conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.conditions
    ADD CONSTRAINT conditions_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 16521)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 16711)
-- Name: curators curators_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.curators
    ADD CONSTRAINT curators_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 16528)
-- Name: directions directions_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.directions
    ADD CONSTRAINT directions_pkey PRIMARY KEY (id);


--
-- TOC entry 3346 (class 2606 OID 16872)
-- Name: duties duties_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.duties
    ADD CONSTRAINT duties_pkey PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 16638)
-- Name: employment_types employment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.employment_types
    ADD CONSTRAINT employment_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 16730)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 16925)
-- Name: history_work_experiences history_work_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.history_work_experiences
    ADD CONSTRAINT history_work_experiences_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 16755)
-- Name: hrs hrs_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.hrs
    ADD CONSTRAINT hrs_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 16593)
-- Name: interns interns_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 16535)
-- Name: internship_statuses internship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.internship_statuses
    ADD CONSTRAINT internship_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 3380 (class 2606 OID 17131)
-- Name: interviews interviews_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interviews
    ADD CONSTRAINT interviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3392 (class 2606 OID 17334)
-- Name: invations invations_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.invations
    ADD CONSTRAINT invations_pkey PRIMARY KEY (code);


--
-- TOC entry 3358 (class 2606 OID 16971)
-- Name: language_interns language_interns_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.language_interns
    ADD CONSTRAINT language_interns_pkey PRIMARY KEY (language_id, intern_id);


--
-- TOC entry 3356 (class 2606 OID 16966)
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- TOC entry 3384 (class 2606 OID 17204)
-- Name: mentor_reviews mentor_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.mentor_reviews
    ADD CONSTRAINT mentor_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 16770)
-- Name: mentors mentors_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 16937)
-- Name: metros metros_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.metros
    ADD CONSTRAINT metros_pkey PRIMARY KEY (id);


--
-- TOC entry 3338 (class 2606 OID 16789)
-- Name: organization_reviews organization_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organization_reviews
    ADD CONSTRAINT organization_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 16645)
-- Name: organization_types organization_types_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organization_types
    ADD CONSTRAINT organization_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 16691)
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 16473)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (role_id, url, type);


--
-- TOC entry 3390 (class 2606 OID 17297)
-- Name: presences presences_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.presences
    ADD CONSTRAINT presences_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 16583)
-- Name: recoveries recoveries_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.recoveries
    ADD CONSTRAINT recoveries_pkey PRIMARY KEY (code);


--
-- TOC entry 3292 (class 2606 OID 16514)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 16884)
-- Name: requirements requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 17024)
-- Name: response_statuses response_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.response_statuses
    ADD CONSTRAINT response_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 17105)
-- Name: responses responses_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.responses
    ADD CONSTRAINT responses_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 16400)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 17091)
-- Name: scholls scholls_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.scholls
    ADD CONSTRAINT scholls_pkey PRIMARY KEY (id);


--
-- TOC entry 3382 (class 2606 OID 17172)
-- Name: selection_basic_tests selection_basic_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.selection_basic_tests
    ADD CONSTRAINT selection_basic_tests_pkey PRIMARY KEY (basic_test_id, selection_id);


--
-- TOC entry 3368 (class 2606 OID 17031)
-- Name: selections selections_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 16740)
-- Name: skill_interns skill_interns_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.skill_interns
    ADD CONSTRAINT skill_interns_pkey PRIMARY KEY (skill_id, intern_id);


--
-- TOC entry 3342 (class 2606 OID 16843)
-- Name: skill_vacancies skill_vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.skill_vacancies
    ADD CONSTRAINT skill_vacancies_pkey PRIMARY KEY (skill_id, vacancy_id);


--
-- TOC entry 3324 (class 2606 OID 16682)
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 16675)
-- Name: speakers speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.speakers
    ADD CONSTRAINT speakers_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 17017)
-- Name: stages stages_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.stages
    ADD CONSTRAINT stages_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 17223)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 16652)
-- Name: training_directions training_directions_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.training_directions
    ADD CONSTRAINT training_directions_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 17010)
-- Name: type_basic_tests type_basic_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.type_basic_tests
    ADD CONSTRAINT type_basic_tests_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 17122)
-- Name: type_interviews type_interviews_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.type_interviews
    ADD CONSTRAINT type_interviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 16542)
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 16563)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 16808)
-- Name: vacancies vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2606 OID 16898)
-- Name: vacancy_reviews vacancy_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancy_reviews
    ADD CONSTRAINT vacancy_reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 3388 (class 2606 OID 17245)
-- Name: vacancy_statuses vacancy_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancy_statuses
    ADD CONSTRAINT vacancy_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 16659)
-- Name: work_experiences work_experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.work_experiences
    ADD CONSTRAINT work_experiences_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 16666)
-- Name: work_schedules work_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.work_schedules
    ADD CONSTRAINT work_schedules_pkey PRIMARY KEY (id);


--
-- TOC entry 3444 (class 2606 OID 17054)
-- Name: basic_tests basic_tests_basic_test_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.basic_tests
    ADD CONSTRAINT basic_tests_basic_test_status_id_fkey FOREIGN KEY (basic_test_status_id) REFERENCES public.basic_test_statuses(id);


--
-- TOC entry 3445 (class 2606 OID 17163)
-- Name: basic_tests basic_tests_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.basic_tests
    ADD CONSTRAINT basic_tests_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id) NOT VALID;


--
-- TOC entry 3446 (class 2606 OID 17059)
-- Name: basic_tests basic_tests_type_basic_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.basic_tests
    ADD CONSTRAINT basic_tests_type_basic_test_id_fkey FOREIGN KEY (type_basic_test_id) REFERENCES public.type_basic_tests(id);


--
-- TOC entry 3447 (class 2606 OID 17078)
-- Name: championships championships_selection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.championships
    ADD CONSTRAINT championships_selection_id_fkey FOREIGN KEY (selection_id) REFERENCES public.selections(id);


--
-- TOC entry 3395 (class 2606 OID 16550)
-- Name: cities cities_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- TOC entry 3432 (class 2606 OID 16861)
-- Name: conditions conditions_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.conditions
    ADD CONSTRAINT conditions_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- TOC entry 3412 (class 2606 OID 16712)
-- Name: curators curators_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.curators
    ADD CONSTRAINT curators_id_fkey FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 3413 (class 2606 OID 16717)
-- Name: curators curators_training_direction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.curators
    ADD CONSTRAINT curators_training_direction_id_fkey FOREIGN KEY (training_direction_id) REFERENCES public.training_directions(id);


--
-- TOC entry 3433 (class 2606 OID 16873)
-- Name: duties duties_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.duties
    ADD CONSTRAINT duties_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- TOC entry 3414 (class 2606 OID 16731)
-- Name: events events_speaker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_speaker_id_fkey FOREIGN KEY (speaker_id) REFERENCES public.speakers(id);


--
-- TOC entry 3437 (class 2606 OID 16926)
-- Name: history_work_experiences history_work_experiences_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.history_work_experiences
    ADD CONSTRAINT history_work_experiences_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id);


--
-- TOC entry 3417 (class 2606 OID 16756)
-- Name: hrs hrs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.hrs
    ADD CONSTRAINT hrs_id_fkey FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 3418 (class 2606 OID 16761)
-- Name: hrs hrs_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.hrs
    ADD CONSTRAINT hrs_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- TOC entry 3400 (class 2606 OID 16949)
-- Name: interns interns_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branchs(id) NOT VALID;


--
-- TOC entry 3401 (class 2606 OID 16604)
-- Name: interns interns_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 3402 (class 2606 OID 16609)
-- Name: interns interns_direction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_direction_id_fkey FOREIGN KEY (direction_id) REFERENCES public.directions(id);


--
-- TOC entry 3403 (class 2606 OID 16594)
-- Name: interns interns_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_id_fkey FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 3404 (class 2606 OID 16614)
-- Name: interns interns_internship_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_internship_status_id_fkey FOREIGN KEY (internship_status_id) REFERENCES public.internship_statuses(id);


--
-- TOC entry 3405 (class 2606 OID 16992)
-- Name: interns interns_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id) NOT VALID;


--
-- TOC entry 3406 (class 2606 OID 16910)
-- Name: interns interns_training_direction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_training_direction_id_fkey FOREIGN KEY (training_direction_id) REFERENCES public.training_directions(id) NOT VALID;


--
-- TOC entry 3407 (class 2606 OID 16599)
-- Name: interns interns_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id);


--
-- TOC entry 3408 (class 2606 OID 16987)
-- Name: interns interns_work_experience_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interns
    ADD CONSTRAINT interns_work_experience_id_fkey FOREIGN KEY (work_experience_id) REFERENCES public.work_experiences(id) NOT VALID;


--
-- TOC entry 3451 (class 2606 OID 17142)
-- Name: interviews interviews_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interviews
    ADD CONSTRAINT interviews_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- TOC entry 3452 (class 2606 OID 17137)
-- Name: interviews interviews_selection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interviews
    ADD CONSTRAINT interviews_selection_id_fkey FOREIGN KEY (selection_id) REFERENCES public.selections(id);


--
-- TOC entry 3453 (class 2606 OID 17132)
-- Name: interviews interviews_type_interview_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.interviews
    ADD CONSTRAINT interviews_type_interview_id_fkey FOREIGN KEY (type_interview_id) REFERENCES public.type_interviews(id);


--
-- TOC entry 3464 (class 2606 OID 17335)
-- Name: invations invations_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.invations
    ADD CONSTRAINT invations_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3438 (class 2606 OID 16977)
-- Name: language_interns language_interns_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.language_interns
    ADD CONSTRAINT language_interns_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id);


--
-- TOC entry 3439 (class 2606 OID 16972)
-- Name: language_interns language_interns_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.language_interns
    ADD CONSTRAINT language_interns_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- TOC entry 3456 (class 2606 OID 17210)
-- Name: mentor_reviews mentor_reviews_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.mentor_reviews
    ADD CONSTRAINT mentor_reviews_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id);


--
-- TOC entry 3457 (class 2606 OID 17205)
-- Name: mentor_reviews mentor_reviews_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.mentor_reviews
    ADD CONSTRAINT mentor_reviews_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- TOC entry 3419 (class 2606 OID 16771)
-- Name: mentors mentors_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_id_fkey FOREIGN KEY (id) REFERENCES public.users(id);


--
-- TOC entry 3420 (class 2606 OID 16776)
-- Name: mentors mentors_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- TOC entry 3421 (class 2606 OID 16795)
-- Name: organization_reviews organization_reviews_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organization_reviews
    ADD CONSTRAINT organization_reviews_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id);


--
-- TOC entry 3422 (class 2606 OID 16790)
-- Name: organization_reviews organization_reviews_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organization_reviews
    ADD CONSTRAINT organization_reviews_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- TOC entry 3409 (class 2606 OID 16697)
-- Name: organizations organizations_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branchs(id);


--
-- TOC entry 3410 (class 2606 OID 16692)
-- Name: organizations organizations_training_direction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_training_direction_id_fkey FOREIGN KEY (training_direction_id) REFERENCES public.training_directions(id);


--
-- TOC entry 3411 (class 2606 OID 16702)
-- Name: organizations organizations_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.organization_types(id);


--
-- TOC entry 3393 (class 2606 OID 16474)
-- Name: permissions permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3461 (class 2606 OID 17298)
-- Name: presences presences_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.presences
    ADD CONSTRAINT presences_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id);


--
-- TOC entry 3462 (class 2606 OID 17308)
-- Name: presences presences_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.presences
    ADD CONSTRAINT presences_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- TOC entry 3463 (class 2606 OID 17303)
-- Name: presences presences_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.presences
    ADD CONSTRAINT presences_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- TOC entry 3399 (class 2606 OID 16584)
-- Name: recoveries recoveries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.recoveries
    ADD CONSTRAINT recoveries_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3434 (class 2606 OID 16885)
-- Name: requirements requirements_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- TOC entry 3449 (class 2606 OID 17106)
-- Name: responses responses_response_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.responses
    ADD CONSTRAINT responses_response_status_id_fkey FOREIGN KEY (response_status_id) REFERENCES public.response_statuses(id);


--
-- TOC entry 3450 (class 2606 OID 17111)
-- Name: responses responses_selection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.responses
    ADD CONSTRAINT responses_selection_id_fkey FOREIGN KEY (selection_id) REFERENCES public.selections(id);


--
-- TOC entry 3448 (class 2606 OID 17191)
-- Name: scholls scholls_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.scholls
    ADD CONSTRAINT scholls_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id) NOT VALID;


--
-- TOC entry 3454 (class 2606 OID 17173)
-- Name: selection_basic_tests selection_basic_tests_basic_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.selection_basic_tests
    ADD CONSTRAINT selection_basic_tests_basic_test_id_fkey FOREIGN KEY (basic_test_id) REFERENCES public.basic_tests(id);


--
-- TOC entry 3455 (class 2606 OID 17178)
-- Name: selection_basic_tests selection_basic_tests_selection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.selection_basic_tests
    ADD CONSTRAINT selection_basic_tests_selection_id_fkey FOREIGN KEY (selection_id) REFERENCES public.selections(id);


--
-- TOC entry 3440 (class 2606 OID 17042)
-- Name: selections selections_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id);


--
-- TOC entry 3441 (class 2606 OID 17186)
-- Name: selections selections_school_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_school_id_fkey FOREIGN KEY (school_id) REFERENCES public.scholls(id) NOT VALID;


--
-- TOC entry 3442 (class 2606 OID 17037)
-- Name: selections selections_stage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_stage_id_fkey FOREIGN KEY (stage_id) REFERENCES public.stages(id);


--
-- TOC entry 3443 (class 2606 OID 17032)
-- Name: selections selections_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.selections
    ADD CONSTRAINT selections_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- TOC entry 3415 (class 2606 OID 16746)
-- Name: skill_interns skill_interns_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.skill_interns
    ADD CONSTRAINT skill_interns_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id);


--
-- TOC entry 3416 (class 2606 OID 16741)
-- Name: skill_interns skill_interns_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.skill_interns
    ADD CONSTRAINT skill_interns_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(id);


--
-- TOC entry 3430 (class 2606 OID 16844)
-- Name: skill_vacancies skill_vacancies_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.skill_vacancies
    ADD CONSTRAINT skill_vacancies_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(id);


--
-- TOC entry 3431 (class 2606 OID 16849)
-- Name: skill_vacancies skill_vacancies_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.skill_vacancies
    ADD CONSTRAINT skill_vacancies_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- TOC entry 3458 (class 2606 OID 17234)
-- Name: tasks tasks_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id) NOT VALID;


--
-- TOC entry 3459 (class 2606 OID 17229)
-- Name: tasks tasks_training_direction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_training_direction_id_fkey FOREIGN KEY (training_direction_id) REFERENCES public.training_directions(id);


--
-- TOC entry 3460 (class 2606 OID 17224)
-- Name: tasks tasks_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- TOC entry 3394 (class 2606 OID 16620)
-- Name: universities universities_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;


--
-- TOC entry 3396 (class 2606 OID 16574)
-- Name: users users_citizenship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_citizenship_id_fkey FOREIGN KEY (citizenship_id) REFERENCES public.citizenships(id);


--
-- TOC entry 3397 (class 2606 OID 16569)
-- Name: users users_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- TOC entry 3398 (class 2606 OID 16564)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3423 (class 2606 OID 16819)
-- Name: vacancies vacancies_employment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_employment_type_id_fkey FOREIGN KEY (employment_type_id) REFERENCES public.employment_types(id);


--
-- TOC entry 3424 (class 2606 OID 16824)
-- Name: vacancies vacancies_hr_creater_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_hr_creater_id_fkey FOREIGN KEY (hr_creater_id) REFERENCES public.hrs(id);


--
-- TOC entry 3425 (class 2606 OID 16829)
-- Name: vacancies vacancies_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- TOC entry 3426 (class 2606 OID 16814)
-- Name: vacancies vacancies_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- TOC entry 3427 (class 2606 OID 17246)
-- Name: vacancies vacancies_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.vacancy_statuses(id) NOT VALID;


--
-- TOC entry 3428 (class 2606 OID 16834)
-- Name: vacancies vacancies_work_experience_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_work_experience_id_fkey FOREIGN KEY (work_experience_id) REFERENCES public.work_experiences(id);


--
-- TOC entry 3429 (class 2606 OID 16809)
-- Name: vacancies vacancies_work_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_work_schedule_id_fkey FOREIGN KEY (work_schedule_id) REFERENCES public.work_schedules(id);


--
-- TOC entry 3435 (class 2606 OID 16904)
-- Name: vacancy_reviews vacancy_reviews_intern_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancy_reviews
    ADD CONSTRAINT vacancy_reviews_intern_id_fkey FOREIGN KEY (intern_id) REFERENCES public.interns(id);


--
-- TOC entry 3436 (class 2606 OID 16899)
-- Name: vacancy_reviews vacancy_reviews_vacancy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hack_db_3kwr_user
--

ALTER TABLE ONLY public.vacancy_reviews
    ADD CONSTRAINT vacancy_reviews_vacancy_id_fkey FOREIGN KEY (vacancy_id) REFERENCES public.vacancies(id);


--
-- TOC entry 3706 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: hack_db_3kwr_user
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO hack_db_3kwr_user;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2280 (class 826 OID 16391)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO hack_db_3kwr_user;


--
-- TOC entry 2282 (class 826 OID 16393)
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO hack_db_3kwr_user;


--
-- TOC entry 2281 (class 826 OID 16392)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO hack_db_3kwr_user;


--
-- TOC entry 2279 (class 826 OID 16390)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO hack_db_3kwr_user;


-- Completed on 2023-05-28 23:36:16

--
-- PostgreSQL database dump complete
--

