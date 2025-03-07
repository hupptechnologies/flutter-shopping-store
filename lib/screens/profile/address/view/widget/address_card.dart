import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/enum/address_enum.dart';
import 'package:e_commerce/data/address/address_dto.dart';
import 'package:e_commerce/screens/profile/address/controller/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddressCard extends GetView<AddressController> {
  final AddressDto address;
  const AddressCard({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final isOffice = address.type == AddressEnum.office;
    return GestureDetector(
      onTap: () => controller.setDefaultAddress(address.id),
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
              Radio(
                value: true,
                groupValue: address.isDefault,
                activeColor: AppColors.darkGray,
                onChanged: (value) {
                  if (value != null) {
                    controller.setDefaultAddress(address.id);
                  }
                },
                visualDensity:
                    const VisualDensity(horizontal: -4.0, vertical: 2.0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                      Text(
                        address.getAddressLine(),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () => controller.editOrCreate(address.id),
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 18,
                  color: AppColors.lightGreen,
                ),
                visualDensity: const VisualDensity(
                  horizontal: -4.0,
                  vertical: -1.0,
                ),
              ),
              IconButton(
                onPressed: () => controller.delete(address.id),
                icon: const Icon(
                  Icons.delete_outlined,
                  size: 18,
                  color: AppColors.offRed,
                ),
                visualDensity: const VisualDensity(
                  horizontal: -4.0,
                  vertical: -1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
