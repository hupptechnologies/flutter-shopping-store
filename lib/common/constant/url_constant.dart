abstract class UrlConstant {
  static const String url = 'https://certain-mistakenly-skink.ngrok-free.app';
  static const String prefix = '/api/v1';

  static const String auth = '/auth';
  static const String login = '$auth/login';
  static const String logout = '$auth/logout';
  static const String signup = '$auth/sign-up';
  static const String forgetPassword = '$auth/forget-password';
  static const String verifyOtp = '$auth/verify-otp';
  static const String resetPassword = '$auth/reset-password';

  static const String user = '/user';
  static const String getProfile = '$user/get-profile';

  static const String address = '/address';

  static const String voucher = '/voucher';

  static const String cards = '/cards';

  static const String review = '/review';

  static const String category  = '/category';

  static const String product  = '/product';

  static const String wishlist  = '/wishlist';
  static const String brands  = 'brands';
}
