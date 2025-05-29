import 'package:fertie_application/helpers/route.dart';
import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class IndividualChatIScreen extends StatefulWidget {
  const IndividualChatIScreen({Key? key}) : super(key: key);

  @override
  State<IndividualChatIScreen> createState() => _IndividualChatIScreenState();
}

class _IndividualChatIScreenState extends State<IndividualChatIScreen> {
  final TextEditingController _controller = TextEditingController();

  List<_ChatMessage> messages = [
    _ChatMessage(text: "I've been doing some research too. What have you found most interesting?", isUser: false),
    _ChatMessage(text: "It's going well! I've been learning a lot. How about you?", isUser: true),
    _ChatMessage(text: "I discovered that diet can really impact fertility. Have you looked into that?", isUser: false),
    _ChatMessage(text: "Absolutely! I've also been exploring stress management techniques. They seem crucial.", isUser: true),
    _ChatMessage(text: "Yes, I read that certain vitamins and minerals can boost fertility. It's fascinating!", isUser: false),
    _ChatMessage(text: "For sure!", isUser: true),


  ];

  bool _isTyping = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: SafeArea(
        child: Column(
          children: [
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
                   //   toggleSidebar();
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
                      Get.back();
                      },
                      child: SvgPicture.asset(AppIcons.openIcon, color: Colors.black)),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                itemCount: messages.length + (_isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (_isTyping && index == messages.length) {
                    // Typing indicator
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            _TypingDot(delay: 0),
                            SizedBox(width: 6),
                            _TypingDot(delay: 200),
                            SizedBox(width: 6),
                            _TypingDot(delay: 400),
                          ],
                        ),
                      ),
                    );
                  }

                  final msg = messages[index];
                  if (msg.isUser) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color:AppColors.colorE1DAD3,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  msg.text,
                                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.grey[400],
                              child: const Icon(Icons.person, size: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Text(
                            msg.text,
                            style:  TextStyle(fontSize: 14, color: AppColors.blackColor),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),

            // Input area
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
                  Icon(Icons.emoji_emotions_outlined, color: Colors.grey[600]),
                  const SizedBox(width: 8),
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
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;

  _ChatMessage({required this.text, required this.isUser});
}

class _TypingDot extends StatefulWidget {
  final int delay;

  const _TypingDot({Key? key, this.delay = 0}) : super(key: key);

  @override
  State<_TypingDot> createState() => _TypingDotState();
}

class _TypingDotState extends State<_TypingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
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
        width: 8,
        height: 8,
        decoration:  BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
