import 'package:flutter/material.dart';
import 'package:vscanner/modules/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/widgets/scan_logo.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScanLogo(),
    );
  }
}
