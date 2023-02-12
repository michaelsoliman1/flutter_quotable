import 'package:app_data/src/locator/locator_setup.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'setup',
  preferRelativeImports: false,
)
Future<void> setupLocator() async => locator.setup();
