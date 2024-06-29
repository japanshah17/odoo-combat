def employee_serial(employee) -> dict:
    return{
          "id":str(employee["_id"]),
          "name":str(employee["name"]),
          "gender":str(employee["gender"]),
          "email":str(employee["email"]),
          "password":str(employee["password"]),
          "department":str(employee["department"]),
          "post":str(employee["post"]),
    }

def employee_list_serial(employee_list) -> list:
    return [employee_serial(employee) for employee in employee_list]