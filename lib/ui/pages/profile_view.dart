// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/common_methods.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * .09,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            Text(
                              'Profile',
                              style: GoogleFonts.rocknRollOne(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        PopupMenuButton(
                            color: Colors.white,
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      child: TextButton.icon(
                                    onPressed: () {
                                      showLogout(context);
                                    },
                                    icon: const Icon(
                                      Icons.logout_rounded,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      "Sign Out",
                                      style: GoogleFonts.rocknRollOne(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ))
                                ]),
                      ],
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
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
