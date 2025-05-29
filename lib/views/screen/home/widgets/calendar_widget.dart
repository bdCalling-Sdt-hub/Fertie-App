import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/views/base/custom_button.dart';
import 'package:fertie_application/views/screen/home/insights/widgets/dayStatusWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../helpers/route.dart';

class CalendarWidget extends StatefulWidget {
  final Map<DateTime, List<String>> events;
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime initialFocusedDay;
  final Function(DateTime, DateTime)? onDaySelected;
  final Function(DateTime)? onPageChanged;

  const CalendarWidget({
    super.key,
    required this.events,
    required this.firstDay,
    required this.lastDay,
    required this.initialFocusedDay,
    this.onDaySelected,
    this.onPageChanged,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay;
  DateTime? _selectedDay;

  _CalendarWidgetState() : _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialFocusedDay;
  }

  List<String> _getEventsForDay(DateTime day) {
    return widget.events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.h),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            GestureDetector(
              // Allow vertical drag to pass to parent scroll view
              onVerticalDragUpdate: (details) {
                // Do nothing here; let the parent handle vertical scrolling
              },
              onVerticalDragEnd: (_) {
                // Ensure parent scroll view handles the fling
              },
              // Preserve tap and horizontal swipe for calendar functionality
              onTapUp: (details) {
                // Let TableCalendar handle tap events
              },
              onHorizontalDragUpdate: (details) {
                // Let TableCalendar handle horizontal swipes for month navigation
              },
              child: TableCalendar(
                firstDay: widget.firstDay,
                lastDay: widget.lastDay,
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
                  if (widget.onDaySelected != null) {
                    widget.onDaySelected!(selectedDay, focusedDay);
                  }
                },
                onFormatChanged: (format) {
                  setState(() {
                    // _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                  if (widget.onPageChanged != null) {
                    widget.onPageChanged!(focusedDay);
                  }
                },
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: AppColors.colorF7D6D1,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColors.blackColor),
                  ),
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
                  titleTextFormatter: (date, locale) => DateFormat.yMMMM(locale).format(date),
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
                                color: event == 'today'
                                    ? AppColors.primaryColor
                                    : event == 'fertile'
                                    ? AppColors.colorDFC7FF
                                    : event == 'ovulation'
                                    ? AppColors.color7D9EBB
                                    : event == 'menstruation'
                                    ? AppColors.colorFF5653
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
                          title: 'Menstruation',
                        ),
                        SizedBox(height: 8.h),
                        DayStatusWidget(
                          color: AppColors.colorB7BBA6,
                          title: 'Ovulation',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.cycleInsightsScreen);
                },
                text: 'View Full Insights',
              ),
            ),
          ],
        ),
      ),
    );
  }
}