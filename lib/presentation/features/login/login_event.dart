import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class LoginLoadEvent extends LoginEvent {
  @override
  String toString() => 'Login is Loaded';
}

class LoginPressed extends LoginEvent {
  final String email;
  final String password;

  LoginPressed({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}