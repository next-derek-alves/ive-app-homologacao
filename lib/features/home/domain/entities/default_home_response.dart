import 'package:equatable/equatable.dart';

import 'package:ivedigital/features/home/domain/entities/course_entity.dart';

class IDefaultHomeResponse extends Equatable {
  final bool error;
  final String? message;
  final String? developerMessage;
  final String? exception;
  final List<ICourseEntity> data;

  IDefaultHomeResponse(
    this.error,
    this.message,
    this.developerMessage,
    this.exception,
    this.data,
  );

  @override
  List<Object?> get props =>
      [error, message, developerMessage, exception, data];
}
