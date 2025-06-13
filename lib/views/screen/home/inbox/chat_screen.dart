import 'package:fertie_application/utils/app_colors.dart';
import 'package:fertie_application/utils/app_icons.dart';
import 'package:fertie_application/utils/style.dart';
import 'package:fertie_application/views/screen/home/inbox/controller/chat_controller.dart';
import 'package:fertie_application/views/screen/home/inbox/models/chat_message_model.dart';
import 'package:fertie_application/views/screen/home/inbox/widgets/fertie_mark.dart';
import 'package:fertie_application/views/screen/home/inbox/widgets/text_input_container.dart';
import 'package:fertie_application/views/screen/home/inbox/widgets/typing_dot_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_images.dart';
import 'models/monthly_chat_item_model.dart';

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // ADDED: Track which month is currently selected
  String selectedMonthId = '2025-06'; // Default to current month

  // MODIFIED: Updated monthly chats with better structure
  List<MonthlyChatItem> monthlyChats = [
    MonthlyChatItem(id: '2025-06', monthName: 'June 2025', isCurrentMonth: true, lastActivity: DateTime(2025, 6, 12)),
    MonthlyChatItem(id: '2025-05', monthName: 'May 2025', isCurrentMonth: false, lastActivity: DateTime(2025, 5, 28)),
    MonthlyChatItem(id: '2025-04', monthName: 'April 2025', isCurrentMonth: false, lastActivity: DateTime(2025, 4, 25)),
    MonthlyChatItem(id: '2025-03', monthName: 'March 2025', isCurrentMonth: false, lastActivity: DateTime(2025, 3, 15)),
    MonthlyChatItem(id: '2025-02', monthName: 'February 2025', isCurrentMonth: false, lastActivity: DateTime(2025, 2, 20)),
    MonthlyChatItem(id: '2025-01', monthName: 'January 2025', isCurrentMonth: false, lastActivity: DateTime(2025, 1, 18)),
  ];

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
    chatController = Get.put(ChatController(), permanent: true);
    ever(chatController.currentBotMessage, (_) => _scrollToBottom());
    ever(chatController.messages, (_) => _scrollToBottom());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.chatBg,
      // MODIFIED: Updated drawer design to match screenshot
      drawer: _buildChatHistoryDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            buildTopBarContainer(),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  itemCount: chatController.messages.length + (chatController.currentBotMessage.value.isNotEmpty ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == chatController.messages.length && chatController.currentBotMessage.value.isNotEmpty) {
                      return _buildMessage(ChatMessage(
                        text: chatController.currentBotMessage.value.trim(),
                        isMe: false,
                        time: DateTime.now(),
                      ));
                    }
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
            TextInputContainer(chatController: chatController),
          ],
        ),
      ),
    );
  }

  // MODIFIED: Updated drawer design to match the screenshot with proper selection
  Widget _buildChatHistoryDrawer() {
    return Drawer(
      backgroundColor: AppColors.brandSecondaryColor,
      width: MediaQuery.of(context).size.width * 0.55,
      child: SafeArea(
        child: Column(
          children: [
            // MODIFIED: Updated header design to match screenshot
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:  AppColors.brandSecondaryColor,
                border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
              ),
              child: Row(
                children: [
                  Icon(Icons.chat_bubble_outline, color: Colors.white, size: 24),
                  const SizedBox(width: 12),
                  Text(
                    'Chat History',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // MODIFIED: Updated list design to match screenshot
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: monthlyChats.length,
                itemBuilder: (context, index) {
                  MonthlyChatItem monthChat = monthlyChats[index];
                  return _buildMonthlyChatItem(monthChat);
                },
              ),
            ),
            FertieAiAssistantMark(),
          ],
        ),
      ),
    );
  }

  // MODIFIED: Updated design to match the screenshot with proper selection handling
  Widget _buildMonthlyChatItem(MonthlyChatItem monthChat) {
    // ADDED: Check if this month is selected (not just current month)
    bool isSelected = selectedMonthId == monthChat.id;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        // MODIFIED: Updated selection styling to match screenshot
        color: isSelected ? Color(0xFFE3F2FD).withValues(alpha: 0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        // border: isSelected ? Border.all(color: Color(0xFF2196F3), width: 1.5) : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // ADDED: Handle monthly chat selection with proper state management
            setState(() {
              selectedMonthId = monthChat.id;
            });

            // ADDED: Send selected month to server for fetching chat history
            _loadMonthlyChat(monthChat.id);

            // Close drawer after selection
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // MODIFIED: Updated text styling to match screenshot
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        monthChat.monthName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                          // color: isSelected ? Color(0xFF1976D2) : Colors.black87,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),

                // MODIFIED: Updated trailing icon/badge
                if (monthChat.isCurrentMonth)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'CURRENT',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ADDED: Method to load monthly chat data from server
  void _loadMonthlyChat(String monthId) {
    print('Loading chat history for month: $monthId');

    // TODO: Implement API call to fetch monthly chat history
    // Example implementation:
    // chatController.loadMonthlyChat(monthId);

    // You can add loading state here
    // chatController.isLoading.value = true;

    // API call example:
    // try {
    //   final response = await ApiService.getMonthlyChat(monthId);
    //   chatController.messages.value = response.messages;
    //   chatController.isLoading.value = false;
    // } catch (e) {
    //   print('Error loading monthly chat: $e');
    //   chatController.isLoading.value = false;
    // }
  }

  // KEPT: Helper method to format date
  String _formatDate(DateTime date) {
    List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}';
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
              _scaffoldKey.currentState?.openDrawer();
            },
            child: SvgPicture.asset(AppIcons.sideBarIcon, color: Colors.black),
          ),
          Text(
            'Chat with Fertie - Cycle Day 10',
            style: AppStyles.fontSize16(
                color: AppColors.blackColor, fontWeight: FontWeight.bold).copyWith(fontFamily: 'Nunito'),
          ),
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
}
