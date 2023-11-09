import logging

from dag_utils.db_utils import DB_TYPE

logging.basicConfig(
    level=logging.INFO, format="%(asctime)s-%(name)s-%(levelname)s %(message)s"
)
logger = logging.getLogger(__name__)


def get_dbt_env(db_type: str, secrets: dict) -> dict:
    dbt_env = {}
    if db_type == DB_TYPE.Synapse.value:
        dbt_env = {
            "SYNAPSE_DB_SERVER": f"{secrets['DB_SERVER']}",
            "SYNAPSE_DB_PORT": f"{secrets['DB_PORT']}",
            "SYNAPSE_DB_NAME": f"{secrets['DB_NAME']}",
            "SYNAPSE_DB_SCHEMA": f"{secrets['DB_SCHEMA']}",
            "SYNAPSE_DB_USER": f"{secrets['DB_USER']}",
            "SYNAPSE_DB_PASSWORD": f"{secrets['DB_PASSWORD']}",
        }
    elif db_type == DB_TYPE.Redshift.value:
        dbt_env = {
            "REDSHIFT_DB_SERVER": f"{secrets['DB_SERVER']}",
            "REDSHIFT_DB_NAME": f"{secrets['DB_NAME']}",
            "REDSHIFT_DB_SCHEMA": f"{secrets['DB_SCHEMA']}",
            "REDSHIFT_DB_USER": f"{secrets['DB_USER']}",
            "REDSHIFT_DB_PASSWORD": f"{secrets['DB_PASSWORD']}",
        }
    elif db_type == DB_TYPE.Postgres.value:
        dbt_env = {
            "POSTGRES_DB_SERVER": f"{secrets['DB_SERVER']}",
            "POSTGRES_DB_NAME": f"{secrets['DB_NAME']}",
            "POSTGRES_DB_SCHEMA": f"{secrets['DB_SCHEMA']}",
            "POSTGRES_DB_USER": f"{secrets['DB_USER']}",
            "POSTGRES_DB_PASSWORD": f"{secrets['DB_PASSWORD']}",
        }

    return dbt_env
