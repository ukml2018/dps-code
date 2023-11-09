from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class CallCenterLog(Base):
    __tablename__ = "crm_call_center_logs"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    call_id = Column(sa.VARCHAR(100))
    date_received = Column(sa.VARCHAR(100))
    complaint_id = Column(sa.VARCHAR(100))
    rand_client = Column(sa.VARCHAR(100))
    phonefinal = Column(sa.VARCHAR(100))
    vru_line = Column(sa.VARCHAR(100))
    priority = Column(sa.VARCHAR(100))
    type = Column(sa.VARCHAR(100))
    outcome = Column(sa.VARCHAR(100))
    server = Column(sa.VARCHAR(100))
    ser_start = Column(sa.VARCHAR(100))
    ser_exit = Column(sa.VARCHAR(100))
    ser_time = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)