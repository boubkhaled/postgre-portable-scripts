CREATE USER new_username WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE database_name TO new_username;
GRANT ALL PRIVILEGES ON SCHEMA schema_name TO new_username;
GRANT USAGE ON SCHEMA public TO new_username;
REM Optional: GRANT ALL PRIVILEGES ON TABLE table_name TO new_username;

REM To create a new user and assign privileges to specific databases in PostgreSQL, you can follow these steps:
REM 
REM     Connect to the PostgreSQL server using a user with administrative privileges (e.g., the postgres superuser or a user with CREATEDB and CREATEUSER privileges).
REM 
REM     Open a tool (such as pgAdmin or the psql command-line tool) to interact with the PostgreSQL server.
REM 
REM     Execute the following SQL command to create a new user:
REM 
REM     sql
REM 
REM CREATE USER new_username WITH PASSWORD 'password';
REM 
REM Replace new_username with the desired username for the new user, and 'password' with the desired password for the user.
REM 
REM Grant privileges to the user on specific databases. Execute the following SQL command for each database you want to grant access to:
REM 
REM sql
REM 
REM GRANT ALL PRIVILEGES ON DATABASE database_name TO new_username;
REM 
REM Replace database_name with the name of the database you want to grant access to.
REM 
REM If you want to grant different privileges (e.g., only specific permissions such as SELECT, INSERT, etc.), you can modify the GRANT statement accordingly.
REM 
REM If you want to grant additional privileges on specific schemas within the database, you can execute the following SQL command for each schema:
REM 
REM sql
REM 
REM GRANT ALL PRIVILEGES ON SCHEMA schema_name TO new_username;
REM 
REM Replace schema_name with the name of the schema you want to grant access to.
REM 
REM If you want to grant privileges on specific tables within the database, you can execute the following SQL command for each table:
REM 
REM sql
REM 
REM     GRANT ALL PRIVILEGES ON TABLE table_name TO new_username;
REM 
REM     Replace table_name with the name of the table you want to grant access to.
REM 
REM     After granting the necessary privileges, you can disconnect from the PostgreSQL server.
REM 
REM The new user should now be able to connect to the specified databases and have the assigned privileges. Adjust the privileges according to your specific requirements, and make sure to choose appropriate access levels for security purposes.
REM 
REM Note: Granting privileges requires administrative privileges. Ensure that you have the necessary permissions to create users and grant privileges in the PostgreSQL server.