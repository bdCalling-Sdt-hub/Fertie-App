import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CycleInsightsCard extends StatelessWidget {
  final Widget svgIcon; // <-- Accept any widget here for icon
  final Color iconColor;
  final Color backgroundColor;
  final String? title;
  final String content;
  final String headerText;

  const CycleInsightsCard({
    super.key,
    required this.svgIcon,
    required this.iconColor,
    this.title,
    required this.content,
    required this.headerText,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  headerText,
                  style: AppStyles.fontSize14(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: svgIcon,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null && title!.isNotEmpty) ...[
                          Text(
                            title!,
                            style: AppStyles.fontSize14(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4.h),
                        ],
                        Text(
                          content,
                          style: AppStyles.fontSize14(color: AppColors.color777777),
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
    );
  }
}
