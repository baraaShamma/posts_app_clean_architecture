import 'package:easy_localization/easy_localization.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

validInput(String val, int min, int max, String type, context) {
  if (val.isEmpty) {
    return "10".tr();
  }
  if (val.isNotEmpty) {
    if (type == "email") {
      if (!val.isValidEmail()) {
        return "11".tr();
      }
    }

    if (val.length < min) {
      return "${"12".tr()}$min";
    }

    if (val.length > max) {
      return "${"13".tr()} $max";
    }
  }
}
