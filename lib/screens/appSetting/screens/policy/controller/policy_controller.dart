import 'package:get/get.dart';

class PolicyController extends GetxController {
  final List<Map<String, String>> policys = [
    {
      "title": "Information We Collect",
      "subtitle":
          "We collect personal details such as name, email, phone number, address, and payment information. We may also collect device data, IP addresses, and browsing behavior."
    },
    {
      "title": "How We Use Your Information",
      "subtitle":
          "We use your data to process orders, provide customer support, improve our services, send promotional offers, and prevent fraud."
    },
    {
      "title": "Data Sharing & Third Parties",
      "subtitle":
          "We do not sell user data. However, we may share it with trusted service providers (e.g., payment processors, delivery partners) and legal authorities if required."
    },
    {
      "title": "Cookies & Tracking Technologies",
      "subtitle":
          "We use cookies and tracking tools to enhance your experience, personalize content, and analyze user behavior. You can manage cookies through your browser settings."
    },
    {
      "title": "Data Security Measures",
      "subtitle":
          "We implement encryption, firewalls, and secure payment gateways to protect your personal information from unauthorized access."
    },
    {
      "title": "User Rights & Data Control",
      "subtitle":
          "Users can access, edit, or delete their personal data. You can also opt out of marketing emails or request data deletion as per applicable laws."
    },
    {
      "title": "Data Retention Policy",
      "subtitle":
          "We store user data only as long as necessary for business operations, legal compliance, or security purposes. Unused data may be deleted after a specific period."
    },
    {
      "title": "Children’s Privacy",
      "subtitle":
          "Our app is not intended for children under 13. We do not knowingly collect data from minors. If a child’s data is found, we will delete it promptly."
    },
    {
      "title": "Legal Compliance & Policy Updates",
      "subtitle":
          "We comply with relevant data protection laws (e.g., GDPR, CCPA). We may update this policy, and users will be notified of major changes."
    },
    {
      "title": "Contact Information & Support",
      "subtitle":
          "If you have privacy-related questions or requests, you can contact us via email or through the in-app support section."
    }
  ];

  void agreeTap() {
    Get.back();
  }
}
