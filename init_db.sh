#! bash
psql -f beitech_create.sql
psql -d beitech -U beitech_user -W -f beitech_schema.sql
psql -d beitech -U beitech_user -W -f beitech_procedures.sql
psql -d beitech -U beitech_user -W -f beitech_functions.sql
psql -d beitech -U beitech_user -W -f beitech_populate.sql
