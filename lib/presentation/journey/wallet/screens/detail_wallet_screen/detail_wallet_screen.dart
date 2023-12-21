import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/constants/app_dimens.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';

import 'package:flutter_e_spend/common/utils/app_utils.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';

import 'package:flutter_e_spend/presentation/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/button_widget/text_button_widget.dart';
import 'package:flutter_e_spend/presentation/widgets/image_app_widget/image_app.dart';
import 'package:flutter_e_spend/presentation/widgets/text_field_widget/text_field_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';

import '../../../../../data/models/bank_info_model.dart';
import '../../../../themes/themes.dart';
import 'bloc/detail_wallet_cubit.dart';

class DetailWalletScreen extends StatefulWidget {
  const DetailWalletScreen({Key? key}) : super(key: key);

  @override
  State<DetailWalletScreen> createState() => _DetailWalletScreenState();
}

class _DetailWalletScreenState extends State<DetailWalletScreen> {
  late final TextEditingController walletTypeController;

  late final TextEditingController balanceController;

  late final TextEditingController walletNameController;

  late final Locale _locale;

  @override
  void initState() {
    final state = context.read<DetailWalletCubit>().state;
    walletTypeController = TextEditingController(
      text: state.walletTypeModel.name,
    );
    balanceController = TextEditingController(
      text: state.balance.getTextAmount,
    );
    walletNameController = TextEditingController(
      text: state.walletName,
    );
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
    return BlocBuilder<DetailWalletCubit, DetailWalletState>(
        builder: (context, state) {
      walletTypeController.text = translate(
          context.watch<DetailWalletCubit>().state.walletTypeModel.id! == 1
              ? 'cash'
              : 'bank_account');
      return Scaffold(
        backgroundColor: AppColor.ebonyClay,
        appBar: AppBarWidget(
          centerWidget: Text(
            translate('detail_wallet'),
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
                      onTap: () => showBottomSheet(context),
                      prefixIcon: Assets.images.icForm.image(
                        height: AppDimens.space_26,
                        width: AppDimens.space_26,
                      ),
                      enabled: context.watch<DetailWalletCubit>().state.isEdit,
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
                      enabled: context.watch<DetailWalletCubit>().state.isEdit,
                      prefixIcon: Assets.images.icCoins.image(
                        height: AppDimens.space_26,
                        width: AppDimens.space_26,
                      ),
                      controller: balanceController
                        ..addListener(() {
                          if (balanceController.text.length > 1) {
                            String str = _formatNumber(balanceController.text
                                .substring(0, balanceController.text.length - 1)
                                .replaceAll(',', ''));
                            log(str);
                            balanceController.value = TextEditingValue(
                              text: str + _currency,
                              selection:
                                  TextSelection.collapsed(offset: str.length),
                            );
                          }
                        }),
                      onChanged: (string) {},
                      hintText: '0$_currency',
                      keyboardType: TextInputType.number,
                      textStyle: ThemeText.style14Medium
                          .copyWith(height: 1.5, color: AppColor.grey),
                    ),
                    SizedBox(height: AppDimens.space_12),
                    TextFieldWidget(
                      enabled: context.watch<DetailWalletCubit>().state.isEdit,
                      prefixIcon: AppImageWidget(
                        path: context
                            .watch<DetailWalletCubit>()
                            .state
                            .walletImage,
                        height: AppDimens.space_26,
                        width: AppDimens.space_26,
                        defultImage: Assets.images.icWallet.image(),
                      ),
                      controller: walletNameController..addListener(() {}),
                      readOnly: context
                              .read<DetailWalletCubit>()
                              .state
                              .walletTypeModel ==
                          walletTypeList.last,
                      onTap: () async {
                        if (context
                                .read<DetailWalletCubit>()
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
            if (context.watch<DetailWalletCubit>().state.isEdit)
              Positioned(
                left: AppDimens.space_16,
                right: AppDimens.space_16,
                bottom: AppDimens.height_24,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButtonWidget(
                        onPressed: () {
                          context.read<DetailWalletCubit>().update(
                                context,
                                name: walletNameController.text,
                                balance: balanceController.text,
                                imagePath: imagePath,
                              );
                        },
                        title: 'update'.tr,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: TextButtonWidget(
                          buttonColor: AppColor.red,
                          onPressed: () {
                            context.read<DetailWalletCubit>().delete();
                          },
                          title: 'delete'.tr),
                    ),
                  ],
                ),
              ),
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
          value: BlocProvider.of<DetailWalletCubit>(context),
          child: BlocBuilder<DetailWalletCubit, DetailWalletState>(
              builder: (context, state) => Column(
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
                              .read<DetailWalletCubit>()
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
                                      .watch<DetailWalletCubit>()
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
                              .read<DetailWalletCubit>()
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
                                      .watch<DetailWalletCubit>()
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
                                  .read<DetailWalletCubit>()
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
