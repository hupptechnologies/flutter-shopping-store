import 'package:e_commerce/common/constant/margin_padding.dart';
import 'package:e_commerce/screens/profile/feedback/controller/feedback_controller.dart';
import 'package:e_commerce/screens/profile/feedback/view/widget/feedback_image_picker_widget.dart';
import 'package:e_commerce/screens/profile/feedback/view/widget/feedback_review_description_widget.dart';
import 'package:e_commerce/screens/profile/feedback/view/widget/feedback_title_with_rating_widget.dart';
import 'package:e_commerce/widgets/back_button_appbar_title.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/pop_scope_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScopeWrapper<FeedbackController>(
      child: Scaffold(
        appBar: const BackButtonAppbarTitle(
          centerTitle: true,
          title: 'Share your feedback',
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MarginPadding.homeHorPadding,
              vertical: MarginPadding.homeTopPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const FeedbackTitleWithRatingWidget(),
                  const SizedBox(height: 50),
                  const FeedbackReviewDescriptionWidget(),
                  const FeedbackImagePickerWidget(),
                  ButtonWidget(
                    title: 'Send feedback',
                    isDisable: false,
                    onPressed: controller.submitReview,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
