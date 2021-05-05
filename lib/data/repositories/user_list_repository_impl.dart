import 'package:my_flutter_test_app1/data/error/exceptions.dart';
import 'package:my_flutter_test_app1/data/model/userData.dart';
import 'package:my_flutter_test_app1/data/network/network_status.dart';
import 'package:my_flutter_test_app1/data/testApp/repositories/user_list_remote_repository.dart';

import '../../locator.dart';
import 'abstract/user_list_repository.dart';


class UserListRepositoryImpl extends UserListRepository {

  @override
  Future<List<UserData>> getUserListResult({String page}) async {
    try
    {
      NetworkStatus networkStatus = sl();
      UserListRepository userListRepository;
      if ( networkStatus.isConnected != null ) {
        userListRepository = RemoteUserListRepository(testApp: sl());
      } else {
        userListRepository = null;//LocalUserListRepository();
      }


      return await userListRepository.getUserListResult(page: page);
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}
