import 'package:ivedigital/features/home/data/models/course_model.dart';
import 'package:ivedigital/features/home/domain/entities/default_home_response.dart';

class DefaultHomeResponseModel extends IDefaultHomeResponse {
  DefaultHomeResponseModel(
    bool error,
    String? message,
    String? developerMessage,
    String? exception,
    List<CourseModel> data,
  ) : super(
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
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory DefaultHomeResponseModel.fromMap(Map<String, dynamic> map) {
    return DefaultHomeResponseModel(
      map['error'],
      map['message'],
      map['developerMessage'],
      map['exception'],
      List<CourseModel>.from(map['data']?.map((x) => CourseModel.fromMap(x))),
    );
  }
}
