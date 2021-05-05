import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_test_app1/presentation/features/userList/user_list_bloc.dart';
import 'package:my_flutter_test_app1/presentation/features/userList/user_list_event.dart';
import 'package:my_flutter_test_app1/presentation/features/userList/user_list_state.dart';

import '../../widgets/independent/loading_view.dart';
import '../wrapper.dart';
import 'views/user_list_view.dart';

class UserListScreen extends StatefulWidget {
  final UserListParameters parameters;

  const UserListScreen({Key key, this.parameters}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class UserListParameters {
  final String page;

  const UserListParameters(this.page);
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    print('widget parameters at user list screen ${widget.parameters}');
    return SafeArea(
        child: BlocProvider<UserListBloc>(
            create: (context) {
              return UserListBloc()
                ..add(widget.parameters == null
                    ?
                ShowUserListEvent('1')
                    :
                ShowUserListEvent(widget.parameters.page));
            },
            child:
            UserListWrapper()
        ));
  }
}

class UserListWrapper extends StatefulWidget {
  @override
  _UserListWrapperState createState() => _UserListWrapperState();
}

class _UserListWrapperState extends MyWrapperState<UserListWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserListBloc, UserListState>(
        child: getPageView(<Widget>[
          LoadingView(),
          buildListScreen(context),
        ]),
        listener: (BuildContext context, UserListState state) {
          final index = state is UserListLoadingState ? 0 : 1;
          changePage(changeType: ViewChangeType.Exact, index: index);
        });
  }

  Widget buildListScreen(BuildContext context) {
    return UserListView();
  }
}
