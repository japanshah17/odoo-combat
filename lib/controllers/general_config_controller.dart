import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GeneralConfigController extends GetxController {
  RxBool isLoaderActive = false.obs;
  RxString appName = ''.obs;
  RxString appversion = ''.obs;
  final box = GetStorage();
}

GeneralConfigController generalConfigController = GeneralConfigController();
