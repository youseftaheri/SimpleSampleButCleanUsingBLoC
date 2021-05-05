import 'package:my_flutter_test_app1/data/model/userData.dart';

abstract class UserListRepository {
  Future<List<UserData>> getUserListResult({
    String page,
  });
}
