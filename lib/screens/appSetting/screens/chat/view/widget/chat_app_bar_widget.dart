import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/extension/color_extensions.dart';
import 'package:e_commerce/screens/appSetting/screens/chat/controller/chat_controller.dart';
import 'package:e_commerce/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatAppBarWidget extends GetView<ChatController>
    implements PreferredSizeWidget {
  const ChatAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.lightGray, width: 0.8),
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 90,
        leading: Padding(
          padding: EdgeInsets.only(left: MarginPadding.homeHorPadding),
          child: const BuildBackButton(),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            spacing: 15,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor:
                        AppColors.dartGratWithOpaity5.withOpacityValue(0.3),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 5.5,
                      backgroundColor: AppColors.lightGreen,
                    ),
                  ),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Admin',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(fontSize: 12),
                  )
                ],
              )
            ],
          ),
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
