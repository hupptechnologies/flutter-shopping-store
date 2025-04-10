import 'package:e_commerce/dto/review_dto.dart';
import 'package:e_commerce/service/review_service.dart';
import 'package:get/get.dart';

class ProductReviewListController extends GetxController {
  final ReviewService reviewService = ReviewService();

  final Rx<List<ReviewDto>> reviews = Rx<List<ReviewDto>>([]);
  late Rxn<String> title = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    title.value = Get.arguments['title'];
    fetchReviewList();
  }

  Future<void> fetchReviewList() async {
    final id = Get.arguments['id'];
    if (id == null) {
      return;
    }
    final response = await reviewService.allByProductId(id);
    if (!response.error) {
      reviews.value = response.data!.items;
    }
  }
}