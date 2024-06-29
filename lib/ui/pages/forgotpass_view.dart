// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/ui/widgets/common_button.dart';
import 'package:hackathon/ui/widgets/common_text_field.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _FileComplainState();
}

class _FileComplainState extends State<ForgetPass> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
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
                        Row(children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            color: Colors.white,
                            icon: const Icon(Icons.arrow_back),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Forgot Password',
                            style: GoogleFonts.rocknRollOne(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ]),
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CommonTextFieldWidget(
                              label: 'Enter your email',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
                    ),
                    Center(
                      child: CommonButtonWidget(
                        label: 'Register',
                        onTap: () {},
                        isEnabled: true,
                        height: Get.width * .9,
                      ),
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
