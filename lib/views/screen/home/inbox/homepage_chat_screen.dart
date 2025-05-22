import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
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
      height: 380,
      child: Stack(
        children: [
          // Main chat container
          Container(
            decoration: BoxDecoration(
              color: AppColors.colorEBF1EF,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                // Header
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.color7D9EBB,
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
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

                const SizedBox(height: 10),

                // Messages area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            margin: const EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child:  Text(
                              'How are you feeling today ?',
                              style: TextStyle(color: AppColors.blackColor, fontSize: 14),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 12),
                          child: Text(
                            '12:10pm',
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey[600]),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 10),
                                  margin: const EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.color7D9EBB,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                  ),
                                  child: const Text(
                                    'Great , and you?',
                                    style: TextStyle(color: Colors.black87, fontSize: 14),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 6),

                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey[400],
                                child: const Icon(Icons.person,
                                    size: 16, color: Colors.white),
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

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              TypingDot(),
                              SizedBox(width: 6),
                              TypingDot(delay: 200),
                              SizedBox(width: 6),
                              TypingDot(delay: 400),
                            ],
                          ),
                        ),

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
                      Icon(Icons.emoji_emotions_outlined, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Ask Fertie anything...',
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send_rounded, color: Colors.grey),
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
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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


class TypingDot extends StatefulWidget {
  final int delay;
  const TypingDot({super.key, this.delay = 0});

  @override
  State<TypingDot> createState() => _TypingDotState();
}

class _TypingDotState extends State<TypingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _animation = Tween<double>(begin: 0.3, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: 10,
        height: 10,
        decoration:  BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
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
              Text('Chat Menu',
                  style: AppStyles.fontSize16(fontWeight: FontWeight.bold)),
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

