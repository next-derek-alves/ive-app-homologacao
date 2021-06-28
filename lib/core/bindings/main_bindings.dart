import 'package:get/get.dart';
import 'package:ivedigital/core/client_http/getx_client_http.dart';
import 'package:ivedigital/core/services/authentication/authentication_controller.dart';
import 'package:ivedigital/features/login/data/datasource/login_datasource_implementation.dart';
import 'package:ivedigital/features/login/data/repositories/login_repository_implementation.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GetxClientHttp());
    Get.put(LoginDatasourceImplementation(Get.find()));
    Get.put(LoginRepositoryImplementation(Get.find()));
    Get.put(AuthenticationController(Get.find()));
  }
}
