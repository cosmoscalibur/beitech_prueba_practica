-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: beitech | type: DATABASE --
-- -- DROP DATABASE IF EXISTS beitech;
-- CREATE DATABASE beitech
-- 	ENCODING = 'UTF8';
-- -- ddl-end --
-- COMMENT ON DATABASE beitech IS E'Base de datos para implementación de prueba técnica.';
-- -- ddl-end --
-- 

-- object: public.product | type: TABLE --
-- DROP TABLE IF EXISTS public.product CASCADE;
CREATE TABLE public.product (
	product_id serial NOT NULL,
	name varchar(191) NOT NULL,
	product_description varchar(191) NOT NULL,
	price numeric(10,2) NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (product_id)

);
-- ddl-end --
-- ALTER TABLE public.product OWNER TO postgres;
-- ddl-end --

-- object: public.customer_product | type: TABLE --
-- DROP TABLE IF EXISTS public.customer_product CASCADE;
CREATE TABLE public.customer_product (
	product_id integer,
	customer_id integer
);
-- ddl-end --
-- ALTER TABLE public.customer_product OWNER TO postgres;
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.customer_product DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.customer_product ADD CONSTRAINT product_fk FOREIGN KEY (product_id)
REFERENCES public.product (product_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.customer | type: TABLE --
-- DROP TABLE IF EXISTS public.customer CASCADE;
CREATE TABLE public.customer (
	customer_id serial NOT NULL,
	name varchar(191) NOT NULL,
	email varchar(191) NOT NULL,
	CONSTRAINT customer_pk PRIMARY KEY (customer_id)

);
-- ddl-end --
-- ALTER TABLE public.customer OWNER TO postgres;
-- ddl-end --

-- object: customer_fk | type: CONSTRAINT --
-- ALTER TABLE public.customer_product DROP CONSTRAINT IF EXISTS customer_fk CASCADE;
ALTER TABLE public.customer_product ADD CONSTRAINT customer_fk FOREIGN KEY (customer_id)
REFERENCES public.customer (customer_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."order" | type: TABLE --
-- DROP TABLE IF EXISTS public."order" CASCADE;
CREATE TABLE public."order" (
	order_id serial NOT NULL,
	creation_date date NOT NULL,
	delivery_address varchar(191) NOT NULL,
	total numeric(15,2),
	customer_id integer,
	CONSTRAINT order_pk PRIMARY KEY (order_id)

);
-- ddl-end --
-- ALTER TABLE public."order" OWNER TO postgres;
-- ddl-end --

-- object: public.order_detail | type: TABLE --
-- DROP TABLE IF EXISTS public.order_detail CASCADE;
CREATE TABLE public.order_detail (
	order_detail_id serial NOT NULL,
	product_description varchar(191),
	price numeric(10,2),
	quantity integer NOT NULL,
	product_id integer,
	order_id integer,
	CONSTRAINT order_detail_pk PRIMARY KEY (order_detail_id)

);
-- ddl-end --
-- ALTER TABLE public.order_detail OWNER TO postgres;
-- ddl-end --

-- object: customer_fk | type: CONSTRAINT --
-- ALTER TABLE public."order" DROP CONSTRAINT IF EXISTS customer_fk CASCADE;
ALTER TABLE public."order" ADD CONSTRAINT customer_fk FOREIGN KEY (customer_id)
REFERENCES public.customer (customer_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.order_detail DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.order_detail ADD CONSTRAINT product_fk FOREIGN KEY (product_id)
REFERENCES public.product (product_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: order_fk | type: CONSTRAINT --
-- ALTER TABLE public.order_detail DROP CONSTRAINT IF EXISTS order_fk CASCADE;
ALTER TABLE public.order_detail ADD CONSTRAINT order_fk FOREIGN KEY (order_id)
REFERENCES public."order" (order_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


