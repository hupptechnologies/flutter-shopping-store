import 'package:e_commerce/dto/user_dto.dart';
import 'package:timeago/timeago.dart' as timeago;

List<ReviewDto> reviewDtoFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => ReviewDto.fromJson(json)).toList();
}

class ReviewDto {
  int? id;
  String? rating;
  String? comment;
  int? productId;
  UserDto? user;
  String? ago;

  ReviewDto({
    this.id,
    this.rating,
    this.comment,
    this.productId,
    this.user,
    this.ago,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) => ReviewDto(
        id: json["id"],
        rating: json["rating"],
        comment: json["comment"],
        productId: json["productId"],
        user: json["user"] != null ? UserDto.fromJson(json["user"]) : null,
        ago: json['updatedAt'] != null
            ? timeago.format(DateTime.parse(json['updatedAt']), locale: 'en')
            : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rating"] = rating;
    data["comment"] = comment;
    if (productId != null) {
      data["productId"] = productId;
    }
    return data;
  }
}
