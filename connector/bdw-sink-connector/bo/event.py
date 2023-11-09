from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class Event(Base):
    __tablename__ = "crm_events"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    complaint_id = Column(sa.VARCHAR(100))
    client_id = Column(sa.VARCHAR(100))
    date_received = Column(sa.VARCHAR(100))
    product = Column(sa.VARCHAR(100))
    sub_product = Column(sa.VARCHAR(100))
    issue = Column(sa.VARCHAR(100))
    sub_issue = Column(sa.VARCHAR(100))
    consumer_complaint_narrative = Column(sa.VARCHAR(6000))
    tags = Column(sa.VARCHAR(100))
    consumer_consent_provided = Column(sa.VARCHAR(100))
    submitted_via = Column(sa.VARCHAR(100))
    date_sent_to_company = Column(sa.VARCHAR(100))
    company_response_to_consumer = Column(sa.VARCHAR(100))
    timely_response = Column(sa.VARCHAR(100))
    consumer_disputed = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)
