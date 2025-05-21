import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayStatusWidget extends StatelessWidget {
  final Color color;
  final String title;


  DayStatusWidget({required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),
        SizedBox(width: 8.w),
        Text(title)
      ],
    );
  }
}