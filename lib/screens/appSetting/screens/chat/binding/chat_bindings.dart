import 'package:e_commerce/screens/appSetting/screens/chat/controller/chat_controller.dart';
import 'package:get/get.dart';

class ChatBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
