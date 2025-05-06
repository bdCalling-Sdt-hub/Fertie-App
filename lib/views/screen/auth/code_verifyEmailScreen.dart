import 'dart:async';
import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/base/custom_text.dart';
import 'package:fertie_application/views/base/pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CodeVerifyEmailScreen extends StatefulWidget {
  const CodeVerifyEmailScreen({super.key});

  @override
  State<CodeVerifyEmailScreen> createState() => _CodeVerifyEmailScreenState();
}

class _CodeVerifyEmailScreenState extends State<CodeVerifyEmailScreen> {
  TextEditingController verifyCodeCtrl = TextEditingController();
  late Timer _timer;
  int _start = 180;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Verify Email', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                child: Text('Please Check Your Email And Enter The Code', style: AppStyles.fontSize16(color: AppColors.greyColor)),
              ),
              SizedBox(height: 40.h),

              CustomPinCodeTextField(
                textEditingController: verifyCodeCtrl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_formatTime(_start), style: AppStyles.fontSize20(color: AppColors.greyColor, fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: 50.h),

              /// SaveIn Button
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.resetPasswordScreen);
                },
                text: 'Sent OTP',
              ),

              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't received code?"),
                  TextButton(
                    onPressed: () {
                      // Add your resend logic here
                    },
                    child: CustomText(
                      text: "Resend it",
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
