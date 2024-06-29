import 'package:get_it/get_it.dart';

import 'postgrievance_controller.dart';

final getIt = GetIt.instance;

void singletonSetup() {
  getIt.registerSingleton<PostGrievanceController>(PostGrievanceController());
}
