part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {}

// class for change textfiled password
class ChangePasswordEvent extends AuthEvent {}
