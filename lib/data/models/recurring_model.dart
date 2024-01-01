import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/data/models/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recurring_model.freezed.dart';
part 'recurring_model.g.dart';

@freezed
class RecurringModel with _$RecurringModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory RecurringModel({
    required TransactionModel transaction,
    required DateTime startDate,
    required String recurringType,
    required int recurringCount,
    String? id,
  }) = _RecurringModel;

  const RecurringModel._();

  factory RecurringModel.fromJson(Map<String, dynamic> json) =>
      _$RecurringModelFromJson(json);

  static RecurringModel fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> query) {
    final json = query.data();
    final id = query.id;
    final model = RecurringModel.fromJson(json);
    return model.copyWith(id: id);
  }
}
