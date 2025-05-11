import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditInsightsController extends GetxController {

  //=================================>>> Menstrual Flow
  RxString selectedMenstrual = ''.obs;
  final List<String> menstrualOption = ['Light', 'Medium', 'Heavy','Spotting'];
  // Map Menstrual to icons
  final Map<String, Widget> menstrualIcons = {
    'Light': SvgPicture.asset(AppIcons.bloodIcon),
    'Medium': SvgPicture.asset(AppIcons.mediumIcon),
    'Heavy': SvgPicture.asset(AppIcons.heavyIcon),
    'Spotting': SvgPicture.asset(AppIcons.spottingIcon),
  };

  //==================================>>> Mood
  RxString selectedMood = ''.obs;
  final List<String> moodOption = [
    'Happy', 'Crying', 'Indifferent','Sad','Angry',
    'Questioning','In pain','Cramping','Content','Embarrassed'];

  final Map<String, Image> moodIcons = {
    'Happy': Image.asset(AppImages.cuteappLogo),
    'Crying': Image.asset('assets/images/cryingImage.png'),
    'Indifferent': Image.asset('assets/images/indifferentImage.png'),
    'Sad': Image.asset('assets/images/sadImage.png'),
    'Angry': Image.asset('assets/images/angryImage.png'),
    'Questioning': Image.asset('assets/images/questioningImage.png'),
    'In pain': Image.asset('assets/images/inPainImage.png'),
    'Cramping': Image.asset('assets/images/crampingImage.png'),
    'Content': Image.asset('assets/images/contentImage.png'),
    'Embarrassed': Image.asset('assets/images/embarrassedImage.png'),
  };


  //=====================================>>> Activity
  RxString selectedActivity = ''.obs;
  final List<String> activityOption = ['Intercourse', 'Insemination'];
  // Map Activity to icons
  final Map<String, String> activityIcons = {
    'Intercourse': AppImages.cuteappLogo,
    'Insemination':  AppImages.appLogo,
  };


  // =================================================>>Symptoms
  RxString selectedSymptoms = ''.obs;
  final List<String> symptomsOption = [
    'Headache',
    'Cramps',
    'Backache',
    'Breast tenderness',
    'Cervical mucous',
    'Others'
  ];

  // Map symptoms to icons
  final Map<String, IconData> symptomIcons = {
    'Headache': Icons.face_retouching_natural,
    'Cramps': Icons.sick,
    'Backache': Icons.accessibility_new,
    'Breast tenderness': Icons.favorite_border,
    'Cervical mucous': Icons.opacity,
    'Others': Icons.more_horiz,
  };

}
