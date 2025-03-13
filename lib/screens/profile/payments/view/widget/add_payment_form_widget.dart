import 'package:e_commerce/common/utils/input_formatter.dart';
import 'package:e_commerce/screens/profile/payments/controller/add_payment_controller.dart';
import 'package:e_commerce/screens/profile/payments/view/widget/add_payment_field_widget.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddPaymentFormWidget extends GetView<AddPaymentController> {
  const AddPaymentFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        AddPaymentField(
          controller: controller.cardholderName,
          label: 'Cardholder Name',
          hintText: 'XXXXX XXXXX',
          inputFormatters: [
            UpperCaseTextFormatter()
          ],
        ),
        AddPaymentField(
          controller: controller.cardNumber,
          label: 'Card Number',
          hintText: '0000 0000 0000 0000',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
            CardNumberInputFormatter(),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: AddPaymentField(
                controller: controller.expiresDate,
                label: 'Expires',
                hintText: 'MM/YY',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5),
                  ExpiryDateInputFormatter(),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: AddPaymentField(
                controller: controller.cvv,
                label: 'CVV',
                hintText: '000',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        FractionallySizedBox(
          widthFactor: 0.7,
          child: ButtonWidget(
            title: 'Add card',
            isDisable: false,
            onPressed: controller.addCard,
          ),
        )
      ],
    );
  }
}
