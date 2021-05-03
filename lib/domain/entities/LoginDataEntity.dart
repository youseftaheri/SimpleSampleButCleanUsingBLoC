import 'entity.dart';

class LoginDataEntity extends Entity {
  final String token;
  final String error;

  LoginDataEntity(
      {
        this.token,
        this.error,
      });

  @override
  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'error': error,
    };
  }

  @override
  List<Object> get props => [
    token,
    error,
  ];
}
