import 'package:injectable/injectable.dart';

/// Instance name for base url
const baseUrlInstanceName = 'baseUrl';

@module
abstract class EnvModule {
  @Named(baseUrlInstanceName)
  String get url => 'https://quotable.io/';
}
