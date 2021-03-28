DROP DATABASE IF EXISTS beitech;
DROP ROLE IF EXISTS beitech_user;

CREATE DATABASE beitech
	ENCODING = 'UTF8';
COMMENT ON DATABASE beitech IS E'Base de datos para implementación de prueba técnica.';

CREATE ROLE beitech_user WITH LOGIN ENCRYPTED PASSWORD 'beitech2021';
GRANT ALL PRIVILEGES ON DATABASE beitech TO beitech_user;
