from fastapi import APIRouter
from ..controllers import item_controller

router = APIRouter()

@router.get("/cities/")
def read_cities():
    return item_controller.get_items()

@router.post("/cities/")
def create_city(item: Item):
    return item_controller.create_item(item)
