
import 'package:fertie_application/helpers/prefs_helpers.dart';
import 'package:fertie_application/utils/app_constants.dart';
import 'package:get/get.dart';


class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        await PrefsHelper.remove(AppConstants.isLogged);
        await PrefsHelper.remove(AppConstants.bearerToken);
       // Get.offAllNamed(AppRoutes.logInScreen);
       // Get.offAllNamed(AppRoutes.logInScreen);
      } else {
        // showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
      }
    }
  }
}
