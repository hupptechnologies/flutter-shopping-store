import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/aboutUs/controller/about_as_controller.dart';
import 'package:e_commerce/screens/aboutUs/view/widget/contact_about_us_widget.dart';
import 'package:e_commerce/screens/aboutUs/view/widget/social_media_about_us_widget.dart';
import 'package:e_commerce/widgets/appbar/view/common_app_bar.dart';
import 'package:e_commerce/widgets/drawer/view/drawer_view.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsView extends GetView<AboutAsController> {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<AboutAsController>(
      child: Scaffold(
        appBar: const CommonAppBar(
          title: 'About as',
          isNotication: false,
        ),
        drawer: const CommonDrawerView(),
        drawerEnableOpenDragGesture: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.',
                  ),
                  ContactAboutUsWidget(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Contact us in Social Media',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SocialMediaAboutUsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
