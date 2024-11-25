class SearchBox {
  final String name;
  final String image;
  final String color;
  final List<SearchCategory>? category;

  SearchBox({
    required this.name,
    required this.image,
    required this.color,
    this.category,
  });
}

class SearchCategory {
  final String name;
  final int item;
  final List<SearchCategory>? subCategory;

  SearchCategory({
    required this.name,
    required this.item,
    this.subCategory,
  });
}
