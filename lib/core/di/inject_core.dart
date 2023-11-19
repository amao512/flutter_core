import 'package:flutter_core/core/data/repository/core_auth_data_repository.dart';
import 'package:flutter_core/core/data/repository/core_system_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dataSource/secure_data_source.dart';
import '../data/dataSource/shared_pref_manager.dart';

final getIt = GetIt.instance;

injectCore() async {
  await _injectDataSource();
  await _injectRepository();
}

_injectDataSource() async {
  var prefs = SharedPrefManager().sharedPreferences ??
      await SharedPreferences.getInstance();

  getIt.registerFactory<SharedPreferences>(() => prefs);
  getIt.registerFactory(
        () => SecureDataSource(getIt.get()),
  );
}

_injectRepository() {
  getIt.registerFactory(() => CoreAuthDataRepository(getIt.get()));
  getIt.registerFactory(() => CoreSystemRepository(getIt.get()));
}