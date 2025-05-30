import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_images.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PersonalizeScreen extends StatefulWidget {
  PersonalizeScreen({super.key});

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
  TextEditingController text = Get.put(TextEditingController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Personalize Journey 🧡',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImages.cuteAppLogo),

            Text('We’d love to customize your \nexperience. Please share a few \ndetails to get started.',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  onTap: () {
                   Get.toNamed(AppRoutes.personalizeQuestionScreenOne);
                  },
                  text: 'Lets get start'),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }
}
