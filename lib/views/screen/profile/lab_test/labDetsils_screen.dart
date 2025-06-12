import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/base/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabDetailsScreen extends StatefulWidget {
  const LabDetailsScreen({super.key});

  @override
  State<LabDetailsScreen> createState() => _LabDetailsScreenState();
}

class _LabDetailsScreenState extends State<LabDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title:  Text('Lab 1',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
               color: AppColors.white,
            ),
            child: Padding(
              padding:  EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 120.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                            child: Image.asset('assets/images/labTest.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text: 'Lab 1',color: Colors.black,fontSize:24.sp ,),
                            CustomText(text: 'lab1@gmail.com',color: Colors.black,fontSize:14.sp),
                            CustomButton(onTap: (){}, text: 'Contact')
                          ],
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 16.h),
                  // Lab Test Details Section
                   Text('Lab Test Details', style: AppStyles.fontSize14(fontWeight: FontWeight.bold)),
                   SizedBox(height: 8.h),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla auctor metus ut est aliquam, nec varius magna fermentum. Suspendisse potenti. Integer ac magna eu urna sollicitudin tincidunt. Proin et purus id elit convallis scelerisque et sed lectus. Phasellus vulputate, libero et auctor interdum, lorem turpis accumsan nisi, at consectetur felis dui ut felis. Sed ut hendrerit ex, eget pretium elit. Cras id nulla velit. Aliquam eu tincidunt purus.', style: AppStyles.fontSize14()),
                  SizedBox(height: 16.h),

                  // Contact Information Section
                  Text('Contact Information:', style: AppStyles.fontSize14(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.h),
                  Text('Phone: 1123 456.7890', style: AppStyles.fontSize14()),
                  Text('Email: info@lorenipsumlab1.com', style: AppStyles.fontSize14()),
                  Text('Website: www.lorenipsumlab1.com', style: AppStyles.fontSize14()),
                  SizedBox(height: 16.h),

                  // Address Section
                  Text('Address', style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),

                   SizedBox(height: 8.h),
                   Text('123 Lorem Ipsum Street,', style: AppStyles.fontSize14()),
                   Text('Color St. Apt 12345,', style: AppStyles.fontSize14()),
                   Text('Connecticut City, COUNTRY', style: AppStyles.fontSize14()),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}