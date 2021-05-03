import 'package:my_flutter_test_app1/data/error/exceptions.dart';
import 'package:my_flutter_test_app1/data/model/loginData.dart';
import 'package:my_flutter_test_app1/data/network/network_status.dart';
import 'package:my_flutter_test_app1/data/testApp/repositories/login_remote_repositories.dart';

import '../../locator.dart';
import 'abstract/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {

  @override
  Future<LoginData> getLoginResult({
    String email,
    String password,
  }) async {
    try
    {
      NetworkStatus networkStatus = sl();
      LoginRepository loginRepository;
      if ( networkStatus.isConnected != null ) {
        loginRepository = RemoteLoginRepository(testApp: sl());
      } else {
        loginRepository = null;
      }

      return await loginRepository.getLoginResult(
        email: email,
        password: password,
      );
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}
