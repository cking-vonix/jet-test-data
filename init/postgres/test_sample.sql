
-- AllTypes table -----------------------------

create schema IF NOT EXISTS test_sample;

DROP TABLE IF EXISTS test_sample.all_types CASCADE;

CREATE TABLE test_sample.ALL_TYPES
(
    -- numeric
    small_int_ptr smallint,
    small_int smallint NOT NULL,
    integer_ptr  integer,
    integer integer NOT NULL,
    big_int_ptr   bigint,
    big_int bigint NOT NULL,
    decimal_ptr decimal(10, 2),
    decimal decimal(10, 2) NOT NULL,
    numeric_ptr numeric(20, 3),
    numeric numeric(20,3) NOT NULL,
    real_ptr    real,
    real        real NOT NULL,
    double_precision_ptr double precision,
    double_precision double precision NOT NULL,
    smallserial     smallserial NOT NULL,
    serial serial NOT NULL,
    bigserial bigserial NOT NULL,

    --monetary
--     money_ptr money,
--     money     money NOT NULL,

    var_char_ptr character varying(100),
    var_char character varying(200) NOT NULL,
    char_ptr character(80),
    char character(80) NOT NULL,
    text_ptr text,
    text text NOT NULL,

    --binary
    bytea_ptr bytea,
    bytea bytea NOT NULL,

    --datetime
    timestampz_ptr timestamp with time zone,
    timestampz timestamp with time zone NOT NULL,
    timestamp_ptr timestamp without time zone,
    timestamp timestamp without time zone NOT NULL,
    date_ptr date,
    date date NOT NULL,
    timez_ptr time with time zone,
    timez time with time zone NOT NULL,
    time_ptr time without time zone,
    time time without time zone NOT NULL,
    interval_ptr interval,
    interval interval NOT NULL,

    --boolean
    boolean_ptr boolean,
    boolean boolean NOT NULL,

    --geometry
    point_ptr point,

    --bitstrings
    bit_ptr bit(3),
    bit bit(3) NOT NULL,
    bit_varying_ptr bit varying(20),
    bit_varying bit varying(40) NOT NULL,

    --textsearch
    tsvector_ptr tsvector,
    tsvector tsvector NOT NULL,

    --uuid
    uuid_ptr uuid,
    uuid uuid NOT NULL,

    --xml
    xml_ptr xml,
    xml xml NOT NULL,

    --json
    json_ptr json,
    json json NOT NULL,
    jsonb_ptr jsonb,
    jsonb jsonb NOT NULL,

    --array
    integer_array_ptr integer[],
    integer_array     integer[] NOT NULL,
    text_array_ptr    text[],
    text_array        text[] NOT NULL,
    jsonb_array       jsonb[] NOT NULL,
    text_multi_dim_array_ptr text[][],
    text_multi_dim_array text[][] NOT NULL
);

INSERT INTO test_sample.ALL_types(
    small_int_ptr, "small_int", integer_ptr, "integer", big_int_ptr, "big_int", decimal_ptr, "decimal", numeric_ptr, "numeric", real_ptr, "real", double_precision_ptr, double_precision, smallserial, serial, bigserial,
--     money_ptr, money,
    var_char_ptr, var_char, char_ptr, char, text_ptr, text,
    bytea_ptr, bytea,
    timestampz_ptr, timestampz, timestamp_ptr, "timestamp", date_ptr, date, timez_ptr, timez, time_ptr, "time", interval_ptr, "interval",
    boolean_ptr, "boolean",
    point_ptr,
    bit_ptr, "bit", bit_varying_ptr, bit_varying,
    tsvector_ptr, tsvector,
    uuid_ptr, uuid,
    xml_ptr, xml,
    json_ptr, json, jsonb_ptr, jsonb,
    integer_array_ptr, integer_array, text_array_ptr, text_array, jsonb_array, text_multi_dim_array_ptr, text_multi_dim_array)
VALUES (14, 14, 300, 300, 50000, 5000, 1.11, 1.11, 2.22, 2.22, 5.55, 5.55, 11111111.22, 11111111.22, DEFAULT, DEFAULT, DEFAULT,
--         100000, 100000,
        'ABBA', 'ABBA', 'JOHN', 'JOHN', 'Some text', 'Some text',
        'bytea', 'bytea',
        'January 8 04:05:06 1999 PST', 'January 8 04:05:06 1999 PST', '1999-01-08 04:05:06', '1999-01-08 04:05:06', '1999-01-08', '1999-01-08', '04:05:06 -8:00', '04:05:06 -8:00', '04:05:06', '04:05:06', '3 4:05:06', '3 4:05:06',
        TRUE, FALSE,
        '(2,3)',
        B'101', B'101', B'101111', B'101111',
        to_tsvector('supernovae'), to_tsvector('supernovae'),
        'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11', 'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
        '<Sub>abc</Sub>', '<Sub>abc</Sub>',
        '{"a": 1, "b": 3}', '{"a": 1, "b": 3}', '{"a": 1, "b": 3}', '{"a": 1, "b": 3}',
        '{1, 2, 3}', '{1, 2, 3}', '{"breakfast", "consulting"}', '{"breakfast", "consulting"}', ARRAY['{"a": 1, "b": 2}'::jsonb, '{"a":3, "b": 4}'::jsonb], '{{"meeting", "lunch"}, {"training", "presentation"}}', '{{"meeting", "lunch"}, {"training", "presentation"}}')
        ,
       (NULL, 14, NULL, 300, NULL, 5000, NULL, 1.11, NULL, 2.22, NULL, 5.55, NULL, 11111111.22, DEFAULT, DEFAULT, DEFAULT,
--         NULL, 100000,
        NULL, 'ABBA', NULL, 'JOHN', NULL, 'Some text',
        NULL, 'bytea',
        NULL, 'January 8 04:05:06 1999 PST', NULL, '1999-01-08 04:05:06', NULL, '1999-01-08', NULL, '04:05:06 -8:00', NULL, '04:05:06', NULL, '3 4:05:06',
        NULL, FALSE,
        NULL,
        NULL, B'101', NULL, B'101111',
        NULL, to_tsvector('supernovae'),
        NULL, 'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
        NULL, '<Sub>abc</Sub>',
        NULL, '{"a": 1, "b": 3}', NULL, '{"a": 1, "b": 3}',
        NULL, '{1, 2, 3}', NULL, '{"breakfast", "consulting"}', ARRAY['{"a": 1, "b": 2}'::jsonb, '{"a":3, "b": 4}'::jsonb], NULL, '{{"meeting", "lunch"}, {"training", "presentation"}}')
       ;

-- Link table --------------------

DROP TABLE IF EXISTS test_sample.link;

CREATE TABLE IF NOT EXISTS test_sample.link (
    id serial PRIMARY KEY,
    url VARCHAR (255) NOT NULL,
    name VARCHAR (255) NOT NULL,
    description VARCHAR (255)
);

INSERT INTO test_sample.link (ID, url, name, description) VALUES
 (0, 'http://www.youtube.com', 'Youtube' , '');


-- Employee table ---------------

DROP TABLE IF EXISTS test_sample.employee;

CREATE TABLE test_sample.employee (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR (255) NOT NULL,
  last_name VARCHAR (255) NOT NULL,
  employment_date timestamp with time zone,
  manager_id INT,
  FOREIGN KEY (manager_id)
      REFERENCES test_sample.employee (employee_id)
      ON DELETE CASCADE
);
INSERT INTO test_sample.employee (
    employee_id,
    first_name,
    last_name,
    employment_date,
    manager_id
)
VALUES
(1, 'Windy', 'Hays', '1999-01-08 04:05:06.100 +1:00', NULL),
(2, 'Ava', 'Christensen', '1999-01-08 04:05:06 +1:00', 1),
(3, 'Hassan', 'Conner', '1999-01-08 04:05:06 +1:00', 1),
(4, 'Anna', 'Reeves', '1999-01-08 04:05:06 +1:00', 2),
(5, 'Sau', 'Norman', '1999-01-08 04:05:06 +1:00', 2),
(6, 'Kelsie', 'Hays', '1999-01-08 04:05:06 +1:00', 3),
(7, 'Tory', 'Goff', '1999-01-08 04:05:06 +1:00', 3),
(8, 'Salley', 'Lester', '1999-01-08 04:05:06 +1:00', 3);


-- Person table ------------------

DROP TYPE IF EXISTS test_sample.MOOD CASCADE;

CREATE TYPE test_sample.MOOD AS ENUM ('sad', 'ok', 'happy');

DROP TABLE IF EXISTS test_sample.person;


CREATE TABLE test_sample.person(
    person_id uuid NOT NULL PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    "Mood" test_sample.mood
);

INSERT INTO test_sample.person(person_id, first_name, last_name, "Mood") VALUES
     ('b68dbff4-a87d-11e9-a7f2-98ded00c39c6', 'Sad', 'John', 'sad'),
     ('b68dbff5-a87d-11e9-a7f2-98ded00c39c7', 'Ok', 'John', 'ok'),
     ('b68dbff6-a87d-11e9-a7f2-98ded00c39c8', 'Ok', 'John', 'ok');



-- WEIRD TABLE NAMES --------------

DROP TABLE IF EXISTS test_sample."WEIRD NAMES TABLE";

CREATE TABLE test_sample."WEIRD NAMES TABLE"(
    "weird_column_name1" varchar(100) NOT NULL,
    "Weird_Column_Name2" varchar(100) NOT NULL,
    "wEiRd_cOluMn_nAmE3" varchar(100) NOT NULL,
    "WeIrd_CoLuMN_Name4" varchar(100) NOT NULL,
    "WEIRD_COLUMN_NAME5" varchar(100) NOT NULL,

    "WeirdColumnName6" varchar(100) NOT NULL,
    "weirdColumnName7" varchar(100) NOT NULL,
    "weirdcolumnname8" varchar(100),

    "weird col name9" varchar(100) NOT NULL,
    "wEiRd cOlu nAmE10" varchar(100) NOT NULL,
    "WEIRD COLU NAME11" varchar(100) NOT NULL,
    "Weird Colu Name12" varchar(100) NOT NULL,

    "weird-col-name13" varchar(100) NOT NULL,
    "wEiRd-cOlu-nAmE14" varchar(100) NOT NULL,
    "WEIRD-COLU-NAME15" varchar(100) NOT NULL,
    "Weird-Colu-Name16" varchar(100) NOT NULL
);

INSERT INTO test_sample."WEIRD NAMES TABLE"
VALUES ('Doe', 'Doe', 'Doe', 'Doe','Doe', 'Doe', 'Doe', 'Doe','Doe', 'Doe', 'Doe', 'Doe','Doe', 'Doe', 'Doe', 'Doe');

CREATE OR REPLACE VIEW test_sample.all_types_view AS
SELECT all_types.small_int_ptr AS "small_int_ptr",
       all_types.small_int AS "small_int",
       all_types.integer_ptr AS "integer_ptr",
       all_types.integer AS "integer",
       all_types.big_int_ptr AS "big_int_ptr",
       all_types.big_int AS "big_int",
       all_types.decimal_ptr AS "decimal_ptr",
       all_types.decimal AS "decimal",
       all_types.numeric_ptr AS "numeric_ptr",
       all_types.numeric AS "numeric",
       all_types.real_ptr AS "real_ptr",
       all_types.real AS "real",
       all_types.double_precision_ptr AS "double_precision_ptr",
       all_types.double_precision AS "double_precision",
       all_types.smallserial AS "smallserial",
       all_types.serial AS "serial",
       all_types.bigserial AS "bigserial",
       all_types.var_char_ptr AS "var_char_ptr",
       all_types.var_char AS "var_char",
       all_types.char_ptr AS "char_ptr",
       all_types.char AS "char",
       all_types.text_ptr AS "text_ptr",
       all_types.text AS "text",
       all_types.bytea_ptr AS "bytea_ptr",
       all_types.bytea AS "bytea",
       all_types.timestampz_ptr AS "timestampz_ptr",
       all_types.timestampz AS "timestampz",
       all_types.timestamp_ptr AS "timestamp_ptr",
       all_types.timestamp AS "timestamp",
       all_types.date_ptr AS "date_ptr",
       all_types.date AS "date",
       all_types.timez_ptr AS "timez_ptr",
       all_types.timez AS "timez",
       all_types.time_ptr AS "time_ptr",
       all_types.time AS "time",
       all_types.interval_ptr AS "interval_ptr",
       all_types.interval AS "interval",
       all_types.boolean_ptr AS "boolean_ptr",
       all_types.boolean AS "boolean",
       all_types.point_ptr AS "point_ptr",
       all_types.bit_ptr AS "bit_ptr",
       all_types.bit AS "bit",
       all_types.bit_varying_ptr AS "bit_varying_ptr",
       all_types.bit_varying AS "bit_varying",
       all_types.tsvector_ptr AS "tsvector_ptr",
       all_types.tsvector AS "tsvector",
       all_types.uuid_ptr AS "uuid_ptr",
       all_types.uuid AS "uuid",
       all_types.xml_ptr AS "xml_ptr",
       all_types.xml AS "xml",
       all_types.json_ptr AS "json_ptr",
       all_types.json AS "json",
       all_types.jsonb_ptr AS "jsonb_ptr",
       all_types.jsonb AS "jsonb",
       all_types.integer_array_ptr AS "integer_array_ptr",
       all_types.integer_array AS "integer_array",
       all_types.text_array_ptr AS "text_array_ptr",
       all_types.text_array AS "text_array",
       all_types.jsonb_array AS "jsonb_array",
       all_types.text_multi_dim_array_ptr AS "text_multi_dim_array_ptr",
       all_types.text_multi_dim_array AS "text_multi_dim_array"
FROM test_sample.all_types;