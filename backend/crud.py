"""
CRUD operations for machines and maintenance.
"""

from sqlalchemy.orm import Session
from datetime import datetime

from . import models, schemas

# Machine CRUD

def get_machine(db: Session, machine_id: int):
    return db.query(models.Machine).filter(models.Machine.id == machine_id).first()

def get_machines(db: Session, skip: int = 0, limit: int = 10):
    return db.query(models.Machine).offset(skip).limit(limit).all()

def create_machine(db: Session, machine: schemas.MachineCreate):
    db_machine = models.Machine(**machine.dict())
    db.add(db_machine)
    db.commit()
    db.refresh(db_machine)
    return db_machine

def update_machine(db: Session, machine_id: int, machine_update: schemas.MachineUpdate):
    db_machine = get_machine(db, machine_id)
    if not db_machine:
        return None
    for var, value in machine_update.dict(exclude_unset=True).items():
        setattr(db_machine, var, value)
    db.commit()
    db.refresh(db_machine)
    return db_machine

# Maintenance CRUD

def get_maintenance_records(db: Session, machine_id: int, skip: int = 0, limit: int = 10):
    return (
        db.query(models.MaintenanceRecord)
        .filter(models.MaintenanceRecord.machine_id == machine_id)
        .offset(skip)
        .limit(limit)
        .all()
    )

def create_maintenance_record(db: Session, record: schemas.MaintenanceRecordCreate):
    db_record = models.MaintenanceRecord(**record.dict())
    db.add(db_record)
    db.commit()
    db.refresh(db_record)
    return db_record

# Part CRUD

def get_parts(db: Session, machine_id: int):
    return db.query(models.Part).filter(models.Part.machine_id == machine_id).all()

# Simple part creation

def create_part(db: Session, part: schemas.PartCreate):
    db_part = models.Part(**part.dict())
    db.add(db_part)
    db.commit()
    db.refresh(db_part)
    return db_part
