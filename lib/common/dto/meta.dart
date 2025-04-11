class Meta {
  final int total;
  final int totalPage;
  final int currentPage;
  final int perPage;

  Meta({
    required this.total,
    required this.totalPage,
    required this.currentPage,
    required this.perPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
      totalPage: json['totalPage'],
      currentPage: json['currentPage'],
      perPage: json['perPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'totalPage': totalPage,
      'currentPage': currentPage,
      'perPage': perPage,
    };
  }

  bool get hasNextPage => currentPage < totalPage;
  int get nextPage => currentPage + 1;
}
