List<CardDto> cardDtoFromJson(List<dynamic> jsonList) =>
  jsonList.map((json) => CardDto.fromJson(json)).toList();

class CardDto {
  int? id;
  String? cardholderName;
  String? expirationDate;
  String? type;
  String? cardNumber;
  String? cvv;

  CardDto({
    this.id,
    this.cardholderName,
    this.expirationDate,
    this.type,
    this.cardNumber,
    this.cvv,
  });

  factory CardDto.fromJson(Map<String, dynamic> json) => CardDto(
        id: json["id"],
        cardholderName: json["cardholderName"],
        expirationDate: json["expirationDate"],
        type: json["type"],
        cardNumber: json["cardNumber"],
        cvv: json["cvv"],
      );

  Map<String, dynamic> toJson() => {
        "cardholderName": cardholderName,
        "expirationDate": expirationDate,
        "type": type,
        "cardNumber": cardNumber,
        "cvv": cvv,
      };
}
