import 'package:flutter/material.dart';
import 'package:my_flutter_test_app1/data/error/exceptions.dart';
import 'package:my_flutter_test_app1/data/model/userData.dart';
import 'package:my_flutter_test_app1/data/model/userListData.dart';
import 'package:my_flutter_test_app1/data/network/network_request.dart';
import 'package:my_flutter_test_app1/data/repositories/abstract/user_list_repository.dart';
import 'package:my_flutter_test_app1/data/testApp/models/user_list_model.dart';

class RemoteUserListRepository extends UserListRepository {

  final NetworkRequestAbstract testApp;

  RemoteUserListRepository({@required this.testApp});

  @override
  Future<List<UserData>> getUserListResult({String page}) async {
    try
    {
      dynamic userListData = await testApp.getUsersResult(page: page);
      List<UserData> userList = UserListData.fromEntity(UserListModel.fromJson(userListData)).userListData;
      return userList;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}
