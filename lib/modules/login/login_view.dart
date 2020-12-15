import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/login/login_controller.dart';
import 'package:vscanner/modules/widgets/app_button.dart';
import 'package:vscanner/modules/widgets/scan_logo.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScanLogo(),
              Obx(() => TextFormField(
                    controller: controller.emailEditCtrl,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: controller.emailFocus,
                    onFieldSubmitted: (_) =>
                        controller.checkEmailFocus(context),
                    decoration: InputDecoration(
                        errorText: controller.emailError.value,
                        labelText: 'Email',
                        hintText: 'enter_email'.tr,
                        border: buildOutlineInputBorder()),
                  )),
              SizedBox(height: 20),
              Obx(() => TextFormField(
                    obscureText: controller.showPwd.value,
                    controller: controller.pwdEditCtrl,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: controller.pwdFocus,
                    onFieldSubmitted: (_) => controller.checkPwdFocus(context),
                    decoration: InputDecoration(
//                        icon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            icon: Icon(controller.showPwd.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              controller.showPwd.value =
                                  !controller.showPwd.value;
                            }),
                        errorText: controller.pwdError.value,
                        labelText: 'password'.tr,
                        hintText: 'enter_password'.tr,
                        border: buildOutlineInputBorder()),
                  )),
              AppButton(
                text: 'login'.tr,
                color: Colors.cyan,
                onPress: () async => controller.signInWithEmailPassword(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: "NEW USER?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: " SIGN UP",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("SIGN UP click!");
                              },
                          )
                        ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("FORGOT PASSWORD click!");
                    },
                    child: Text(
                      "FORGOT PASSWORD?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  "----- Or connecting with -----",
                  style: TextStyle(color: Colors.black38, fontSize: 12),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: controller.signInWithFacebook,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/facebook.png"),
                      radius: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap:controller.signInWithGoogle,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/google.png"),
                      radius: 25,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withAlpha(50), width: 0),
        borderRadius: const BorderRadius.all(
          Radius.circular(19),
        ));
  }
}
