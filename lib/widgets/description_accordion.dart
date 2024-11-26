import 'package:e_commerce/common/constant/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DescriptionAccordion extends StatefulWidget {
  final String description;

  const DescriptionAccordion({
    super.key,
    required this.description,
  });

  @override
  State<DescriptionAccordion> createState() => _DescriptionAccordionState();
}

class _DescriptionAccordionState extends State<DescriptionAccordion> {
  bool isExpanded = false;
  bool isReadMore = false;

  void toggleExpanded() {
    setState(() {
      isReadMore = isExpanded ? false : isExpanded;
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String fullText = widget.description;

    final String displayText = isReadMore
        ? fullText
        : (fullText.length > 80 ? '${fullText.substring(0, 80)}...' : fullText);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: toggleExpanded,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Description',
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
              child: RichText(
                text: TextSpan(
                  text: displayText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    if (fullText.length > 80)
                      TextSpan(
                        text: isReadMore ? 'Read Less' : 'Read More',
                        style: const TextStyle(
                          color: AppColors.lightGreen,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              isReadMore = !isReadMore;
                            });
                          },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
