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
import 'package:e_commerce/screens/home/binding/home_binding.dart';
import 'package:e_commerce/screens/home/view/home_view.dart';
import 'package:e_commerce/screens/intro/view/intro_view.dart';
import 'package:e_commerce/screens/auth/sign_up/binding/sign_up_binding.dart';
import 'package:e_commerce/screens/auth/sign_up/view/sign_up_view.dart';
import 'package:e_commerce/screens/product/binding/product_detail_binging.dart';
import 'package:e_commerce/screens/product/binding/product_list_binding.dart';
import 'package:e_commerce/screens/product/view/product_detail_view.dart';
import 'package:e_commerce/screens/product/view/product_list_view.dart';
import 'package:e_commerce/screens/search/binding/search_binging.dart';
import 'package:e_commerce/screens/search/view/search_view.dart';
import 'package:e_commerce/screens/splash_screen/view/splash_screen_view.dart';
import 'package:e_commerce/routers/app_routers.dart';
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
  ];
}
