import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/recurring_use_case.dart';
import 'package:flutter_e_spend/domain/use_cases/storage_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../common/utils/internet_checker.dart';
import '../../../../../../../../common/utils/validator.dart';
import '../../../../../../../../data/models/category_model.dart';
import '../../../../../../../../data/models/recurring_model.dart';
import '../../../../../../../../data/models/transaction_model.dart';
import '../../../../../../../../data/models/wallet_model.dart';
import '../../../../../../../bloc/base_bloc/base_bloc.dart';
import 'create_recurring_state.dart';

@injectable
class CreateRecurringBloc extends BaseBloc<CreateRecurringState> {
  final RecurringUseCase _useCase;
  final StorageUseCase storageUseCase;
  // ignore: unused_field
  RecurringModel? _transaction;
  CreateRecurringBloc(
    this._useCase,
    this.storageUseCase,
  ) : super(
          CreateRecurringState.initial(),
        );

  Future<void> initial(RecurringModel transaction) async {
    _transaction = transaction;
  }

  Future<void> chooseCategory(CategoryModel? category) async {
    emit(
      state.copyWith(
        category: category,
        buttonIsValid: AppValidator.validateCreateTransactionButton(
            state.amount, category, state.spendTime, state.wallet),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> changeSpendTime(Timestamp spendTime) async {
    emit(
      state.copyWith(
        spendTime: spendTime,
        buttonIsValid: AppValidator.validateCreateTransactionButton(
            state.amount, state.category, spendTime, state.wallet),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> chooseWallet(WalletModel? wallet) async {
    emit(
      state.copyWith(
        wallet: wallet,
        buttonIsValid: AppValidator.validateCreateTransactionButton(
            state.amount, state.category, state.spendTime, wallet),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> onChangeAmount(int amount) async {
    emit(
      state.copyWith(
        amount: amount,
        buttonIsValid: AppValidator.validateCreateTransactionButton(
            amount, state.category, state.spendTime, state.wallet),
        lastUpdate: DateTime.now(),
      ),
    );
  }

  Future<void> onCreate({
    String? note,
    List<File> photos = const [],
    required String startFrom,
    required String recurringCount,
    required String recurringType,
  }) async {
    showLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        // final List<String> imagePaths = [];
        //     for (int i = 0; i < photos.length; i++) {
        //       final String storagePath =
        //           '${DefaultEnvironment.transaction}/$l/$i.jpeg';
        //       await storageUseCase.put(
        //           imageToUpload: photos[i], imagePathStorage: storagePath);
        //       imagePaths.add(storagePath);
        RecurringModel transaction = RecurringModel(
          transaction: TransactionModel(
            amount: state.amount!,
            photos: [],
            category: state.category!,
            spendTime: state.spendTime,
            wallet: state.wallet!,
            note: note,
            createAt: DateTime.now().millisecondsSinceEpoch,
            lastUpdate: DateTime.now().millisecondsSinceEpoch,
          ),
          startDate: DateTime.tryParse(startFrom) ?? DateTime.now(),
          recurringCount: int.tryParse(recurringCount) ?? 1,
          recurringType: recurringType,
        );
        final transactionResult = await _useCase.put(transaction);

        transactionResult.fold(
          (l) async {
            hideLoading();
            emit(
              state.copyWith(
                status: CreateRecurringStatus.succes,
                lastUpdate: DateTime.now(),
              ),
            );
          },
          (r) {
            showSnackbar(
              translationKey: r.message,
            );
          },
        );
      } on FirebaseException catch (e) {
        emit(
          state.copyWith(
            status: CreateRecurringStatus.failed,
            lastUpdate: DateTime.now(),
          ),
        );
        hideLoading();
        showSnackbar(
          translationKey: e.message ?? '',
        );
      }
    } else {
      hideLoading();
      state.copyWith(
        status: CreateRecurringStatus.noInternet,
        lastUpdate: DateTime.now(),
      );
      showSnackbar(
        translationKey: 'no_internet_connection',
      );
    }
  }

  bool _checkRemote(String path) {
    if (path.toString().contains('http://') ||
        path.toString().contains('https://')) {
      return true;
    }
    return false;
  }

  Future<void> onEdit({
    required String id,
    String? note,
    required List<File> photos,
    required String startFrom,
    required String recurringCount,
    required String recurringType,
  }) async {
    showLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        RecurringModel transaction = RecurringModel(
          transaction: TransactionModel(
            id: id,
            amount: state.amount!,
            category: state.category!,
            spendTime: state.spendTime,
            wallet: state.wallet!,
            photos: state.photo,
            note: note,
            createAt: DateTime.now().millisecondsSinceEpoch,
            lastUpdate: DateTime.now().millisecondsSinceEpoch,
          ),
          startDate: DateTime.tryParse(startFrom) ?? DateTime.now(),
          recurringCount: int.tryParse(recurringCount) ?? 1,
          recurringType: recurringType,
        );
        //update photos

        // final List<String> imagePaths = [];
        // for (int i = 0; i < photos.length; i++) {
        //   final String storagePath =
        //       '${DefaultEnvironment.transaction}/${_transaction?.id}/$i.jpeg';
        //   if (!_checkRemote(photos[i].path)) {
        //     await storageUseCase.put(
        //         imageToUpload: photos[i], imagePathStorage: storagePath);
        //   }
        //   imagePaths.add(storagePath);
        // }
        //update transaction
        // transaction = transaction.copyWith(photos: imagePaths);
        _useCase.put(transaction);
        hideLoading();
        await pop(null);
        emit(
          state.copyWith(
            status: CreateRecurringStatus.succes,
            lastUpdate: DateTime.now(),
          ),
        );
      } on FirebaseException catch (e) {
        hideLoading();
        emit(
          state.copyWith(status: CreateRecurringStatus.failed),
        );
        showSnackbar(
          translationKey: e.message ?? '',
        );
      }
    } else {
      hideLoading();
      state.copyWith(status: CreateRecurringStatus.noInternet);
      showSnackbar(
        translationKey: 'no_internet_connection',
      );
    }
  }
}
