import '../api handler/api_class.dart';
import '../controllers/postgrievance_controller.dart';
import '../main.dart';
import '../models/postgrievance_model.dart';
import '../utils/constants.dart';

class PostGrievanceRepository {
  APIClass apiClass = APIClass();

  Future<PostGrievanceModel> postGrievance() async {
    PostGrievanceController postGrievanceController =
        getIt.get<PostGrievanceController>();
    var data = await apiClass.postAPICall(
      url: "$BaseURL/postGrievance",
      headers: {'Content-Type': 'application/json'},
      body: {
        "title": postGrievanceController.title,
        "description": postGrievanceController.description,
        "type": postGrievanceController.type,
        "department": postGrievanceController.department,
        "severity": postGrievanceController.serverity,
        "postedBy": 'Username',
        "grievanceId": postGrievanceController.grievanceId,
        "status": "",
        "forwardedTo": ""
      },
    );
    return PostGrievanceModel.fromJson(data ?? {});
  }
}
