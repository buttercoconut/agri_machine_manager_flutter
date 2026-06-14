from sqlalchemy import Column, Integer, String, Date, Float
from sqlalchemy.orm import declarative_base

Base = declarative_base()

class Machine(Base):
    __tablename__ = "machines"
    id = Column(Integer, primary_key=True, index=True)
    model_name = Column(String, nullable=False)
    serial_number = Column(String, unique=True, nullable=False)
    purchase_date = Column(Date, nullable=False)
    usage_hours = Column(Float, default=0.0)

class MaintenanceRecord(Base):
    __tablename__ = "maintenance_records"
    id = Column(Integer, primary_key=True, index=True)
    machine_id = Column(Integer, nullable=False)
    scheduled_date = Column(Date, nullable=False)
    description = Column(String, nullable=True)
