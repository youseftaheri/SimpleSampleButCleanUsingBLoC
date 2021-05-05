import 'package:my_flutter_test_app1/data/model/userData.dart';
import 'package:my_flutter_test_app1/domain/entities/user_list_data_entity.dart';

class UserListModel extends UserListDataEntity {

  UserListModel(
      {page,
        per_page,
        total,
        total_pages,
        userListData,
      }) : super(
    page: page,
    per_page: per_page,
    total: total,
    total_pages: total_pages,
    userListData: userListData,
  );

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    return UserListModel(
      page: json['page'].toString(),
      per_page: json['per_page'].toString(),
      total: json['total'].toString(),
      total_pages: json['total_pages'].toString(),
      userListData: _getUserListFromJson(json),
    );
  }

  static List<UserData> _getUserListFromJson(Map<String, dynamic> json){
    List<UserData> userList = [];
    int count = json['data'].length;
    try {
        for (int i = 0; i < count; i++) {
          userList.add(
              UserData(
                id: json['data'][i]['id'].toString() ?? '',
                email: json['data'][i]['email'].toString() ?? '',
                first_name: json['data'][i]['first_name'].toString() ?? '',
                last_name: json['data'][i]['last_name'].toString() ?? '',
                avatar: json['data'][i]['avatar'].toString() ?? '',
              )
          );
      }
    }catch(e){
      print("$e");
    }
    return userList;
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': per_page,
      'total': total,
      'total_pages': total_pages,
      'userListData': userListData,
    };
  }
  static String stripTags(String htmlText) {
    RegExp exp = RegExp(
        r'<[^>]*>',
        multiLine: true,
        caseSensitive: true
    );
    return htmlText.replaceAll(exp, '');
  }
}
