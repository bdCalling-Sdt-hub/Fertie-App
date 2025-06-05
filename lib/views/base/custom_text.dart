import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.maxLine,
    this.textOverflow,
    this.fontName,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 14,
    this.textHeight,
    this.decoration,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
    this.text = "",
    this.textStyle,
  });

  final double left;
  final TextOverflow? textOverflow;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int? maxLine;
  final String? fontName;
  final double? textHeight;
  final TextDecoration? decoration;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: Text(
        textAlign: textAlign,
        text,
        maxLines: maxLine,
        overflow: textOverflow ?? TextOverflow.ellipsis,
        style:
            textStyle ??
            TextStyle(
              decoration: decoration,
              fontSize: fontSize,
              decorationColor: AppColors.blueColor,
              fontFamily: fontName ?? "Nunito",
              fontWeight: fontWeight,
              color: color,
              decorationThickness: 1.5,
            ),
      ),
    );
  }
}
