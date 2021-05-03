import 'package:equatable/equatable.dart';
import 'package:my_flutter_test_app1/data/error/exceptions.dart';
import 'package:my_flutter_test_app1/domain/entities/LoginDataEntity.dart';
import 'package:my_flutter_test_app1/domain/entities/entity.dart';

class LoginData extends Equatable {
  final String token;
  final String error;

  LoginData(
      {
        this.token,
        this.error,
      });

  LoginData.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        error = json['error'];

  Map<String, dynamic> toJson() =>
      {
        'token': token,
        'error': error,
      };

  @override
  List<Object> get props => [token, error];

  @override
  bool get stringify => true;

  @override
  factory LoginData.fromEntity(Entity entity) {
    if ( entity is LoginDataEntity ) {
      return LoginData(
        token: entity.token,
        error: entity.error,
      );
    } else {
      throw EntityModelMapperException(message: 'Entity should be of type LoginDataEntity');
    }
  }
}
