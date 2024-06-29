// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/controllers/postgrievance_controller.dart';
import 'package:hackathon/ui/widgets/common_button.dart';
import 'package:hackathon/ui/widgets/common_text_field.dart';
import '../../main.dart';
import '../../routes/app_routes.dart';

class FileComplain extends StatefulWidget {
  const FileComplain({super.key});

  @override
  State<FileComplain> createState() => _FileComplainState();
}

class _FileComplainState extends State<FileComplain> {
  List<String> list = <String>[
    'HR',
    'Operations',
    'Marketing',
    'Deployment',
    'Development'
  ];
  List<String> list1 = <String>[
    'Mental',
    'Bullying',
    'Body Shaming',
    'Wistle Blowing'
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    String dropdownValue1 = list1.first;

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
                          'File a Complaint',
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
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              CommonTextFieldWidget(
                                label: 'Complaint Title',
                                controller: titleController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Type",
                                style: GoogleFonts.rocknRollOne(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                child: DropdownMenu<String>(
                                  menuStyle: MenuStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.grey.shade100)),
                                  width: Get.width * .9,
                                  trailingIcon:
                                      const Icon(Icons.keyboard_arrow_down),
                                  inputDecorationTheme:
                                      const InputDecorationTheme(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                  initialSelection: list1.first,
                                  onSelected: (String? value) {
                                    setState(() {
                                      dropdownValue1 = value!;
                                    });
                                  },
                                  dropdownMenuEntries: list1
                                      .map<DropdownMenuEntry<String>>(
                                          (String value) {
                                    return DropdownMenuEntry<String>(
                                        value: value, label: value);
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Concerned Department",
                                style: GoogleFonts.rocknRollOne(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                child: DropdownMenu<String>(
                                  menuStyle: MenuStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.grey.shade100)),
                                  width: Get.width * .9,
                                  trailingIcon:
                                      const Icon(Icons.keyboard_arrow_down),
                                  inputDecorationTheme:
                                      const InputDecorationTheme(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                  initialSelection: list.first,
                                  onSelected: (String? value) {
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                  dropdownMenuEntries: list
                                      .map<DropdownMenuEntry<String>>(
                                          (String value) {
                                    return DropdownMenuEntry<String>(
                                        value: value, label: value);
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CommonTextFieldWidget(
                                label: 'Complaint Description',
                                controller: descriptionController,
                                maxLines: 8,
                              ),
                            ]),
                      ),
                    ),
                    Center(
                      child: CommonButtonWidget(
                        label: 'File',
                        onTap: () {
                          PostGrievanceController postGrievanceController =
                              getIt.get<PostGrievanceController>();
                          postGrievanceController.department = dropdownValue;
                          postGrievanceController.grievanceId =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          postGrievanceController.description =
                              descriptionController.text;
                          postGrievanceController.serverity = 'High';
                          postGrievanceController.title = titleController.text;
                          postGrievanceController.type = dropdownValue1;
                          postGrievanceController.postGrievance();
                        },
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
