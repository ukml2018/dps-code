from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class CallCenter(Base):
    __tablename__ = "interactiondepot_callcenter"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    timestamp = Column(sa.VARCHAR(100))
    account_id = Column(sa.VARCHAR(100))
    client_id = Column(sa.VARCHAR(100))
    channel = Column(sa.VARCHAR(100))
    eventtype = Column(sa.VARCHAR(100))
    locationid = Column(sa.VARCHAR(100))
    treatmentid = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)