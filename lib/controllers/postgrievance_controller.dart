import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/postgrievance_model.dart';
import '../repository/postgrievance_repository.dart';
// import '../routes/app_routes.dart';
import '../utils/common_methods.dart';

class PostGrievanceController extends GetxController {
  String? title;
  String? department;
  String? description;
  String? type;
  String? serverity;
  String? grievanceId;

  PostGrievanceRepository GrievanceRepository = PostGrievanceRepository();
  Rx<PostGrievanceModel>? postGrievanceModel = PostGrievanceModel().obs;
  // Rx<GetMyGrievanceModel>? getMyGrievanceModel = GetMyGrievanceModel().obs;

  Future<void> postGrievance() async {
    postGrievanceModel?.value = await (GrievanceRepository.postGrievance());
    if (postGrievanceModel!.value.code == 200) {
      showMessage('Success', postGrievanceModel!.value.msg!, Colors.green);
    } else {
      showMessage('Failed', postGrievanceModel!.value.msg!, Colors.red);
    }
  }

  // Future<void> getMyGrievance() async {
  //   getMyGrievanceModel?.value = await (GrievanceRepository.getMyGrievance());
  //   if (postGrievanceModel!.value.code == 200) {
  //     Get.toNamed(Routes.HOMEPAGE);
  //   } else {
  //     showMessage('Failed', postGrievanceModel!.value.msg!, Colors.red);
  //   }
  // }
}
