import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/screen/home/inbox/widgets/typing_dot.dart';
import 'package:fertie_application/views/screen/home/inbox/widgets/typing_dot_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class HomeChatWidget extends StatefulWidget {
  HomeChatWidget({super.key});

  @override
  State<HomeChatWidget> createState() => _HomeChatWidgetState();
}

class _HomeChatWidgetState extends State<HomeChatWidget> {
  bool _isSidebarOpen = false;

  void toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {

    final double sidebarWidth = 180;

    return SizedBox(
      height: 380.h,
      child: Stack(
        children: [
          // Main chat container
          Container(
            decoration: BoxDecoration(
              color: AppColors.colorEBF1EF,
              border: Border.all(color: AppColors.blueColor),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                // Header
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.color7D9EBB,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('Sidebar icon clicked');
                          toggleSidebar();
                        },
                        child: SvgPicture.asset(AppIcons.sideBarIcon, color: Colors.black),
                      ),
                      Text(
                        'Chat with Fertie - Cycle Day 10',
                        style: AppStyles.fontSize16(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.individualChatIScreen);
                        },
                          child: SvgPicture.asset(AppIcons.openIcon, color: Colors.black)),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                // Messages area
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding:  EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                            margin:  EdgeInsets.only(bottom: 4.r),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                topRight: Radius.circular(16.r),
                                bottomRight: Radius.circular(16.r),
                              ),
                            ),
                            child:  Text(
                              'How are you feeling today ?',
                              style: TextStyle(color: AppColors.blackColor, fontSize: 14.sp),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 10.r, bottom: 12.r),
                          child: Text('12:10pm', style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                                  margin:  EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.color7D9EBB,
                                    borderRadius:  BorderRadius.only(
                                      topLeft: Radius.circular(16.r),
                                      topRight: Radius.circular(16.r),
                                      bottomLeft: Radius.circular(16.r),
                                    ),
                                  ),
                                  child:  Text(
                                    'Great, and you?',
                                    style: TextStyle(color: Colors.black87, fontSize: 14.sp),
                                  ),
                                ),
                              ),
                              SizedBox(width: 6.w),
                              CircleAvatar(
                                radius: 12.r,
                                backgroundColor: Colors.grey[400],
                                child: Icon(Icons.person, size: 16.sp, color: Colors.white),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 20),
                          child: Text(
                            '12:10pm',
                            style: TextStyle(fontSize: 10, color: Colors.grey[600]), textAlign: TextAlign.right,
                          ),
                        ),

                        TypingDotAnimation(),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                       Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Ask Fertie anything...',
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 12.r),
                          ),
                        ),
                      ),
                      Icon(Icons.emoji_emotions_outlined, color: Colors.grey[600]),
                      SizedBox(width: 8.w),
                      IconButton(
                        icon: Icon(Icons.send_rounded, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Sidebar container
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 0,
            bottom: 0,
            left: _isSidebarOpen ? 0 : -sidebarWidth,
            width: sidebarWidth,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.color7D9EBB,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 40.h,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: GestureDetector(
                        onTap: toggleSidebar,
                        child: SvgPicture.asset(AppIcons.sideBarIcon, color: Colors.white),
                      ),
                    ),
                  ),
                  // Sidebar content
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                          child: Text('Menu Item 1',
                              style: AppStyles.fontSize16(color: AppColors.white)),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                          child: Text('Menu Item 2',
                              style: AppStyles.fontSize16(color: AppColors.white)),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                          child: Text('Menu Item 3',
                              style: AppStyles.fontSize16(color: AppColors.white)),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                          child: Text('Menu Item 4',
                              style: AppStyles.fontSize16(color: AppColors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}








// Drawer widget function you provided
Widget openDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: const Color(0xffe5f1f9),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: const Color(0xffa1b9c7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.black54),
              ),
              const SizedBox(height: 10),
              Text('Chat Menu', style: AppStyles.fontSize16(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.chat),
          title: Text('New Chat', style: AppStyles.fontSize16()),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        // Add more drawer items here if needed
      ],
    ),
  );
}

