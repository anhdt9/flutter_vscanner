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
          'enter_email' : 'Enter email',
          'enter_password' : 'Enter password',
          'password': 'Password'
        },
        'vi_VN': {
          'title': 'Quét Card',
          'login': 'Đăng nhập',
          'sign_up': 'Đăng ký',
          'logout': 'Đăng xuất',
          'enter_email' : 'Nhập email',
          'enter_password' : 'Nhập mật khẩu',
          'password': 'Mật khẩu'
        }
      };
}
