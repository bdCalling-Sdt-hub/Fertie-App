import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HelpScreen extends StatelessWidget {
  final TextEditingController _describtionCTRL = TextEditingController();

  HelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Help',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Email Us',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
                    Text('You will get reply in your email Inbox. ',style: AppStyles.fontSize14()),
                  ],
                ),

              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 8.h),
              child: Text('Massage',style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
            ),
            CustomTextField(
              controller: _describtionCTRL,
              hintText: 'Type your message..',
              maxLines: 15,
            ),
            SizedBox(height: 59.h),

            CustomButton(onTap: (){}, text: 'Send'),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
