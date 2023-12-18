import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/storage_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../common/configs/default_environment.dart';
import '../../../../../../common/utils/internet_checker.dart';
import '../../../../../../common/utils/validator.dart';
import '../../../../../../data/models/category_model.dart';
import '../../../../../../data/models/transaction_model.dart';
import '../../../../../../data/models/wallet_model.dart';
import '../../../../../../domain/use_cases/transaction_use_case.dart';
import '../../../../../bloc/base_bloc/base_bloc.dart';
import 'create_transaction_state.dart';

@injectable
class CreateTransactionBloc extends BaseBloc<CreateTransactionState> {
  final TransactionUseCase _transactionUseCase;
  final StorageUseCase storageUseCase;
  TransactionModel? _transaction;
  CreateTransactionBloc(
    this._transactionUseCase,
    this.storageUseCase,
  ) : super(
          CreateTransactionState.initial(),
        );

  Future<void> initial(TransactionModel transaction) async {
    _transaction = transaction;
    emit(
      state.copyWith(
        amount: transaction.amount,
        wallet: transaction.wallet,
        category: transaction.category,
        photo: transaction.photos,
        spendTime: transaction.spendTime,
        buttonIsValid: AppValidator.validateCreateTransactionButton(
          transaction.amount,
          transaction.category,
          transaction.spendTime,
          transaction.wallet,
        ),
        lastUpdate: DateTime.now(),
      ),
    );
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

  Future<void> onCreate({String? note, List<File> photos = const []}) async {
    showLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        TransactionModel transaction = TransactionModel(
            amount: state.amount!,
            category: state.category!,
            spendTime: state.spendTime,
            wallet: state.wallet!,
            note: note,
            createAt: DateTime.now().millisecondsSinceEpoch,
            lastUpdate: DateTime.now().millisecondsSinceEpoch);
        final transactionResult = await _transactionUseCase.create(transaction);

        transactionResult.fold(
          (l) async {
            final List<String> imagePaths = [];
            for (int i = 0; i < photos.length; i++) {
              final String storagePath =
                  '${DefaultEnvironment.transaction}/$l/$i.jpeg';
              await storageUseCase.put(
                  imageToUpload: photos[i], imagePathStorage: storagePath);
              imagePaths.add(storagePath);
            }
            transaction = transaction.copyWith(id: l, photos: imagePaths);
            _transactionUseCase.update(
              transaction,
              transactionOld: transaction.copyWith(amount: 0),
            );
            hideLoading();
            emit(
              state.copyWith(
                status: CreateTransactionStatus.succes,
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
            status: CreateTransactionStatus.failed,
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
        status: CreateTransactionStatus.noInternet,
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
  }) async {
    showLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        TransactionModel transaction = TransactionModel(
            id: id,
            amount: state.amount!,
            category: state.category!,
            spendTime: state.spendTime,
            wallet: state.wallet!,
            photos: state.photo,
            note: note,
            createAt: DateTime.now().millisecondsSinceEpoch,
            lastUpdate: DateTime.now().millisecondsSinceEpoch);
        //update photos

        final List<String> imagePaths = [];
        for (int i = 0; i < photos.length; i++) {
          final String storagePath =
              '${DefaultEnvironment.transaction}/${_transaction?.id}/$i.jpeg';
          if (!_checkRemote(photos[i].path)) {
            await storageUseCase.put(
                imageToUpload: photos[i], imagePathStorage: storagePath);
          }
          imagePaths.add(storagePath);
        }
        //update transaction
        transaction = transaction.copyWith(photos: imagePaths);
        _transactionUseCase.update(
          transaction,
          transactionOld: _transaction!,
        );
        hideLoading();
        await pop(null);
        emit(
          state.copyWith(
            status: CreateTransactionStatus.succes,
            lastUpdate: DateTime.now(),
          ),
        );
      } on FirebaseException catch (e) {
        hideLoading();
        emit(
          state.copyWith(status: CreateTransactionStatus.failed),
        );
        showSnackbar(
          translationKey: e.message ?? '',
        );
      }
    } else {
      hideLoading();
      state.copyWith(status: CreateTransactionStatus.noInternet);
      showSnackbar(
        translationKey: 'no_internet_connection',
      );
    }
  }
}
