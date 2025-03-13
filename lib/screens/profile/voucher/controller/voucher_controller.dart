import 'package:e_commerce/common/utils/common_snackbar.dart';
import 'package:e_commerce/dto/voucher_dto.dart';
import 'package:e_commerce/service/voucher_service.dart';
import 'package:get/get.dart';

class VoucherController extends GetxController {
  final VoucherService voucherService = VoucherService();
  final RxList<VoucherDto> vouchers = <VoucherDto>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchVouchers();
  }

  void fetchVouchers() async {
    final response = await voucherService.getVouchers();
    if (response.error) {
      CommonSnackbar.error(response.message);
      return;
    }
    vouchers.assignAll(response.data!.items);
  }
}
