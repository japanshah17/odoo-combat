// ignore_for_file: no_leading_underscores_for_local_identifiers

class PostGrievanceModel {
  int? code;
  bool? success;
  String? msg;
  String? data;

  PostGrievanceModel({this.code, this.success, this.msg, this.data});

  PostGrievanceModel.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["msg"] is String) {
      msg = json["msg"];
    }
    if (json["data"] is String) {
      data = json["data"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["success"] = success;
    _data["msg"] = msg;
    _data["data"] = data;
    return _data;
  }
}
