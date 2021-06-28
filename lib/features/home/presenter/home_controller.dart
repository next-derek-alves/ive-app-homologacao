import 'package:get/get.dart';
import 'package:ivedigital/features/home/data/repositories/get_all_courses_repository_implementation.dart';

class HomeController extends GetxController with StateMixin {
  final GetAllCoursesRepositoryImplementation repository;

  HomeController(this.repository);

  @override
  void onInit() {
    getAllCourses();
    super.onInit();
  }

  void getAllCourses() async {
    change([], status: RxStatus.loading());
    try {
      final courses = await repository.getAllCourses();
      change(courses.data, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error("Erro ao buscar os cursos"));
    }
  }
}
