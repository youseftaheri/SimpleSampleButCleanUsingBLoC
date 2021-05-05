
import 'package:equatable/equatable.dart';
import 'package:my_flutter_test_app1/data/error/exceptions.dart';
import 'package:my_flutter_test_app1/data/model/userData.dart';
import 'package:my_flutter_test_app1/domain/entities/entity.dart';
import 'package:my_flutter_test_app1/domain/entities/user_list_data_entity.dart';

class UserListData extends Equatable {
  final String page;
  final String per_page;
  final String total;
  final String total_pages;
  final List<UserData> userListData;

  UserListData(
      {
        this.page,
        this.per_page,
        this.total,
        this.total_pages,
        this.userListData,
      });

  @override
  Object get prop => {page, per_page, total, total_pages, userListData};

  @override
  bool get stringify => true;

  @override
  factory UserListData.fromEntity(Entity entity) {
    if ( entity is UserListDataEntity ) {
      return UserListData(
        page: entity.page,
        per_page: entity.per_page,
        total: entity.total,
        total_pages: entity.total_pages,
        userListData: entity.userListData,
      );
    } else {
      throw EntityModelMapperException(message: 'Entity should be of type UserListDataEntity');
    }
  }

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
