import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
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

  CollectionReference<Map<String, dynamic>> get _doc => config.userDoc
      .collection(config.auth.currentUser?.uid ?? '')
      .doc(DefaultEnvironment.customer)
      .collection(DefaultEnvironment.statistics);

  @override
  Future<Either<StatisticsListModel, AppError>> update(
    TransactionModel transaction, {
    TransactionModel? transactionOld,
  }) async {
    try {
      final listStatistics = await get();
      return listStatistics.fold(
        (left) async {
          StatisticsListModel statistics = left;
          final dateItem = transaction.spendTime.toDate();
          //
          num amount = transaction.amount - (transactionOld?.amount ?? 0);
          //update amount year
          final data =
              statistics.data.map((key, value) => MapEntry(key, value));
          data.update(
            transaction.category.category.categoryType,
            (value) => value + amount,
            ifAbsent: () => amount,
          );
          data.update(
            transaction.category.category,
            (value) => value + amount,
            ifAbsent: () => amount,
          );
          statistics = statistics.copyWith(data: data);
          //update amount month
          final subStatisticsMonth = (statistics.subStatistics
                  ?.map((key, value) => MapEntry(key, value))) ??
              {};
          if (subStatisticsMonth[dateItem.month] == null) {
            subStatisticsMonth.addEntries([
              MapEntry(
                dateItem.month,
                StatisticsListModel(
                  data: {
                    transaction.category.category.categoryType: amount,
                    transaction.category.category: amount,
                  },
                  subStatistics: {},
                ),
              ),
            ]);
          } else {
            final dataMonth =
                (subStatisticsMonth[dateItem.month] ?? StatisticsListModel())
                    .data
                    .map((key, value) => MapEntry(key, value));

            dataMonth.update(
              transaction.category.category.categoryType,
              (value) => value + amount,
              ifAbsent: () => amount,
            );
            dataMonth.update(
              transaction.category.category,
              (value) => value + amount,
              ifAbsent: () => amount,
            );
            subStatisticsMonth.update(
              dateItem.month,
              (value) => value.copyWith(data: dataMonth),
              ifAbsent: () => StatisticsListModel(
                data: dataMonth,
                subStatistics: {},
              ),
            );
          }
          //update amount day
          final subStatisticsDay = (subStatisticsMonth[dateItem.month]
                  ?.subStatistics
                  ?.map((key, value) => MapEntry(key, value))) ??
              {};
          if (subStatisticsMonth[dateItem.month]
                  ?.subStatistics?[dateItem.day] ==
              null) {
            subStatisticsDay.addEntries([
              MapEntry(
                dateItem.day,
                StatisticsListModel(
                  data: {
                    transaction.category.category.categoryType: amount,
                    transaction.category.category: amount,
                  },
                  subStatistics: {},
                ),
              ),
            ]);
          } else {
            final dataDay = (subStatisticsMonth[dateItem.month]
                        ?.subStatistics?[dateItem.day] ??
                    StatisticsListModel())
                .data
                .map((key, value) => MapEntry(key, value));
            dataDay.update(
              transaction.category.category.categoryType,
              (value) => value + amount,
              ifAbsent: () => amount,
            );
            dataDay.update(
              transaction.category.category,
              (value) => value + amount,
              ifAbsent: () => amount,
            );
            subStatisticsDay.update(
              dateItem.day,
              (value) => value.copyWith(data: dataDay),
              ifAbsent: () => StatisticsListModel(
                data: dataDay,
                subStatistics: {},
              ),
            );
          }
          //update
          subStatisticsMonth.update(
            dateItem.month,
            (value) => value.copyWith(subStatistics: subStatisticsDay),
            ifAbsent: () => StatisticsListModel(
              data: {},
              subStatistics: subStatisticsDay,
            ),
          );
          statistics = statistics.copyWith(
            subStatistics: subStatisticsMonth,
          );
          // //remove all data ==0
          // final statisticsData = statistics.data
          //     .map((key, value) => MapEntry(key, value))
          //     .entries
          //     .where((element) => element.value.toDouble() != 0.toDouble());
          // statistics = statistics.copyWith(
          //   data: Map.fromEntries(statisticsData),
          // );
          // //remove all data day ==0 and month ==0
          // final statisticsDay = statistics.subStatistics
          //     ?.map((key, value) => MapEntry(key, value))
          //     .entries
          //     .where(
          //       (element) =>
          //           element.value.data.isNotEmpty &&
          //           element.value.data.entries.any(
          //               (element) => element.value.toDouble() != 0.toDouble()),
          //     )
          //     .where((element) =>
          //         element.value.subStatistics?.entries.any((element) =>
          //             element.value.data.isNotEmpty &&
          //             element.value.data.entries.any((element) =>
          //                 element.value.toDouble() != 0.toDouble())) ??
          //         false);
          // statistics = statistics.copyWith(
          //   subStatistics: Map.fromEntries((statisticsDay?.toList() ?? [])),
          // );
          //remove null

          //update remote
          final json = statistics.toJson();
          await _doc.doc(dateItem.year.toString()).set(json);

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
      final result = await _doc.doc(DateTime.now().year.toString()).get();
      return Left(StatisticsListModel.fromJson(result.data() ?? {}));
    } catch (e) {
      return Right(AppError(message: e.toString()));
    }
  }

  @override
  Stream<Either<StatisticsListModel, AppError>> stream() {
    try {
      return _doc.doc(DateTime.now().year.toString()).snapshots().map(
        (event) {
          try {
            return Left(StatisticsListModel.fromJson(event.data() ?? {}));
          } catch (e) {
            return Right(AppError(message: e.toString()));
          }
        },
      );
    } catch (e) {
      return Stream.value(Right(AppError(message: e.toString())));
    }
  }
}
