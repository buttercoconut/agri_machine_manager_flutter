# models.py
from sqlalchemy import Column, Integer, String, Date, Float, ForeignKey
from sqlalchemy.orm import relationship
from .database import Base

class Machine(Base):
    __tablename__ = "machines"
    id = Column(Integer, primary_key=True, index=True)
    model_name = Column(String, nullable=False)
    serial_number = Column(String, unique=True, nullable=False)
    purchase_date = Column(Date, nullable=False)
    usage_hours = Column(Float, default=0.0)
    last_maintenance = Column(Date)
    # relationships
    maintenance_records = relationship("MaintenanceRecord", back_populates="machine")

class MaintenanceRecord(Base):
    __tablename__ = "maintenance_records"
    id = Column(Integer, primary_key=True, index=True)
    machine_id = Column(Integer, ForeignKey("machines.id"))
    maintenance_date = Column(Date, nullable=False)
    description = Column(String)
    parts_replaced = Column(String)
    machine = relationship("Machine", back_populates="maintenance_records")
