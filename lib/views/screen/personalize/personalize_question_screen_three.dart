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

class PersonalizeQuestionScreenThree extends StatefulWidget {
  PersonalizeQuestionScreenThree({super.key});

  @override
  State<PersonalizeQuestionScreenThree> createState() => _PersonalizeQuestionScreenThreeState();
}

class _PersonalizeQuestionScreenThreeState extends State<PersonalizeQuestionScreenThree> {
  String? selectedOne;
  String? selectedTwo;
  String? selectedThree;
  TextEditingController monthText = TextEditingController();
  final Set<String> _selectedOptions = {};

  void _handleCheckboxChange(String option, bool? isChecked) {
    setState(() {
      if (option == 'None') {
        // If "None" is selected, clear all other options
        if (isChecked == true) {
          _selectedOptions.clear();
          _selectedOptions.add('None');
        } else {
          _selectedOptions.remove('None');
        }
      } else {
        // If any other option is selected, remove "None"
        if (isChecked == true) {
          _selectedOptions.add(option);
          _selectedOptions.remove('None');
        } else {
          _selectedOptions.remove(option);
        }
      }
    });
  }

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
                  SvgPicture.asset(AppIcons.lineIcon,width: 80.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text('Optional Info', style: AppStyles.fontSize24(fontWeight: FontWeight.w900,color: AppColors.primaryColor)),
                  ),
                  SvgPicture.asset(AppIcons.lineIcon,width: 80.w),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('How long have you been trying?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomTextField(
                  controller: monthText,
                  hintText: 'Enter in month',
                ),
              ),
              // Date of Birth Question
              Text('Are you using any of these to track ovulation?', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.blue,
                    value: _selectedOptions.contains('Ovulation tests (OPKs)'),
                    onChanged: (bool? value) {
                      _handleCheckboxChange('Ovulation tests (OPKs)', value);
                    },
                  ),
                  const Text('Ovulation tests (BBT)'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.blue,
                    value: _selectedOptions.contains('Basal body temp (BBT)'),
                    onChanged: (bool? value) {
                      _handleCheckboxChange('Basal body temp (BBT)', value);
                    },
                  ),
                  const Text('Basal body temp (BBT)'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.blue,
                    value: _selectedOptions.contains('Cervical mucus'),
                    onChanged: (bool? value) {
                      _handleCheckboxChange('Cervical mucus', value);
                    },
                  ),
                  const Text('Cervical mucus'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.blue,
                    value: _selectedOptions.contains('Progesterone Testing'),
                    onChanged: (bool? value) {
                      _handleCheckboxChange('Progesterone Testing', value);
                    },
                  ),
                  const Text('Progesterone Testing'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.blue,
                    value: _selectedOptions.contains('None'),
                    onChanged: (bool? value) {
                      _handleCheckboxChange('None', value);
                    },
                  ),
                  const Text('None'),
                ],
              ),
            ],
          ),

              SizedBox(height: 10.h),
              // Period Question
              Text('Do you have pain with your period? 🩸', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'Mild',
                        groupValue: selectedTwo,
                        onChanged: (String? value) {
                          setState(() {
                            selectedTwo = value;
                          });
                        },
                      ),
                      Text('Mild'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'Moderate',
                        groupValue: selectedTwo,
                        onChanged: (String? value) {
                          setState(() {
                            selectedTwo = value;
                          });
                        },
                      ),
                      Text('Moderate'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: 'Severe',
                        groupValue: selectedTwo,
                        onChanged: (String? value) {
                          setState(() {
                            selectedTwo = value;
                          });
                        },
                      ),
                      Text('Severe'),
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
                   Get.toNamed(AppRoutes.personalizeQuestionScreenFour);
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
                    //Get.toNamed(AppRoutes.PersonalizeQuestionScreenThree);
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
