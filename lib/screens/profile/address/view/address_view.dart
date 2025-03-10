import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/profile/address/controller/address_controller.dart';
import 'package:e_commerce/screens/profile/address/view/widget/address_card.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<AddressController>(
      isLoader: controller.addressService.api.isLoader,
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          title: 'Delivery address',
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Obx(() {
                    if (controller.list.isEmpty) {
                      return SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Get.height / 5),
                          child: const Center(
                            child: Text(
                              "No address found",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.list.length,
                      itemBuilder: (context, index) {
                        final address = controller.list[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: AddressCard(address: address),
                        );
                      },
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: ButtonWidget(
                        title: 'Add new address',
                        isDisable: false,
                        onPressed: () => controller.editOrCreate(null),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
