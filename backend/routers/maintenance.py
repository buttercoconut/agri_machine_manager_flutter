# routers/maintenance.py
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from datetime import date

from .. import models, schemas, database

router = APIRouter(prefix="/maintenance", tags=["maintenance"])

@router.post("/", response_model=schemas.MaintenanceRecord, status_code=status.HTTP_201_CREATED)
def create_maintenance(record: schemas.MaintenanceRecordCreate, db: Session = Depends(database.get_db)):
    db_record = models.MaintenanceRecord(**record.dict())
    db.add(db_record)
    db.commit()
    db.refresh(db_record)
    return db_record

@router.get("/", response_model=list[schemas.MaintenanceRecord])
def list_maintenance(machine_id: int, db: Session = Depends(database.get_db)):
    records = db.query(models.MaintenanceRecord).filter(models.MaintenanceRecord.machine_id == machine_id).all()
    return records

@router.get("/{record_id}", response_model=schemas.MaintenanceRecord)
def get_maintenance(record_id: int, db: Session = Depends(database.get_db)):
    record = db.query(models.MaintenanceRecord).filter(models.MaintenanceRecord.id == record_id).first()
    if not record:
        raise HTTPException(status_code=404, detail="Record not found")
    return record

@router.put("/{record_id}", response_model=schemas.MaintenanceRecord)
def update_maintenance(record_id: int, record_update: schemas.MaintenanceRecordBase, db: Session = Depends(database.get_db)):
    record = db.query(models.MaintenanceRecord).filter(models.MaintenanceRecord.id == record_id).first()
    if not record:
        raise HTTPException(status_code=404, detail="Record not found")
    for var, value in vars(record_update).items():
        if value is not None:
            setattr(record, var, value)
    db.commit()
    db.refresh(record)
    return record

@router.delete("/{record_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_maintenance(record_id: int, db: Session = Depends(database.get_db)):
    record = db.query(models.MaintenanceRecord).filter(models.MaintenanceRecord.id == record_id).first()
    if not record:
        raise HTTPException(status_code=404, detail="Record not found")
    db.delete(record)
    db.commit()
    return None
