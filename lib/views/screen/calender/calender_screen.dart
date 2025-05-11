import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:fertie_application/views/screen/calender/datStatusWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  TextEditingController textEditingController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<String>> _events = {};

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

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      bottomNavigationBar: UserBottomMenu(1),
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        title: Text('Calendar', style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                children: [
                  Container(
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: AppColors.colorF7D6D1,
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.touchIcon),
                          SizedBox(width: 6.w),
                          Expanded(child: Text('Tap on the date to view or edit your cycle insights.', style: AppStyles.fontSize14())),
                        ],
                      ),
                    ),
                  ),
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
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16.r),
                                      bottomRight: Radius.circular(16.r),
                                    ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Divider(thickness: .5, color: AppColors.color7D9EBB),
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
                                color: AppColors.colorF7D6D1,
                                title: 'Today',
                              ),
                              SizedBox(height: 8.h),
                              DayStatusWidget(
                                color: AppColors.colorDFC7FF,
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
                                  color: AppColors.colorFF5653,
                                  title: 'Menstruation'
                              ),
                              SizedBox(height: 8.h),
                              DayStatusWidget(
                                  color: AppColors.color7D9EBB,
                                  title: 'Ovulation'
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24.r),
                      topLeft: Radius.circular(24.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Column(
                              children: [
                                Container(
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.colorEBD7C7,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Period Length', style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                            InkWell(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes.editCycleInsightScreen);
                                                },
                                                child: SvgPicture.asset(AppIcons.editIcon)),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 2.r),
                                          child: Text('Total : 5 days', style: AppStyles.fontSize14(fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 2.r),
                                          child: Text('Jan 1 to Jan 5', style: AppStyles.fontSize12(color: AppColors.color88888)),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                Container(
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.colorEBD7C7,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Menstrual Cycle', style: AppStyles.fontSize14(fontWeight: FontWeight.w600)),
                                            InkWell(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes.menstrualCycleScreen);
                                                },
                                                child: SvgPicture.asset(AppIcons.editIcon)),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 2.r),
                                          child: Text('Total : 28 days', style: AppStyles.fontSize14(fontWeight: FontWeight.w500)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 2.r),
                                          child: Text('Jan 1 to Jan 28', style: AppStyles.fontSize12(color: AppColors.color88888)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
