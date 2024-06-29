from pydantic import BaseModel,EmailStr

class Employee(BaseModel):
    name:str
    gender:str
    email:EmailStr
    password:str
    department:str
    post:str