import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/common/dto/pagination.dart';
import 'package:e_commerce/dto/voucher_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class VoucherService extends BaseService {
  Future<ApiResponse<Pagination<VoucherDto>>> getVouchers() async {
    return api.get(
      url: UrlConstant.voucher,
      fromJsonT: (data) => Pagination.fromJson(
        data,
        (json) => voucherDtoFromJson(json),
      ),
    );
  }
}
