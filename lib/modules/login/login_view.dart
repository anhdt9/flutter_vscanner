import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/login/login_controller.dart';
import 'package:vscanner/modules/widgets/scan_logo.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScanLogo(),
              RaisedButton(
                child: Text('Switch to English'),
                onPressed: () {
                  print('switching to EN');
                  Get.updateLocale(Locale('vi', 'VN'));
                },
              )
            ],
          ),
        ),
      ),
    );
  }


}
