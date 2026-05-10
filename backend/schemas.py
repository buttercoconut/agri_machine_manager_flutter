# schemas.py
from pydantic import BaseModel, Field
from datetime import date

class MachineBase(BaseModel):
    model_name: str
    serial_number: str
    purchase_date: date
    usage_hours: float = 0.0
    last_maintenance: date | None = None

class MachineCreate(MachineBase):
    pass

class MachineUpdate(BaseModel):
    usage_hours: float | None = None
    last_maintenance: date | None = None

class Machine(MachineBase):
    id: int

    class Config:
        orm_mode = True

class MaintenanceRecordBase(BaseModel):
    maintenance_date: date
    description: str | None = None
    parts_replaced: str | None = None

class MaintenanceRecordCreate(MaintenanceRecordBase):
    machine_id: int

class MaintenanceRecord(MaintenanceRecordBase):
    id: int
    machine_id: int

    class Config:
        orm_mode = True
