import 'package:e_commerce/dto/image_dto.dart';

List<CategoryDto> categoryDtoFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => CategoryDto.fromJson(json)).toList();
}

class CategoryDto {
  int? id;
  String? name;
  String? description;
  String? gender;
  List<CategoryDto>? children;
  List<ImageDto>? images;
  int? productCount;

  CategoryDto({
    this.id,
    this.name,
    this.description,
    this.gender,
    this.children,
    this.images,
    this.productCount,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) => CategoryDto(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        gender: json['gender'],
        children: json['children'] != null
            ? categoryDtoFromJson(json['children'])
            : null,
        images:
            json['images'] != null ? imageDtoFromJson(json['images']) : null,
        productCount: json['products']?.length,
      );
}
