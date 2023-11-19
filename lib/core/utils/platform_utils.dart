import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_core/core/utils/extensions/string_ext.dart';
import 'package:package_info_plus/package_info_plus.dart';

String versionName = "";

class PlatformUtils {
  static bool get isMobile {
    if (kIsWeb) {
      return false;
    } else {
      return Platform.isIOS || Platform.isAndroid;
    }
  }

  static getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    versionName = packageInfo.version;
  }

  // static launchAppInStore() async {
  //   if (Platform.isIOS) {
  //     const url = 'https://apps.apple.com/app/id/123456789';
  //     await url.launchURL();
  //   } else if (Platform.isAndroid) {
  //     const url = 'https://play.google.com/store/apps/details?id=com.arada.app';
  //     await url.launchURL();
  //   }
  //  }
}