import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/screen/home/inbox/controller/chat_controller.dart';
import 'package:fertie_application/views/screen/home/inbox/models/chat_message_model.dart';
import 'package:fertie_application/views/screen/home/inbox/widgets/typing_dot_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_images.dart';

class ChatScreen extends StatefulWidget {
  final bool isFullScreen;
  final VoidCallback? onExpandTap;

  const ChatScreen({
    super.key,
    this.isFullScreen = true,
    this.onExpandTap,
  });

  @override
  State<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController chatTextFieldController = TextEditingController();
  late final ChatController chatController;
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Use Get.find to get existing controller or create if not exists
    // chatController = Get.isRegistered<ChatController>()
    //     ? Get.find<ChatController>()
    //     : Get.put(ChatController());

    chatController = Get.put(ChatController(), permanent: true);
    ever(chatController.currentBotMessage, (_) => _scrollToBottom());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chatBg,
      // appBar: widget.isFullScreen ? AppBar(
      //   // title: Text('Chat with Fertie - Cycle Day 10'),
      //   // backgroundColor: AppColors.color7D9EBB,
      // ) : null,
      body: SafeArea(
        child: Column(
          children: [
            // if (!widget.isFullScreen)
              buildTopBarContainer(),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  // Original code:
                  // itemCount: chatController.messages.length,
                  // itemBuilder: (context, index) {
                  //   return _buildMessage(chatController.messages[index]);
                  // },

                  // Modified code: Include currentBotMessage for live display
                  itemCount: chatController.messages.length + (chatController.currentBotMessage.value.isNotEmpty ? 1 : 0),
                  itemBuilder: (context, index) {
                    // Add in-progress message at the end
                    if (index == chatController.messages.length && chatController.currentBotMessage.value.isNotEmpty) {
                      return _buildMessage(ChatMessage(
                        text: chatController.currentBotMessage.value.trim(),
                        isMe: false,
                        time: DateTime.now(),
                      ));
                    }
                    // Show completed messages
                    return _buildMessage(chatController.messages[index]);
                  },
                );
              }),
            ),
            Obx(() {
              if (chatController.isTyping.value) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: TypingDotAnimation(),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
            buildTextInputContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    final alignment = message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bgColor = message.isMe ? AppColors.userMessageColor : AppColors.botMessageColor;
    final avatar = message.isMe
        ? Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400)),
      child: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(Icons.person_2_rounded, color: Colors.grey[400], size: 30),
      ),
    )
        : Image.asset(AppImages.cuteAppLogo, height: 40, width: 40);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isMe) avatar,
          SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: alignment,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(message.text),
                ),
                SizedBox(height: 4),
                Text(
                  '${message.time.hour}:${message.time.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          if (message.isMe) SizedBox(width: 8),
          if (message.isMe) avatar,
        ],
      ),
    );
  }

  Widget buildTopBarContainer() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.chatTopBarColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        border: Border.all(color: AppColors.chatTopBarBorderColor)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              print('Sidebar icon clicked');
            },
            child: SvgPicture.asset(AppIcons.sideBarIcon, color: Colors.black),
          ),
          Text(
            'Chat with Fertie - Cycle Day 10',
            style: AppStyles.fontSize16(
                color: AppColors.blackColor, fontWeight: FontWeight.bold).copyWith(fontFamily: 'Nunito'),
          ),

          // Expand/Collapse button
          GestureDetector(
            onTap: !widget.isFullScreen ? widget.onExpandTap : Get.back,
            child: SvgPicture.asset(
              AppIcons.openIcon,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextInputContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.only(top: 6, right: 4, left: 18, bottom: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 0.7, offset: Offset(0, 3))
          ]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatController.chatTextFieldController,
              decoration: InputDecoration(
                hintText: 'Ask Fertie anything...',
                hintStyle: TextStyle(color: Colors.black.withValues(alpha: 0.3)),
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
            onPressed: () {
              chatController.sendMessage();
            },
          ),
        ],
      ),
    );
  }
}