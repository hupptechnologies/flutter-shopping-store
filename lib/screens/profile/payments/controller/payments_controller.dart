import 'package:e_commerce/common/constant/image_constant.dart';
import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/dto/card_dto.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/service/card_service.dart';
import 'package:get/get.dart';

class PaymentsController extends GetxController {
  final CardService cardService = CardService();
  final RxList<CardDto> cardList = <CardDto>[].obs;

  final List<String> creditCardList = [
    ImageConstant.payPalIcon,
    ImageConstant.visaIcon,
    ImageConstant.mastercardIcon,
    ImageConstant.alipayIcon,
    ImageConstant.amexIcon,
  ];

  void gotoAddCard () async {
    final bool result = await Get.toNamed(AppRoutes.addPayment);

    if (result) {
      fetchCards();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCards();
  }

  Future<void> fetchCards() async {
    final cards = await cardService.getCards();
    if (cards.error) {
      CommonSnackbar.error(cards.message);
      return;
    }
    cardList.assignAll(cards.data!);
  }
}
