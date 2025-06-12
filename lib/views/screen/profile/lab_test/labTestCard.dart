import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabTestCard extends StatelessWidget {
  final String imagePath;
  final String labName;
  final String email;

  const LabTestCard({
    required this.imagePath,
    required this.labName,
    required this.email,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8.r),
              topLeft: Radius.circular(8.r),
            ),
            child: Image.asset(
              imagePath,
              height: 140.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 140.h,
                color: Colors.grey.shade300,
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: Colors.grey,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labName,
                  style: AppStyles.fontSize12(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  email,
                  style: AppStyles.fontSize12(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
