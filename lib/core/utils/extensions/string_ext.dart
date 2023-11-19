import 'package:url_launcher/url_launcher.dart';

extension StringExt on String {
  String ifEmpty(String anotherString) {
    return isEmpty ? anotherString : this;
  }

  launchURL() async {
    if (!await launchUrl(Uri.parse(this))) throw 'Could not launch $this';
  }

  bool validateEmail() {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(this);
  }
}

extension StringNullableExt on String {
  String orEmpty() => this ?? '';
}