import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_e_spend/common/utils/internet_checker.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../data/models/wallet_model.dart';
import '../../../../../../data/models/wallet_type_model.dart';
import '../../../../../../domain/use_cases/wallet_use_case.dart';
import '../../../../../widgets/snackbar_widget/snackbar_widget.dart';

class DetailWalletState extends Equatable {
  final WalletTypeModel walletTypeModel;
  final int balance;
  final String walletName;
  final WalletTypeModel walletTypeSelecting;
  final bool isEdit;
  final String? walletImage;

  const DetailWalletState(
      {required this.walletTypeModel,
      required this.balance,
      required this.walletName,
      required this.walletTypeSelecting,
      this.walletImage,
      required this.isEdit});

  DetailWalletState update(
          {WalletTypeModel? walletTypeModel,
          int? balance,
          String? walletName,
          WalletTypeModel? walletTypeSelecting,
          bool? isEdit,
          String? walletImage}) =>
      DetailWalletState(
          walletTypeModel: walletTypeModel ?? this.walletTypeModel,
          balance: balance ?? this.balance,
          walletName: walletName ?? this.walletName,
          walletTypeSelecting: walletTypeSelecting ?? this.walletTypeSelecting,
          isEdit: isEdit ?? this.isEdit,
          walletImage: walletImage ?? this.walletImage);

  @override
  List<Object?> get props =>
      [walletTypeModel, balance, walletName, walletTypeSelecting, isEdit];
}

@injectable
class DetailWalletCubit extends BaseBloc<DetailWalletState> {
  final WalletUseCase walletUseCase;
  WalletModel? _wallet;

  DetailWalletCubit({required this.walletUseCase})
      : super(DetailWalletState(
          walletTypeModel: walletTypeList.first,
          walletTypeSelecting: walletTypeList.first,
          balance: 0,
          walletName: '',
          isEdit: false,
        ));

  init(WalletModel wallet) {
    _wallet = wallet;
    emit(
      state.update(
        walletTypeModel: walletTypeList
            .firstWhere((element) => element.id == wallet.walletType),
        walletTypeSelecting: walletTypeList
            .firstWhere((element) => element.id == wallet.walletType),
        balance: wallet.balance,
        walletName: wallet.walletName,
        isEdit: wallet.balance == wallet.firstBalance,
        walletImage: wallet.walletImage,
      ),
    );
  }

  void onChangedWalletTypeSelecting(WalletTypeModel walletTypeModel) {
    emit(state.update(walletTypeSelecting: walletTypeModel));
  }

  void onChangedWalletTypeSelected() {
    emit(state.update(walletTypeModel: state.walletTypeSelecting));
  }

  void onChangedWalletName(String name) {
    emit(state.update(walletName: name));
  }

  void onChangedWalletImage(String image) {
    emit(state.update(walletImage: image));
  }

  Future<void> update(BuildContext context,
      {required String name,
      required String balance,
      required imagePath}) async {
    if (await InternetChecker.hasConnection()) {
      try {
        if (balance.isNotEmpty) {
          balance = balance
              .substring(
                0,
                balance.length - 1,
              )
              .replaceAll(
                ',',
                '',
              );
        }

        WalletModel newWallet = WalletModel(
          walletName: name,
          id: _wallet?.id,
          balance: int.tryParse(balance) ?? 0,
          walletImage: imagePath,
          walletType: state.walletTypeModel.id,
          createAt: DateTime.now().millisecondsSinceEpoch,
          lastUpdate: DateTime.now().millisecondsSinceEpoch,
          firstBalance: int.tryParse(balance) ?? 0,
        );
        final result = await walletUseCase.put(walletModel: newWallet);
        if (result == null) {
          emit(
            state.update(
              walletTypeModel: walletTypeList.first,
              walletTypeSelecting: walletTypeList.first,
              balance: 0,
              walletName: '',
            ),
          );
          await context.popRoute(true);
          showSnackbar(
            translationKey: 'success',
            type: SnackBarType.success,
          );
        } else {
          showSnackbar(
              translationKey: 'error_message', type: SnackBarType.error);
        }
      } catch (e) {
        showSnackbar(translationKey: 'error_message', type: SnackBarType.error);
      }
    } else {
      showSnackbar(translationKey: 'error_message', type: SnackBarType.error);
    }
  }

  delete() async {
    final result = await walletUseCase.delete(id: _wallet?.id ?? '');
    if (result == null) {
      await pop(null);
    } else {
      showSnackbar(translationKey: 'error_message', type: SnackBarType.error);
    }
  }
}
