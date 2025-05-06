import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpgradeAccountScreen extends StatefulWidget {
  const UpgradeAccountScreen({super.key});

  @override
  State<UpgradeAccountScreen> createState() => _UpgradeAccountScreenState();
}

class _UpgradeAccountScreenState extends State<UpgradeAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title: Text('Upgrade Account', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.r),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Container(
                height: 450.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor,
                      blurRadius: .1,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        // The red container at the back
                        Container(
                          height: 175.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.colorFae6e3,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r),
                              bottomLeft: Radius.circular(80.r),
                              bottomRight: Radius.circular(80.r),
                            ),
                          ),
                        ),
                        // Your original container on top
                        Container(
                          height: 150.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r),
                              bottomLeft: Radius.circular(80.r),
                              bottomRight: Radius.circular(80.r),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.r),
                              child: Column(
                                children: [
                                  Text('Premium', style: AppStyles.fontSize24(fontWeight: FontWeight.bold)),
                                  Text('\$19.99', style: AppStyles.fontSize32(fontWeight: FontWeight.bold)),
                                  Text('per month', style: AppStyles.fontSize18()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: 20.h),
                    Text('Key Features', style:AppStyles.fontSize20(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppIcons.checkIcon),
                                  SizedBox(width: 8.w),
                                  Text('Fertie interactive chat'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppIcons.checkIcon),
                                  SizedBox(width: 8.w),
                                  Text('Cycle Insights'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppIcons.checkIcon),
                                  SizedBox(width: 8.w),
                                  Text('Your Personalized Plan'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:20.w),
                      child: CustomButton(onTap: (){}, text: 'Start'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

