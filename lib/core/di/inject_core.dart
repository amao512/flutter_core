import 'package:flutter_core/core/domain/usecase/core_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dataSource/security_data_source.dart';
import '../data/dataSource/shared_pref_manager.dart';

final di = GetIt.instance;

injectCore() async {
  var prefs = SharedPrefManager().sharedPreferences ??
      await SharedPreferences.getInstance();

  di.registerFactory<SharedPreferences>(() => prefs);
  di.registerFactory(
    () => SecurityDataSource(sharedPreferences: prefs),
  );

  di.registerFactory(
    () => CoreGetAccessTokenUseCase(securityDataSource: di.get()),
  );
  di.registerFactory(
    () => CoreSaveTokenUseCase(securityDataSource: di.get()),
  );
  di.registerFactory(
    () => CoreClearTokenUseCase(securityDataSource: di.get()),
  );
  di.registerFactory(
    () => SaveLanguageCodeUseCase(securityDataSource: di.get()),
  );
  di.registerFactory(
    () => CoreClearAuthDataUseCase(securityDataSource: di.get()),
  );
  di.registerFactory(
    () => CoreSavePhoneNumberUseCase(securityDataSource: di.get()),
  );
  di.registerFactory(
    () => CoreGetPhoneNumberUseCase(securityDataSource: di.get()),
  );
}
