from pymongo import MongoClient

client = MongoClient("mongodb+srv://admin:Admin%21@cluster0.tiupjft.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")
db = client.grievance
employee_collection=db["employee_collection"]
admin_collection=db["admin_collection"]
grievance_collection=db["grievance_collection"]