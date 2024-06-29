// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../routes/app_routes.dart';
import '../utils/common_methods.dart';

List<String> pendingResponses = [];

class APIClass {
  _encryptRequestData(
      {Map<String, String>? headers, Map<String, String>? params}) {
    // Encryption code Started
    var body = params;
    // String jsonBody = json.encode(body); // Convert Json From HashMap Parameters
    // //Header part
    // var key = utf8.encode(APISECRET);
    // var bytes = utf8.encode(jsonBody);
    // var hmacSha256 = Hmac(sha256, key);
    // var hashKey = hmacSha256.convert(bytes);
    // log("xHash == $hashKey");
    var head = headers ?? {};
    // head.addAll({"x-hash": hashKey.toString()});
    // // String encodedString = _generateString(jsonBody);
    // log("encodedString  $encodedString");
    Map<String, String> parameters = {};
    //
    // parameters.addAll({"jsonData": encodedString});
    // Encryption code END
    return {"headers": head, "params": parameters, "body": body};
  }

  dynamic _evalResponse(
      http.Response response, String decryptedResponseData, String url,
      {bool showToast = false, bool showErrorPopup = true}) {
    if (pendingResponses.contains(url)) {
      pendingResponses.remove(url);
      Map<String, dynamic> data = jsonDecode(decryptedResponseData);
      hideLoader();
      return data;
    }
  }

  Future<dynamic> getAPICall({
    required String url,
    Map<String, String>? headers,
    Map<String, String>? params,
    bool shouldShowLoader = true,
  }) async {
    if (shouldShowLoader) {
      showLoader();
    }
    bool isInternetConnected = await isInternetAvailable();
    if (isInternetConnected) {
      // ignore: unused_local_variable
      Map<String, dynamic> encryptedData =
          _encryptRequestData(headers: headers, params: params);
      pendingResponses.add(url);
      log("Current pending requests${pendingResponses.toString()}");

      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      var data = _evalResponse(response, response.body, url);

      log("API $url Response ===>> Body ${jsonEncode(data)}");
      return data;
    } else {
      Get.toNamed(Routes.NOINTERNET);
    }
  }

  Future<dynamic> postAPICall({
    required String url,
    Map<String, String>? headers,
    Map<String, String>? params,
    Map<String, dynamic>? body,
    bool shouldShowLoader = true,
    bool showToast = false,
    bool showErrorPopup = true,
  }) async {
    if (shouldShowLoader) {
      showLoader();
    }
    bool isInternetConnected = await isInternetAvailable();
    if (isInternetConnected) {
      log("API Called $url");

      pendingResponses.add(url);
      log("Current pending requests${pendingResponses.toString()}");
      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: headers,
      );
      log(response.statusCode.toString());

      var data = _evalResponse(response, response.body, url,
          showToast: showToast, showErrorPopup: showErrorPopup);
      log("API $url Response ===>> Body $data");
      if (response.statusCode == 200) {
        return data;
      } else {}
    } else {
      Get.toNamed(Routes.NOINTERNET);
    }
  }

//   Future deletePost({required String url, required String id}) async {
//     http.Response res = await http.delete(
//       Uri.parse("$url/$id"),
//     );

//     if (res.statusCode == 200) {
//       return res.statusCode;
//     } else {}
//   }

  Future<dynamic> putAPICall({
    required String url,
    Map<String, String>? headers,
    Map<String, String>? params,
    Map<String, dynamic>? body,
    bool shouldShowLoader = true,
    bool showToast = false,
    bool showErrorPopup = true,
  }) async {
    if (shouldShowLoader) {
      showLoader();
    }
    bool isInternetConnected = await isInternetAvailable();
    if (isInternetConnected) {
      log("API Called $url");

      pendingResponses.add(url);
      log("Current pending requests${pendingResponses.toString()}");
      http.Response response = await http.put(
        Uri.parse(url),
        body: json.encode(body),
        headers: headers,
      );
      log(response.statusCode.toString());

      var data = _evalResponse(response, response.body, url,
          showToast: showToast, showErrorPopup: showErrorPopup);
      log("API $url Response ===>> Body $data");
      if (response.statusCode == 200) {
        return data;
      } else {}
    } else {
      Get.toNamed(Routes.NOINTERNET);
    }
  }
}
