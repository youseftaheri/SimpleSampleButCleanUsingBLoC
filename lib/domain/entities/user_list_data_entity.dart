import 'package:my_flutter_test_app1/data/model/userData.dart';
import 'entity.dart';

class UserListDataEntity extends Entity {
  final String page;
  final String per_page;
  final String total;
  final String total_pages;
  final List<UserData> userListData;

  UserListDataEntity(
    {
      this.page,
      this.per_page,
      this.total,
      this.total_pages,
      this.userListData,
    });

  @override
  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'per_page': per_page,
      'total': total,
      'total_pages': total_pages,
      'userListData': userListData,
    };
  }

  @override
  List<Object> get props => [
    page,
    per_page,
    total,
    total_pages,
    userListData,
  ];
}
