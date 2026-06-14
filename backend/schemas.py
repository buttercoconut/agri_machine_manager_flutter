from pydantic import BaseModel, Field
from datetime import date
from typing import Optional

class MachineBase(BaseModel):
    model_name: str = Field(..., example="Tractor X200")
    serial_number: str = Field(..., example="SN123456789")
    purchase_date: date = Field(..., example="2022-05-15")
    usage_hours: float = Field(0.0, example=120.5)

class MachineCreate(MachineBase):
    pass

class Machine(MachineBase):
    id: int
    class Config:
        orm_mode = True

class MaintenanceBase(BaseModel):
    machine_id: int
    scheduled_date: date
    description: Optional[str] = None

class MaintenanceCreate(MaintenanceBase):
    pass

class Maintenance(MaintenanceBase):
    id: int
    class Config:
        orm_mode = True
