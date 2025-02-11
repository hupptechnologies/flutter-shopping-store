import 'package:flutter/material.dart';

class NoRecordsWidget extends StatelessWidget {
  const NoRecordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No Records Found",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
