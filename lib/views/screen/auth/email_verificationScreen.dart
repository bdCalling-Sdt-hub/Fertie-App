
import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Email Verification',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Please Enter Your Email Address To Verify',style: AppStyles.fontSize16(color: AppColors.greyColor)),
              ),
              // Text sections
              SizedBox(height: 40.h),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Email',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter email',
                  controller: emailCtrl),




              SizedBox(height: 50.h),

              /// Next Button
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.codeVerifyEmailScreen);
                },
                text:'Next',
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
