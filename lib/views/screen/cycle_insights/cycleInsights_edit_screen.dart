import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';



class EditCycleInsightScreen extends StatefulWidget {
  const EditCycleInsightScreen({super.key});

  @override
  State<EditCycleInsightScreen> createState() => _EditCycleInsightScreenState();
}

class _EditCycleInsightScreenState extends State<EditCycleInsightScreen> {
  TextEditingController textEditingController = TextEditingController();


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title:  Text('Cycle Insight',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Text('January 12, Thursday',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.colorEBD7C7,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(8.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Menstrual flow',style: AppStyles.fontSize14()),
                                        Row(
                                          children: [
                                            SvgPicture.asset(AppIcons.bloodIcon),
                                            SizedBox(width: 4.w),
                                            Text('Light',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Mood',style: AppStyles.fontSize14()),
                                              SizedBox(height: 8.h),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(AppIcons.bloodIcon),
                                                  SizedBox(width: 4.w),
                                                  Text('Great',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Activity',style: AppStyles.fontSize14()),
                                              SizedBox(height: 8.h),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(AppIcons.loveIcon),
                                                  SizedBox(width: 4.w),
                                                  Text('Intercourse',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    //Symptom
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Symptoms',style: AppStyles.fontSize14()),
                                              SizedBox(height: 8.h),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(AppIcons.bloodIcon),
                                                        SizedBox(width: 4.w),
                                                        Text('Great',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(AppIcons.bloodIcon),
                                                        SizedBox(width: 4.w),
                                                        Text('Others',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),

                                      ],
                                    ),


                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
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
