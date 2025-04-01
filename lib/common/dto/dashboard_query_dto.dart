import 'package:e_commerce/common/enum/product_type_enum.dart';

class DashboardQueryDto {
  ProductTypeEnum? type;

  DashboardQueryDto({
    this.type,
  });

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type!.name,
      };

  void setType(ProductTypeEnum type) {
    this.type = type;
  }
}
