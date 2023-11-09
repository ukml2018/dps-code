from sqlalchemy import create_engine, Column
from sqlalchemy.ext.declarative import declarative_base

import sqlalchemy as sa

Base = declarative_base()
class LuxuryLoanPortfolio(Base):
    __tablename__ = "luxury_loan_portfolio"
    __table_args__ = {"schema": "rawdata"}

    id = Column(sa.VARCHAR(100), nullable=False, primary_key=True)
    loan_id = Column(sa.VARCHAR(100))
    funded_amount = Column(sa.VARCHAR(100))
    funded_date = Column(sa.VARCHAR(100))
    duration_years = Column(sa.VARCHAR(100))
    duration_months = Column(sa.VARCHAR(100))
    ten_yr_treasury_index_date_funded = Column(sa.VARCHAR(100))
    interest_rate_percent = Column(sa.VARCHAR(100))
    interest_rate = Column(sa.VARCHAR(100))
    payments = Column(sa.VARCHAR(100))
    total_past_payments = Column(sa.VARCHAR(100))
    loan_balance = Column(sa.VARCHAR(100))
    property_value = Column(sa.VARCHAR(100))
    purpose = Column(sa.VARCHAR(100))
    firstname = Column(sa.VARCHAR(100))
    middlename = Column(sa.VARCHAR(100))
    lastname = Column(sa.VARCHAR(100))
    social = Column(sa.VARCHAR(100))
    phone = Column(sa.VARCHAR(100))
    title = Column(sa.VARCHAR(100))
    employment_length = Column(sa.VARCHAR(100))
    building_class_category = Column(sa.VARCHAR(100))
    tax_class_at_present = Column(sa.VARCHAR(100))
    building_class_at_present = Column(sa.VARCHAR(100))
    address_1 = Column(sa.VARCHAR(100))
    address_2 = Column(sa.VARCHAR(100))
    zip_code = Column(sa.VARCHAR(100))
    city = Column(sa.VARCHAR(100))
    state = Column(sa.VARCHAR(100))
    total_units = Column(sa.VARCHAR(100))
    land_square_feet = Column(sa.VARCHAR(100))
    gross_square_feet = Column(sa.VARCHAR(100))
    tax_class_at_time_of_sale = Column(sa.VARCHAR(100))
    loaded_time = Column(sa.VARCHAR(100))
    batch_id = Column(sa.VARCHAR(100))

    def __init__(self, dict):
        for key, value in dict.items():
            setattr(self, key, value)