import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_images.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/base/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class OnboardingScreen extends StatefulWidget {
   OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  TextEditingController text = Get.put(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              //=============================> Skip Button <========================
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(width: 1.w, color: AppColors.primaryColor),
                    ),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 3.h),
                      child: CustomText(
                        text: 'Skip',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              //=============================> Onboarding Img Section <========================
              SizedBox(height: 145.h),
              Image.asset(AppImages.appLogo, width: 357.w, height: 357.h),
              //=============================> GET STARTED Button <========================
              SizedBox(height: 120.h),
              CustomButton(
                  onTap: () {
                     Get.toNamed(AppRoutes.signInScreen);
                  },
                  text: 'GET STARTED'),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
