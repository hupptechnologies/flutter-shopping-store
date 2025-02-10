import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final RxList messages = [
    {
      "text": "Hello!",
      "isSender": false,
      "time": DateTime.now().subtract(const Duration(days: 3))
    },
    {
      "text": "Hi, how are you?",
      "isSender": true,
      "time": DateTime.now().subtract(const Duration(days: 2))
    },
    {
      "text": "I'm good, thanks!",
      "isSender": false,
      "time": DateTime.now().subtract(const Duration(days: 1))
    },
    {
      "text": "What about you?",
      "isSender": false,
      "time": DateTime.now().subtract(const Duration(minutes: 2))
    },
    {
      "text": "I'm doing great!",
      "isSender": true,
      "time": DateTime.now().subtract(const Duration(minutes: 1))
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 300), () => scrollToBottom());
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void sendMessage() {
    if (chatController.text.trim().isNotEmpty) {
      messages.add({
        "text": chatController.text.trim(),
        "isSender": true,
        "time": DateTime.now(),
      });
      chatController.clear();
      Future.delayed(const Duration(milliseconds: 100), () => scrollToBottom());
    }
  }
}
