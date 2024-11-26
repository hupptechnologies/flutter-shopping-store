import 'package:flutter/material.dart';

class AccordionTextIcon extends StatefulWidget {
  final String title;
  final Widget child;
  final bool isExpanded;
  final double padding;

  const AccordionTextIcon({
    super.key,
    required this.title,
    required this.child,
    this.isExpanded = false,
    this.padding = 0,
  });

  @override
  State<AccordionTextIcon> createState() => _AccordionTextIconState();
}

class _AccordionTextIconState extends State<AccordionTextIcon> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isExpanded = widget.isExpanded;
    });
  }

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.padding,
            vertical: 2,
          ),
          child: GestureDetector(
            onTap: toggleExpanded,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 8,
            left: widget.padding,
            right: widget.padding,
          ),
          child: const Divider(),
        ),
        Visibility(visible: isExpanded, child: widget.child)
      ],
    );
  }
}
