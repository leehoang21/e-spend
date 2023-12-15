import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/di/injector.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/pick_image_use_case.dart';
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
  CreateTransactionBloc(
    this._transactionUseCase,
    this.storageUseCase,
  ) : super(
          CreateTransactionState.initial(),
        );

  Future<void> initial(TransactionModel transaction) async {
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
    Injector.showLoading();
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
        final transactionId = await _transactionUseCase.create(transaction);
        log('transaction id : $transactionId');
        final List<String> imagePaths = [];
        for (final photo in photos) {
          final String storagePath =
              '/${DefaultEnvironment.transaction}/$transactionId/${DateTime.now().millisecondsSinceEpoch}.png';
          await storageUseCase.put(
              imageToUpload: photo, imagePathStorage: storagePath);
          imagePaths.add(storagePath);
        }
        transactionId.fold(
          (l) {
            transaction = transaction.copyWith(id: l, photos: imagePaths);
            _transactionUseCase.update(transaction);
            Injector.hideLoading();
            emit(
              state.copyWith(
                status: CreateTransactionStatus.succes,
                lastUpdate: DateTime.now(),
              ),
            );
          },
          (r) {},
        );
      } on FirebaseException catch (e) {
        emit(
          state.copyWith(
            status: CreateTransactionStatus.failed,
            lastUpdate: DateTime.now(),
          ),
        );
        Injector.hideLoading();
        Injector.context.showSnackbar(
          translationKey: e.message ?? '',
        );
      }
    } else {
      Injector.hideLoading();
      state.copyWith(
        status: CreateTransactionStatus.noInternet,
        lastUpdate: DateTime.now(),
      );
      Injector.context.showSnackbar(
        translationKey: 'no_internet_connection',
      );
    }
  }

  Future<void> onEdit({required String id, String? note}) async {
    Injector.showLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        _transactionUseCase.update(
          TransactionModel(
              id: id,
              amount: state.amount!,
              category: state.category!,
              spendTime: state.spendTime,
              wallet: state.wallet!,
              photos: state.photo,
              note: note,
              createAt: DateTime.now().millisecondsSinceEpoch,
              lastUpdate: DateTime.now().millisecondsSinceEpoch),
        );
        Injector.hideLoading();
        emit(
          state.copyWith(
            status: CreateTransactionStatus.succes,
            lastUpdate: DateTime.now(),
          ),
        );
      } on FirebaseException catch (e) {
        Injector.hideLoading();
        emit(
          state.copyWith(status: CreateTransactionStatus.failed),
        );
        Injector.context.showSnackbar(
          translationKey: e.message ?? '',
        );
      }
    } else {
      Injector.hideLoading();
      state.copyWith(status: CreateTransactionStatus.noInternet);
      Injector.context.showSnackbar(
        translationKey: 'no_internet_connection',
      );
    }
  }
}
