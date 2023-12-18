import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CreateTransactionConstants {
  static final String addTransaction = 'transaction.create.add_transaction'.tr;
  static final String updateTransaction = translate('transaction.update');

  static final String note = translate('transaction.create.note');
  static final String category = translate('transaction.create.category');
  static final String update = translate('transaction.create.update');

  static final String invoicePhotos =
      translate('transaction.create.invoice_photos');
  static final String create = translate('transaction.create');
  static final String chooseAWallet =
      translate('transaction.create.choose_a_wallet');
}
