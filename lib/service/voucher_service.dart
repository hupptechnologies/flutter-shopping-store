import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/dto/pagination.dart';
import 'package:e_commerce/data/voucher/voucher_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class VoucherService extends BaseService {

  Future<ApiResponse<Pagination<VoucherDto>>> getVouchers() async {
    return api.get(
      UrlConstant.voucher,
      (data) => Pagination.fromJson(
        data,
        (item) => VoucherDto.fromJson(item),
      ),
    );
  }
}
