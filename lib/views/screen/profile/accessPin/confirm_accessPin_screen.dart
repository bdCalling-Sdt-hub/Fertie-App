
import 'package:fertie_application/controller/pinCodePageController.dart';
import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ConfirmAccessPinScreen extends StatefulWidget {
  const ConfirmAccessPinScreen({super.key});

  @override
  _ConfirmAccessPinScreenState createState() => _ConfirmAccessPinScreenState();
}

class _ConfirmAccessPinScreenState extends State<ConfirmAccessPinScreen> {
  final PinCodePageController _controller = Get.put(PinCodePageController());

  final int _pinLength = 5;


  void _onNumberTap(String number) {
    setState(() {
      if (_controller.pinCode.value.length < _pinLength) {
        _controller.pinCode.value = _controller.pinCode.value + number;
      }
    });
  }

  void _onDeleteTap() {
    setState(() {
      if (_controller.pinCode.value.isNotEmpty) {
        _controller.pinCode.value = _controller.pinCode.value.substring(
          0,
          _controller.pinCode.value.length - 1,
        );
      }
    });
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pinLength,
            (index) => Container(
          width: 12.w,
          height: 12.h,
          margin: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
            index < _controller.pinCode.value.length
                ? AppColors.primaryColor
                : Colors.grey[300],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return Expanded(
      child: InkWell(
        onTap: () => _onNumberTap(number),
        child: Center(child: Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.colorE6EEF3,
            ),
            child: Center(child: Text(number, style: TextStyle(fontSize: 24.sp))))),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return Expanded(
      child: InkWell(
        onTap: () => _onDeleteTap(),
        child: Center(child: Icon(Icons.backspace)),
      ),
    );
  }

  Widget _buildNumberRow(String a, String b, String c) {
    return Row(
      children: [
        _buildNumberButton(a),
        _buildNumberButton(b),
        _buildNumberButton(c),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Set Access PIN', style: AppStyles.fontSize20(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 150.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.colorE6EEF3,
                ),
                child: Center(
                    child: SvgPicture.asset(AppIcons.accessPinIcon)
                )
            ),
            SizedBox(height: 16.h),
            Text(
                "Confirm Pin",
                textAlign: TextAlign.center,
                style: AppStyles.fontSize20(fontWeight: FontWeight.w600)
            ),
            SizedBox(height: 20.h),
            _buildIndicator(),
            SizedBox(height: 20.h),
            _buildNumberRow("1", "2", "3"),
            SizedBox(height: 20.h),
            _buildNumberRow("4", "5", "6"),
            SizedBox(height: 20.h),
            _buildNumberRow("7", "8", "9"),
            SizedBox(height: 20.h),

            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.forgetPasswordScreen);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: SizedBox()),
                  _buildNumberButton("0"),
                  _buildDeleteButton(),
                ],
              ),
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}

