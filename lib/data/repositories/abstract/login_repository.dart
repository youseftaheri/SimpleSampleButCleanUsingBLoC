import 'package:my_flutter_test_app1/data/model/loginData.dart';

abstract class LoginRepository {
  Future<LoginData> getLoginResult({
    String email,
    String password,
  });
}
