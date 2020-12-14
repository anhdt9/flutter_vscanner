import 'dart:async';

import 'package:get/get.dart';
import 'package:vscanner/routes/routes.dart';
import 'package:vscanner/services/AuthService.dart';
import 'package:vscanner/utils/utils.dart';
import 'package:vscanner/utils/validators/AppValidator.dart';

class LoginController extends GetxController {
  StreamController _emailController = StreamController();
  StreamController _passwordController = StreamController();

  final _authService = Get.find<AuthService>();

  Stream get emailStream => _emailController.stream;

  Stream get passwordStream => _passwordController.stream;

  bool isValidValues(String email, String password) {
    bool isValid = true;
    if (!AppValidator.isValidEmail(email)) {
      isValid = false;
      _emailController.sink.add('email_invalid');
    } else {
      _emailController.sink.add('OK');
    }

    if (!AppValidator.isValidPwd(password)) {
      isValid = false;
      _passwordController.sink.add('password_invalid');
    } else {
      _passwordController.sink.add('OK');
    }
    return isValid;
  }

  Future<void> signUpWithEmailPassword(String email, String password) async {
    final resultSignUp = await _authService.signUpWithEmailPassword(email, password);
    resultSignUp.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign up with email success');
        Get.offNamedUntil(LOGIN, (route) => false);
      },
    );
  }

  Future<void> signInWithEmailPassword(String email, String password) async {
    final resultSignIn = await _authService.signInWithEmailPassword(email, password);
    resultSignIn.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign in with email success');
        Get.offNamedUntil(HOME, (route) => false);
      },
    );
  }

  Future<void> signInWithGoogle() async {
    final resultSignIn = await _authService.signInWithGoogle();
    resultSignIn.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign in with google success');
        Get.offNamedUntil(HOME, (route) => false);
      },
    );
  }

  Future<void> signInWithFacebook() async {
    final resultSignIn = await _authService.signInWithFacebook();
    resultSignIn.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign in with facebook success');
        Get.offNamedUntil(HOME, (route) => false);
      },
    );
  }

  Future<void> signInAnonymous() async {
    final resultSignIn = await _authService.signInAnonymous();
    resultSignIn.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign in with anonymous success');
        Get.offNamedUntil(HOME, (route) => false);
      },
    );
  }

  void signOut(){

  }


  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    super.dispose();
  }
}
