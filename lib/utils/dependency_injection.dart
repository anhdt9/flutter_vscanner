import 'package:get/get.dart';
import 'package:vscanner/services/auth_service.dart';

class DependencyInjection {

  static void init(){
    Get.put(AuthService());
  }

}