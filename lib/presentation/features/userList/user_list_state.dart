import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_test_app1/data/model/userData.dart';

@immutable
abstract class UserListState extends Equatable {
  final String page;

  UserListState({this.page});

  @override
  List<Object> get props => [page];
}

@immutable
class UserListLoadingState extends UserListState {
  @override
  String toString() => 'UserListInitialState';
}

@immutable
abstract class UserListViewState extends UserListState {
  final List<UserData> users;

  UserListViewState({String page, this.users})
      : super(page: page);

  @override
  List<Object> get props => [users, page];
}

@immutable
class AllUserListViewState extends UserListViewState {
  AllUserListViewState({String page, List<UserData> users})
      : super(page: page, users: users);

  @override
  String toString() => 'UserListViewState';
}

@immutable
class UserListErrorState extends UserListState {
  @override
  String toString() => 'UserListErrorState';
}