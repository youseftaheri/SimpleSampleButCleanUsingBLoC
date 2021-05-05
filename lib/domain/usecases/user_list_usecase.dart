import 'package:my_flutter_test_app1/data/model/userData.dart';
import 'package:my_flutter_test_app1/data/repositories/abstract/user_list_repository.dart';
import '../../locator.dart';
import 'base_use_case.dart';

abstract class UserListUseCase
    implements BaseUseCase<UserListResult, UserListParams> {}

class UserListUseCaseImpl implements UserListUseCase {
  @override
  Future<UserListResult> execute(UserListParams params) async {
    try {
      UserListRepository _userListRepository = sl();
      List<UserData> users = await _userListRepository.getUserListResult(
          page: params.page,
      );
      return UserListResult(
          users,
          users.length
      );

    } catch (e) {
      return UserListResult(
          null,
          0,
          exception: EmptyUserListException()
      );
    }
  }
}

class UserListResult {
  final List<UserData> users;
  final int quantity;
  final Exception exception;

  UserListResult(
      this.users,
      this.quantity,{
        this.exception
      }
      );

  bool get validResults => exception == null;
}

class UserListParams {
  final String page;

  UserListParams({
    this.page,
  });
}

class EmptyUserListException implements Exception {}