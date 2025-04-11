import 'package:e_commerce/common/args/product_review_list_args.dart';
import 'package:e_commerce/common/dto/meta.dart';
import 'package:e_commerce/common/dto/query_dto.dart';
import 'package:e_commerce/common/enum/order_by_enum.dart';
import 'package:e_commerce/dto/review_dto.dart';
import 'package:e_commerce/service/review_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewListController extends GetxController {
  final ReviewService reviewService = ReviewService();
  final QueryDto queryDto = QueryDto(order: OrderBy.desc, orderColumn: 'updatedAt');
  final Rx<List<ReviewDto>> reviews = Rx<List<ReviewDto>>([]);
  final ScrollController scrollController = ScrollController();
  
  late Meta meta;
  late Rxn<ProductReviewListArgs> args = Rxn<ProductReviewListArgs>();
  late bool isLoadingMore = false;

  @override
  void onInit() {
    args.value = Get.arguments as ProductReviewListArgs;
    scrollController.addListener(_onScroll);
    Future.microtask(() => fetchReviewList());
    super.onInit();
  }

  Future<void> _onScroll() async {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        meta.hasNextPage &&
        !isLoadingMore) {
      isLoadingMore = true;
      await fetchReviewList();
      isLoadingMore = false;
    }
  }

  Future<void> onRefresh() async {
    queryDto.setPage(1);
    await fetchReviewList();
  }

  Future<void> fetchReviewList() async {
    final productId = args.value?.productId;
    if (productId == null) return;

    final response = await reviewService.allByProductId(productId, queryDto);
    if (response.error) return;

    final newReviews = response.data!.items;
    meta = response.data!.meta;

    if (meta.currentPage == 1) {
      reviews.value = newReviews;
    } else {
      reviews.update((val) => val!.addAll(newReviews));
    }

    if (meta.hasNextPage) {
      queryDto.setPage(meta.nextPage);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
