import 'package:flutter_core/core/ui/constants/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Форматирует строку под номер телефона
String formatPhoneNumber(String phoneNumber) {
  final value = phoneNumber.replaceAll(" ", "").replaceAll("+", "");
  if (value.length < 9) {
    return "";
  }
  var mode = 0;

  if (value.length == 10) {
    mode = 1;
  }
  final startPhone = value.substring(1 - mode, 4 - mode);
  final centerPhone = value.substring(4 - mode, 7 - mode);
  final endNumber = value.substring(7 - mode, value.length);

  return "+7 $startPhone $centerPhone $endNumber";
}

String formatForeignPhoneNumber(String phoneNumber) {
  // Remove any non-digit characters from the phone number
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D+'), '');

  // Check if the phone number has the correct length (11 digits)
  if (phoneNumber.length != 11) {
    // If not, return the original phone number
    return phoneNumber;
  }

  // Format the phone number as "+# ### ### ####"
  return "+${phoneNumber.substring(0, 1)} ${phoneNumber.substring(1, 4)} ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}";
}

String formatForSendPhoneNumber(String? phoneNumber) => "7${phoneNumber ?? ''}";

String formatForSendPhoneNumberWithValidatingPrefix(String? phoneNumber) =>
    "7${removePrefixFromPhoneNumber(phoneNumber ?? '')}";

String formatForeignPhoneNumberToSend(String? phoneNumber) =>
    phoneNumber?.replaceAll(" ", "").replaceAll("+", "") ?? CoreConstants.empty;

/// Убирает префикс (+7,7,8) в начале номера
String removePrefixFromPhoneNumber(String? phoneNumber) {
  var localPhoneNumber = phoneNumber?.replaceAll(RegExp(r'\s'), '') ?? '';
  localPhoneNumber = localPhoneNumber.replaceAll('(', '');
  localPhoneNumber = localPhoneNumber.replaceAll(')', '');

  if (localPhoneNumber.isEmpty) {
    return '';
  } else if (localPhoneNumber.startsWith('+7') &&
      localPhoneNumber.length == 12) {
    return localPhoneNumber.substring(3);
  } else if ((localPhoneNumber.startsWith('7') ||
          localPhoneNumber.startsWith('8')) &&
      localPhoneNumber.length == 11) {
    return localPhoneNumber.substring(1);
  } else {
    return localPhoneNumber;
  }
}

// check phone number with format +7 ### ### ## ##
bool validatePhoneNumber(String phoneNumber) {
  final maskFormatter = MaskTextInputFormatter(
    mask: "+7 ### ### ## ##",
    initialText: phoneNumber,
  );

  String fixedLine =
      "(?:33622|7(?:1(?:0(?:[23]\\d|4[0-3]|59|63)|1(?:[23]\\d|4[0-79]|59)|2(?:[23]\\d|59)|3(?:2\\d|3[0-79]|4[0-35-9]|59)|4(?:[24]\\d|3[013-9]|5[1-9])|5(?:2\\d|3[1-9]|4[0-7]|59)|6(?:[2-4]\\d|5[19]|61)|72\\d|8(?:[27]\\d|3[1-46-9]|4[0-5]))|2(?:1(?:[23]\\d|4[46-9]|5[3469])|2(?:2\\d|3[0679]|46|5[12679])|3(?:[2-4]\\d|5[139])|4(?:2\\d|3[1-35-9]|59)|5(?:[23]\\d|4[0-246-8]|59|61)|6(?:2\\d|3[1-9]|4[0-4]|59)|7(?:[2379]\\d|40|5[279])|8(?:[23]\\d|4[0-3]|59)|9(?:2\\d|3[124578]|59))))\\d{5}";
  var patterns = [
    "7(?:0[0-25-8]|47|6[02-4]|7[15-8]|85)\\d{7}",
    "33622\\d{5}|(?:7\\d|80)\\d{8}",
    "751\\d{7}",
    "800\\d{7}",
    "809\\d{7}",
    "808\\d{7}",
    "751\\d{7}",
    fixedLine
  ];
  var regExps = patterns.map((e) => RegExp(e));
  if (maskFormatter.getUnmaskedText().isEmpty) {
    return false;
  } else if (!regExps
      .map((e) => e.hasMatch(maskFormatter.getUnmaskedText()))
      .contains(true)) {
    return false;
  }
  return true;
}
