import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/domain/use_cases/buget_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../../common/utils/internet_checker.dart';
import '../../../../../../../../../common/utils/validator.dart';
import '../../../../../../../../../data/models/buget_model.dart';
import '../../../../../../../../../data/models/category_model.dart';
import '../../../../../../../../../data/models/wallet_model.dart';
import '../../../../../../../../bloc/base_bloc/base_bloc.dart';
import 'create_budget_state.dart';

@injectable
class CreateBugetBloc extends BaseBloc<CreateBugetState> {
  final BugetUseCase _useCase;
  // ignore: unused_field
  BugetModel? _buget;
  CreateBugetBloc(
    this._useCase,
  ) : super(CreateBugetState.initial());

  Future<void> initial(BugetModel buget) async {
    _buget = buget;
  }

  Future<void> chooseCategory(CategoryModel? category) async {
    if (category == null) return;
    final data = state.data.copyWith(category: category);
    emit(
      state.copyWith(
        data: data,
        buttonIsValid: AppValidator.validateCreateBugetButton(
          data,
        ),
      ),
    );
  }

  Future<void> changeSpendTime(DateTime spendTime) async {
    final data = state.data.copyWith(
      lastAt: spendTime,
    );
    emit(
      state.copyWith(
        data: data,
        buttonIsValid: AppValidator.validateCreateBugetButton(
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
        buttonIsValid: AppValidator.validateCreateBugetButton(
          data,
        ),
      ),
    );
  }

  Future<void> onChangeAmount(int amount) async {
    final data = state.data.copyWith(amount: amount);
    emit(
      state.copyWith(
        data: data,
        buttonIsValid: AppValidator.validateCreateBugetButton(
          data,
        ),
      ),
    );
  }

  Future<void> onCreate() async {
    showLoading();
    if (await InternetChecker.hasConnection()) {
      try {
        BugetModel buget = state.data;
        final bugetResult = await _useCase.put(buget);
        bugetResult.fold(
          (l) async {
            hideLoading();
            emit(
              state.copyWith(
                status: CreateBugetStatus.succes,
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
            status: CreateBugetStatus.failed,
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
        status: CreateBugetStatus.noInternet,
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
        BugetModel buget = state.data;

        _useCase.put(buget.copyWith(id: _buget?.id));
        hideLoading();
        await pop(null);
        emit(
          state.copyWith(
            status: CreateBugetStatus.succes,
          ),
        );
      } on FirebaseException catch (e) {
        hideLoading();
        emit(
          state.copyWith(status: CreateBugetStatus.failed),
        );
        showSnackbar(
          translationKey: e.message ?? '',
        );
      }
    } else {
      hideLoading();
      state.copyWith(status: CreateBugetStatus.noInternet);
      showSnackbar(
        translationKey: 'no_internet_connection',
      );
    }
  }
}
