import 'package:get/get.dart';

class SettingNotificationController extends GetxController {
  final RxList list = [
    {
      "id": 1,
      "title": "Show notifications",
      "subTitle": "Receive push notifications for new messages",
      "value": true,
    },
    {
      "id": 2,
      "title": "Notification sounds",
      "subTitle": "Play sound for new messages",
      "value": true,
    },
    {
      "id": 3,
      "title": "Lock screen notifications",
      "subTitle": "Allow notification on the lock screen",
      "value": false,
    }
  ].obs;

  void onChangeValue(int id, bool value) {
    final index = list.indexWhere((element) => element["id"] == id);
    if (index != -1) {
      list[index]["value"] = value;
      list.refresh();
    }
  }
}
