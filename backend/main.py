# main.py
from fastapi import FastAPI
from .routers import machines, maintenance
from .database import engine, Base

# Create tables
Base.metadata.create_all(bind=engine)

app = FastAPI(title="Agri Machine Manager API")

app.include_router(machines.router)
app.include_router(maintenance.router)

@app.get("/")
def read_root():
    return {"message": "Welcome to the Agri Machine Manager API"}
