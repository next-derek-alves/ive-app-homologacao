import 'package:ivedigital/features/login/domain/entities/login_response.dart';

class LoginResponseModel extends ILoginResponse {
  LoginResponseModel({
    String? token,
    String? type,
    int? expires,
  }) : super(
          token,
          type,
          expires,
        );

  factory LoginResponseModel.fromMap(Map<String, dynamic>? map) {
    return LoginResponseModel(
      token: map == null ? "" : map['access_token'],
      type: map == null ? "" : map['token_type'],
      expires: map == null ? 0 : map['expires_in'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'type': type,
      'expires': expires,
    };
  }
}
