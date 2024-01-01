part of 'service.dart';

List<String> get listBankSupport => [
      'com.mbmobile',
    ];

class NotificationMapperModel {
  final TransactionModel transaction;
  final String id;
  final String walletId;
  NotificationMapperModel({
    required this.transaction,
    required this.id,
    required this.walletId,
  });
}

(TransactionModel, String) mapNotificationToTransaction(
    NotificationEvent event) {
  late TransactionModel transaction = TransactionModel.empty();
  num amount = 0;
  num blance = 0;
  String walletName = '';
  DateTime spendTime = DateTime.now();
  final title = event.title ?? '';
  final content = event.message ?? '';
  switch (event.packageName) {
    case 'com.mbmobile':
      List<String> messages = content.split('|');
      walletName = 'MB';
      for (var message in messages) {
        if (message.contains('GD:')) {
          final gd = message.split('GD:')[1].split('VND');
          if (gd.length > 1) {
            amount = num.tryParse(gd[0].trim().replaceAll(',', '')) ?? 0;
            spendTime = DateTime.tryParse(gd[1].trim()) ?? DateTime.now();
          }
        }
        if (message.contains('TK')) {
          walletName += message.split('TK')[1].trim();
        }
        if (message.contains('SD:')) {
          blance = num.tryParse(
                message.split('SD:')[1].trim().replaceAll(',', '').replaceAll(
                      RegExp('[a-zA-Z]'),
                      '',
                    ),
              ) ??
              0;
        }
      }
      break;
    default:
  }
  transaction = transaction.copyWith(
    amount: amount.toInt(),
    note: '$title:${content.split('|')[0]}',
    spendTime: Timestamp.fromDate(spendTime),
    createAt: DateTime.now().millisecondsSinceEpoch,
    category: amount > 0
        ? const CategoryModel(category: CategoryType.otherRevenue)
        : const CategoryModel(category: CategoryType.other),
    wallet: WalletModel(
      walletName: walletName,
      walletImage: 'https://api.vietqr.io/img/MB.png',
      balance: blance.toInt(),
      createAt: DateTime.now().millisecondsSinceEpoch,
      lastUpdate: DateTime.now().millisecondsSinceEpoch,
      walletType: 2,
      firstBalance: blance.toInt(),
      id: hash(walletName),
    ),
  );
  final id = hash(event.packageName.toString() +
      event.title.toString() +
      event.message.toString());

  return (transaction, id);
}
