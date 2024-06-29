// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app.dart';
import '../controllers/general_config_controller.dart';
import '../routes/app_routes.dart';
import '../ui/widgets/global_loader.dart';
import 'constants.dart';

void showLoader() {
  generalConfigController.isLoaderActive.value = true;
  Get.dialog(
    barrierDismissible: false,
    const GlobalLoaderWidget(),
  );
}

// Future<String> validateNumber(String number) async {
//   RegExp specialCharRegex = RegExp(r'[^\w\s]');

//   if (!specialCharRegex.hasMatch(number) && number.length == 10) {
//     return '';
//   } else {
//     return 'Please enter a valid Mobile Number';
//   }
// }

// Future<String> validatePin(String number) async {
//   if (number.length == 6) {
//     RegExp repeated = RegExp(r'(\d)\1');
//     RegExp sequence = RegExp(r'012|123|234|345|456|567|678|789');
//     if (repeated.hasMatch(number)) {
//       return 'Entered Pin is weak, Do not use repeated digits';
//     } else if (sequence.hasMatch(number)) {
//       return 'Entered Pin is weak, Do not use digits in sequence';
//     } else {
//       return '';
//     }
//   } else {
//     return 'Please enter a pin with minimum 6 digits';
//   }
// }

Future<String> validateEmail(String email) async {
  bool isvalid = EmailValidator.validate(email);

  return !isvalid ? 'Please enter a valid Email Address' : '';
}

Future<String> validateAge(String age) async {
  if (int.parse(age) >= 0 && int.parse(age) <= 70) {
    return '';
  } else {
    return 'Please enter valid age';
  }
}

Future<String> validateChildAge(String age) async {
  if (int.parse(age) >= 0 && int.parse(age) <= 12) {
    return '';
  } else {
    return 'Please enter valid age for child';
  }
}

Future<String> validateAadhar(String aadhar) async {
  if (aadhar.length >= 12) {
    return '';
  } else {
    return 'Please enter valid Aadhar Number';
  }
}

Future<String> validateAddress(String add) async {
  if (add.length >= 16) {
    return '';
  } else {
    return 'Please enter full address';
  }
}

Future<String> validatePassword(String password) async {
  String pattern = r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[#$@!%&*?])(?=.*[a-z]).{6,}$';
  RegExp regExp = RegExp(pattern);
  if (regExp.hasMatch(password)) {
    return '';
  } else {
    return 'Password must be atleast 6 characters with 1 Capital Letter, 1 Small Letter, 1 Special, and 1 Digit';
  }
}

Future<String> validateName(String name) async {
  if (name.length >= 3) {
    return '';
  }
  return 'Name must be atleast 3 characters';
}

Future<String> validatePasswords(String password, String newpassword) async {
  if (password == newpassword) {
    return '';
  } else {
    return 'Passwords do not match';
  }
}

Future<String> validatePrice(String price) async {
  if (int.parse(price) > 0) {
    return '';
  } else {
    return 'Please enter a valid price';
  }
}

void showMessage(String title, String msg, Color titleColor) async {
  showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: titleMedium.copyWith(color: titleColor),
          ),
          content: Text(
            msg,
          ),
          actions: [
            TextButton(
              child: Text(
                'Ok',
                style: titleMedium.copyWith(color: Colors.green),
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

void showComingSoon() async {
  showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          backgroundColor: Colors.white,
          title: Text(
            'We are working on it',
            style: titleMedium,
          ),
          actions: [
            TextButton(
              child: Text(
                'Close',
                style: titleMedium.copyWith(color: Colors.green),
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

void showLogout(BuildContext context) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Are you sure you want to logout',
            style: titleMedium.copyWith(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: Text(
                'No',
                style: defaultStyle.copyWith(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Yes',
                style: defaultStyle.copyWith(color: Colors.black),
              ),
              onPressed: () async {
                generalConfigController.box.erase();
                Get.offAllNamed(Routes.LOGIN);
              },
            ),
          ],
        );
      });
}

Future<bool> isInternetAvailable() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}

void hideLoader() {
  if (generalConfigController.isLoaderActive.value) {
    generalConfigController.isLoaderActive.value = false;
    Get.back();
  }
}
