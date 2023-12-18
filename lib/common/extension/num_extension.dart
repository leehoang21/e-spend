import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:intl/intl.dart';

extension NumExtension on num {
  String get toStandardized {
    if (this < 10 && -10 < this) {
      return '0$this';
    }
    return toString();
  }

  String get getTextAmount {
    final formatter = NumberFormat.simpleCurrency(
      locale: getIt<HiveConfig>().locale.countryCode == null
          ? 'vi_VN'
          : ('${getIt<HiveConfig>().locale.countryCode ?? ''}_${getIt<HiveConfig>().locale.languageCode}'),
    );
    return formatter.format(this);
  }

  String get getTextCompactAmount {
    final formatter = NumberFormat.compact(
      locale: getIt<HiveConfig>().locale.countryCode == null
          ? 'vi_VN'
          : ('${getIt<HiveConfig>().locale.countryCode ?? ''}_${getIt<HiveConfig>().locale.languageCode}'),
    );
    return formatter.format(this);
  }

  String get getTextCompactCurrencyAmount {
    final formatter = NumberFormat.compactCurrency(
      locale: getIt<HiveConfig>().locale.countryCode == null
          ? 'vi_VN'
          : ('${getIt<HiveConfig>().locale.countryCode ?? ''}_${getIt<HiveConfig>().locale.languageCode}'),
    );
    return formatter.format(this);
  }
}
