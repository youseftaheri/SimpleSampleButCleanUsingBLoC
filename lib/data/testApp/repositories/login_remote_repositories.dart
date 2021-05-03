import 'package:flutter/material.dart';
import 'package:my_flutter_test_app1/data/error/exceptions.dart';
import 'package:my_flutter_test_app1/data/model/loginData.dart';
import 'package:my_flutter_test_app1/data/network/network_request.dart';
import 'package:my_flutter_test_app1/data/repositories/abstract/login_repository.dart';
import 'package:my_flutter_test_app1/data/testApp/models/login_model.dart';

class RemoteLoginRepository extends LoginRepository {
  final NetworkRequestAbstract testApp;
  RemoteLoginRepository({@required this.testApp});

  @override
  Future<LoginData> getLoginResult({String email, String password}) async {
    try {
      dynamic loginData = await testApp.getLoginResult(
          email: email,
          password: password);
      LoginData login = LoginData.fromEntity(LoginDataModel.fromJson(loginData));
      return login;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}
