import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/appSetting/screens/policy/controller/policy_controller.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolicyView extends GetView<PolicyController> {
  const PolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<PolicyController>(
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          centerTitle: true,
          title: 'Privacy Policy',
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                spacing: 15,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.policys.length,
                    itemBuilder: (context, index) {
                      final item = controller.policys[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 6,
                          children: [
                            Text(
                              '${(index + 1).toString()} ${item['title']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(item['subtitle']!),
                          ],
                        ),
                      );
                    },
                  ),
                  ButtonWidget(
                    title: 'I’ve agree with this',
                    isDisable: false,
                    onPressed: controller.agreeTap,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
