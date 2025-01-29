import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/common/enum/address_enum.dart';
import 'package:e_commerce/data/address/address_dto.dart';
import 'package:e_commerce/screens/address/controller/address_controller.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    final address = controller.list[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: addressCard(address),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child:
                      ButtonWidget(title: 'Add new address', isDisable: false),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addressCard(AddressDto address) {
    final isOffice = address.type == AddressEnum.office;
    return GestureDetector(
      onTap: () => controller.onChangeDefalutAddress(address.id),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Radio(
                  value: address.id,
                  groupValue: controller.selectedAddressId.value,
                  activeColor: AppColors.darkGray,
                  onChanged: (value) {
                    if (value != null) {
                      controller.onChangeDefalutAddress(value);
                    }
                  },
                  visualDensity:
                      const VisualDensity(horizontal: -4.0, vertical: 2.0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            isOffice
                                ? ImageConstant.officeIcon
                                : ImageConstant.addressHomeIcon,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'SEND TO\n',
                                  ),
                                  TextSpan(
                                    text: isOffice ? 'My Office' : 'My Home',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'SBI Building, street 3, Software Park',
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      )
                    ],
                  ),
                ),
              ),
              const InkWell(
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: AppColors.offRed,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.offRed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
