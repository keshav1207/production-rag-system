-- Grant table/sequence privileges to the backend service_role.
-- The initial schema created tables without explicit grants, which left
-- service_role unable to access some tables (e.g. project_documents ->
-- error 42501 "permission denied for table project_documents").

-- Privileges on all existing tables/sequences in the public schema
GRANT USAGE ON SCHEMA public TO service_role;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO service_role;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO service_role;

-- Ensure any tables/sequences created in the future also get the grants
ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT ALL PRIVILEGES ON TABLES TO service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
    GRANT ALL PRIVILEGES ON SEQUENCES TO service_role;
