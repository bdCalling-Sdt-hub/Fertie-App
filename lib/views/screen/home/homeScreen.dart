import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:fertie_application/views/screen/home/dayStatusWidget.dart';
import 'package:fertie_application/views/screen/home/insights/CardView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: AppColors.colorFDFBEF,
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
                  color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.h),
                    border: Border.all(color: AppColors.primaryColor)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(8.r),
                  child: Column(
                    children: [
                      TableCalendar(
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
                           //     _calendarFormat = format;
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DayStatusWidget(
                                    color: AppColors.colorE0DCD2,
                                    title: 'Today',
                                  ),
                                  SizedBox(height: 8.h),
                                  DayStatusWidget(
                                    color: AppColors.colorA6B1BB,
                                    title: 'Fertile Day',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Column(
                                children: [
                                  DayStatusWidget(
                                      color: AppColors.primaryColor,
                                      title: 'Menstruation'
                                  ),
                                  SizedBox(height: 8.h),
                                  DayStatusWidget(
                                      color: AppColors.colorB7BBA6,
                                      title: 'Ovulation'
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: CustomButton(onTap: (){}, text: 'View Full Insights'),
                      ),

                    ],
                  ),
                ),

              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    Expanded(
                      child: CardView(
                        icon: 'assets/images/waterImage.png',
                        title: 'Ovulation',
                        date: 'May 14, 2025',
                        description: 'In 6 days (CD14)',
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: CardView(
                        icon: 'assets/images/love.png',
                        title: 'Fertile Window',
                        date: 'May 14, 2025',
                        description: 'Expected start of your next period based on your usual cycle',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: CardView(
                      icon: 'assets/images/redblood.png',
                      title: 'Period Starts',
                      date: 'May 14, 2025',
                      description: 'In 6 days (CD14)',
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CardView(
                      icon: 'assets/images/tree.png',
                      title: 'Implantation Window',
                      date: 'May 14, 2025',
                      description: 'Expected start of your next period based on your usual cycle',
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
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
