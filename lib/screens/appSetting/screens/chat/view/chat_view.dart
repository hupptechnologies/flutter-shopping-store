import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/appSetting/screens/chat/controller/chat_controller.dart';
import 'package:e_commerce/screens/appSetting/screens/chat/view/widget/chat_app_bar_widget.dart';
import 'package:e_commerce/screens/appSetting/screens/chat/view/widget/chat_message_widget.dart';
import 'package:e_commerce/screens/appSetting/screens/chat/view/widget/chat_sending_message_widget.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<ChatController>(
      child: Scaffold(
        appBar: const ChatAppBarWidget(),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MarginPadding.homeHorPadding,
                vertical: MarginPadding.homeTopPadding,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.messages.length,
                        itemBuilder: (context, index) =>
                            ChatMessageWidget(index: index),
                      ),
                    ),
                  ),
                  const ChatSendingMessageWidget()
                ],
              )),
        ),
      ),
    );
  }
}
