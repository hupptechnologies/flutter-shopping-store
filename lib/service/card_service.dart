import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/dto/card_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class CardService extends BaseService {
  Future<ApiResponse<List<CardDto>>> getCards() async {
    return api.get(UrlConstant.cards, fromJsonT: (data) => cardDtoFromJson(data));
  }

  Future<ApiResponse> add(CardDto cardDto) async {
    return api.post(UrlConstant.cards, data: cardDto.toJson());
  }
}