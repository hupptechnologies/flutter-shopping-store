import 'package:e_commerce/common/dto/meta.dart';

class Pagination<T> {
  final List<T> items;
  final Meta meta;

  Pagination({required this.items, required this.meta});

  factory Pagination.fromJson(
    Map<String, dynamic> json,
    List<T> Function(dynamic) fromJsonT,
  ) {
    return Pagination(
      items: fromJsonT(json['items']),
      meta: Meta.fromJson(json['meta']),
    );
  }
}
