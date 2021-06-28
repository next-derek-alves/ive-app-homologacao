import 'package:ivedigital/features/login/domain/entities/default_login_response.dart';

abstract class ILoginRepository {
  Future<IDefaultLoginResponse> login(Map<String, dynamic> data);
}
