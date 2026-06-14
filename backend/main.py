from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from .routers import machine, maintenance

app = FastAPI(title="Agri Machine Manager API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(machine.router, prefix="/machines", tags=["machines"])
app.include_router(maintenance.router, prefix="/maintenances", tags=["maintenances"])

@app.get("/")
async def root():
    return {"message": "Welcome to Agri Machine Manager API"}
