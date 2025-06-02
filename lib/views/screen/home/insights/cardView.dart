import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardView extends StatelessWidget {
  final String icon;
  final String title;
  final String date;
  final String description;
  final double? iconSize;
  final TextStyle? descriptionStyle;

  const CardView({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.description, this.iconSize, this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: 188.w,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        color: AppColors.colorFEFDFB,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.greyColor2,
            width: 0.7.w,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4.h, top: 16),
                child: Image.asset(
                  icon,
                  width: iconSize ?? 40.w,
                  height: iconSize ?? 40.h,
                ),
              ),

              Text(
                title,
                style: AppStyles.fontSize20(fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  date,
                  style: AppStyles.fontSize14(fontWeight: FontWeight.w400,color: AppColors.color777777),
                ),
              ),
              Divider(thickness: 1,color: AppColors.greyColor2),
              Text(
                description,
                style: descriptionStyle ?? AppStyles.fontSize12(fontWeight: FontWeight.w500,color: AppColors.color777777),
              ),
              const SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }
}