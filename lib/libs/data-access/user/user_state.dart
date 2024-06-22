part of 'user_bloc.dart';

class UserState {
  UserModel? user;
  String? error;
  bool isLoading = false;

  UserState({this.user, this.error, this.isLoading = false});
}
