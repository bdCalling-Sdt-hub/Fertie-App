import 'dart:io';

import 'package:fertie_application/helpers/imageHelper.dart';
import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  Uint8List? _image;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text('Personal Information'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
                border: Border.all(width: 1.w, color: AppColors.greyColor),
              ),
              child: Padding(
                padding:  EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Personal Information'),
                        Row(
                          children: [
                            Text('Edit',style: AppStyles.fontSize16(fontWeight: FontWeight.w600,color: AppColors.primaryColor)),
                            SizedBox(width: 8.w),
                            InkWell(
                              onTap: (){
                                Get.toNamed(AppRoutes.editPersonalInformationScreen);
                              },
                                child: SvgPicture.asset(AppIcons.editIcon,color:AppColors.primaryColor))
                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 16.h),
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Profile picture
                          _image != null
                              ? Container(
                              width: 150.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1.w, color: AppColors.white),
                                  image: DecorationImage(
                                      image: MemoryImage(_image!),
                                      fit: BoxFit.cover)))
                              : Container(
                            width: 150.w, height: 150.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.r)),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                'http://www.clker.com/cliparts/Z/J/g/U/V/b/avatar-male-silhouette-md.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text('Name'),
                    Text('Linfsay',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                    SizedBox(height: 16.h),
                    Text('Age'),
                    Text('25',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                    SizedBox(height: 16.h),
                    Text('Email'),
                    Text('linfsay@gmail.com',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
