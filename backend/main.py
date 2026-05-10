"""
FastAPI application entry point for agri_machine_manager backend.
"""

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .routers import machines, maintenance
from .database import engine, Base

# Create database tables
Base.metadata.create_all(bind=engine)

app = FastAPI(title="Agri Machine Manager API", version="0.1.0")

# Allow CORS for Flutter frontend (localhost:3000 or mobile)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, restrict to specific origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(machines.router, prefix="/machines", tags=["machines"])
app.include_router(maintenance.router, prefix="/maintenance", tags=["maintenance"])

@app.get("/", tags=["root"])
async def read_root():
    return {"message": "Welcome to Agri Machine Manager API"}
