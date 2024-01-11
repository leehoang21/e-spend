import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/recurring_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../common/utils/internet_checker.dart';
import '../../../../../../../../common/utils/validator.dart';
import '../../../../../../../../data/models/category_model.dart';
import '../../../../../../../../data/models/recurring_model.dart';
import '../../../../../../../../data/models/wallet_model.dart';
import '../../../../../../../bloc/base_bloc/base_bloc.dart';
import 'create_recurring_state.dart';

@injectable
class CreateRecurringBloc extends BaseBloc<CreateRecurringState> {
  final RecurringUseCase _useCase;
  // ignore: unused_field
  RecurringModel? _recurring;
  CreateRecurringBloc(
    this._useCase,
  ) : super(
          CreateRecurringState.initial(),
        );

  Future<void> initial(RecurringModel recurring) async {
    _recurring = recurring;
  }

  Future<void> chooseCategory(CategoryModel? category) async {
    if (category == null) return;
    final data = state.data.copyWith(category: category.category);
    emit(
      state.copyWith(
        data: data,
        buttonIsValid: AppValidator.validateCreateRecurringButton(
          data,
        ),
      ),
    );
  }

  Future<void> changeNote(
    String note,
  ) async {
    final data = state.data.copyWith(note: note);
    emit(
      state.copyWith(
        data: data,
      ),
    );
  }

  Future<void> changeRepeat(
    Repeat repeat,
  ) async {
    final data = state.data.copyWith(repeat: repeat);
    emit(
      state.copyWith(
        data: data,
        buttonIsValid: AppValidator.validateCreateRecurringButton(
          data,
        ),
      ),
    );
  }

  Future<void> changeSpendTime(DateTime spendTime) async {
    final data = state.data.copyWith(
      createAt: spendTime,
    );
    emit(
      state.copyWith(
        data: data,
        buttonIsValid: AppValidator.validateCreateRecurringButton(
          data,
        ),
      ),
    );
  }

  Future<void> chooseWallet(WalletModel? wallet) async {
    if (wallet == null) return;
    final data = state.data.copyWith(wallet: wallet);
    emit(
      state.copyWith(
        data: data,
        buttonIsValid: AppValidator.validateCreateRecurringButton(
          data,
        ),
      ),
    );
  }

  Future<void> onChangeAmount(int amount) async {
    final data = state.data.copyWith(defaultAmount: amount);
    emit(
      state.copyWith(
        data: data,
        buttonIsValid: AppValidator.validateCreateRecurringButton(
          data,
        ),
      ),
    );
  }

  Future<void> onCreate() async {
    showLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        RecurringModel recurring = state.data;
        final recurringResult = await _useCase.put(recurring);
        recurringResult.fold(
          (l) async {
            hideLoading();
            emit(
              state.copyWith(
                status: CreateRecurringStatus.succes,
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
      );
      showSnackbar(
        translationKey: 'no_internet_connection',
      );
    }
  }

  Future<void> onEdit() async {
    showLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        RecurringModel recurring = state.data;

        _useCase.put(recurring.copyWith(id: _recurring?.id));
        hideLoading();
        await pop(null);
        emit(
          state.copyWith(
            status: CreateRecurringStatus.succes,
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
