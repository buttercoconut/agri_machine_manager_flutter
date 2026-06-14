from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from datetime import date
from ..database import SessionLocal
from .. import schemas, models

router = APIRouter()

# Dependency

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Machine CRUD
@router.post("/", response_model=schemas.Machine)
def create_machine(machine: schemas.MachineCreate, db: Session = Depends(get_db)):
    db_machine = models.Machine(**machine.dict())
    db.add(db_machine)
    db.commit()
    db.refresh(db_machine)
    return db_machine

@router.get("/", response_model=list[schemas.Machine])
def read_machines(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    machines = db.query(models.Machine).offset(skip).limit(limit).all()
    return machines

@router.get("/{machine_id}", response_model=schemas.Machine)
def read_machine(machine_id: int, db: Session = Depends(get_db)):
    machine = db.query(models.Machine).filter(models.Machine.id == machine_id).first()
    if not machine:
        raise HTTPException(status_code=404, detail="Machine not found")
    return machine

# Maintenance CRUD
@router.post("/", response_model=schemas.Maintenance)
def create_maintenance(maint: schemas.MaintenanceCreate, db: Session = Depends(get_db)):
    db_maint = models.MaintenanceRecord(**maint.dict())
    db.add(db_maint)
    db.commit()
    db.refresh(db_maint)
    return db_maint

@router.get("/", response_model=list[schemas.Maintenance])
def read_maintenances(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    maints = db.query(models.MaintenanceRecord).offset(skip).limit(limit).all()
    return maints
