import 'package:flutter_core/core/data/dataSource/secure_data_source.dart';
import 'package:flutter_core/core/ui/constants/constants.dart';

class CoreAuthDataRepository {

  CoreAuthDataRepository(this._dataSource);

  final SecureDataSource _dataSource;

  void setAccessToken(String token) => _dataSource.saveAccessToken(token);

  String getAccessToken() => _dataSource.getAccessToken() ?? CoreConstants.empty;

  void clearAccessToken() => _dataSource.clearAccessToken();

  void setRefreshToken(String token) => _dataSource.saveRefreshToken(token);

  String getRefreshToken(String token) => _dataSource.getRefreshToken() ?? CoreConstants.empty;

  void clearRefreshToken() => _dataSource.clearRefreshToken();

  void setPhoneNumber(String phoneNumber) => _dataSource.savePhoneNumber(phoneNumber);

  String getPhoneNumber() => _dataSource.getPhoneNumber() ?? CoreConstants.empty;

  void clearPhoneNumber() => _dataSource.clearPhoneNumber();

  void setUserName(String name) => _dataSource.saveUserName(name);

  String getUserName() => _dataSource.getUserName() ?? CoreConstants.empty;

  void clearAuthData() {
    _dataSource.clearAccessToken();
    _dataSource.clearRefreshToken();
    _dataSource.clearPhoneNumber();
    _dataSource.clearUserName();
  }
}