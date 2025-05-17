import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/app_images.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:fertie_application/views/screen/calender/calender_screen.dart';
import 'package:fertie_application/views/screen/home/insights/facticity_score_card.dart';
import 'package:fertie_application/views/screen/home/home_screen_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};
  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  void initState() {
    super.initState();
    _events = {
      DateTime.utc(2025, 5, 5): ['ovulation'],
      DateTime.utc(2025, 5, 10): ['today'],
      DateTime.utc(2025, 5, 12): ['today'],
      DateTime.utc(2025, 5, 16): ['ovulation'],
      DateTime.utc(2025, 5, 17): ['ovulation'],
      DateTime.utc(2025, 5, 18): ['fertile'],
      DateTime.utc(2025, 5, 2): ['menstruation'],
      DateTime.utc(2025, 5, 3): ['ovulation'],
      DateTime.utc(2025, 5, 1): ['menstruation'],
      DateTime.utc(2025, 5, 5): ['ovulation'],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(0),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              CustomButton(onTap: () {
                Get.toNamed(AppRoutes.personalizeScreen);
              }, text: "Personalize Journey 🧡"
              ),

              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    border: Border.all(color: AppColors.primaryColor)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(8.r),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2024, 10, 20),
                    lastDay: DateTime.utc(2030, 10, 20),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                          color: AppColors.colorF7D6D1,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: AppColors.blackColor)),
                      selectedTextStyle: TextStyle(color: AppColors.blackColor),
                      todayDecoration: BoxDecoration(
                        color: AppColors.colorF7D6D1,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextFormatter:
                          (date, locale) => DateFormat.yMMMM(locale).format(date),
                    ),
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, day, events) {
                        List<String> dayEvents = _getEventsForDay(day);
                        if (dayEvents.isNotEmpty) {
                          return Positioned(
                            bottom: 7,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: dayEvents.map((event) {
                                return Container(
                                  height: 4.h,
                                  width: 40.w,
                                  margin: EdgeInsets.symmetric(horizontal: 0.5.w),
                                  decoration: BoxDecoration(
                                    color: event == 'today' ? AppColors.primaryColor
                                        : event == 'fertile' ? AppColors.colorDFC7FF
                                        : event == 'ovulation' ? AppColors.color7D9EBB
                                        : event == 'menstruation' ? AppColors.colorFF5653
                                        : Colors.transparent,
                                    shape: BoxShape.rectangle,

                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Text('Today\'s Rundown :', style: AppStyles.fontSize16(fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: AppColors.colorE0DCD2,
                    border: Border.all(
                        width: 1.w, color: AppColors.subTextColor),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phase'),
                            Text('Menstrual', style: AppStyles.fontSize16(
                                fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Intensity'),
                            Text('Very Low', style: AppStyles.fontSize16(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cycle Day'),
                            Text('4', style: AppStyles.fontSize16(
                                fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //Total Cycle Insight
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today Cycle Insights :', style: AppStyles.fontSize16(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('Edit Insights',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(AppIcons.editIcon),

                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.colorEBD7C7,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Menstrual flow',style: AppStyles.fontSize14()),
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppIcons.bloodIcon),
                                        SizedBox(width: 4.w),
                                        Text('Light',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Mood',style: AppStyles.fontSize14()),
                                          SizedBox(height: 8.h),
                                          Row(
                                            children: [
                                              SvgPicture.asset(AppIcons.bloodIcon),
                                              SizedBox(width: 4.w),
                                              Text('Great',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Activity',style: AppStyles.fontSize14()),
                                          SizedBox(height: 8.h),
                                          Row(
                                            children: [
                                              SvgPicture.asset(AppIcons.loveIcon),
                                              SizedBox(width: 4.w),
                                              Text('Intercourse',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                //Symptom
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Symptoms',style: AppStyles.fontSize14()),
                                          SizedBox(height: 8.h),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(AppIcons.bloodIcon),
                                                    SizedBox(width: 4.w),
                                                    Text('Great',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(AppIcons.bloodIcon),
                                                    SizedBox(width: 4.w),
                                                    Text('Others',style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),

                                  ],
                                ),


                              ],
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPopup(context);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Image.asset(AppImages.cuteappLogo),
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFDC86),
          title: Text('Unlock full cycle insights with a 👑 Premium subscription! ',
              style: AppStyles.fontSize16(fontWeight: FontWeight.w600)),
          content: Text('Tap to Upgrade and get personalized features. 🎉🎉'),
        );
      },
    );
  }
}
