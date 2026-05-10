"""
SQLAlchemy models for core entities.
"""

from sqlalchemy import Column, Integer, String, Date, Float, ForeignKey, DateTime
from sqlalchemy.orm import relationship

from .database import Base

class Machine(Base):
    __tablename__ = "machines"

    id = Column(Integer, primary_key=True, index=True)
    model_name = Column(String, nullable=False)
    serial_number = Column(String, unique=True, nullable=False)
    purchase_date = Column(Date, nullable=False)
    usage_hours = Column(Float, default=0.0)
    last_maintenance = Column(DateTime, nullable=True)
    # Additional fields like location can be added later

    maintenance_records = relationship("MaintenanceRecord", back_populates="machine")
    parts = relationship("Part", back_populates="machine")

class MaintenanceRecord(Base):
    __tablename__ = "maintenance_records"

    id = Column(Integer, primary_key=True, index=True)
    machine_id = Column(Integer, ForeignKey("machines.id"))
    maintenance_type = Column(String, nullable=False)
    scheduled_date = Column(DateTime, nullable=False)
    performed_date = Column(DateTime, nullable=True)
    notes = Column(String, nullable=True)

    machine = relationship("Machine", back_populates="maintenance_records")

class Part(Base):
    __tablename__ = "parts"

    id = Column(Integer, primary_key=True, index=True)
    machine_id = Column(Integer, ForeignKey("machines.id"))
    part_name = Column(String, nullable=False)
    part_number = Column(String, nullable=False)
    purchase_link = Column(String, nullable=True)

    machine = relationship("Machine", back_populates="parts")

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True, nullable=False)
    hashed_password = Column(String, nullable=False)
    email = Column(String, unique=True, index=True, nullable=False)
    is_active = Column(Integer, default=1)

    # Relationships to machines can be added if needed
