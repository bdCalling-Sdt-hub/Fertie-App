import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PeriodLengthScreen extends StatefulWidget {
  const PeriodLengthScreen({super.key});

  @override
  State<PeriodLengthScreen> createState() => _PeriodLengthScreenState();
}

class _PeriodLengthScreenState extends State<PeriodLengthScreen> {
  int periodLength = 0;
  DateTime startDate = DateTime(2025, 1, 1);
  DateTime endDate = DateTime(2025, 1, 5);

  void _incrementPeriod() {
    setState(() {
      periodLength++;
      endDate = startDate.add(Duration(days: periodLength - 1));
    });
  }

  void _decrementPeriod() {
    if (periodLength > 1) {
      setState(() {
        periodLength--;
        endDate = startDate.add(Duration(days: periodLength - 1));
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            hintColor: AppColors.redColor,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
        endDate = startDate.add(Duration(days: periodLength - 1));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Period Length',
          style: AppStyles.fontSize24(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Conditions
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  'How long does your period usually last?',
                  style: AppStyles.fontSize24(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Tip: Most periods last between 5 and 10 days.',
                style: AppStyles.fontSize14(
                  fontWeight: FontWeight.w600,
                  color: AppColors.subTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  height: 380.h,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: AppColors.subTextColor),
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Period Length Section
                      Text(
                        'Period Length',
                        style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _decrementPeriod();
                            },
                            child: SvgPicture.asset(AppIcons.minusIcon),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.r),
                            child: Container(
                              width: 100.w,
                              height: 60.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.colorFCF5F4,
                                border: Border.all(
                                    width: 1.w, color: AppColors.subTextColor),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                '$periodLength',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _incrementPeriod();
                            },
                            child: SvgPicture.asset(AppIcons.plusIcon),
                          ),
                        ],
                      ),
                      Text(
                        'Days',
                        style:
                        AppStyles.fontSize24(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 30.h),
                      // Start Date Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Date',
                            style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Select your start date, then the end date \nwill set automatically based on \nthe period length.',
                            style: AppStyles.fontSize14(color: AppColors.subTextColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 159.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.w, color: AppColors.subTextColor),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.r),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${_getMonthName(startDate.month)} ${startDate.day}, ${startDate.year}',
                                      style: AppStyles.fontSize14(fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(width: 4.w),
                                    SvgPicture.asset(
                                      AppIcons.calenderblackColor,
                                      height: 20.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              'to',
                              style: AppStyles.fontSize14(color: AppColors.subTextColor),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '${_getMonthName(endDate.month)} ${endDate.day}, ${endDate.year}',
                              style: AppStyles.fontSize14(color: AppColors.subTextColor, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }
}
