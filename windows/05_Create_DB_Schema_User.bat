REM connecter avec postgres
psql.exe -U postgres -p 5439

REM Créer une nouvelle base de données
CREATE DATABASE DBB;

REM Connecter à la base de données créée
\c DBB;

REM Créer schema & group & user
CREATE SCHEMA myschema;
CREATE GROUP mygroup;

CREATE USER myuser WITH PASSWORD '123456' NOSUPERUSER NOCREATEDB NOCREATEROLE;
GRANT CONNECT ON DATABASE DBB TO myuser;
GRANT USAGE ON SCHEMA myschema TO myuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA myschema GRANT ALL PRIVILEGES ON TABLES TO myuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA myschema GRANT USAGE, SELECT ON SEQUENCES TO myuser;
GRANT ALL PRIVILEGES ON SCHEMA myschema TO myuser;


psql.exe -U myuser -d DBB -p 5439

CREATE TABLE myschema.Customers(id int);