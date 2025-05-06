import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PersonalizeQuestionScreenFour extends StatefulWidget {
  PersonalizeQuestionScreenFour({super.key});

  @override
  State<PersonalizeQuestionScreenFour> createState() => _PersonalizeQuestionScreenFourState();
}

class _PersonalizeQuestionScreenFourState extends State<PersonalizeQuestionScreenFour> {
  String? selectedOne;
  String? selectedTwo;

  TextEditingController timeText = TextEditingController();
  TextEditingController outcomeText = TextEditingController();


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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.lineIcon,width: 50.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text('Pregnancy History', style: AppStyles.fontSize24(fontWeight: FontWeight.w900,color: AppColors.primaryColor)),
                  ),
                  SvgPicture.asset(AppIcons.lineIcon,width: 50.w),
                ],
              ),
              SizedBox(height: 20.h),
              // Question 1
              Text('Have you ever been pregnant?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
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

              //============How many times
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('How many times?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(
                  controller: timeText,
                  hintText: 'Type here',
                ),
              ),

              //============Outcomes
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Outcome(s)', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(
                  controller: outcomeText,
                  hintText: 'Type here',
                  maxLines: 4,
                ),
              ),
              SizedBox(height: 10.h),
              Text('Was it with your current partner?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
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
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: CustomButton(
                  onTap: () {
                     Get.toNamed(AppRoutes.personalizeQuestionScreenFive);
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
                    Get.toNamed(AppRoutes.personalizeQuestionScreenFive);
                  },
                  text: 'Skip',
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
