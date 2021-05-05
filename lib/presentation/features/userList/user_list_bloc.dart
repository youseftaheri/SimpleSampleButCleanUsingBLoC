import 'package:bloc/bloc.dart';
import 'package:my_flutter_test_app1/data/model/userData.dart';
import 'package:my_flutter_test_app1/domain/usecases/user_list_usecase.dart';
import 'package:my_flutter_test_app1/presentation/features/userList/user_list_event.dart';
import 'package:my_flutter_test_app1/presentation/features/userList/user_list_state.dart';
import '../../../locator.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserListUseCase userListUseCase;

  UserListBloc(): userListUseCase = sl(), super(null);

  UserListState get initialState => UserListLoadingState();

  @override
  Stream<UserListState> mapEventToState(UserListEvent event) async* {
    if (event is ShowUserListEvent) {
      // if (state is UserListViewState) {
        yield UserListLoadingState();
        List<UserData> users = await _getExchangesList(event.page);
        yield AllUserListViewState(
            users: users, page: event.page);
      // } else {
      //   yield UserListLoadingState();
      //   List<UserData> users = await _getExchangesList(event.page);
      //   yield AllUserListViewState(
      //       users: users, page: event.page);
      // }
    }
  }

  Future<List<UserData>> _getExchangesList(String page) async{
    final usersData = await userListUseCase.execute(
        UserListParams(
            page: page,
        )
    );
    return usersData.users;
  }


}