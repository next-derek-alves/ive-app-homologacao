import 'package:ivedigital/core/client_http/getx_client_http.dart';
import 'package:ivedigital/core/endpoints/ive_digital_endpoints.dart';
import 'package:ivedigital/features/login/data/datasource/login_datasource.dart';
import 'package:ivedigital/features/login/data/models/default_login_response_model.dart';

class LoginDatasourceImplementation implements ILoginDatasource {
  final GetxClientHttp client;

  LoginDatasourceImplementation(this.client);
  @override
  Future<DefaultLoginResponseModel> login(
      Map<String, dynamic> credentials) async {
    try {
      final response =
          await client.post(IveDigitalEndpoints.login(), credentials);

      final dynamic data = response.body;

      DefaultLoginResponseModel value = DefaultLoginResponseModel.fromMap(data);
      return value;
    } catch (e) {
      rethrow;
    }
  }
}
