import 'package:my_flutter_test_app1/data/model/loginData.dart';
import 'package:my_flutter_test_app1/data/repositories/abstract/login_repository.dart';

import '../../locator.dart';
import 'base_use_case.dart';

abstract class LoginUseCase
    implements BaseUseCase<LoginResult, LoginParams> {}


class LoginUseCaseImpl implements LoginUseCase {
  @override
  Future<LoginResult> execute(LoginParams params) async {
    try {
      LoginRepository _loginRepository = sl();
      LoginData login = await _loginRepository.getLoginResult(
        email: params.email,
        password: params.password,
      );
      return LoginResult(
          login);

    } catch (e) {
      return LoginResult(
          null,
          exception: EmptyLoginException()
      );
    }
  }
}

class LoginResult {
  final LoginData login;
  final Exception exception;

  LoginResult(
      this.login,{
        this.exception
      }
      );

  bool get validResults => exception == null;
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    this.email,
    this.password,

  });}

class EmptyLoginException implements Exception {}