// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/app_routes.dart';

class Appeal extends StatefulWidget {
  const Appeal({super.key});

  @override
  State<Appeal> createState() => _AppealState();
}

class _AppealState extends State<Appeal> {
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Appeal',
                          style: GoogleFonts.rocknRollOne(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PROFILE);
                          },
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/girl.jpeg'),
                          ),
                        ),
                      ]),
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
                child: Container(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
