import 'package:ivedigital/features/home/data/datasource/get_all_courses_datasource_implementation.dart';
import 'package:ivedigital/features/home/domain/entities/default_home_response.dart';
import 'package:ivedigital/features/home/domain/repositories/get_all_courses_repository.dart';

class GetAllCoursesRepositoryImplementation
    implements IGetAllCoursesRepository {
  final GetallCoursesDatasourceImplementation datasourse;

  GetAllCoursesRepositoryImplementation(this.datasourse);

  @override
  Future<IDefaultHomeResponse> getAllCourses() async {
    try {
      final response = await datasourse.getAllCourses();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
