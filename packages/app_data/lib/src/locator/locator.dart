import 'package:app_core/app_core.dart';
import 'package:app_data/src/locator/locator_setup.dart';

final locator = Locator();

class Locator implements ILocator {
  @override
  Future<void> setup() => setupLocator();

  @override
  T find<T extends Object>() => getItLocator<T>();

  T call<T extends Object>() => find<T>();

  @override
  void registerFactory<T extends Object>(T Function() register, {String? instanceName}) =>
      getItLocator.registerFactory<T>(register, instanceName: instanceName);

  @override
  void registerLazySingelton<T extends Object>(T Function() register, {String? instanceName}) =>
      getItLocator.registerLazySingleton<T>(
        register,
        instanceName: instanceName,
      );

  @override
  void registerSingelton<T extends Object>(T singelton, {String? instanceName}) =>
      getItLocator.registerSingleton<T>(singelton, instanceName: instanceName);
}
