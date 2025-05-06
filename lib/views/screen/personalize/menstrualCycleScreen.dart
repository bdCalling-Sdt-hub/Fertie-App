import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MenstrualCycleScreen extends StatefulWidget {
  MenstrualCycleScreen({super.key});

  @override
  State<MenstrualCycleScreen> createState() => _MenstrualCycleScreenState();
}

class _MenstrualCycleScreenState extends State<MenstrualCycleScreen> {
  int cycleLength = 0;
  DateTime startDate = DateTime(2025, 1, 1);
  DateTime endDate = DateTime(2025, 1, 5);

  void _incrementPeriod() {
    setState(() {
      cycleLength++;
    });
  }

  void _decrementPeriod() {
    if (cycleLength > 1) {
      setState(() {
        cycleLength--;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Menstrual Cycle',
          style: AppStyles.fontSize24(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Conditions
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'What is your average menstrual cycle length?',
                  style: AppStyles.fontSize24(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Tip: An average cycle lasts between 24 and 40 days.',
                style: AppStyles.fontSize14(
                  fontWeight: FontWeight.w600,
                  color: AppColors.subTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Period Length Section
                  Text(
                    'Cycle Length',
                    style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: (){
                            _decrementPeriod();
                          },
                          child: SvgPicture.asset(AppIcons.minusIcon)),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        child: Container(
                          width: 100.w,
                          height: 60.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.colorFCF5F4,
                            border: Border.all(width: 1.w, color: AppColors.subTextColor),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '$cycleLength',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){
                          _incrementPeriod();
                        },
                          child: SvgPicture.asset(AppIcons.plusIcon)),
                    ],
                  ),

                  Text('Days', style: AppStyles.fontSize24(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 80.h),
                  // Start Date Section

                ],
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: CustomButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.menstrualCycleScreen);
                  },
                  text: 'Set And Next',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: CustomButton(
                  color: AppColors.white,
                  borderColor: AppColors.white,
                  onTap: () {
                    Get.back();
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