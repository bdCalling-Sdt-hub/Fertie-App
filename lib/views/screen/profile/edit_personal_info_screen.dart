import 'dart:io';

import 'package:fertie_application/helpers/imageHelper.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/base/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class EditPersonalInformationScreen extends StatefulWidget {
  const EditPersonalInformationScreen({super.key});

  @override
  State<EditPersonalInformationScreen> createState() =>
      _EditPersonalInformationScreenState();
}

class _EditPersonalInformationScreenState
    extends State<EditPersonalInformationScreen> {
  TextEditingController nameCTRl = TextEditingController();
  TextEditingController birthdayCTRl = TextEditingController();
  TextEditingController emailCTRl = TextEditingController();
  Uint8List? _image;
  File? selectedImage;


  @override
  void initState() {
    super.initState();
    nameCTRl.text = 'Lindsay';
    emailCTRl.text = 'linfsay@example.com';
    birthdayCTRl.text = 'April 15,2022';
  }
  // Default selected date
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthdayCTRl.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text('Edit Personal Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.white,
              border: Border.all(width: 1.w, color: AppColors.greyColor),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              ImagePickerHelper.showImagePickerOption(context, (File pickedImage) {
                                setState(() {
                                  selectedImage = pickedImage;
                                  _image = pickedImage.readAsBytesSync();
                                });
                              });
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(25.r)),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                size: 25,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Name Section
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text('Name'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: CustomTextField(controller: nameCTRl),
                  ),

                  // Email Section
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text('Email'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: CustomTextField(controller: emailCTRl),
                  ),

                  // Age Section
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text('Age'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Select date',
                          controller: birthdayCTRl,
                          readOnly: true,
                          suffixIcons: InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AppIcons.calenderblackColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '${DateTime.now().year - selectedDate.year} Years',
                        style: AppStyles.fontSize24(fontWeight: FontWeight.w500, color: AppColors.subTextColor),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),
                  CustomButton(onTap: (){}, text: "Save"),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
