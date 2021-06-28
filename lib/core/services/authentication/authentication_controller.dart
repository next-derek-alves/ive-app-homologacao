import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ivedigital/core/app_routes.dart';
import 'package:ivedigital/core/services/authentication/authentication_state.dart';
import 'package:ivedigital/features/login/data/repositories/login_repository_implementation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'model/token.dart';

class AuthenticationController extends GetxController {
  final LoginRepositoryImplementation _loginService;
  final _authenticationStateStream = AuthenticationState().obs;
  final RxBool isTokenExpired = false.obs;
  final GetStorage tokenContainer = GetStorage();
  final routes = [].obs;
  final RxString initialRoute = AppRoutes.LANDING_PAGE.obs;

  AuthenticationState get state => _authenticationStateStream.value;
  AuthenticationController(this._loginService);

  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<dynamic> signIn(Map<String, dynamic> credentials) async {
    final response = await _loginService.login(credentials);
    if (response.error) {
      return response;
    } else {
      _authenticationStateStream.value =
          Authenticated(token: Token(token: response.data?.token));
      tokenContainer.write("token", response.data?.token);
      return response;
    }
  }

  bool get token => isTokenExpired.value;

  bool tokenExpired(token) =>
      isTokenExpired.value = JwtDecoder.isExpired(token);

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationState();
  }
}
