import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/appSetting/screens/language/controller/language_controller.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<LanguageController>(
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          centerTitle: true,
          title: 'Languages',
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: ListView(
              children: [
                ListView.builder(
                  itemCount: controller.languages.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = controller.languages[index];
                    return Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          onTap: () => controller.changeLanguage(item),
                          title: Text(item),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          leading: Radio<String>(
                            visualDensity: const VisualDensity(horizontal: -4),
                            value: item,
                            groupValue: controller.selectedLan.value,
                            onChanged: controller.changeLanguage,
                          ),
                          tileColor: AppColors.lightGray,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
