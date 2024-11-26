import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:e_commerce/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {
  final List<int> ratings;

  const ReviewWidget({
    super.key,
    required this.ratings,
  });

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  bool isExpanded = true;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: toggleExpanded,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Reviews',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Divider(),
          ),
          Visibility(
            visible: isExpanded,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  ratingOutOfOrRatingBarWidget(),
                  const SizedBox(height: 10),
                  ListView.builder(
                    itemCount: widget.ratings.length,
                    reverse: true,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return progressBarORratingWidget(
                        index: index + 1,
                        value: widget.ratings[index],
                      );
                    },
                  ),
                  reviewOrWriteTitleWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ratingOutOfOrRatingBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              const Text(
                '4.9',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'OUT OF 5',
                style: TextStyle(
                  color: AppColors.darkGray.withOpacity(0.5),
                ),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const RatingWidget(
              value: 5,
              size: 25,
            ),
            const SizedBox(height: 5),
            Text(
              '83 ratings',
              style: TextStyle(
                color: AppColors.darkGray.withOpacity(0.5),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget progressBarORratingWidget({
    required int index,
    required int value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            index.toString(),
            style: TextStyle(
              color: AppColors.darkGray.withOpacity(0.5),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.star_rate_rounded,
            color: AppColors.lightGreen,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: (value / 100),
                color: AppColors.lightGreen,
                backgroundColor: AppColors.lightGray,
                minHeight: 6,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            '${value.toString()}%',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  Widget reviewOrWriteTitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '47 Reviews',
            style: TextStyle(
              color: AppColors.dartGratWithOpaity5,
            ),
          ),
          Row(
            children: [
              Text(
                'WRITE A REVIEW',
                style: TextStyle(
                  color: AppColors.dartGratWithOpaity5,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.mode_edit_rounded,
                color: AppColors.dartGratWithOpaity5,
                size: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
