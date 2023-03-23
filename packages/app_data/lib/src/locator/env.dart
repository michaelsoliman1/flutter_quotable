import 'package:app_data/src/locator/constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class EnvModule {
  @Named(baseUrlInstanceName)
  String get url => 'https://quotable.io/';
}
