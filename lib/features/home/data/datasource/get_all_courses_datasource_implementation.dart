import 'package:ivedigital/core/client_http/getx_client_http.dart';
import 'package:ivedigital/core/endpoints/ive_digital_endpoints.dart';
import 'package:ivedigital/features/home/data/datasource/get_all_courses_datasource.dart';
import 'package:ivedigital/features/home/data/models/default_home_response_model.dart';

class GetallCoursesDatasourceImplementation
    implements IGetAllCoursesDataSource {
  final GetxClientHttp client;

  GetallCoursesDatasourceImplementation(
    this.client,
  );

  @override
  Future<DefaultHomeResponseModel> getAllCourses() async {
    try {
      final response = await client.get(IveDigitalEndpoints.getAllCourses());
      return DefaultHomeResponseModel.fromMap(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
