import 'dart:async';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:fertie_application/data/api_constants.dart';
import 'package:fertie_application/views/screen/home/inbox/controller/chat_service.dart';
import 'package:fertie_application/views/screen/home/inbox/models/chat_message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  RxBool isTyping = false.obs;
  RxString currentBotMessage = ''.obs;

  final TextEditingController chatTextFieldController = TextEditingController();
  final ChatService chatService = ChatService();
  StreamSubscription<String>? subscription;

  void sendMessage() {
    final text = chatTextFieldController.text.trim();
    if (text.isEmpty) return;

    final userMessage = ChatMessage(
      text: text,
      isMe: true,
      time: DateTime.now(),
    );

    messages.add(userMessage);
    chatTextFieldController.clear();
    isTyping.value = true;

    // Simulate API call and response
    // Future.delayed(Duration(seconds: 2), () {
    //   final botReply = ChatMessage(
    //       text: 'How are you feeling today?',
    //       isMe: false,
    //       time: DateTime.now(),
    //   );
    //   messages.add(botReply);
    //   isTyping.value = false;
    // });

    // fetch bot response via long polling
    fetchBotResponse(text, ApiConstants.tempConversationId);
  }

  void fetchBotResponse(String userMessage, String conversationId) {
    subscription?.cancel(); // cancel any existing subscription
    subscription = chatService.getChatResponses(userMessage, conversationId).listen((chunk) {

      // append each chunk to the current bot message
      currentBotMessage.value += chunk;
      update();
    },
      onError: (error) {
      isTyping.value = false;
      messages.add(
        ChatMessage(text: 'Error $error', isMe: false, time: DateTime.now(),),);
      },
      onDone: () {
       // when the stream is done, finalize the message
        if (currentBotMessage.value.isNotEmpty) {
          messages.add(ChatMessage(
            text: currentBotMessage.value.trim(),
            isMe: false,
            time: DateTime.now(),
          ));
          currentBotMessage.value = '';
        }
        isTyping.value = false;
      }
    );
  }

  // Future<void> displayChunkByChunk(String chunk) async {
  //     currentBotMessage.value+=chunk.toString();
  //       update();
  // }

  @override
  void onClose() {
    subscription?.cancel();
    chatTextFieldController.dispose();
    super.onClose();
  }
}