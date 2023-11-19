import 'package:flutter_core/core/data/dataSource/secure_data_source.dart';

class CoreSystemRepository {
  CoreSystemRepository(this._dataSource);

  final SecureDataSource _dataSource;

  void setLanguageCode(String code) => _dataSource.saveLanguageCode(code);

  String getLanguageCode() => _dataSource.getLanguageCode();
}