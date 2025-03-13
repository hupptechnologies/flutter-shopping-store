import 'package:e_commerce/common/constant/reg_exp_constant.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/dto/card_dto.dart';
import 'package:e_commerce/service/card_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPaymentController extends GetxController {
  final CardService cardService = CardService();
  final TextEditingController cardholderName = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController expiresDate = TextEditingController();
  final TextEditingController cvv = TextEditingController();

  late RxString cardNumberDisplay = 'xxxxxxxxxxxxxxxx'.obs;
  late RxString cardholderDisplay = 'xxxxx xxxxx'.obs;
  late RxString expiryDateDisplay = 'MM/YY'.obs;
  late RxBool readOnly = false.obs;

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments['id'];
    if (id != null) {
      readOnly.value = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getCard(id);
      });
    }
    addListeners();
  }

  @override
  void dispose() {
    removeListeners();
    super.dispose();
  }

  void addListeners() {
    cardholderName.addListener(_updateCardholderDisplay);
    cardNumber.addListener(_updateCardNumberDisplay);
    expiresDate.addListener(_updateExpiryDateDisplay);
  }

  void removeListeners() {
    cardholderName.removeListener(_updateCardholderDisplay);
    cardNumber.removeListener(_updateCardNumberDisplay);
    expiresDate.removeListener(_updateExpiryDateDisplay);
  }

  void _updateCardholderDisplay() {
    cardholderDisplay.value =
        cardholderName.text.isEmpty ? 'xxxxx xxxxx' : cardholderName.text;
  }

  void _updateCardNumberDisplay() {
    String input = cardNumber.text.replaceAll(RegExpConstant.space, '');
    int inputLength = input.length;

    if (inputLength == 0) {
      cardNumberDisplay.value = 'xxxxxxxxxxxxxxxx';
    } else {
      String hiddenPart = 'x' * (16 - inputLength);
      cardNumberDisplay.value = input + hiddenPart;
    }
  }

  void _updateExpiryDateDisplay() {
    String input = expiresDate.text.replaceAll(RegExpConstant.onlyDigits, '');
    expiryDateDisplay.value = input.isEmpty
        ? 'MM/YY'
        : '${input.padRight(2, 'M').substring(0, 2)}/${input.padRight(4, 'Y').substring(2, 4)}';
  }

  Future<void> deleteCard() async {
    final id = Get.arguments['id'];
    if (id == null) {
      return;
    }
    final response = await cardService.delete(id.toString());
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }
    Get.back(result: response.data!);
    CommonSnackbar.success(response.message);
  }

  Future<void> addCard() async {
    final CardDto cardDto = CardDto(
      cardholderName: cardholderName.text,
      cardNumber: cardNumber.text,
      expirationDate: expiresDate.text,
      cvv: cvv.text,
    );

    final response = await cardService.add(cardDto);
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }
    Get.back(result: true);
  }

  Future<void> getCard(dynamic id) async {
    final response = await cardService.getById(id.toString());
    if (!response.error) {
      updateTextField(response.data!);
      return;
    }
    CommonSnackbar.error(response.message);
  }

  void updateTextField(CardDto cardDto) {
    cardholderName.text = cardDto.cardholderName!;
    cardNumber.text = cardDto.cardNumber!;
    expiresDate.text = cardDto.expirationDate!;
    cvv.text = cardDto.cvv!;
    _updateCardholderDisplay();
    _updateCardNumberDisplay();
    _updateExpiryDateDisplay();
  }
}
