import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PersonalizeQuestionScreenTwo extends StatefulWidget {
  PersonalizeQuestionScreenTwo({super.key});

  @override
  State<PersonalizeQuestionScreenTwo> createState() => _PersonalizeQuestionScreenTwoState();
}

class _PersonalizeQuestionScreenTwoState extends State<PersonalizeQuestionScreenTwo> {
  String? selectedOne ;
  String? selectedTwo;
  String? selectedThree;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Personalize Journey 🧡', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Date of Birth Question
              Text('Are you currently trying to conceive?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'Yes',
                        groupValue: selectedOne,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOne = value;
                          });
                        },
                      ),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'No',
                        groupValue: selectedOne,
                        onChanged: (String? value) {
                          setState(() {
                            selectedOne = value;
                          });
                        },
                      ),
                      Text('No'),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 40.h),
              // Height Question
              Text('Are your cycles regular?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'Yes',
                        groupValue: selectedTwo,
                        onChanged: (String? value) {
                          setState(() {
                            selectedTwo = value;
                          });
                        },
                      ),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'No',
                        groupValue: selectedTwo,
                        onChanged: (String? value) {
                          setState(() {
                            selectedTwo = value;
                          });
                        },
                      ),
                      Text('No'),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 40.h),
              // Weight Question
              Text('Describe your flow:', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'Light',
                        groupValue: selectedThree,
                        onChanged: (String? value) {
                          setState(() {
                            selectedThree = value;
                          });
                        },
                      ),
                      Text('Light'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'Normal',
                        groupValue: selectedThree,
                        onChanged: (String? value) {
                          setState(() {
                            selectedThree = value;
                          });
                        },
                      ),
                      Text('Normal'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'Heavy',
                        groupValue: selectedThree,
                        onChanged: (String? value) {
                          setState(() {
                            selectedThree = value;
                          });
                        },
                      ),
                      Text('Heavy'),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.personalizeQuestionScreenThree);
                  },
                  text: 'Next',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: CustomButton(
                  color: AppColors.white,
                  borderColor: AppColors.white,
                  onTap: () {
                    //Get.toNamed(AppRoutes.personalizeQuestionScreenTwo);
                  },
                  text: 'Back',
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
