-- -- =============================================================================
-- -- MIT POKER BOTS - DATABASE INITIALIZATION SCRIPT
-- -- =============================================================================
-- -- This script sets up the initial database structure and configurations
-- -- for the MIT Poker Bots playground application.
-- -- =============================================================================

-- -- Create database if it doesn't exist (handled by POSTGRES_DB env var)
-- -- This script runs after the main database is created

-- -- Set timezone
-- SET timezone = 'UTC';

-- -- Create extensions
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- -- Grant privileges to application user
-- GRANT ALL PRIVILEGES ON DATABASE pbots TO postgres;

-- -- Create schemas if needed
-- CREATE SCHEMA IF NOT EXISTS public;

-- -- Set default privileges
-- ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO postgres;
-- ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO postgres;

-- -- Performance optimizations for development
-- ALTER SYSTEM SET shared_preload_libraries = 'pg_stat_statements';
-- ALTER SYSTEM SET log_statement = 'all';
-- ALTER SYSTEM SET log_min_duration_statement = 100;

-- -- Create development-specific settings
-- ALTER SYSTEM SET log_line_prefix = '%t [%p]: [%l-1] user=%u,db=%d,app=%a,client=%h ';

-- -- Note: The Flask application will create the actual tables using SQLAlchemy
-- -- This script only sets up the database environment and basic configurations



-- =============================================================================
-- MIT POKER BOTS - DATABASE INITIALIZATION SCRIPT
-- =============================================================================
-- This script sets up the initial database structure and configurations
-- for the MIT Poker Bots playground application.
-- =============================================================================

-- Set timezone
SET timezone = 'UTC';

-- Create extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Grant privileges to application user
GRANT ALL PRIVILEGES ON DATABASE pbots TO postgres;

-- Create schemas if needed
CREATE SCHEMA IF NOT EXISTS public;

-- Set default privileges
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT ON SEQUENCES TO postgres;

-- Note: The Flask application will create the actual tables using SQLAlchemy
-- This script only sets up the database environment and basic configurations