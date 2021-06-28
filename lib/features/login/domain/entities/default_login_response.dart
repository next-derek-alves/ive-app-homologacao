import 'package:equatable/equatable.dart';
import 'package:ivedigital/features/login/domain/entities/login_response.dart';

abstract class IDefaultLoginResponse extends Equatable {
  final bool error;
  final String? message;
  final String? developerMessage;
  final String? exception;
  final ILoginResponse? data;

  IDefaultLoginResponse(
    this.error,
    this.message,
    this.developerMessage,
    this.exception,
    this.data,
  );

  @override
  List<Object?> get props => [
        error,
        message,
        developerMessage,
        exception,
        data,
      ];
}
