abstract class ILocator {
  Future<void> setup(String env);

  T find<T extends Object>();

  void registerFactory<T extends Object>(T Function() register);

  void registerLazySingelton<T extends Object>(T Function() register, {String? instanceName});

  void registerSingelton<T extends Object>(T singelton);
}
