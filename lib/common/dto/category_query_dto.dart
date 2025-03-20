class CategoryQueryDto {
  int? depth;
  bool? isProductCount;

  CategoryQueryDto({
    this.depth,
    this.isProductCount,
  });

  Map<String, dynamic> toJson() => {
        if (depth != null) 'depth': depth,
        if (isProductCount != null) 'isProductCount': isProductCount,
      };
}
