import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'Card Scanner',
          'login': 'Login',
          'sign_up': 'Sign up',
          'logout': 'Logout',
        },
        'vi_VN': {
          'title': 'Quét Card',
          'login': 'Đăng nhập',
          'sign_up': 'Đăng ký',
          'logout': 'Đăng xuất',
        }
      };
}
