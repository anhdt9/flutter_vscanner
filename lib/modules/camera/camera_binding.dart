import 'package:get/get.dart';
import 'package:vscanner/modules/camera/camera_controller.dart';

class CameraBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CameraController>(() => CameraController());
  }

}