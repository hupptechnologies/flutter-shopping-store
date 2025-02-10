import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/appSetting/screens/chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatMessageWidget extends GetView<ChatController> {
  final int index;
  const ChatMessageWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final message = controller.messages[index];
    final bool isSender = message["isSender"];
    final String formattedTime = DateFormat('hh:mm a').format(message["time"]);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 14,
            ),
            decoration: BoxDecoration(
              color: isSender
                  ? AppColors.lightGreen.withOpacityValue(0.5)
                  : AppColors.lightGray,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message["text"],
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              formattedTime,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.dartGratWithOpaity5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
