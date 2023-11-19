import 'package:flutter_core/core/data/dataSource/security_data_source.dart';

class CoreClearAuthDataUseCase {
  SecurityDataSource securityDataSource;

  CoreClearAuthDataUseCase({required this.securityDataSource});

  call() {
    securityDataSource.clearAccessToken();
    securityDataSource.clearRefreshToken();
    securityDataSource.clearPhoneNumber();
  }
}

class CoreGetAccessTokenUseCase {
  SecurityDataSource securityDataSource;

  CoreGetAccessTokenUseCase({required this.securityDataSource});

  String? call() => securityDataSource.getAccessToken();
}

class CoreSaveTokenUseCase {
  SecurityDataSource securityDataSource;

  CoreSaveTokenUseCase({required this.securityDataSource});

  call({required String token, required String refreshToken}) {
    securityDataSource.saveAccessToken(token);
    securityDataSource.saveRefreshToken(refreshToken);
  }
}

class CoreClearTokenUseCase {
  SecurityDataSource securityDataSource;

  CoreClearTokenUseCase({required this.securityDataSource});

  call() {
    securityDataSource.clearAccessToken();
    securityDataSource.clearRefreshToken();
  }
}

class SaveLanguageCodeUseCase {
  SecurityDataSource securityDataSource;

  SaveLanguageCodeUseCase({required this.securityDataSource});

  call(String code) {
    securityDataSource.saveLanguageCode(code);
  }
}


class CoreSavePhoneNumberUseCase {
  SecurityDataSource securityDataSource;

  CoreSavePhoneNumberUseCase({required this.securityDataSource});

  call(String phoneNumber) {
    securityDataSource.savePhoneNumber(phoneNumber);
  }
}

class CoreGetPhoneNumberUseCase {
  SecurityDataSource securityDataSource;

  CoreGetPhoneNumberUseCase({required this.securityDataSource});

  String? call() => securityDataSource.getPhoneNumber();
}