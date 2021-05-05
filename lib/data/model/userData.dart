import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  UserData(
      {
        this.id,
        this.email,
        this.first_name,
        this.last_name,
        this.avatar,
      });

  @override
  List<Object> get props => [id, email, first_name, last_name, avatar];

}