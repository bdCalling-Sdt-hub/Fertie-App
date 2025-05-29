import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_text_field.dart';
import 'package:fertie_application/views/screen/home/insights/controllers/editInsightsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class EditInsightsScreen extends StatefulWidget {
  const EditInsightsScreen({super.key});

  @override
  State<EditInsightsScreen> createState() => _EditInsightsScreenState();
}

class _EditInsightsScreenState extends State<EditInsightsScreen> {


  final EditInsightsController editInsightsController = Get.put(EditInsightsController());
  TextEditingController textEditingController= TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Edit Insights', style: AppStyles.fontSize16()),
                    Container(
                        height: 28.h,width: 58.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(child: Text('Save', style: AppStyles.fontSize16(fontWeight: FontWeight.bold)))),

                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.colorEBD7C7,
                ),
                child: Padding(
                  padding:  EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      // Lab Test Details Section
                      Text('Menstrual Flow', style: AppStyles.fontSize14(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.h),
                      Obx(() {
                        String selectedFuel = editInsightsController.selectedMenstrual.value;
                        return Column(
                          children: [
                            Wrap(
                              spacing: 8.w,
                              children: editInsightsController.menstrualOption.map((option) {
                                bool isSelected = selectedFuel == option;
                                return ChoiceChip(
                                  showCheckmark: false,
                                  selectedColor: AppColors.primaryColor,
                                  backgroundColor: AppColors.secondColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  side: BorderSide.none,
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Use SvgPicture to display the icon
                                      editInsightsController.menstrualIcons[option] ??
                                          SvgPicture.asset('assets/icons/birthday.svg'),
                                      SizedBox(width: 4.w),
                                      Text(
                                        option,
                                        style: AppStyles.fontSize16(fontWeight: FontWeight.w700, color: AppColors.blackColor),
                                      ),
                                    ],
                                  ),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        editInsightsController.selectedMenstrual.value = option;
                                      } else {
                                        editInsightsController.selectedMenstrual.value = ''; // Deselect
                                      }
                                      print('Selected Menstrual: $option');
                                    });
                                  },

                                );
                              }).toList(),
                            ),
                          ],
                        );
                      }),


                      SizedBox(height: 8.h),

                      //==============>> Mood
                      Text('Mood', style: AppStyles.fontSize14(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.h),
                      Obx(() {
                        String selectedFuel = editInsightsController.selectedMood.value;
                        return Column(
                          children: [
                            Wrap(
                              spacing: 8.w,
                              children: editInsightsController.moodOption.map((option) {
                                bool isSelected = selectedFuel == option;
                                return ChoiceChip(
                                  selectedColor: AppColors.primaryColor,
                                  backgroundColor: AppColors.secondColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  side: BorderSide.none,
                                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),

                                  showCheckmark: false,
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        editInsightsController.moodIcons[option]!,
                                        width: 18.w,
                                        height: 18.h,
                                      ),
                                      SizedBox(width: 4.w),
                                      // Text part
                                      Text(
                                        option,
                                        style: AppStyles.fontSize16(
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        editInsightsController.selectedMood.value = option;
                                      } else {
                                        editInsightsController.selectedMood.value = ''; // Deselect
                                      }
                                      print('Selected Mood: $option');
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: 8.h),
                      //==============>> Activity
                      Text('Activity', style: AppStyles.fontSize14(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.h),
                      Obx(() {
                        String selectedFuel = editInsightsController.selectedActivity.value;
                        return Column(
                          children: [
                            Wrap(
                              spacing: 8.w,
                              children: editInsightsController.activityOption.map((option) {
                                bool isSelected = selectedFuel == option;
                                return ChoiceChip(
                                  selectedColor: AppColors.primaryColor,
                                  backgroundColor: AppColors.secondColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  side: BorderSide.none,
                                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                                  showCheckmark: false,
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                  Image.asset(
                                  editInsightsController.activityIcons[option]!,
                                    width: 18.sp,
                                    height: 18.sp,
                                  ),
                                    SizedBox(width: 4.w),
                                      Text(
                                          option,
                                          style: AppStyles.fontSize16(fontWeight: FontWeight.w700,color: AppColors.blackColor)
                                      ),
                                    ],
                                  ),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        editInsightsController.selectedActivity.value = option;
                                      } else {
                                        editInsightsController.selectedActivity.value = ''; // Deselect
                                      }
                                      print('Selected Activity: $option');
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: 8.h),
                      //==============>> Symptoms
                      Text('Symptoms', style: AppStyles.fontSize14(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.h),
                      Obx(() {
                        String selectedFuel = editInsightsController.selectedSymptoms.value;
                        return Column(
                          children: [
                            Wrap(
                              spacing: 8.w,
                              children: editInsightsController.symptomsOption.map((option) {
                                bool isSelected = selectedFuel == option;
                                return ChoiceChip(
                                  selectedColor: AppColors.primaryColor,
                                  backgroundColor: AppColors.secondColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  side: BorderSide.none,
                                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                                  showCheckmark: false,
                                  label: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        editInsightsController.symptomIcons[option]!,
                                        width: 18.sp,
                                        height: 18.sp,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                          option,
                                          style: AppStyles.fontSize16(fontWeight: FontWeight.w700,color: AppColors.blackColor)
                                      ),
                                    ],
                                  ),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        editInsightsController.selectedSymptoms.value = option;
                                      } else {
                                        editInsightsController.selectedSymptoms.value = ''; // Deselect
                                      }
                                      print('Selected Symptoms: $option');
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      }),


                      SizedBox(height: 8.h),
                      Text('Lab Test', style: AppStyles.fontSize14(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text('LH Test'),
                          Icon(Icons.arrow_drop_down),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: CustomTextField(
                                controller: textEditingController
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}