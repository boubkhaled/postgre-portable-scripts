REM Modifier le fichier pg_hba.conf: remplacer trust par scram-sha-256
ALTER USER postgres WITH PASSWORD 'new_password';