import 'package:equatable/equatable.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/transaction_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/format_utils.dart';
import '../../../../domain/use_cases/transaction_use_case.dart';
import '../../../../domain/use_cases/user_use_case.dart';
import '../../../bloc/base_bloc/base_bloc.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends BaseBloc<HomeState> {
  HomeCubit(this.useCase, this.userUseCase) : super(const HomeState());
  final TransactionUseCase useCase;
  final UserUseCase userUseCase;
  DateTime date = DateTime.now();

  @override
  Future onInit() async {
    await getData();
    super.onInit();
  }

  changeDate(DateTime time) {
    date = time;
  }

  Future getData() async {
    final result = await useCase.get();
    result.fold((l) {
      emit(state.copyWith(data: l, status: HomeStateStatus.loaded));
    }, (r) {
      emit(state.copyWith(status: HomeStateStatus.error));
    });
  }

  String get revenue {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      final dateItem = DateTime.fromMillisecondsSinceEpoch(element.spendTime);
      if (dateItem.month != date.month || dateItem.year != date.year) {
        return previousValue;
      }
      if (element.category.type != 'REVENUE') return previousValue;
      return previousValue + element.amount;
    }).toString();
  }

  String get expense {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      final dateItem = DateTime.fromMillisecondsSinceEpoch(element.spendTime);
      if (dateItem.month != date.month || dateItem.year != date.year) {
        return previousValue;
      }
      if (element.category.type != 'EXPENSES') return previousValue;
      return previousValue + element.amount;
    }).toString();
  }

  Map<String, List<TransactionModel>> data(bool isMonth) {
    isMonth = !isMonth;

    List<TransactionModel> data = state.data.map((e) => e.copyWith()).toList();
    data.sort((a, b) => b.spendTime.compareTo(a.spendTime));
    Map<String, List<TransactionModel>> result = {};
    for (final item in data) {
      final dateItem = DateTime.fromMillisecondsSinceEpoch(item.spendTime);
      if (isMonth) {
        if (dateItem.month == date.month && dateItem.year == date.year) {
          if (dateItem.day == date.day) {
            result['Today'.tr] = [...result['Today'.tr] ?? [], item];
          } else if (dateItem.day == date.day - 1) {
            result['Yesterday'.tr] = [...result['Yesterday'.tr] ?? [], item];
          } else {
            final timeString = formatDateMonth(
                DateTime.fromMillisecondsSinceEpoch(item.spendTime));
            result[timeString] = [...result[timeString] ?? [], item];
          }
        }
      } else if (dateItem.day == date.day &&
          dateItem.month == date.month &&
          dateItem.year == date.year) {
        result['Today'.tr] = [...result['Today'.tr] ?? [], item];
      } else if (dateItem.day == date.day - 1 &&
          dateItem.month == date.month &&
          dateItem.year == date.year) {
        result['Yesterday'.tr] = [...result['Yesterday'.tr] ?? [], item];
      } else {
        final timeString = formatDateMonth(
            DateTime.fromMillisecondsSinceEpoch(item.spendTime));
        result[timeString] = [...result[timeString] ?? [], item];
      }
    }
    return result;
  }

  double get total {
    final data = state.data;
    return data.fold(0, (previousValue, element) {
      final dateItem = DateTime.fromMillisecondsSinceEpoch(element.spendTime);
      if (dateItem.month != date.month || dateItem.year != date.year) {
        return previousValue;
      }
      if (element.category.type != 'EXPENSES') {
        return previousValue + element.amount;
      }
      return previousValue - element.amount;
    });
  }
}