import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fertie_application/helpers/prefs_helpers.dart';
import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_constants.dart';
import 'package:fertie_application/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    StreamSubscription;
     getConnectivity();
  }
  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200.h),
                Container(
                  height: 300.h,
                  width: 345.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24.r)),
                  ),
                  child:    Image.asset(AppImages.appLogo, width: 357.w, height: 357.h),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///===================internet connection checker==================>
  StreamSubscription? streamSubscription;
  bool isConnection = false;

  ///========================is internet connection check========================>
  void getConnectivity() async {
    streamSubscription = Connectivity().onConnectivityChanged.listen((event) async {
      isConnection = await InternetConnectionChecker.instance.hasConnection;

      ///==================if internet is available===================>
      if (isConnection) {
        print("------------------Internet available");
        Timer(const Duration(seconds: 4), () async {
          bool? isLogged = await PrefsHelper.getBool(AppConstants.isLogged);
          var role = await PrefsHelper.getString(AppConstants.role);
          //String token = await PrefsHelper.getString(AppConstants.bearerToken);

          ///========================Check islogged in, token, and role then decide where will be navigate====================>

       /*   if (isLogged != null && isLogged) {
              if (role == Role.projectManager.name) {
                Get.offAllNamed(AppRoutes.managerHomeScreen);
              }
              if (role == Role.projectSupervisor.name) {
                Get.offAllNamed(AppRoutes.splashScreen);
              }
          } */ {
            Get.offAllNamed(AppRoutes.onboardingScreen);
          }
        });
      }

      ///======================no internet=========================>
      else {
        Get.offAllNamed(AppRoutes.onboardingScreen);
        Get.snackbar("No Internet", 'Connect your device with internet');
        print("----------------------No internet");
      }
    });
  }
}
