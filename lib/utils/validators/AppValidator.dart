import 'package:vscanner/utils/validators/Regexs.dart';

class AppValidator {

  static bool isValidPwd(String pwd) {
    return Regexs.password.hasMatch(pwd);
  }

  static bool isValidName(String name) {
    return Regexs.name.hasMatch(name);
  }

  static bool isValidNickname(String nickname) {
    return Regexs.name.hasMatch(nickname);
  }

  static bool isValidEmail(String email) {
    return Regexs.email.hasMatch(email);
  }
}
