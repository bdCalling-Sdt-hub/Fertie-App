import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_images.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/screen/home/insights/card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../bottomMenuBar/user_bottom_menu..dart';
import 'calendar/calendar_widget.dart';
import 'inbox/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    super.initState();
    // _events = {
    //   DateTime.utc(2025, 5, 5): ['ovulation'],
    //   DateTime.utc(2025, 5, 10): ['today'],
    //   DateTime.utc(2025, 5, 12): ['today'],
    //   DateTime.utc(2025, 5, 16): ['ovulation'],
    //   DateTime.utc(2025, 5, 17): ['ovulation'],
    //   DateTime.utc(2025, 5, 18): ['fertile'],
    //   DateTime.utc(2025, 5, 2): ['menstruation'],
    //   DateTime.utc(2025, 5, 3): ['ovulation'],
    //   DateTime.utc(2025, 5, 1): ['menstruation'],
    //   DateTime.utc(2025, 5, 5): ['ovulation'],
    // };
  }

  void _navigateToFullChatScreen() {
    Get.to(() => ChatScreen(isFullScreen: true),
      transition: Transition.topLevel, // `circularReveal` looks cute. we can also use `size`, `topLevel`
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UserBottomMenu(0),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(24.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // fertie greets the user (card)
                      buildGreetingsCard(),
                      SizedBox(height: 24),

                      // Chat Preview Container
                      buildEmbeddedChatScreen(),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.r),
              child: Column(
                children: [

                  // Calendar
                  buildCalendarWidget(),

                  SizedBox(height: 12),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
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
                            description: 'Best chance for pregnancy if trying to conceive this weekBest chance for pregnancy if trying to conceive this week',
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
                          description: 'Expected start of your next period based on your usual cycle',
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: CardView(
                          icon: 'assets/images/tree.png',
                          title: 'Implantation Window',
                          date: 'May 14, 2025',
                          description: 'If fertilization occurred, implantation may happen now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmbeddedChatScreen() {
    return ClipRRect(
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.chatTopBarBorderColor,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 300.h,
          child: ChatScreen(
            isFullScreen: false,
            onExpandTap: _navigateToFullChatScreen,
          ),
        ),
      ),
    );
  }

  SizedBox buildGreetingsCard() {
    return SizedBox(
      height: 116.h,
      width: double.infinity,
      child: Card(
        elevation: 7,
        shadowColor: Colors.black.withValues(alpha: 0.5),
        color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.cuteAppLogo, height: 60, width: 60),
              SizedBox(width: 8.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey "Lindsay" !',
                    style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      style: AppStyles.fontSize14(color: AppColors.blackColor),
                      children: [
                        TextSpan(text: 'You\'re on '),
                        TextSpan(
                          text: 'Cycle Day ',
                          style: AppStyles.fontSize16(
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ),
                        TextSpan(
                          text: '10',
                          style: AppStyles.fontSize16(
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackColor,
                          ),
                        ),
                        TextSpan(text: '- this is a \nkey time 🪴'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  CalendarWidget buildCalendarWidget() {
    return CalendarWidget(
      events: _events,
      firstDay: DateTime.utc(2024, 10, 20),
      lastDay: DateTime.utc(2030, 10, 20),
      initialFocusedDay: _focusedDay,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}