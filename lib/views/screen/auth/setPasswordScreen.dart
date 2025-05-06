import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                child: Text('Set Password',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Enter A New Password',style: AppStyles.fontSize16(color: AppColors.greyColor)),
              ),
              // Text sections
              SizedBox(height: 40.h),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('New Password',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter password',
                  controller: emailCtrl),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Confirm Password',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
              ),
              CustomTextField(
                  filColor: AppColors.white,
                  hintText: 'Enter password',
                  controller: passCtrl),


              SizedBox(height: 50.h),

              /// SaveIn Button
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.emailVerificationScreen);
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
}
