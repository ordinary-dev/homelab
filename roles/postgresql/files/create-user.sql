CREATE OR REPLACE FUNCTION create_user_if_not_exists(username TEXT, passwd TEXT)
RETURNS VOID AS \$\$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = username) THEN
        EXECUTE format('CREATE ROLE %I LOGIN PASSWORD %L', username, passwd);
    ELSE
        RAISE NOTICE 'User % already exists.', username;
    END IF;
END;
\$\$ LANGUAGE plpgsql;
