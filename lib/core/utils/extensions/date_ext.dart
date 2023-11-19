import 'package:intl/intl.dart';

class DatePatternConstants {
  static const dd_P_MM__HH_DP_mm = "dd.MM HH:mm";
  static const yyyy_MM_dd = "yyyy-MM-dd";
  static const yyyy_MM = "yyyy-MM";
  static const yyyy_P_MM_P_dd = "yyyy.MM.dd";
  static const dd_S_MMM = "dd MMM";
  static const dd_S_MMM_S_YYYY_C_S_HH_MM = "dd MMM yyyy, HH:mm";
  static const dd_S_MMMM = "dd MMMM";
  static const dd_S_MMMM_YYYY = "dd MMMM yyyy";
  static const dd_P_MM = "dd.MM";
  static const dd_S_MMM_C_S_EEE = "dd MMM, EEE";
  static const dd_S_MMMM_C_S_EEE = "dd MMMM, EEE";
  static const dd_S_MMMM_S_HH_DP_MM = "dd MMMM HH:mm";
  static const dd_S_MMMM_C_S_YYYY = "dd MMMM, yyyy";
  static const dd_mm_yyyy = "dd-MM-yyyy";
  static const dd_P_mm_P_yyyy = "dd.MM.yyyy";
  static const dd_P_mm_P_yy = "dd.MM.yy";
  static const dd_P_mm_P_yy_hh_P_mm = "dd.MM.yy HH:mm";
  static const dd_P_mm_P_yy_S_H_mm = "dd.MM.yy, HH:mm";
  static const dd = "dd";
  static const MM = "MM";
  static const LLLL = "LLLL";
  static const MMM = "MMM";
  static const HH_DP_mm = "HH:mm";
  static const yyyy_MM_dd_T_HH_mm_ss = "yyyy-MM-dd'T'HH:mm:ss";
  static const yyyy_MM_dd_HH_mm_ss_ZZZZZ = "yyyy-MM-dd'T'HH:mm:ssZZZZZ";
  static const yyyy_MM_dd_T_HH_mm = "yyyy-MM-dd'T'HH:mm";
  static const yyyy_MM_dd_CC_HH_mm_ss = "yyyy-MM-dd, HH:mm:ss";
  static const yyyy_MM_dd_S_HH_mm_ss = "yyyy-MM-dd HH:mm:ss";
  static const yyyy_MM_dd_CC_HH_mm = "yyyy-MM-dd, HH:mm";
  static const yyyy = "yyyy";
  static const llll_yyyy = "LLLL yyyy";
  static const HH_DP_mm_DP_ss = "HH:mm:ss";
  static const dd_MMM_S_HH_S_mm = "dd MMMM HH:mm";
  static const yyyy_MM_dd_HH_mm_ss_SSSSSS = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS";
  static const yyyy_MM_dd_HH_mm_ss_SSS = "yyyy-MM-dd HH:mm:ss.SSS";
}

extension DateExt on String {
  DateTime parseDate([String pattern = DatePatternConstants.dd_P_mm_P_yyyy]) {
    var format = DateFormat(pattern);
    return format.parse(this);
  }

  String formatDateTo({
    required String formatPattern,
    required String parsePattern,
}) {
    var format = DateFormat(formatPattern).parse(this);
    var parse = DateFormat(parsePattern).format(format);

    return parse;
  }
}

extension DateTimeExt on DateTime {
  String formatString() {
    var stringDay = (day < 10) ? "0$day" : day.toString();
    var stringMonth = (month < 10) ? "0$month" : month.toString();
    return "$stringDay.$stringMonth.$year";
  }

  String getMonthName(String localCode, [bool withDeclination = false]) {
    if (!withDeclination) return DateFormat.MMMM(localCode).format(this);
    if (localCode != 'ru') return DateFormat.MMMM(localCode).format(this);

    return switch (month) {
      1 => "Января",
      2 => "Февраля",
      3 => "Марта",
      4 => "Апреля",
      5 => "Мая",
      6 => "Июня",
      7 => "Июля",
      8 => "Августа",
      9 => "Сентября",
      10 => "Октября",
      11 => "Ноября",
      12 => "Декабря",
      _ => "",
    };
  }
}
