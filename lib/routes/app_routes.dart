import 'package:vscanner/modules/forgotPassword/forgot_password_binding.dart';
import 'package:vscanner/modules/forgotPassword/forgot_password_view.dart';
import 'package:vscanner/modules/home/home_binding.dart';
import 'package:vscanner/modules/home/home_view.dart';
import 'package:vscanner/modules/login/login_binding.dart';
import 'package:vscanner/modules/login/login_view.dart';
import 'package:vscanner/modules/signup/signup_binding.dart';
import 'package:vscanner/modules/signup/signup_view.dart';
import 'package:vscanner/routes/routes.dart';
import 'package:get/get.dart';

class AppRouters {
  static const INITIAL = LOGIN;

  static final routes = [
    GetPage(
      name: HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),

    GetPage(
      name: FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),

//    GetPage(
//      name: CREATE_MY_CARD,
//      page: () => CreateMyCardView(),
//      binding: CreateMyCardBinding(),
//    ),
//
//    GetPage(
//      name: MY_CARD_DETAIL,
//      page: () => MyCardDetailView(),
//      binding: MyCardDetailBinding(),
//    ),
//
//    GetPage(
//      name: SETTINGS,
//      page: () => SettingsView(),
//      binding: SettingsBinding(),
//    ),
//
//    GetPage(
//      name: CAMERA,
//      page: () => CameraView(),
//      binding: CameraBinding(),
//    ),
//
//    GetPage(
//      name: PREVIEW,
//      page: () => PreviewView(),
//      binding: PreviewBinding(),
//    ),
//
//    GetPage(
//      name: PREVIEW_DETAIL,
//      page: () => PreviewDetailView(),
//      binding: PreviewDetailBinding(),
//    ),
  ];
}