import 'package:get/get.dart';
import 'package:ivedigital/core/app_routes.dart';
import 'package:ivedigital/core/services/authentication/authentication_controller.dart';
import 'package:ivedigital/core/services/authentication/authentication_state.dart';
import 'package:ivedigital/features/login/presenter/login_state.dart';

class LoginPageController extends GetxController {
  final AuthenticationController _authController = Get.find();
  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  Future<void> login(Map<String, dynamic> data) async {
    _loginStateStream.value = LoginLoading();
    try {
      final response = await _authController.signIn(data);
      if (response != null && response.error == true) {
        _loginStateStream.value = LoginFailure(error: response.message);
      } else {
        _loginStateStream.value = LoginState();
        return Get.offAllNamed(AppRoutes.HOME);
      }
    } on AuthenticationFailure catch (e) {
      _loginStateStream.value = LoginFailure(error: e.message);
    }
  }
}
