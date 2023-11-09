import os

SINK_SOURCE_USERNAME = os.getenv("SINK_SOURCE_USERNAME", "sqladminuser")
SINK_SOURCE_PASSWORD = os.getenv("SINK_SOURCE_PASSWORD", "xxx")
SINK_SOURCE_HOST = os.getenv("SINK_SOURCE_HOST", "synps-ws-mda-dev-eastus-001.sql.azuresynapse.net")
SINK_SOURCE_DATABASE = os.getenv("SINK_SOURCE_DATABASE", "BDW")
SINK_SOURCE_SCHEMA = os.getenv('SINK_SOURCE_SCHEMA', 'conformed')

SINK_SOURCE_DRIVER = os.getenv('SINK_SOURCE_DRIVER', 'com.microsoft.sqlserver.jdbc.SQLServerDriver')
SINK_SOURCE_PORT = int(os.getenv('SINK_SOURCE_PORT', '1433'))


####
## postgresql DB on Azure as target
####
SINK_TARGET_HOST = os.getenv("SINK_TARGET_HOST", "pstgrsql-mda-dev-eastus-001.postgres.database.azure.com")
SINK_TARGET_USERNAME = os.getenv("SINK_TARGET_USERNAME", "adminuser")
SINK_TARGET_PASSWORD = os.getenv("SINK_TARGET_PASSWORD", "xxx")
SINK_TARGET_DATABASE = os.getenv("SINK_TARGET_DATABASE", "bdw")
SINK_TARGET_SCHEMA = os.getenv("SINK_TARGET_SCHEMA", "conformed")
SINK_TARGET_DRIVER = os.getenv('SINK_TARGET_DRIVER', 'org.postgresql.Driver')
SINK_TARGET_PORT = int(os.getenv('SINK_TARGET_PORT', '5432'))
