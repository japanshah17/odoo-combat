import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'package:get_storage/get_storage.dart';
import 'controllers/controller_singletons.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  singletonSetup();
  await GetStorage.init();
  runApp(const App());
}
