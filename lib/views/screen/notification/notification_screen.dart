import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/base/custom_text.dart';
import 'package:fertie_application/views/screen/bottomMenuBar/user_bottom_menu..dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController textEditingController = TextEditingController();

  final notifications = [
    {
      'title': 'Hey! Don’t forget to check your cycle insights today!',
      'date': 'January 14, 2025',
      'description': 'Reminder',
      'notificationType': 'Reminder',
    },
    {
      'title': 'Hey! It’s the second day of your ovulation window!',
      'date': 'January 15, 2025',
      'description': '(Very High Chance for Pregnancy)',
      'notificationType': 'Ovulation',
    },
    {
      'title': 'Hey! Today might just be the day for ovulation!',
      'date': 'January 14, 2025',
      'description': 'Remainder',
      'notificationType': 'Reminder',
    },
    {
      'title': 'Hey! Today’s a great day for making a baby!',
      'date': 'January 14, 2025',
      'description': '(Very High Chance for Pregnancy)',
      'notificationType': 'Ovulation',
    },
    {
      'title': 'Hey! Looks like your period is showing up today!',
      'date': 'January 14, 2025',
      'description': 'Ovulation Day',
      'notificationType': 'Pregnancy',
    },
    {
      'title': 'Hey! Your period is kicking off today!',
      'date': 'January 15, 2025',
      'description': '(Very High Chance for Pregnancy)',
      'notificationType': 'Ovulation',
    },
    {
      'title': 'Period Day start from today',
      'date': 'January 1, 2025',
      'description': 'You set your period length 5 days, you can change it from profile > Period and Cycle settings.',
      'notificationType': 'Period',
    },
    {
      'title': 'Today is 2nd of your ovulation time',
      'date': 'January 15, 2025',
      'description': '(Very High Chance for Pregnancy)',
      'notificationType': 'Ovulation',
    },
  ];

  // Color getNotificationBackgroundColor(String notificationType) {
  //   switch (notificationType) {
  //     case 'Reminder':
  //       return Color(0xFFFAEBE0);
  //     case 'Ovulation':
  //       return Color(0xFFFFFFFF);
  //     case 'Pregnancy':
  //       return Color(0xFFE6EEF3);
  //     case 'Period':
  //       return Color(0xFFFAEBE0);
  //     default:
  //       return Colors.white;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.white,
      bottomNavigationBar: UserBottomMenu(3),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title:  Text('Notification',style: AppStyles.fontSize24(fontWeight: FontWeight.w600)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextButton(
                onPressed: () {
                },
                child: CustomText(
                  text: "Mark all read",
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                // Color backgroundColor = getNotificationBackgroundColor(notification['notificationType']!);

                return Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 16,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              notification['title']!,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor,
                              ),
                              softWrap: true,
                            ),
                          ),
                          SizedBox(width: 8.h),
                          Text(
                            notification['date']!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.subTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        notification['description']!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.subTextColor,
                          fontWeight: FontWeight.w500,
                          // color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}
