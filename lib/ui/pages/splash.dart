// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/routes/app_routes.dart';

import 'package:lottie/lottie.dart';

import '../../controllers/general_config_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      navigate();
    });
  }

  void navigate() async {
    Timer(const Duration(seconds: 3), () {
      generalConfigController.box.read('loggedIn') == 'true'
          ? Get.offAllNamed(Routes.HOMEPAGE)
          : Get.offAllNamed(Routes.LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Content(),
    );
  }

  Widget Content() {
    return Container(
        alignment: Alignment.center,
        child: Lottie.asset("assets/splashscreen.json"));
  }
}
