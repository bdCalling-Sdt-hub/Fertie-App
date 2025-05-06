import 'package:fertie_application/utils/app_icons.dart';
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
    'Medium': SvgPicture.asset(AppIcons.calenderIcon),
    'Heavy': SvgPicture.asset(AppIcons.helpIcon),
    'Spotting': SvgPicture.asset(AppIcons.notificationIcon),
  };

  //==================================>>> Mood
  RxString selectedMood = ''.obs;
  final List<String> moodOption = [
    'Happy', 'Crying', 'Indifferent','Sad','Angry',
    'Questioning','In pain','Cramping','Content','Embarrassed'];
  final Map<String, IconData> moodIcons = {
    'Happy': Icons.face_retouching_natural,
    'Crying': Icons.sick,
    'Indifferent': Icons.sick,
    'Sad': Icons.safety_check_outlined,
    'Angry': Icons.sick,
    'Questioning': Icons.qr_code,
    'In pain': Icons.padding,
    'Cramping': Icons.satellite,
    'Content': Icons.sick,
    'Embarrassed': Icons.emoji_emotions,
  };


  //=====================================>>> Activity
  RxString selectedActivity = ''.obs;
  final List<String> activityOption = ['Intercourse', 'Insemination'];
  // Map Activity to icons
  final Map<String, IconData> activityIcons = {
    'Intercourse': Icons.face_retouching_natural,
    'Insemination': Icons.sick,
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
