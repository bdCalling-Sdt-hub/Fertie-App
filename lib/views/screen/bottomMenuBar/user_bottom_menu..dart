import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class UserBottomMenu extends StatelessWidget {
  final int menuIndex;
  const UserBottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? AppColors.white : AppColors.blackColor;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: title,
        icon: Padding(
          padding:  EdgeInsets.only(top: 4.h),
          child: SvgPicture.asset(
            image,
            height: 27.h, // 24 in figma
            width: 27.w,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem(menuIndex == 0 ? AppIcons.homeFillUpIcon : AppIcons.homeIcon, 'Home', theme, 0),
      getItem(menuIndex == 1 ? AppIcons.insightFillup : AppIcons.insightIcon,'Insight', theme, 1),
      getItem(menuIndex == 2 ? AppIcons.profileFillup : AppIcons.profileIcon, 'Profile', theme, 2),
      getItem(menuIndex == 3 ? AppIcons.notificationFillup : AppIcons.notificationIcon, 'Notification', theme, 3),
    ];

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: Offset(0, -.05),
          ),
        ],
      ),
      child: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: AppColors.primaryColor2),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor2,
        unselectedItemColor: AppColors.greyColor,
        currentIndex: menuIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              Get.offAndToNamed(AppRoutes.homeScreen);
              break;
            case 1:
              Get.offAndToNamed(AppRoutes.cycleInsightsScreen);
              break;
            case 2:
              Get.offAndToNamed(AppRoutes.profileScreen);
              break;
            case 3:
              Get.offAndToNamed(AppRoutes.notificationScreen);
              break;
          }
        },
        items: menuItems,
      ),
    );
  }
}

