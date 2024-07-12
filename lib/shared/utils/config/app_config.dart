import 'package:injectable/injectable.dart';

abstract class IConfig {
  String get baseUrl;
}

@Singleton(as: IConfig)
class AppConfig extends IConfig {
  @override
  String get baseUrl => "http://localhost:3000";
}
