# routers/machines.py
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from datetime import date

from .. import models, schemas, database

router = APIRouter(prefix="/machines", tags=["machines"])

@router.post("/", response_model=schemas.Machine, status_code=status.HTTP_201_CREATED)
def create_machine(machine: schemas.MachineCreate, db: Session = Depends(database.get_db)):
    db_machine = models.Machine(**machine.dict())
    db.add(db_machine)
    db.commit()
    db.refresh(db_machine)
    return db_machine

@router.get("/{machine_id}", response_model=schemas.Machine)
def get_machine(machine_id: int, db: Session = Depends(database.get_db)):
    machine = db.query(models.Machine).filter(models.Machine.id == machine_id).first()
    if not machine:
        raise HTTPException(status_code=404, detail="Machine not found")
    return machine

@router.put("/{machine_id}", response_model=schemas.Machine)
def update_machine(machine_id: int, machine_update: schemas.MachineUpdate, db: Session = Depends(database.get_db)):
    machine = db.query(models.Machine).filter(models.Machine.id == machine_id).first()
    if not machine:
        raise HTTPException(status_code=404, detail="Machine not found")
    if machine_update.usage_hours is not None:
        machine.usage_hours = machine_update.usage_hours
    if machine_update.last_maintenance is not None:
        machine.last_maintenance = machine_update.last_maintenance
    db.commit()
    db.refresh(machine)
    return machine

@router.delete("/{machine_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_machine(machine_id: int, db: Session = Depends(database.get_db)):
    machine = db.query(models.Machine).filter(models.Machine.id == machine_id).first()
    if not machine:
        raise HTTPException(status_code=404, detail="Machine not found")
    db.delete(machine)
    db.commit()
    return None
