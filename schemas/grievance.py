def grievance_serial(grievance) -> dict:
    return{
          "id":str(grievance["_id"]),
          "title":str(grievance["title"]),
          "description":str(grievance["description"]),
          "type":str(grievance["type"]),
          "department":str(grievance["department"]),
          "severity":str(grievance["severity"]),
          "postedBy":str(grievance["postedBy"]),
          "grievanceId":str(grievance["grievanceId"]),
          "status":str(grievance["status"]),
          "forwardedTo":str(grievance["forwardedTo"]),
    }

def grievance_list_serial(grievance_list) -> list:
    return [grievance_serial(grievance) for grievance in grievance_list]