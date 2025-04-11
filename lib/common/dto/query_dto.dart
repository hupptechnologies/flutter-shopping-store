import 'package:e_commerce/common/enum/order_by_enum.dart';

class QueryDto {
  int? _page;
  int? _limit;
  String? _search;
  String? _orderColumn;
  OrderBy? _order;

  QueryDto({
    int? page,
    int? limit,
    OrderBy? order,
    String? orderColumn,
    String? search,
  })  : _page = page,
        _limit = limit,
        _order = order,
        _orderColumn = orderColumn,
        _search = search;

  void setPage(int? page) {
    _page = page;
  }

  void setLimit(int? limit) {
    _limit = limit;
  }

  void setSearch(String? search) {
    _search = search;
  }

  void setOrderColumn(String? orderColumn) {
    _orderColumn = orderColumn;
  }

  void setOrder(OrderBy? order) {
    _order = order;
  }

  Map<String, dynamic> toJson() => {
        if (_page != null) 'page': _page,
        if (_limit != null) 'limit': _limit,
        if (_order != null) 'order': _order!.name.toUpperCase(),
        if (_orderColumn != null) 'orderColumn': _orderColumn,
        if (_search != null) 'search': _search,
      };
}

