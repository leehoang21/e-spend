import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';

import 'package:flutter_e_spend/common/utils/app_utils.dart';

import 'package:flutter_e_spend/presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';

import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';

import '../../../../../data/models/bank_info_model.dart';
import '../../../../themes/themes.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  late final TextEditingController walletTypeController;

  late final TextEditingController balanceController;

  late final TextEditingController walletNameController;
  late final Locale _locale;

  @override
  void initState() {
    walletTypeController = TextEditingController();
    balanceController = TextEditingController();
    walletNameController = TextEditingController();
    _locale = const Locale('en');
    super.initState();
  }

  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale.languageCode)
          .format(num.tryParse(s) ?? 0);

  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: 'vi').currencySymbol;

  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateWalletCubit, CreateWalletState>(
        builder: (context, createWalletState) {
      walletTypeController.text = translate(
          context.watch<CreateWalletCubit>().state.walletTypeModel.id! == 1
              ? 'cash'
              : 'bank_account');
      return Scaffold(
        backgroundColor: AppColor.ebonyClay,
        appBar: AppBarWidget(
          centerWidget: Text(
            translate('add_wallet'),
            textAlign: TextAlign.center,
            style: ThemeText.style18Bold.copyWith(color: AppColor.white),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.white,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: AppDimens.space_16),
              padding: EdgeInsets.only(top: AppDimens.height_20),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppDimens.radius_20),
                      topRight: Radius.circular(AppDimens.radius_20))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translate(
                        "wallet_type",
                      ),
                      style: ThemeText.style14Medium
                          .copyWith(fontSize: AppDimens.space_16),
                    ),
                    SizedBox(height: AppDimens.space_12),
                    TextFieldWidget(
                      onTap: () {
                        //showBottomSheet(context);
                      },
                      prefixIcon: Assets.images.icForm.image(
                        height: AppDimens.space_26,
                        width: AppDimens.space_26,
                      ),
                      readOnly: true,
                      controller: walletTypeController,
                      textStyle: ThemeText.style14Medium
                          .copyWith(height: 1.5, color: AppColor.grey),
                    ),
                    SizedBox(height: AppDimens.space_16),
                    Text(
                      translate(
                        "wallet_info",
                      ),
                      style: ThemeText.style14Medium
                          .copyWith(fontSize: AppDimens.space_16),
                    ),
                    SizedBox(height: AppDimens.space_12),
                    TextFieldWidget(
                      prefixIcon: Assets.images.icCoins.image(
                        height: AppDimens.space_26,
                        width: AppDimens.space_26,
                      ),
                      controller: balanceController,
                      onChanged: (string) {
                        if (string.length > 1) {
                          String str = _formatNumber(string
                              .substring(0, string.length - 1)
                              .replaceAll(',', ''));
                          log('str$string');
                          log('balanceController${balanceController.text}');
                          balanceController.value = TextEditingValue(
                            text: str + _currency,
                            selection:
                                TextSelection.collapsed(offset: str.length),
                          );
                          context
                              .read<CreateWalletCubit>()
                              .onChangedButtonState(
                                  walletNameController.text.isNotEmpty);
                        } else {
                          context
                              .read<CreateWalletCubit>()
                              .onChangedButtonState(false);
                        }
                      },
                      hintText: '0$_currency',
                      keyboardType: TextInputType.number,
                      textStyle: ThemeText.style14Medium
                          .copyWith(height: 1.5, color: AppColor.grey),
                    ),
                    SizedBox(height: AppDimens.space_12),
                    TextFieldWidget(
                      prefixIcon: Assets.images.icWallet.image(
                          height: AppDimens.space_26,
                          width: AppDimens.space_26),
                      controller: walletNameController
                        ..addListener(() {
                          context
                              .read<CreateWalletCubit>()
                              .onChangedButtonState(
                                  walletNameController.text.isNotEmpty);
                        }),
                      readOnly: context
                              .read<CreateWalletCubit>()
                              .state
                              .walletTypeModel ==
                          walletTypeList.last,
                      onTap: () async {
                        if (context
                                .read<CreateWalletCubit>()
                                .state
                                .walletTypeModel ==
                            walletTypeList.last) {
                          final result =
                              await context.pushRoute(const BankListRoute());

                          if (result != null) {
                            walletNameController.text =
                                (result as BankInfoModel).code ?? "";
                            imagePath = (result).logo ?? "";
                          }
                        }
                      },
                      hintText: translate('wallet_name'),
                      textStyle: ThemeText.style14Medium
                          .copyWith(height: 1.5, color: AppColor.grey),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: AppDimens.space_16,
                right: AppDimens.space_16,
                bottom: AppDimens.space_16,
                child: TextButtonWidget(
                  onPressed: () {
                    context.read<CreateWalletCubit>().onCreateWallet(context,
                        name: walletNameController.text,
                        balance: balanceController.text,
                        imagePath: imagePath);
                    walletNameController.text = '';
                    balanceController.text = '';
                    FocusScope.of(context).unfocus();
                  },
                  buttonState:
                      context.watch<CreateWalletCubit>().state.buttonState,
                  title: translate('create'),
                )),
          ],
        ),
      );
    });
  }

  void showBottomSheet(BuildContext context) => showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (BuildContext bottomContext) {
        return BlocProvider.value(
          value: BlocProvider.of<CreateWalletCubit>(context),
          child: BlocBuilder<CreateWalletCubit, CreateWalletState>(
              builder: (context, createWalletState) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AppBarWidget(
                        leading: const SizedBox(),
                        centerWidget: Text(
                          translate(('wallet_type')),
                          textAlign: TextAlign.center,
                          style: ThemeText.style18Bold.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColor.white,
                          ),
                        ),
                        action: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.close,
                              color: AppColor.white,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimens.space_16),
                        child: ListTile(
                          onTap: () => context
                              .read<CreateWalletCubit>()
                              .onChangedWalletTypeSelecting(
                                  walletTypeList.first),
                          dense: true,
                          leading: Assets.images.icPaperMoney.image(
                            height: AppDimens.space_26,
                            width: AppDimens.space_26,
                          ),
                          title: Text(
                            translate('cash'),
                            style: ThemeText.style14Medium,
                          ),
                          trailing: Visibility(
                              visible: context
                                      .watch<CreateWalletCubit>()
                                      .state
                                      .walletTypeSelecting ==
                                  walletTypeList.first,
                              child: const Icon(Icons.check)),
                        ),
                      ),
                      SizedBox(height: AppDimens.space_12),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimens.space_16),
                        child: ListTile(
                          onTap: () => context
                              .read<CreateWalletCubit>()
                              .onChangedWalletTypeSelecting(
                                  walletTypeList.last),
                          dense: true,
                          leading: Assets.images.icBankCards.image(
                              height: AppDimens.space_26,
                              width: AppDimens.space_26),
                          title: Text(
                            translate('bank_account'),
                            style: ThemeText.style14Medium,
                          ),
                          trailing: Visibility(
                              visible: context
                                      .watch<CreateWalletCubit>()
                                      .state
                                      .walletTypeSelecting ==
                                  walletTypeList.last,
                              child: const Icon(Icons.check)),
                        ),
                      ),
                      SizedBox(height: AppDimens.space_12),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppDimens.space_16,
                            right: AppDimens.space_16,
                            bottom: AppDimens.space_16),
                        child: TextButtonWidget(
                            buttonColor: AppColor.ebonyClay,
                            title: translate('confirm'),
                            onPressed: () {
                              context
                                  .read<CreateWalletCubit>()
                                  .onChangedWalletTypeSelected();
                              walletNameController.text = '';
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  )),
        );
      });
}
