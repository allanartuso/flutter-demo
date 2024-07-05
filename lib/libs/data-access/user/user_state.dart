part of 'user_bloc.dart';

@immutable
final class UserState extends Equatable {
  const UserState({this.user, this.error, this.isLoading = false});

  final UserModel? user;
  final String? error;
  final bool isLoading;

  @override
  List<Object?> get props => [user, error, isLoading];

  UserState copyWith({
    UserModel? user,
    String? error,
    bool? isLoading,
  }) {
    return UserState(
      user: user ?? this.user,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
