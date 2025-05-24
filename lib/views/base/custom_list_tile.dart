import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final VoidCallback? onTap;
  const CustomListTile({
    super.key,
    required this.title,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: prefixIcon,
        trailing: suffixIcon,
        horizontalTitleGap: 12.w,
        dense: true,
        title: CustomText(
          textAlign: TextAlign.left,
          text: title,
          maxLine: 2,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
