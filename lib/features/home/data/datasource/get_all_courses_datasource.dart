import 'package:ivedigital/features/home/data/models/default_home_response_model.dart';

abstract class IGetAllCoursesDataSource {
  Future<DefaultHomeResponseModel> getAllCourses();
}
