from pydantic import BaseModel


class HouseRent(BaseModel):
    id: int
    location: str
    rent: float
    size: float
    num_rooms: int
