import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardView extends StatelessWidget {
  final String icon;
  final String title;
  final String date;
  final String description;

  const CardView({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216.h,
      width: 188.w,
      child: Card(
        elevation: 2,
        color: AppColors.colorFEFDFB,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.greyColor,
            width: .2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                icon,
                width: 40.w,
                height: 40.h,
              ),

              Text(
                title,
                style: AppStyles.fontSize20(fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  date,
                  style: AppStyles.fontSize14(fontWeight: FontWeight.w600),
                ),
              ),
              Divider(thickness: 1,color: AppColors.greyColor),
              Text(
                description,
                style: AppStyles.fontSize12(fontWeight: FontWeight.w600,color: AppColors.greyColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}