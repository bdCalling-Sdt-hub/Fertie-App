import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SetAccessPinScreen extends StatefulWidget {
  const SetAccessPinScreen({super.key});

  @override
  State<SetAccessPinScreen> createState() => _SetAccessPinScreenState();
}

class _SetAccessPinScreenState extends State<SetAccessPinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Set Access PIN', style: AppStyles.fontSize20(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 157.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorE6EEF3,
                ),
                child: Center(
                    child: SvgPicture.asset(AppIcons.accessPinIcon)
                )
            ),
            SizedBox(height: 20),
            CustomButton(onTap: (){
               showDialog<void>(
                context: context,
                builder: (context) => ScreenLock(
                  correctString: '1234',
                  keyPadConfig: const KeyPadConfig(
                    clearOnLongPressed: true,
                  ),
                  onUnlocked: Navigator.of(context).pop,
                ),
              );
            }, text: 'Change Current Pin',
              color: AppColors.colorE7E7E7,
            ),
            SizedBox(height: 15),
            CustomButton(
              color: AppColors.colorE7E7E7,
                onTap: (){
                  Get.toNamed(AppRoutes.removeAccessPinScreen);
                  },
                text: 'Remove Pin'),

          ],
        ),
      ),
    );
  }
}
