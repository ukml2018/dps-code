from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class IdentityData(Base):
    __tablename__ = "identity_data"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    clientid = Column(sa.VARCHAR(100))
    maid = Column(sa.VARCHAR(100))
    device_type = Column(sa.VARCHAR(100))
    sha1_hashed_email = Column(sa.VARCHAR(100))
    collection_timestamp = Column(sa.VARCHAR(100))
    ip_address = Column(sa.VARCHAR(100))
    source_id = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)