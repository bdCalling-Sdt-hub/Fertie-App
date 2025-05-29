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

  final Map<String, String> moodIcons = {
    'Happy':AppImages.happyImage,
    'Crying': AppImages.cryImage,
    'Indifferent': AppImages.indifferent,
    'Sad': AppImages.sadImage,
    'Angry': AppImages.angry,
    'Questioning':AppImages.questioning,
    'In pain': AppImages.questioning,
    'Cramping':AppImages.cramping,
    'Content': AppImages.content,
    'Embarrassed': AppImages.embarrassed,
  };


  //=====================================>>> Activity
  RxString selectedActivity = ''.obs;
  final List<String> activityOption = ['Intercourse', 'Insemination'];
  // Map Activity to icons
  final Map<String, String> activityIcons = {
    'Intercourse': AppImages.love,
    'Insemination':  AppImages.insemination,
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
  final Map<String, String> symptomIcons = {
    'Headache': AppImages.headache,
    'Cramps': AppImages.cramps,
    'Backache': AppImages.backache,
    'Breast tenderness': AppImages.breast,
    'Cervical mucous': AppImages.cervical,
    'Others': AppImages.others,
  };

}
