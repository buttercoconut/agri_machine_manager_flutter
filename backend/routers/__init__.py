from fastapi import APIRouter
from ..routers import machine

router = APIRouter()
router.include_router(machine.router)
