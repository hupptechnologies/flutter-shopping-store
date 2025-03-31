class ProductQueryDto {
  int? categoryId;

  ProductQueryDto({
    this.categoryId,
  });

  Map<String, dynamic> toJson() => {
        if (categoryId != null) 'categoryId': categoryId,
      };

  void setCategoryId(int id) {
    categoryId = id;
  }
}