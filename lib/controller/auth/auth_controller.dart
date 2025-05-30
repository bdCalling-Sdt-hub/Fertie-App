import 'package:fertie_application/data/api_constants.dart';
import 'package:fertie_application/helpers/prefs_helpers.dart';
import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/service/api_checker.dart';
import 'package:fertie_application/service/api_client.dart';
import 'package:fertie_application/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  ///<=============================== Sign In Method ===========================>


  var signInLoading = false.obs;

  signInMethod() async {
    signInLoading(true);
  //  var fcmToken = await PrefsHelper.getString(AppConstants.fcmToken);
    var headers = {
      'Content-Type': 'application/json'
    };

    Map<String, dynamic> body = {
      "email": emailCtrl.text.trim(),
      "password": passCtrl.text.trim(),
     // "fcmToken": fcmToken,

    };

    print("===================> $body");

      Response response = await ApiClient.postData(
        ApiConstants.signInEndPoint,
        body,
        headers: headers,
      );

      print("============> Response Body: ${response.body}, Status Code: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        signInLoading(false);
       // PrefsHelper.setString(AppConstants.fcmToken, response.body['data']['fcmToken']);
        PrefsHelper.setString(AppConstants.bearerToken, response.body['data']['attributes']['tokens']['accessToken']);
          Get.offAllNamed(AppRoutes.homeScreen);
          Get.snackbar('Successfully', response.body['message']);
      }
      else{
        signInLoading(false);
        ApiChecker.checkApi(response);
        Get.snackbar('Error', response.body['message']);
      }

  }
}