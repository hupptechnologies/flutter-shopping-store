import 'package:get/get.dart';

class TermsController extends GetxController {
  final List<Map<String, String>> terms = [
    {
      "title": "Acceptance of Terms",
      "subtitle":
          "By using the app, users agree to these Terms of Use and any updates. Continued use of the app after changes signifies acceptance."
    },
    {
      "title": "User Accounts & Responsibilities",
      "subtitle":
          "Users must provide accurate registration details and keep their login credentials secure. The app reserves the right to suspend or terminate accounts for violations."
    },
    {
      "title": "Product Listings & Pricing",
      "subtitle":
          "The app strives to provide accurate product descriptions and pricing. However, errors may occur, and the app reserves the right to correct them or cancel affected orders."
    },
    {
      "title": "Orders, Payments & Billing",
      "subtitle":
          "All purchases are subject to availability and payment verification. Users must provide valid payment details and authorize the app to charge the total amount."
    },
    {
      "title": "Shipping & Delivery",
      "subtitle":
          "Delivery times are estimates and may vary. The app is not responsible for delays caused by third-party carriers or incorrect shipping information provided by users."
    },
    {
      "title": "Returns, Refunds & Cancellations",
      "subtitle":
          "Users can request returns and refunds per the app’s policy. Some items may not be eligible for returns, and refund processing times may vary."
    },
    {
      "title": "Prohibited Activities",
      "subtitle":
          "Users must not engage in fraud, abuse, hacking, unauthorized reselling, or activities that violate laws. Violation may lead to account termination and legal action."
    },
    {
      "title": "Intellectual Property",
      "subtitle":
          "All content, including logos, trademarks, and product images, belongs to the app or respective owners. Users may not copy, modify, or distribute app content without permission."
    },
    {
      "title": "Limitation of Liability",
      "subtitle":
          "The app is not liable for direct, indirect, or incidental damages resulting from app usage, including but not limited to product issues, delays, or service interruptions."
    },
    {
      "title": "Privacy & Data Protection",
      "subtitle":
          "The app collects and processes user data according to its Privacy Policy. Users consent to the collection and use of their data as outlined in the policy."
    }
  ];

  void acceptTap() {
    Get.back();
  }
}
