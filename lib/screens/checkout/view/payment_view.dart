import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/checkout/controller/payment_controller.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/credit_card_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPaymentMethodSection(),
        _buildCreditCardCarouselSection(),
        _buildCheckoutSection(),
        _buildBillingSection(),
      ],
    );
  }

  Widget _buildBillingSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MarginPadding.homeTopPadding,
          horizontal: MarginPadding.homeHorPadding,
        ),
        margin: EdgeInsets.zero,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            titleWithPriceWidget(
              title: 'Product Price',
              price: '\$ ${100}',
            ),
            const Divider(),
            titleWithPriceWidget(
              title: 'Shipping',
              price: 'Freeship',
            ),
            const Divider(),
            titleWithPriceWidget(
              title: 'Subtotal',
              price: '\$ ${100}',
              isTotalWidget: true,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: Transform.translate(
                    offset: const Offset(-8, 0),
                    child: ObxValue<RxBool>(
                      (value) => Checkbox(
                        value: value.value,
                        onChanged: controller.toggleTermsAndCondition,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      controller.isTermsAndCondition,
                    ),
                  ),
                ),
                Builder(builder: (context) {
                  return RichText(
                    text: TextSpan(
                      text: 'I agree to ',
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.0,
                            height: 1.2,
                            color: Colors.black,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.termsAndConditions,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: ButtonWidget(
                title: 'Place my order',
                onPressed: null,
                isDisable: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MarginPadding.homeHorPadding),
      child: Column(
        children: [
          paymentMethodSelectingWidget(),
          const SizedBox(height: 10),
          paymentCartTitleOrAddCard(),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MarginPadding.homeHorPadding,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text('or check out with'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.creditCardList.length, (index) {
              return _buildCreditCardIcon(index);
            }),
          ),
        ],
      ),
    );
  }

  Widget titleWithPriceWidget({
    required String title,
    required String price,
    bool isTotalWidget = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: !isTotalWidget ? AppColors.dartGratWithOpaity5 : null,
              fontSize: 14,
              fontWeight: isTotalWidget ? FontWeight.bold : null,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: isTotalWidget ? 18 : 14,
              fontWeight: isTotalWidget ? FontWeight.bold : null,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCreditCardIcon(int index) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: Get.width / (controller.creditCardList.length + 1.5),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.dartGratWithOpaity5,
            blurRadius: 0.5,
            spreadRadius: 0.3,
          ),
        ],
      ),
      child: SvgPicture.asset(
        controller.creditCardList[index],
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildCreditCardCarouselSection() {
    return CarouselSlider(
      items: List.generate(3, (index) {
        return const CreditCardWidget(
          icon: ImageConstant.visaIcon,
          cardNumber: 4364134589328378,
          holderName: 'Sunie Pham',
          validDate: '02/2026',
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        viewportFraction: 0.9,
        enableInfiniteScroll: false,
      ),
    );
  }

  Widget paymentMethodSelectingWidget() {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controller.paymentMethodCart.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> item = entry.value;

          EdgeInsetsGeometry padding = EdgeInsets.only(
            left: index == 0 ? 0 : 5,
            right: index == controller.paymentMethodCart.length - 1 ? 0 : 5,
          );

          return Expanded(
            child: Padding(
              padding: padding,
              child: ObxValue<RxInt>(
                (selectedIndex) => GestureDetector(
                  onTap: () => controller.changePaymentMethod(index),
                  child: _buildContainer(
                    icon: item["icon"],
                    label: item["label"],
                    isSelected: selectedIndex.value == index,
                  ),
                ),
                controller.selectPaymentMethod,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget paymentCartTitleOrAddCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Choose your card',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () => controller.addCreditCard(),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add new',
                  style: TextStyle(
                    color: AppColors.offRed,
                  ),
                ),
                Icon(
                  Icons.add,
                  color: AppColors.offRed,
                  size: 13,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContainer({
    required String icon,
    required String? label,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? AppColors.darkGray : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.09),
            offset: const Offset(1, 1),
            blurRadius: 3,
            spreadRadius: 2.5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SvgPicture.asset(
              icon,
              color: isSelected ? Colors.white : AppColors.dartGratWithOpaity5,
            ),
          ),
          if (label != null) ...[
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color:
                    isSelected ? Colors.white : AppColors.dartGratWithOpaity5,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
