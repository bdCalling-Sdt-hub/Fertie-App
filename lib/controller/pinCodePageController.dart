import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PinCodePageController extends GetxController {
  var pinCode = ''.obs;
  var confirmPinCode = ''.obs;


  setPinCode()  {
    if (confirmPinCode.value == pinCode.value) {

      Get.snackbar(
        "Not matched",
        "Both pin code should be same",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Not matched",
        "Both pin code should be same",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      confirmPinCode.value = '';
    }


  }
}