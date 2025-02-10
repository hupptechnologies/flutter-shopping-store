import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/appSetting/screens/chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatSendingMessageWidget extends GetView<ChatController> {
  const ChatSendingMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: TextField(
              controller: controller.chatController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.lightGray,
                hintText: "Type a message...",
                hintStyle: TextStyle(
                  color: AppColors.dartGratWithOpaity5.withOpacityValue(0.5),
                  fontSize: 15
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            child: IconButton(
              icon: const Icon(Icons.send_rounded, color: Colors.white),
              onPressed: controller.sendMessage,
            ),
          )
        ],
      ),
    );
  }
}
