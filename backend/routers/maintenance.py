"""
FastAPI router for maintenance endpoints.
"""

from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List

from .. import crud, schemas, database

router = APIRouter()

# Dependency

def get_db():
    db = database.SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/", response_model=schemas.MaintenanceRecord, status_code=status.HTTP_201_CREATED)
def create_maintenance(record: schemas.MaintenanceRecordCreate, db: Session = Depends(get_db)):
    db_record = crud.create_maintenance_record(db, record)
    return db_record

@router.get("/", response_model=List[schemas.MaintenanceRecord])
def read_maintenance(machine_id: int, skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    records = crud.get_maintenance_records(db, machine_id, skip=skip, limit=limit)
    return records

# Additional endpoints (update, delete) can be added similarly
