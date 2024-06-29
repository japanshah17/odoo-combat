from pydantic import BaseModel

class Admin(BaseModel):
    name:str
    gender:str
    email:str
    password:str