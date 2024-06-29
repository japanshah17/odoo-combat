from fastapi import APIRouter
from config.database import employee_collection
from config.database import admin_collection
from config.database import grievance_collection
from models.employee import Employee
from models.grievance import Grievance
from models.admin import Admin
from models.login import Login
from schemas.employee import employee_list_serial
from schemas.admin import admin_list_serial
from schemas.grievance import grievance_list_serial
from hasher import Hasher

router = APIRouter()

@router.post("/register")
async def register(user:Employee):
    if(employee_collection.find_one({'email':dict(user)['email']}) == None):
        hashed = Hasher.get_password_hash(dict(user)['password'])
        user.password = hashed
        employee_collection.insert_one(dict(user))
        user_list = {
            'code':200,
            'success':True,
            'msg':'Registration Successfully',
            'data':employee_list_serial(employee_collection.find({'email':dict(user)['email']}))}
        return user_list
    else:
        user_list = {
            'code':406,
            'success':False,
            'msg':'Already registered with same email',
            'data':''}
        return user_list

@router.post("/login")
async def login(login:Login):
    if employee_collection.find_one({'email':dict(login)['email']}) !=None:
        loginData = employee_collection.find_one({'email':dict(login)['email']})
        if Hasher.verify_password(dict(login)['password'],dict(loginData)['password']):
            user_list = {'code':200,'success':True,'msg':'Login Successful','data':employee_list_serial(employee_collection.find({'email':dict(login)['email']}))}
            return user_list
        else:
            user_list = {'code':403,'success':False,'msg':'Incorret Password','data':''}
            return user_list
    else:
        user_list = {'code':204,'success':False,'msg':'No User Exists','data':''}
        return user_list

@router.post("/postGrievance")
async def postGrievance(grievance:Grievance):
    grievance_collection.insert_one(dict(grievance))
    grievanceList = {'code':200,'success':True,'msg':'Grievance Successful','data':''}
    return grievanceList

@router.post("/getMyGrievance")
async def getMyGrievance(email:str):
    grievanceList = {'code':200,'success':True,'msg':'Grievance retrived Successfully','data':grievance_list_serial(grievance_collection.find({'postedBy':email}))}
    return grievanceList
    
#---------------------------------------------Admin------------------------------------------------------------

@router.post("/admin/register")
async def register(user:Admin):
    if admin_collection.find_one({'email':dict(user)['email']}) == None:
        hashed = Hasher.get_password_hash(dict(user)['password'])
        user.password = hashed
        admin_collection.insert_one(dict(user))
        user_list = {
            'code':200,
            'success':True,
            'msg':'admin Registration Successfully',
            'data':admin_list_serial(admin_collection.find({'email':dict(user)['email']}))}
        return user_list
    else:
        user_list = {
            'code':406,
            'success':False,
            'msg':'admin registered with same email',
            'data':''}
        return user_list

@router.post("/admin/login")
async def login(login:Login):
    if admin_collection.find_one({'email':dict(login)['email']}) !=None:
        loginData = admin_collection.find_one({'email':dict(login)['email']})
        if Hasher.verify_password(dict(login)['password'],dict(loginData)['password']):
            user_list = {'code':200,'success':True,'msg':'Login Successful','data':employee_list_serial(admin_collection.find({'email':dict(login)['email']}))}
            return user_list
        else:
            user_list = {'code':403,'success':False,'msg':'Incorret Password','data':''}
            return user_list
    else:
        user_list = {'code':204,'success':False,'msg':'No User Exists','data':''}
        return user_list

@router.post("/admin/getAllGrievance")
async def getMyGrievance(email:str):
    if admin_collection.find_one({'email':email}) !=None:
        grievanceList = {'code':200,'success':True,'msg':'All grievance retrived Successfully','data':grievance_list_serial(grievance_collection.find())}
        return grievanceList
    else:
        grievanceList = {'code':406,'success':False,'msg':'Not an admin','data':''}
        return grievanceList

@router.post("/admin/rejectGrievance")
async def rejectGrievance(email:str,grievanceId:str):
    if admin_collection.find_one({'email':email}) !=None:
        grievance_collection.find_one_and_update({'_id':grievanceId},{ '$set': {'status':'rejected'}})
        grievanceList = {'code':200,'success':True,'msg':'Grievance rejected Successfully','data':''}
        return grievanceList
    else:
        grievanceList = {'code':406,'success':False,'msg':'Not an admin','data':''}
        return grievanceList

@router.post("/admin/forwardGrievance")
async def forwardGrievance(email:str,grievanceId:str,forwardedTo:str):
    if admin_collection.find_one({'email':email}) !=None:
        grievance_collection.find_one_and_update({'_id':grievanceId},{ '$set': {'status':'forwarded','forwardedTo':forwardedTo}})
        grievanceList = {'code':200,'success':True,'msg':'Grievance forwarded Successfully','data':''}
        return grievanceList
    else:
        grievanceList = {'code':406,'success':False,'msg':'Not an admin','data':''}
        return grievanceList

@router.post("/admin/getEmployees")
async def getEmployees(email:str):
    if admin_collection.find_one({'email':email}) !=None:
        employeeList = {'code':200,'success':True,'msg':'employees retrived Successfully','data':employee_list_serial(employee_collection.find())}
        return employeeList
    else:
        employeeList = {'code':406,'success':False,'msg':'Not an admin','data':''}
        return employeeList


@router.post("/admin/getEmployeesByPost")
async def getEmployees(email:str,post:str):
    if admin_collection.find_one({'email':email}) !=None:
        employeeList = {'code':200,'success':True,'msg':'employees retrived Successfully','data':employee_list_serial(employee_collection.find({'post':post}))}
        return employeeList
    else:
        employeeList = {'code':406,'success':False,'msg':'Not an admin','data':''}
        return employeeList