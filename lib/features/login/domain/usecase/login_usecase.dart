import 'package:ivedigital/core/usecase/usecase.dart';
import 'package:ivedigital/features/login/domain/entities/default_login_response.dart';

import 'package:ivedigital/features/login/domain/repositories/login_repository.dart';

class LoginUsecase
    implements Usecase<IDefaultLoginResponse, Map<String, String>> {
  final ILoginRepository _repository;

  LoginUsecase(this._repository);

  @override
  Future<IDefaultLoginResponse> call(data) async {
    return await _repository.login(data);
  }
}
