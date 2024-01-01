class CreateRecurringConstants {
  static const String addTransaction =
      'transaction.create.add_transaction_recurring';
  static const String updateTransaction =
      'transaction.update_transaction_recurring';

  static const String note = 'transaction.create.note';
  static const String category = 'transaction.create.category';
  static const String update = 'transaction.create.update';

  static const String invoicePhotos = 'transaction.create.invoice_photos';
  static const String create = 'transaction.create';
  static const String chooseAWallet = 'transaction.create.choose_a_wallet';
  static const String from = 'recurring.create.From';
  static const String loop = 'recurring.create.loop';
  static const String hintLoop = 'recurring.create.hint_loop';
  static const String none = 'recurring.create.none';
  static const String confirm = 'confirm';
  static const String count = 'recurring.create.count';
  static const String hintCount = 'recurring.create.hint_count';
  static const List<String> fors = [
    "recurring.create.none",
    "recurring.create.day",
    "recurring.create.week",
    "recurring.create.month",
    "recurring.create.year",
  ];
}
