import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserListEvent extends Equatable {
  final String page;
  UserListEvent(this.page) : super();

  @override
  List<Object> get props => [page];
}

@immutable
class ShowUserListEvent extends UserListEvent {
  ShowUserListEvent(String page) : super(page);
}