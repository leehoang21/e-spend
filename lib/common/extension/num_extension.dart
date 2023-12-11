import 'package:intl/intl.dart';

extension NumExtension on num {
  String get toStandardized {
    if (this < 10 && -10 < this) {
      return '0$this';
    }
    return toString();
  }

  String get getTextAmount {
    final formatter = NumberFormat.simpleCurrency(locale: "vi_VN");
    return formatter.format(this);
  }
}
