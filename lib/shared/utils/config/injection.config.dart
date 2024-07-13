// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../libs/data-access/user/state/user_bloc.dart' as _i7;
import '../../../libs/data-access/user/user_repository.dart' as _i5;
import '../../../libs/data-access/users/state/users_bloc.dart' as _i8;
import '../../../libs/data-access/users/users_provider.dart' as _i9;
import '../../../libs/data-access/users/users_repository.dart' as _i6;
import '../../data-access/rest/rest_service.dart' as _i4;
import 'app_config.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.IConfig>(() => _i3.AppConfig());
    gh.singleton<_i4.HttpService>(() => _i4.HttpService(gh<_i3.IConfig>()));
    gh.singleton<_i5.UserRepository>(
        () => _i5.UserRepository(gh<_i4.HttpService>()));
    gh.singleton<_i6.UsersRepository>(
        () => _i6.UsersRepository(gh<_i4.HttpService>()));
    gh.factory<_i7.UserBloc>(() => _i7.UserBloc(gh<_i5.UserRepository>()));
    gh.factory<_i8.UsersBloc>(() => _i8.UsersBloc(gh<_i6.UsersRepository>()));
    gh.singleton<_i9.UsersFacadeWithBloc>(
        () => _i9.UsersFacadeWithBloc(gh<_i8.UsersBloc>()));
    return this;
  }
}
