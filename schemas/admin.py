def admin_serial(admin) -> dict:
    return{
          "id":str(admin["_id"]),
          "name":str(admin["name"]),
          "gender":str(admin["gender"]),
          "email":str(admin["email"]),
          "password":str(admin["password"]),
    }

def admin_list_serial(admin_list) -> list:
    return [admin_serial(admin) for admin in admin_list]