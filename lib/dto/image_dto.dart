List<ImageDto> imageDtoFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => ImageDto.fromJson(json)).toList();
}

class ImageDto {
  int? id;
  String url;

  ImageDto({this.id, required this.url});

  factory ImageDto.fromJson(Map<String, dynamic> json) => ImageDto(
        id: json['id'],
        url: json['url'],
      );
}
