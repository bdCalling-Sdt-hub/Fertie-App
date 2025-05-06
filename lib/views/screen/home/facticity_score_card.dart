import 'dart:async';
import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/screen/home/customCircularProgressIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class FactityScoreContainer extends StatefulWidget {
  @override
  State<FactityScoreContainer> createState() => _FactityScoreContainerState();
}

class _FactityScoreContainerState extends State<FactityScoreContainer> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_currentPage < 4) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Lindsay', style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
        Text('Let\'s Track Smarter, Not Harder!', style: AppStyles.fontSize14(fontWeight: FontWeight.w600, color: AppColors.primaryColor)),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          height: 241.h,
          decoration: BoxDecoration(
            color: AppColors.colorE0DCD2,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.r),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Container for the background
                              Container(
                                width: 150.w,
                                height: 130.h,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),

                              SizedBox(
                                width: 130.w,
                                height: 120.h,
                                child: CustomCircularProgressIndicator(
                                  value: 0.82,
                                  strokeWidth: 10.0,
                                  backgroundColor: AppColors.color594756,
                                  valueColor: AppColors.primaryColor
                                )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Facticity', style: AppStyles.fontSize20(fontWeight: FontWeight.w600,color: AppColors.color594756)),
                                  Text('Score', style: AppStyles.fontSize18(fontWeight: FontWeight.w600,color: AppColors.color594756)),
                                  Text('82', style: AppStyles.fontSize20(fontWeight: FontWeight.w800,color: AppColors.color594756)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                          child: Row(
                            children: [
                              Text('Edit Insights',style: AppStyles.fontSize14(fontWeight: FontWeight.w800,color: AppColors.color594756)),
                              SizedBox(width: 8.w),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.editInsightsScreen);
                                },
                                child: SvgPicture.asset(AppIcons.editIcon),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // PageView for horizontal scrolling
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 40.h),
                    child: PageView(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        CardWidget(),
                        SizedBox(width: 1.w),
                        CardWidget(),
                        SizedBox(width: 1.w),
                        CardWidget(),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.sp,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131.h,
      width: 147.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Expected', style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
            ),
            Text(
              'Period',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Jan, 1',
              style: AppStyles.fontSize20(fontWeight: FontWeight.w600),
            ),
            Text(
              'In 12 Days',
              style: AppStyles.fontSize20(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
