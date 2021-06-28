import 'package:ivedigital/features/login/data/models/login_response_model.dart';
import 'package:ivedigital/features/login/domain/entities/default_login_response.dart';

class DefaultLoginResponseModel extends IDefaultLoginResponse {
  DefaultLoginResponseModel({
    required bool error,
    String? message,
    String? developerMessage,
    String? exception,
    LoginResponseModel? data,
  }) : super(
          error,
          message,
          developerMessage,
          exception,
          data,
        );

  Map<String, dynamic> toMap() {
    return {
      'error': error,
      'message': message,
      'developerMessage': developerMessage,
      'exception': exception,
      'data': data?.toMap(),
    };
  }

  factory DefaultLoginResponseModel.fromMap(Map<String, dynamic> map) {
    return DefaultLoginResponseModel(
      error: map['error'],
      message: map['message'],
      developerMessage: map['developerMessage'],
      exception: map['exception'],
      data: LoginResponseModel?.fromMap(map['data']),
    );
  }
}
