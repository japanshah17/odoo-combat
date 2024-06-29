import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/controllers/general_config_controller.dart';
import 'package:hackathon/routes/app_routes.dart';

import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: Get.height * .09,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Login to your account',
                      style: GoogleFonts.rocknRollOne(
                          fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        CommonTextFieldWidget(
                          leftIcon: const Icon(Icons.email),
                          label: 'Enter your Username',
                          controller: usernameController,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CommonTextFieldWidget(
                          leftIcon: const Icon(Icons.security),
                          label: 'Enter your password',
                          obscureText: passToggle,
                          rightIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(passToggle
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.FORGET);
                                },
                                // ignore: avoid_unnecessary_containers
                                child: Container(
                                  child: Text(
                                    "Forgot your password?",
                                    style: GoogleFonts.rocknRollOne(
                                      fontSize: 20,
                                      color: const Color.fromARGB(
                                          255, 18, 114, 211),
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12.0,
                                ),
                                CommonButtonWidget(
                                  label: 'Login to continue',
                                  onTap: () async {
                                    await generalConfigController.box
                                        .write('loggedIn', 'true');
                                    await generalConfigController.box
                                        .write('name', usernameController.text);
                                    Get.toNamed(Routes.HOMEPAGE);
                                  },
                                  isEnabled: true,
                                  height: Get.width * .9,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.SIGNUP_SCREEN);
                                      },
                                      child: Text(
                                        "Register Here!",
                                        style: GoogleFonts.rocknRollOne(
                                          fontSize: 20,
                                          color: const Color.fromARGB(
                                              255, 18, 114, 211),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
