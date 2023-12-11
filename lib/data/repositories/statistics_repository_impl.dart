import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/data/models/statistics_model.dart';
import 'package:injectable/injectable.dart';

import '../../common/configs/default_environment.dart';
import '../../common/configs/firebase_config.dart';
import '../../common/exception/app_error.dart';
import '../../data/models/transaction_model.dart';
import '../../domain/repositories/statistics_repository.dart';

@Injectable(as: StatisticsRepository)
class StatisticsRepositoryImpl implements StatisticsRepository {
  final FirebaseConfig config;

  StatisticsRepositoryImpl(
    this.config,
  );

  DocumentReference<Map<String, dynamic>> get _doc => config.userDoc
      .collection(config.auth.currentUser?.uid ?? '')
      .doc(DefaultEnvironment.statistics);

  @override
  Future<Either<StatisticsListModel, AppError>> update(
    TransactionModel transaction, {
    TransactionModel? transactionOld,
  }) async {
    try {
      Map<String, double> map = {};
      Map<String, StatisticsListModel> map2 = {};
      final listStatistics = await get();
      return listStatistics.fold(
        (left) async {
          StatisticsListModel statistics = left;
          final dateItem =
              DateTime.fromMillisecondsSinceEpoch(transaction.spendTime);
          //
          int amount = transaction.amount - (transactionOld?.amount ?? 0);
          //copy with
          map = statistics.data.map((key, value) => MapEntry(key, value));
          map.update(
            transaction.category.type ?? '',
            (value) => value + amount,
            ifAbsent: () => amount.toDouble(),
          );
          statistics = statistics.copyWith(data: map);
          //update with month
          int month = dateItem.month;
          StatisticsListModel statisticMonth =
              statistics.statistics[month - 1] ?? StatisticsListModel();
          //update with day
          int day = dateItem.day;
          StatisticsListModel? statisticDay =
              statisticMonth.statistics[day - 1] ?? StatisticsListModel();
          //update amount day
          map = statisticDay.data.map((key, value) => MapEntry(key, value));
          map.update(
            transaction.category.type ?? '',
            (value) => value + amount,
            ifAbsent: () => amount.toDouble(),
          );
          statisticDay = statisticDay.copyWith(data: map);
          //update list day
          map2 = statisticMonth.statistics
              .map((key, value) => MapEntry(key, value));
          map2.update(
            (day - 1).toString(),
            (value) => statisticDay!,
            ifAbsent: () => statisticDay!,
          );
          statisticMonth = statisticMonth.copyWith(statistics: map2);
          //update amount month
          map = statisticMonth.data.map((key, value) => MapEntry(key, value));
          map.update(
            transaction.category.type ?? '',
            (value) => value + amount,
            ifAbsent: () => amount.toDouble(),
          );
          statisticMonth = statisticMonth.copyWith(data: map);
          //update list  =month
          map2 =
              statistics.statistics.map((key, value) => MapEntry(key, value));
          map2.update(
            (month - 1).toString(),
            (value) => statisticMonth,
            ifAbsent: () => statisticMonth,
          );
          statistics = statistics.copyWith(statistics: map2);
          //
          await _doc
              .collection(dateItem.year.toString())
              .add(statistics.toJson());

          return Left(statistics);
        },
        (right) {
          return Right(right);
        },
      );
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<StatisticsListModel, AppError>> get() async {
    try {
      final result = await _doc.get();
      return Left(StatisticsListModel.fromJson(result.data() ?? {}));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }
}
