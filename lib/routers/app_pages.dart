import 'package:e_commerce/screens/aboutUs/binding/about_us_binding.dart';
import 'package:e_commerce/screens/aboutUs/view/about_us_view.dart';
import 'package:e_commerce/screens/appSetting/binding/app_setting_binding.dart';
import 'package:e_commerce/screens/appSetting/screens/chat/binding/chat_bindings.dart';
import 'package:e_commerce/screens/appSetting/screens/chat/view/chat_view.dart';
import 'package:e_commerce/screens/appSetting/screens/language/binding/language_bindings.dart';
import 'package:e_commerce/screens/appSetting/screens/language/view/language_view.dart';
import 'package:e_commerce/screens/appSetting/screens/notification/binding/setting_notification_bindings.dart';
import 'package:e_commerce/screens/appSetting/screens/notification/view/setting_notification_view.dart';
import 'package:e_commerce/screens/appSetting/screens/policy/binding/policy_bindings.dart';
import 'package:e_commerce/screens/appSetting/screens/policy/view/policy_view.dart';
import 'package:e_commerce/screens/appSetting/screens/terms/binding/terms_bindings.dart';
import 'package:e_commerce/screens/appSetting/screens/terms/view/terms_view.dart';
import 'package:e_commerce/screens/appSetting/view/app_setting_view.dart';
import 'package:e_commerce/screens/notification/binding/notification_binding.dart';
import 'package:e_commerce/screens/notification/view/notification_view.dart';
import 'package:e_commerce/screens/profile/address/binding/address_binding.dart';
import 'package:e_commerce/screens/profile/address/view/address_view.dart';
import 'package:e_commerce/screens/auth/forget-password/binding/forget_password_binging.dart';
import 'package:e_commerce/screens/auth/forget-password/view/forget_password_view.dart';
import 'package:e_commerce/screens/auth/login/binding/login_binding.dart';
import 'package:e_commerce/screens/auth/login/view/login_view.dart';
import 'package:e_commerce/screens/auth/password/binding/password_binding.dart';
import 'package:e_commerce/screens/auth/password/view/password_view.dart';
import 'package:e_commerce/screens/auth/verification-code/binding/verification_code_binding.dart';
import 'package:e_commerce/screens/auth/verification-code/view/verification_code_view.dart';
import 'package:e_commerce/screens/cart/binding/cart_binding.dart';
import 'package:e_commerce/screens/cart/view/cart_view.dart';
import 'package:e_commerce/screens/checkout/binding/checkout_bindings.dart';
import 'package:e_commerce/screens/checkout/view/checkout_view.dart';
import 'package:e_commerce/screens/home/binding/home_binding.dart';
import 'package:e_commerce/screens/home/view/home_view.dart';
import 'package:e_commerce/screens/intro/view/intro_view.dart';
import 'package:e_commerce/screens/auth/sign_up/binding/sign_up_binding.dart';
import 'package:e_commerce/screens/auth/sign_up/view/sign_up_view.dart';
import 'package:e_commerce/screens/orders/binding/order_details_binding.dart';
import 'package:e_commerce/screens/orders/binding/order_track_binding.dart';
import 'package:e_commerce/screens/orders/view/order_details_view.dart';
import 'package:e_commerce/screens/orders/view/order_track_view.dart';
import 'package:e_commerce/screens/product/binding/product_detail_binging.dart';
import 'package:e_commerce/screens/product/binding/product_list_binding.dart';
import 'package:e_commerce/screens/product/view/product_detail_view.dart';
import 'package:e_commerce/screens/product/view/product_list_view.dart';
import 'package:e_commerce/screens/profile/feedback/binding/feedback_binding.dart';
import 'package:e_commerce/screens/profile/feedback/view/feedback_view.dart';
import 'package:e_commerce/screens/profile/payments/binding/add_payment_binding.dart';
import 'package:e_commerce/screens/profile/payments/binding/payments_binding.dart';
import 'package:e_commerce/screens/profile/payments/view/add_payment_view.dart';
import 'package:e_commerce/screens/profile/payments/view/payments_view.dart';
import 'package:e_commerce/screens/profile/setting/binding/setting_binding.dart';
import 'package:e_commerce/screens/profile/setting/view/setting_view.dart';
import 'package:e_commerce/screens/profile/voucher/binding/voucher_binding.dart';
import 'package:e_commerce/screens/profile/voucher/view/voucher_view.dart';
import 'package:e_commerce/screens/profile/wishlist/binding/wishlist_binding.dart';
import 'package:e_commerce/screens/profile/wishlist/view/wishlist_view.dart';
import 'package:e_commerce/screens/rating/binding/rating_binding.dart';
import 'package:e_commerce/screens/rating/view/rating_view.dart';
import 'package:e_commerce/screens/search/binding/search_binging.dart';
import 'package:e_commerce/screens/search/view/search_view.dart';
import 'package:e_commerce/screens/splash_screen/view/splash_screen_view.dart';
import 'package:e_commerce/routers/app_routers.dart';
import 'package:e_commerce/screens/support/binding/support_binding.dart';
import 'package:e_commerce/screens/support/view/support_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.index, page: () => const SplashScreenView()),
    GetPage(name: AppRoutes.intro, page: () => const IntroView()),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinging(),
    ),
    GetPage(
      name: AppRoutes.verificationCode,
      page: () => const VerificationCodeView(),
      binding: VerificationCodeBinding(),
    ),
    GetPage(
      name: AppRoutes.password,
      page: () => const PasswordView(),
      binding: PasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchView(),
      binding: SearchBinging(),
    ),
    GetPage(
      name: AppRoutes.productList,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: AppRoutes.productDetail,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinging(),
    ),
    GetPage(
      name: AppRoutes.cartList,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => const CheckoutView(),
      binding: CheckoutBindings(),
    ),
    GetPage(
      name: AppRoutes.orderDetails,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.rating,
      page: () => const RatingView(),
      binding: RatingBinding(),
    ),
    GetPage(
      name: AppRoutes.orderTrack,
      page: () => const OrderTrackView(),
      binding: OrderTrackBinding(),
    ),
    GetPage(
      name: AppRoutes.address,
      page: () => const AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: AppRoutes.profileSetting,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.payment,
      page: () => const PaymentsView(),
      binding: PaymentsBinding(),
    ),
    GetPage(
      name: AppRoutes.voucher,
      page: () => const VoucherView(),
      binding: VoucherBinding(),
    ),
    GetPage(
      name: AppRoutes.wishlist,
      page: () => const WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: AppRoutes.addPayment,
      page: () => const AddPaymentView(),
      binding: AddPaymentBinding(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: AppRoutes.feedback,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: AppRoutes.appSetting,
      page: () => const AppSettingView(),
      binding: AppSettingBinding(),
    ),
    GetPage(
      name: AppRoutes.support,
      page: () => const SupportView(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: AppRoutes.aboutUs,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: AppRoutes.appSettingLanguage,
      page: () => const LanguageView(),
      binding: LanguageBindings(),
    ),
    GetPage(
      name: AppRoutes.appSettingNotification,
      page: () => const SettingNotificationView(),
      binding: SettingNotificationBindings(),
    ),
    GetPage(
      name: AppRoutes.appSettingTerms,
      page: () => const TermsView(),
      binding: TermsBindings(),
    ),
    GetPage(
      name: AppRoutes.appSettingPolicy,
      page: () => const PolicyView(),
      binding: PolicyBindings(),
    ),
    GetPage(
      name: AppRoutes.appSettingChat,
      page: () => const ChatView(),
      binding: ChatBindings(),
    ),
  ];
}
