import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/base/custom_text.dart';
import 'package:fertie_application/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                child: Text('Reset Password',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Enter A New Password',style: AppStyles.fontSize16(color: AppColors.greyColor)),
              ),
              // Text sections
              SizedBox(height: 40.h),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Current Password',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter current password',
                  controller: emailCtrl),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('New Password',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Confirm password',
                  controller: emailCtrl),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Confirm Password',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter password',
                  controller: passCtrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //=================================> Forgot Password Button <================================
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.forgetPasswordScreen);
                    },
                    child: CustomText(
                      fontWeight: FontWeight.bold,
                      text: 'Forgot Password?',
                      color: AppColors.blueColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),


              SizedBox(height: 50.h),

              /// SaveIn Button
              CustomButton(
                onTap: () {
                  _showCustomBottomSheet(context);
                },
                text:'Save',
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  //=========================>>>>>  Password Change BottomSheet    <<<================================
  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: AppColors.white,
          ),
          height: 410.h,
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.h),
                ),
              ),
              SizedBox(height: 20.h),
              SvgPicture.asset(AppIcons.changedIcon),
              SizedBox(height: 20.h),
              Text('Password Changed!', style: AppStyles.fontSize24(color: AppColors.blackColor,fontWeight: FontWeight.w600)),
              SizedBox(height: 20.h),
              Text('Return to the login page to enter your account with your new password.',
                  style: AppStyles.fontSize16(color: AppColors.color565656),textAlign: TextAlign.center),
              SizedBox(height: 20.h),
              CustomButton(onTap: (){}, text: "Back to Profile")
            ],
          ),
        );
      },
    );
  }
}
