import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/enum/contact_enum.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAsController extends GetxController {
  final List<Map<String, dynamic>> contacts = [
    {
      'icon': Icons.call,
      'title': 'Call us',
      'subTitle': 'Our team is on the line',
      'days': 'Mon-Fri',
      'time': '09-17',
      'type': ContactEnum.call
    },
    {
      'icon': Icons.email,
      'title': 'Email us',
      'subTitle': 'Our team is online',
      'days': 'Mon-Fri',
      'time': '09-17',
      'type': ContactEnum.email
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

  void openContacts(ContactEnum type) {
    switch (type) {
      case ContactEnum.call:
        openDialer('+910000000000');
        return;
      case ContactEnum.email:
        openEmailApp('gemstore@gmail.com');
        return;
    }
  }

  void openDialer(String phoneNumber) async {
    final Uri phoneUri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      CommonSnackbar.error("Could not open dialer");
    }
  }

  void openEmailApp(String email) async {
    final Uri emailUri = Uri.parse('mailto:$email');

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      print("Could not open email app");
    }
  }
}
