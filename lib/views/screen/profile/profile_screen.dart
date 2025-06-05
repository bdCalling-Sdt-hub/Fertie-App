import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/views/base/custom_list_tile.dart';
import 'package:fertie_application/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:flutter/foundation.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(2),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'Profile',
          style: AppStyles.fontSize20(fontWeight: FontWeight.w700).copyWith(fontFamily: 'Nunito'),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Profile picture
                    _image != null
                        ? Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1.w, color: AppColors.white),
                        image: DecorationImage(
                          image: MemoryImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : Container(
                      width: 150.w,
                      height: 150.h,
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
                    // Profile image edit button (commented)
                    // Positioned(
                    //   bottom: 10,
                    //   right: 10,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       ImagePickerHelper.showImagePickerOption(
                    //           context, (File pickedImage) {
                    //         setState(() {
                    //           selectedImage = pickedImage;
                    //           _image = pickedImage.readAsBytesSync();
                    //         });
                    //       });
                    //     },
                    //     child: Container(
                    //       width: 40.w,
                    //       height: 40.h,
                    //       decoration: BoxDecoration(
                    //         color: AppColors.primaryColor,
                    //         borderRadius: BorderRadius.all(Radius.circular(25.r)),
                    //       ),
                    //       child: Icon(
                    //         Icons.camera_alt_outlined,
                    //         size: 25,
                    //         color: AppColors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Lindsay',
                    style: AppStyles.fontSize24(fontWeight: FontWeight.w900).copyWith(fontFamily: 'Nunito'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Age : 25',
                    style: AppStyles.fontSize16(color: AppColors.subTextColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Account type : Free',
                    style: AppStyles.fontSize16(color: AppColors.subTextColor),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                  // color: AppColors.colorF7D6D1,
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                ),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: Column(
                    children: [
                      CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.personalInfoIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: () {
                          Get.toNamed(AppRoutes.personalInformationScreen);
                        },
                        title: 'Personal Information',
                      ),
                      CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.labTest),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: () {
                          Get.toNamed(AppRoutes.labTestScreen);
                        },
                        title: 'Lab Test',
                      ),
                      CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.updateAccountIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: () {
                          // todo: if the user is subscribed, navigate to page congratulating him
                          Get.toNamed(AppRoutes.upgradeAccountScreen);
                        },
                        title: 'Upgrade Account Type',
                        textStyle: TextStyle(
                          color: AppColors.primaryColor2,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.loveIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: () {
                          // Get.toNamed(AppRoutes.personalInformationScreen);
                        },
                        title: 'Period and Cycle settings',
                      ),
                      CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.pinChnageIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: () {
                          Get.toNamed(AppRoutes.setAccessPinScreen);
                        },
                        title: 'Change Access PIN Settings',
                      ),
                      CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.passwordIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: () {
                          Get.toNamed(AppRoutes.resetPasswordScreen);
                        },
                        title: 'Change Password',
                      ),
                      CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.helpIcon),
                        suffixIcon: SvgPicture.asset(AppIcons.listTileArrowIcon),
                        onTap: () {
                          Get.toNamed(AppRoutes.helpScreen);
                        },
                        title: 'Help',
                      ),
                      CustomListTile(
                        prefixIcon: SvgPicture.asset(AppIcons.logoutIcon),
                        onTap: () {
                          _showLogOutBottomSheet(context);
                        },
                        title: 'Log Out',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //=========================>>>>>  Log out Custom BottomSheet    <<<================================
  void _showLogOutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: AppColors.white,
          ),
          height: 265.h,
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Container(
                width: 50.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.h),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Logout',
                style: AppStyles.fontSize24(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 14.h),
              Text(
                'Are you sure?',
                style: AppStyles.fontSize18(color: AppColors.primaryColor),
              ),
              // SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 58.h),
                        backgroundColor: AppColors.fillColor,
                        side: BorderSide(width: 1, color: AppColors.greyColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: AppStyles.fontSize18(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 58.h),
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: AppStyles.fontSize18(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
