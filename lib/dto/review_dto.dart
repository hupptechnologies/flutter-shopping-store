class ReviewDto {
  int? id;
  String? rating;
  String? comment;
  int? productId;

  ReviewDto({this.id, this.rating, this.comment, this.productId});

  factory ReviewDto.fromJson(Map<String, dynamic> json) => ReviewDto(
        id: json["id"],
        rating: json["rating"],
        comment: json["comment"],
        productId: json["productId"],
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
