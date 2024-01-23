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