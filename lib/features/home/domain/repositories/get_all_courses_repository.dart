import 'package:ivedigital/features/home/domain/entities/default_home_response.dart';

abstract class IGetAllCoursesRepository {
  Future<IDefaultHomeResponse> getAllCourses();
}
