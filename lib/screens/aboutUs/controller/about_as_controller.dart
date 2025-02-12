import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutAsController extends GetxController {
  final List<Map<String, dynamic>> contacts = [
    {
      'icon': Icons.call,
      'title': 'Call us',
      'subTitle': 'Our team is on the line',
      'days': 'Mon-Fri',
      'time': '09-17'
    },
    {
      'icon': Icons.email,
      'title': 'Email us',
      'subTitle': 'Our team is online',
      'days': 'Mon-Fri',
      'time': '09-17'
    }
  ];

  final List<Map<String, dynamic>> socialMedias = [
    {
      'icon': ImageConstant.instagramIcon,
      'title': 'Instagram',
      'subTitle': '4,6K Followers',
      'other': '118 Posts'
    },
    {
      'icon': ImageConstant.telegramIcon,
      'title': 'Telegram',
      'subTitle': '1,3K Followers',
      'other': '85 Posts'
    },
    {
      'icon': ImageConstant.facebookIcon,
      'title': 'FackBook',
      'subTitle': '3,8K Followers',
      'other': '136 Posts'
    },
    {
      'icon': ImageConstant.whatsappIcon,
      'title': 'WhatsUp',
      'subTitle': 'Available Mon-Fri',
      'other': '09-17'
    },
  ];
}
