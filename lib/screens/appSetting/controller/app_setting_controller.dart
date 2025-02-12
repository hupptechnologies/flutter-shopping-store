import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:get/get.dart';

class AppSettingController extends GetxController {
  final List list = [
    {
      'icon': ImageConstant.languageIcon,
      'title': 'Language',
      'path': AppRoutes.appSettingLanguage
    },
    {
      'icon': ImageConstant.bellDuotoneIcon,
      'title': 'Notification',
      'path': AppRoutes.appSettingNotification
    },
    {
      'icon': ImageConstant.termsOfUseIcon,
      'title': 'Terms of Use',
      'path': AppRoutes.appSettingTerms
    },
    {
      'icon': ImageConstant.aboutUsIcon,
      'title': 'Privacy Policy',
      'path': AppRoutes.appSettingPolicy
    },
    {
      'icon': ImageConstant.chatSupportIcon,
      'title': 'Chat support',
      'path': AppRoutes.appSettingChat
    },
  ];
}
