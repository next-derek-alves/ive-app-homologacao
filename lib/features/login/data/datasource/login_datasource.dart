import 'package:ivedigital/features/login/data/models/default_login_response_model.dart';

abstract class ILoginDatasource {
  Future<DefaultLoginResponseModel> login(Map<String, String> data);
}
