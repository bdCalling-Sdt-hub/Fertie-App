import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/app_images.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:fertie_application/views/screen/home/insights/facticity_score_card.dart';
import 'package:fertie_application/views/screen/home/home_screen_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(0),
   /*   appBar: AppBar(
      //  title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              CustomButton(onTap: () {
                Get.toNamed(AppRoutes.personalizeScreen);
              }, text: "Personalize Journey 🧡"
              ),
              SizedBox(height: 10.h),
              FactityScoreContainer(),
              SizedBox(height: 10.h),
              HomeScreenLineChart(),
              SizedBox(height: 10.h),
              Text('Today\'s Rundown :', style: AppStyles.fontSize16(fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AppColors.colorE0DCD2,
                    border: Border.all(
                        width: 1.w, color: AppColors.subTextColor),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phase'),
                            Text('Menstrual', style: AppStyles.fontSize16(
                                fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Intensity'),
                            Text('Very Low', style: AppStyles.fontSize16(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cycle Day'),
                            Text('4', style: AppStyles.fontSize16(
                                fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Total Cycle Insight
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today Cycle Insights :', style: AppStyles.fontSize16(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('Edit Insights',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(AppIcons.editIcon),

                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
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
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPopup(context);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Image.asset(AppImages.cuteappLogo),
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFDC86),
          title: Text('Unlock full cycle insights with a 👑 Premium subscription! ',
              style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
          content: Text('Tap to Upgrade and get personalized features. 🎉🎉'),
        );
      },
    );
  }
}
