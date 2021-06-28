import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ivedigital/core/app_routes.dart';
import 'package:ivedigital/core/services/authentication/authentication_controller.dart';

class AuthRoutesMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthenticationController>();
    if (GetStorage().read("token") != null &&
        authService.tokenExpired(GetStorage().read("token"))) {
      GetStorage().remove("token");
      print("expired");
      return RouteSettings(name: AppRoutes.LOGIN);
    } else {
      return null;
    }
  }
}
