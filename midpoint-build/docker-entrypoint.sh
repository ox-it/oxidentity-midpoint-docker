#!/bin/bash

set -e

echo "midpoint-db:5432:midpoint:midpoint:midpoint" > ~/.pgpass
chmod 600 ~/.pgpass
psql --host=midpoint-db --username=midpoint -f "/opt/midpoint/doc/config/sql/_all/postgresql-3.8-all.sql"
#psql --host=midpoint-db --username=midpoint -f "/opt/midpoint/doc/config/sql/activiti/activiti.postgres.create.engine.sql"
#psql --host=midpoint-db --username=midpoint -f "/opt/midpoint/doc/config/sql/activiti/activiti.postgres.create.history.sql"
#psql --host=midpoint-db --username=midpoint -f "/opt/midpoint/doc/config/sql/activiti/activiti.postgres.create.identity.sql"

exec "$@"
