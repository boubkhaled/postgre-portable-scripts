# Installation Steps
1) Download latest postgres portable version from https://www.enterprisedb.com/download-postgresql-binaries
2) Extract it to c:\postgresql
3) Copy `.bat` [files](https://github.com/boubkhaled/postgre-portable-scripts/tree/main/windows) to c:\postgresql
4) Enjoy :) 


# PostgreSQL root folder scripts
![image](https://github.com/boubkhaled/postgre-portable-scripts/assets/18572114/b325954d-0fa0-4591-80d3-a2070fd9cc24)


# 1) Start the server

![image](https://github.com/boubkhaled/postgre-portable-scripts/assets/18572114/3bfc25bf-46ae-454a-ade3-8ce87676a0fa)

## MsDOS
```powershell
@ECHO OFF

REM Put me in the extracted postgres root folder(which contains 
REM a "bin" folder), and run it.

REM The script sets environment variables helpful for PostgreSQL
@SET PATH="%~dp0\bin";%PATH%
@SET PGDATA=%~dp0\data
@SET PGDATABASE=postgres
@SET PGUSER=postgres
@SET PGPORT=5439
@SET PGLOCALEDIR=%~dp0\share\locale

ECHO.
IF EXIST data (
ECHO This instance already initialized.
ECHO.
) ELSE (
ECHO First run, wait for initializing.
"%~dp0\bin\initdb" -U postgres -A trust
ECHO.
)
"%~dp0\bin\pg_ctl" -D "%~dp0/data" -l logfile start
ECHO.
ECHO postgres listening on port %PGPORT%
ECHO.
REM pause
set /p DUMMY=Hit ENTER to continue...
"%~dp0\bin\pg_ctl" -D "%~dp0/data" stop
```

# 2) Connecting using psql tool
![image](https://github.com/boubkhaled/postgre-portable-scripts/assets/18572114/a3bb42c5-0cdf-44c8-964a-11703303af2c)

```bash
%cd%\bin\psql.exe -U postgres -p 5439
```

# 3) Change password
![image](https://github.com/boubkhaled/postgre-portable-scripts/assets/18572114/1d30093b-0be2-4d2c-b18f-95322635169e)

```sql
ALTER USER postgres WITH PASSWORD 'new_password';
```

# 4) Create new user
```sql
CREATE USER new_username WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE database_name TO new_username;
GRANT ALL PRIVILEGES ON SCHEMA schema_name TO new_username;
GRANT USAGE ON SCHEMA public TO new_username;
-- Optional: GRANT ALL PRIVILEGES ON TABLE table_name TO new_username;
```

# 5) Create new schema
```bash
# connecter avec postgres
psql.exe -U postgres -p 5439

# Créer une nouvelle base de données
CREATE DATABASE DBB;

# Connecter à la base de données créée
\c DBB;

# Create schema & group & user
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
```
