import 'package:flutter_core/core/domain/usecase/core_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dataSource/security_data_source.dart';
import '../data/dataSource/shared_pref_manager.dart';

final getIt = GetIt.instance;

injectCore() async {
  var prefs = SharedPrefManager().sharedPreferences ??
      await SharedPreferences.getInstance();

  getIt.registerFactory<SharedPreferences>(() => prefs);
  getIt.registerFactory(
    () => SecurityDataSource(sharedPreferences: prefs),
  );

  getIt.registerFactory(
    () => CoreGetAccessTokenUseCase(securityDataSource: getIt.get()),
  );
  getIt.registerFactory(
    () => CoreSaveTokenUseCase(securityDataSource: getIt.get()),
  );
  getIt.registerFactory(
    () => CoreClearTokenUseCase(securityDataSource: getIt.get()),
  );
  getIt.registerFactory(
    () => SaveLanguageCodeUseCase(securityDataSource: getIt.get()),
  );
  getIt.registerFactory(
    () => CoreClearAuthDataUseCase(securityDataSource: getIt.get()),
  );
  getIt.registerFactory(
    () => CoreSavePhoneNumberUseCase(securityDataSource: getIt.get()),
  );
  getIt.registerFactory(
    () => CoreGetPhoneNumberUseCase(securityDataSource: getIt.get()),
  );
}
