import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_e_spend/common/utils/internet_checker.dart';
import 'package:flutter_e_spend/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../common/di/injector.dart';
import '../../../../../../data/models/wallet_model.dart';
import '../../../../../../data/models/wallet_type_model.dart';
import '../../../../../../domain/use_cases/wallet_use_case.dart';
import '../../../../../widgets/snackbar_widget/snackbar_widget.dart';

class CreateWalletState extends Equatable {
  final WalletTypeModel walletTypeModel;
  final int balance;
  final String walletName;
  final WalletTypeModel walletTypeSelecting;
  final ButtonState buttonState;
  final String? walletImage;

  const CreateWalletState(
      {required this.walletTypeModel,
      required this.balance,
      required this.walletName,
      required this.walletTypeSelecting,
      this.walletImage,
      required this.buttonState});

  CreateWalletState update(
          {WalletTypeModel? walletTypeModel,
          int? balance,
          String? walletName,
          WalletTypeModel? walletTypeSelecting,
          ButtonState? buttonState,
          String? walletImage}) =>
      CreateWalletState(
          walletTypeModel: walletTypeModel ?? this.walletTypeModel,
          balance: balance ?? this.balance,
          walletName: walletName ?? this.walletName,
          walletTypeSelecting: walletTypeSelecting ?? this.walletTypeSelecting,
          buttonState: buttonState ?? this.buttonState,
          walletImage: walletImage ?? this.walletImage);

  @override
  List<Object?> get props =>
      [walletTypeModel, balance, walletName, walletTypeSelecting, buttonState];
}

@injectable
class CreateWalletCubit extends Cubit<CreateWalletState> {
  final WalletUseCase walletUseCase;

  CreateWalletCubit({required this.walletUseCase})
      : super(CreateWalletState(
            walletTypeModel: walletTypeList.first,
            walletTypeSelecting: walletTypeList.first,
            balance: 0,
            walletName: '',
            buttonState: ButtonState.inactive));

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

  void onChangedButtonState(bool active) {
    emit(state.update(
        buttonState: active ? ButtonState.active : ButtonState.inactive));
  }

  Future<void> onCreateWallet(BuildContext context,
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
          balance: int.parse(balance),
          walletImage: imagePath,
          walletType: state.walletTypeModel.id,
          createAt: DateTime.now().millisecondsSinceEpoch,
          lastUpdate: DateTime.now().millisecondsSinceEpoch,
        );
        final result = await walletUseCase.put(walletModel: newWallet);
        if (result == null) {
          emit(state.update(
              walletTypeModel: walletTypeList.first,
              walletTypeSelecting: walletTypeList.first,
              balance: 0,
              walletName: '',
              buttonState: ButtonState.inactive));
          await context.popRoute(true);
          Injector.context.showSnackbar(
            translationKey: 'success',
            type: SnackBarType.success,
          );
        } else {
          Injector.context.showSnackbar(
              translationKey: 'error_message', type: SnackBarType.error);
        }
      } catch (e) {
        Injector.context.showSnackbar(
            translationKey: 'error_message', type: SnackBarType.error);
      }
    } else {
      Injector.context.showSnackbar(
          translationKey: 'error_message', type: SnackBarType.error);
    }
  }
}
