import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/routes/routes.dart';
import 'package:vscanner/services/auth_service.dart';
import 'package:vscanner/utils/utils.dart';

class LoginController extends GetxController {
  StreamController _emailController = StreamController();
  StreamController _passwordController = StreamController();


  TextEditingController emailEditCtrl = TextEditingController();
  TextEditingController pwdEditCtrl = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode pwdFocus = FocusNode();

  var emailError = 'email error'.obs;
  var pwdError = 'Password error'.obs;
  var showPwd = false.obs;

  final _authService = Get.find<AuthService>();

  Stream get emailStream => _emailController.stream;

  Stream get passwordStream => _passwordController.stream;

  bool isValidValues(String email, String password) {
    bool isValid = true;
    if (!GetUtils.isEmail(email)) {
      isValid = false;
      _emailController.sink.add('email_invalid');
    } else {
      _emailController.sink.add('OK');
    }

    if (GetUtils.isNullOrBlank(password)) {
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

  Future<void> signInWithEmailPassword() async {
    final resultSignIn = await _authService.signInWithEmailPassword(emailEditCtrl.text, pwdEditCtrl.text);
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
    _authService.signOut();
  }


  @override
  void onInit() {

  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    emailEditCtrl.dispose();
    pwdEditCtrl.dispose();
    emailFocus.dispose();
    pwdFocus.dispose();
    super.dispose();
  }

  void checkEmailFocus(BuildContext context) {
    _fieldFocusChange(context, emailFocus, pwdFocus);
  }

  void checkPwdFocus(BuildContext context) {
    _fieldFocusChange(context, pwdFocus, null);
  }

  void _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    if (nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    } else {
      currentFocus.unfocus();
    }
  }
}
