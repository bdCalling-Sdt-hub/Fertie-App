import 'package:fertie_application/themes/text_theme.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAppTheme {
  FAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    // primaryColor: Colors.blue,
    textTheme: FTextTheme.lightTextTheme,
    // chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    // appBarTheme: TAppBarTheme. lightAppBarTheme,
    // checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    // bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    // elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    // textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
    // inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  // static ThemeData darkTheme = ThemeData(
  //   useMaterial3: true,
  //   fontFamily: GoogleFonts.poppins().fontFamily,
  //   brightness: Brightness.dark,
  //   primaryColor: Colors.blue,
  //   textTheme: TTextTheme.darkTextTheme,
  //   chipTheme: TChipTheme.darkChipTheme,
  //   scaffoldBackgroundColor: Colors.black,
  //   appBarTheme: TAppBarTheme.darkAppBarTheme,
  //   checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
  //   bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
  //   elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  //   outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
  //   textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
  //   inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  // );
}