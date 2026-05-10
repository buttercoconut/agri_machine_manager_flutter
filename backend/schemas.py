"""
Pydantic schemas for request/response validation.
"""

from datetime import date, datetime
from typing import List, Optional

from pydantic import BaseModel, Field, EmailStr

# Machine schemas
class MachineBase(BaseModel):
    model_name: str
    serial_number: str
    purchase_date: date
    usage_hours: float = 0.0

class MachineCreate(MachineBase):
    pass

class MachineUpdate(BaseModel):
    model_name: Optional[str] = None
    serial_number: Optional[str] = None
    purchase_date: Optional[date] = None
    usage_hours: Optional[float] = None

class MachineInDBBase(MachineBase):
    id: int
    last_maintenance: Optional[datetime] = None

    class Config:
        orm_mode = True

class Machine(MachineInDBBase):
    pass

# Maintenance schemas
class MaintenanceRecordBase(BaseModel):
    maintenance_type: str
    scheduled_date: datetime
    notes: Optional[str] = None

class MaintenanceRecordCreate(MaintenanceRecordBase):
    machine_id: int

class MaintenanceRecordUpdate(BaseModel):
    performed_date: Optional[datetime] = None
    notes: Optional[str] = None

class MaintenanceRecord(MaintenanceRecordBase):
    id: int
    machine_id: int
    performed_date: Optional[datetime] = None

    class Config:
        orm_mode = True

# Part schemas
class PartBase(BaseModel):
    part_name: str
    part_number: str
    purchase_link: Optional[str] = None

class PartCreate(PartBase):
    machine_id: int

class Part(PartBase):
    id: int
    machine_id: int

    class Config:
        orm_mode = True

# User schemas
class UserBase(BaseModel):
    username: str
    email: EmailStr

class UserCreate(UserBase):
    password: str

class User(UserBase):
    id: int
    is_active: bool

    class Config:
        orm_mode = True
