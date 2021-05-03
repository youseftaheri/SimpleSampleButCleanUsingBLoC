import 'package:flutter/cupertino.dart';
import 'package:my_flutter_test_app1/domain/entities/LoginDataEntity.dart';

class LoginDataModel extends LoginDataEntity {

  LoginDataModel(
      {
        @required token,
        @required error,
      }) : super(
      token: token,
      error: error
  );

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      token: json['token'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'error': error
    };
  }
}
