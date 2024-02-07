part of 'auth_bloc.dart';

abstract class AuthEvent {}
class AuthInitial extends AuthEvent {}
class AuthLoginEvent extends AuthEvent {}

// class for change textfiled password
class ChangePasswordEvent extends AuthEvent {}

class ChangeCheckedEvent extends AuthEvent {}