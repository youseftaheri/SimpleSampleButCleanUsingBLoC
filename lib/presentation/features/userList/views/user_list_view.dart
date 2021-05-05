import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/theme.dart';
import '../../../../data/model/userData.dart';
import '../../../../utils/constants/strings.dart';
import '../user_list_bloc.dart';
import '../user_list_state.dart';
import 'package:my_flutter_test_app1/presentation/widgets/extensions/user_view.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key key}) : super(key: key);

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView>  with TickerProviderStateMixin {

  final _listItems = <Widget>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadItems(List<Widget> users) {
    // fetching data from web api, db...
    final fetchedList = users;
    var future = Future(() {});
    for (var i = 0; i < fetchedList.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 100), () {
//          Future.delayed(Duration(milliseconds: 1500));
          _listItems.add(fetchedList[i]);
          _listKey.currentState.insertItem(_listItems.length - 1, duration: Duration(milliseconds: 300));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    MaskFilter _blur;
    final List<MaskFilter> _blurs = [
      MaskFilter.blur(BlurStyle.solid, 16.0),
    ];
    _blur = _blurs[0];

    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 4;
    var _theme = Theme.of(context);
    return BlocListener<UserListBloc, UserListState>(
        listener: (context, state) {
          if (state is UserListErrorState) {
            return Container(
                padding: EdgeInsets.all(AppSizes.sidePadding),
                child: Text(Strings.an_error_occurred,
                    style: _theme.textTheme.headline4
                        .copyWith(color: _theme.errorColor)));
          }
          return Container();
        }, child:
    BlocBuilder<UserListBloc, UserListState>(builder: (context, state) {
      if (state is AllUserListViewState) {
        if (_listItems.isEmpty) {
          _loadItems(buildUserList(state.users));
        }
        return Stack(children: <Widget>[
          state.users == null
              ?
          Align(
              alignment: Alignment.center,
              child:
              Padding(
                  padding: EdgeInsets.only(top: 100),
                  child:
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text(
                          Strings.empty_user, textAlign: TextAlign.center,
                          style: Theme
                              .of(context)
                              .textTheme
                              .caption
                              .copyWith(color: AppColors.colorPrimary, fontSize: 18),
                        ),
                      ),
              )
          )
              :
          state.users.isEmpty
              ?
          Align(
              alignment: Alignment.center,
              child:
              Padding(
                  padding: EdgeInsets.only(top: 100),
                  child:
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text(
                          Strings.empty_user, textAlign: TextAlign.center,
                          style: Theme
                              .of(context)
                              .textTheme
                              .caption
                              .copyWith(color: AppColors.red, fontSize: 18),
                        ),
                      ),
              )
          )
              :
          AnimatedList(
            key: _listKey,
            padding: EdgeInsets.only(top: 60, bottom: 30),
            initialItemCount: _listItems.length,
            itemBuilder: (context, index, animation) {
              return
                SlideTransition(
                  position: CurvedAnimation(
                    curve: Curves.easeIn,
                    parent: animation,
                  ).drive((Tween<Offset>(
                    begin: Offset(-1, 1),
                    end: Offset(0, 0),
                  ))),
                  child: _listItems[index],
                );
            },
          ),
          Stack(children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                  Strings.userListTitle
                    , textAlign: TextAlign.center, style: TextStyle(fontSize: 19,
                        fontFamily: 'Iransans', fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          ],
          ),
        ],
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    }));
  }
  List<Widget> buildUserList(List<UserData> users) {
    var elements = <Widget>[];
    if ( users != null ) {
      for (var i = 0; i < users.length; i++) {
        elements.add(
          Material(
            color: AppColors.transparent,
            child:
            users[i].getListView(context: context)
          ));
      }
      }
    return elements;
  }
}