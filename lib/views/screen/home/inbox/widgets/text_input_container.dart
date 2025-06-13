import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:fertie_application/views/screen/home/inbox/controller/chat_controller.dart';
import 'package:flutter/material.dart';

class TextInputContainer extends StatelessWidget {
  final ChatController chatController;
  const TextInputContainer({super.key, required this.chatController});

  @override
  Widget build(BuildContext context) {
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
          IconButton(
            color: Colors.grey[600],
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      chatController.chatTextFieldController.text += emoji.emoji;
                    },
                    config: Config(
                      height: 256,
                    ),
                  ),
                ),
              );
            },
            icon: Icon(Icons.emoji_emotions_outlined),
          ),
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
