--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: all_aboard_boards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE all_aboard_boards (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: all_aboard_boards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE all_aboard_boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: all_aboard_boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE all_aboard_boards_id_seq OWNED BY all_aboard_boards.id;


--
-- Name: all_aboard_perspective_assignments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE all_aboard_perspective_assignments (
    id integer NOT NULL,
    slide_id integer,
    source_name character varying(255),
    perspective_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer,
    configuration hstore
);


--
-- Name: all_aboard_perspective_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE all_aboard_perspective_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: all_aboard_perspective_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE all_aboard_perspective_assignments_id_seq OWNED BY all_aboard_perspective_assignments.id;


--
-- Name: all_aboard_slides; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE all_aboard_slides (
    id integer NOT NULL,
    board_id integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    layout_name character varying(255)
);


--
-- Name: all_aboard_slides_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE all_aboard_slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: all_aboard_slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE all_aboard_slides_id_seq OWNED BY all_aboard_slides.id;


--
-- Name: all_aboard_source_configuration_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE all_aboard_source_configuration_metadata (
    id integer NOT NULL,
    source_name character varying(255),
    configuration hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: all_aboard_source_configuration_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE all_aboard_source_configuration_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: all_aboard_source_configuration_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE all_aboard_source_configuration_metadata_id_seq OWNED BY all_aboard_source_configuration_metadata.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY all_aboard_boards ALTER COLUMN id SET DEFAULT nextval('all_aboard_boards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY all_aboard_perspective_assignments ALTER COLUMN id SET DEFAULT nextval('all_aboard_perspective_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY all_aboard_slides ALTER COLUMN id SET DEFAULT nextval('all_aboard_slides_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY all_aboard_source_configuration_metadata ALTER COLUMN id SET DEFAULT nextval('all_aboard_source_configuration_metadata_id_seq'::regclass);


--
-- Name: all_aboard_boards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY all_aboard_boards
    ADD CONSTRAINT all_aboard_boards_pkey PRIMARY KEY (id);


--
-- Name: all_aboard_perspective_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY all_aboard_perspective_assignments
    ADD CONSTRAINT all_aboard_perspective_assignments_pkey PRIMARY KEY (id);


--
-- Name: all_aboard_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY all_aboard_slides
    ADD CONSTRAINT all_aboard_slides_pkey PRIMARY KEY (id);


--
-- Name: all_aboard_source_configuration_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY all_aboard_source_configuration_metadata
    ADD CONSTRAINT all_aboard_source_configuration_metadata_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20130217184407');

INSERT INTO schema_migrations (version) VALUES ('20130217184408');

INSERT INTO schema_migrations (version) VALUES ('20130217184409');

INSERT INTO schema_migrations (version) VALUES ('20130217184410');

INSERT INTO schema_migrations (version) VALUES ('20130217184411');

INSERT INTO schema_migrations (version) VALUES ('20130217184412');

INSERT INTO schema_migrations (version) VALUES ('20130217184413');

INSERT INTO schema_migrations (version) VALUES ('20130217184414');

INSERT INTO schema_migrations (version) VALUES ('20130217184415');

INSERT INTO schema_migrations (version) VALUES ('20130217184416');

INSERT INTO schema_migrations (version) VALUES ('20130217184417');