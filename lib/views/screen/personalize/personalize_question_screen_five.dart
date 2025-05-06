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

class PersonalizeQuestionScreenFive extends StatefulWidget {
  PersonalizeQuestionScreenFive({super.key});

  @override
  State<PersonalizeQuestionScreenFive> createState() => _PersonalizeQuestionScreenFiveState();
}

class _PersonalizeQuestionScreenFiveState extends State<PersonalizeQuestionScreenFive> {
  String? selectedOne;
  String? selectedTwo;

  TextEditingController conditionsText = TextEditingController();
  TextEditingController supplementsText = TextEditingController();
  TextEditingController familyText = TextEditingController();
  TextEditingController fertilityText = TextEditingController();


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
                  SvgPicture.asset(AppIcons.lineIcon,width: 30.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text('Medical & Lifestyle 💊', style: AppStyles.fontSize24(fontWeight: FontWeight.w900,color: AppColors.primaryColor)),
                  ),
                  SvgPicture.asset(AppIcons.lineIcon,width: 30.w),
                ],
              ),


              //============conditions
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Any medical conditions or surgeries we should know about?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(
                  controller: conditionsText,
                  maxLines: 4,
                  hintText: 'Type here',
                ),
              ),

              //============ >> supplements
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Are you taking any medications or supplements?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(
                  controller: supplementsText,
                  hintText: 'Type here',
                  maxLines: 4,
                ),
              ),
              SizedBox(height: 10.h),
              // Question
              Text('Any history of STDs or pelvic infections?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
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
              SizedBox(height: 10.h),
              Text('Do you smoke, drink, or use recreational drugs?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
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
              //============ >> family
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Any family health conditions (especially fertility-related)?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(
                  controller: familyText,
                  hintText: 'Type here',
                  maxLines: 4,
                ),
              ),
              //============ >> fertility

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Want to share anything about your partner’s health or fertility?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(
                  controller: fertilityText,
                  hintText: 'Type here',
                  maxLines: 4,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: CustomButton(
                  onTap: () {
                    // Get.toNamed(AppRoutes.PersonalizeQuestionScreenFive);
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
                    Get.toNamed(AppRoutes.periodLengthScreen);
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
