#!/bin/bash

# Keep It Simple and Stupid
_psql () { psql --set ON_ERROR_STOP=0 "$@" ; }

_psql \
<<'EOF'
CREATE DATABASE roadmap;
\connect roadmap;
CREATE USER roadmap;
ALTER USER roadmap PASSWORD 'changeme';
-- TODO user should not have all priv
GRANT ALL PRIVILEGES ON DATABASE roadmap TO roadmap;
CREATE SCHEMA roadmap;
GRANT ALL ON SCHEMA roadmap TO roadmap;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA roadmap TO roadmap;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA roadmap TO roadmap;
EOF
