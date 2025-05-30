import 'package:fertie_application/views/screen/home/inbox/models/chat_message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  RxBool isTyping = false.obs;

  final TextEditingController chatTextFieldController = TextEditingController();

  void sendMessage() {
    final text = chatTextFieldController.text.trim();
    if (text.isEmpty) return;

    final userMessage = ChatMessage(text: text, isMe: true, time: DateTime.now());

    messages.add(userMessage);
    chatTextFieldController.clear();
    isTyping.value = true;

    // Simulate API call and response
    Future.delayed(Duration(seconds: 2), () {
      final botReply = ChatMessage(
          text: 'How are you feeling today?',
          isMe: false,
          time: DateTime.now(),
      );
      messages.add(botReply);
      isTyping.value = false;
    });
  }
}