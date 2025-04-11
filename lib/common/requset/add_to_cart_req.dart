import 'package:e_commerce/dto/variant_dto.dart';
import 'package:get/get.dart';

class AddToCartReq {
  int? productId;
  final int? quantity;
  int? variantId;

  List<VariantDto> variants = [];

  Rxn<String> selectedColor = Rxn<String>(null);
  Rxn<String> selectedSize = Rxn<String>(null);
  RxList<VariantDto> filteredColors = <VariantDto>[].obs;
  RxList<VariantDto> filteredSizes = <VariantDto>[].obs;

  bool get isValid => productId != null && variantId != null && quantity != null; 

  AddToCartReq({this.productId, this.quantity = 1});

  Map<String, dynamic> toJson() => {
        if (productId != null) 'productId': productId,
        if (variantId != null) 'variantId': variantId,
        if (quantity != null) 'quantity': quantity,
      };

  void setProductId(String id) {
    productId = int.parse(id);
  }

  void setVariants(List<VariantDto>? variants) {
    if (variants == null) return;
    this.variants = variants;
    filteredColors.value = _getFilteredColors();
    filteredSizes.value = _getFilteredSizes();
  }

  void setColor(String color) {
    selectedColor.value = selectedColor.value == color ? null : color;
    filteredSizes.value = _getFilteredSizes();
    _setVariantId();
  }

  void setSize(String size) {
    selectedSize.value = selectedSize.value == size ? null : size;
    filteredColors.value = _getFilteredColors();
    _setVariantId();
  }

  void _setVariantId() {
    final variant = variants.firstWhereOrNull((variant) =>
        variant.color == selectedColor.value &&
        variant.size == selectedSize.value);
    variantId = variant?.id;
  }

  List<VariantDto> _getFilteredColors() {
    return _getUniqueVariants(
      filterValue: selectedSize.value,
      match: (v, val) => v.size == val,
      key: (v) => v.color,
    );
  }

  List<VariantDto> _getFilteredSizes() {
    return _getUniqueVariants(
      filterValue: selectedColor.value,
      match: (v, val) => v.color == val,
      key: (v) => v.size,
    );
  }

  List<VariantDto> _getUniqueVariants({
    required String? filterValue,
    required bool Function(VariantDto, String) match,
    required String Function(VariantDto) key,
  }) {
    final filtered = filterValue == null
        ? variants
        : variants.where((v) => match(v, filterValue)).toList();

    final uniqueMap = <String, VariantDto>{};
    for (var variant in filtered) {
      uniqueMap[key(variant)] = variant;
    }

    return uniqueMap.values.toList();
  }
}
