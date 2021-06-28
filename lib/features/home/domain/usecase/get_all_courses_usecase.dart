import 'package:ivedigital/core/usecase/usecase.dart';
import 'package:ivedigital/features/home/domain/entities/default_home_response.dart';
import 'package:ivedigital/features/home/domain/repositories/get_all_courses_repository.dart';

class GetAllCoursesUsecase implements Usecase<IDefaultHomeResponse, void> {
  final IGetAllCoursesRepository _repository;

  GetAllCoursesUsecase(this._repository);

  @override
  Future<IDefaultHomeResponse> call(void params) async {
    return await _repository.getAllCourses();
  }
}
