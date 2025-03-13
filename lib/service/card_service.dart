import 'package:e_commerce/common/constant/url_constant.dart';
import 'package:e_commerce/common/dto/api_response.dart';
import 'package:e_commerce/dto/card_dto.dart';
import 'package:e_commerce/service/base_service.dart';

class CardService extends BaseService {
  Future<ApiResponse<List<CardDto>>> getCards() async {
    return api.get(
      url: UrlConstant.cards,
      fromJsonT: (data) => cardDtoFromJson(data),
    );
  }

  Future<ApiResponse> add(CardDto cardDto) async {
    return api.post(url: UrlConstant.cards, data: cardDto.toJson());
  }

  Future<ApiResponse<CardDto>> getById(String id) async {
    return api.get(
      url: [UrlConstant.cards, id.toString()],
      fromJsonT: (data) => CardDto.fromJson(data),
    );
  }
}
