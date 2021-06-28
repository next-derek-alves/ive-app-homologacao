import 'package:ivedigital/features/login/data/datasource/login_datasource_implementation.dart';
import 'package:ivedigital/features/login/data/models/default_login_response_model.dart';
import 'package:ivedigital/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImplementation implements ILoginRepository {
  final LoginDatasourceImplementation datasource;

  LoginRepositoryImplementation(this.datasource);

  @override
  Future<DefaultLoginResponseModel> login(Map<String, dynamic> data) async {
    try {
      final response = await datasource.login(data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
