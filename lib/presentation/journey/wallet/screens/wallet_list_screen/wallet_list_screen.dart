import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../common/constants/app_dimens.dart';
import '../../../../../common/utils/app_utils.dart';
import '../../../../../data/models/wallet_model.dart';
import '../../../../themes/themes.dart';
import '../../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../../widgets/image_app_widget/image_app.dart';
import '../../../../widgets/loading_widget/loader_widget.dart';
import '../../../../widgets/refresh_widget.dart';
import 'bloc/wallet_list_cubit.dart';

class WalletListScreen extends StatelessWidget {
  WalletListScreen({Key? key}) : super(key: key);

  final refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ebonyClay,
      appBar: AppBarWidget(
        centerWidget: Text(
          'wallets'.tr,
          textAlign: TextAlign.center,
          style: ThemeText.style18Bold.copyWith(color: AppColor.white),
        ),
        //  color: AppColor.ebonyClay,
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
      body: Container(
          margin: EdgeInsets.only(top: AppDimens.space_16),
          padding: EdgeInsets.only(top: AppDimens.height_20),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimens.radius_20),
                  topRight: Radius.circular(AppDimens.radius_20))),
          child: BlocBuilder<WalletListCubit, WalletListState>(
              builder: (context, walletListState) {
            if (walletListState is WalletListLoaded) {
              return RefreshWidget(
                  controller: refreshController,
                  onRefresh: () async {
                    await context.read<WalletListCubit>().getWalletList();
                    refreshController.refreshCompleted();
                  },
                  child: ListView.builder(
                    itemBuilder: (context, index) => _buildWalletItem(
                        context, walletListState.walletList[index]),
                    itemCount: walletListState.walletList.length,
                  ));
            }

            if (walletListState is WalletListError) {
              return Center(
                child: Text('error_message'.tr),
              );
            }
            if (walletListState is WalletListNoResult) {
              return Container();
            }

            return const LoaderWidget();
          })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.black,
        onPressed: () async {
          final result = await context.pushRoute(const CreateWalletRoute());

          if (result is bool && result) {
            await context.read<WalletListCubit>().getWalletList();
          }
        },
        child: Icon(
          Icons.add_rounded,
          size: AppDimens.height_52,
        ),
      ),
    );
  }

  Widget _buildWalletItem(BuildContext context, WalletModel wallet) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, wallet);
      },
      child: Container(
        margin: EdgeInsets.only(
            bottom: AppDimens.space_16,
            left: AppDimens.space_16,
            right: AppDimens.space_16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(AppDimens.radius_16),
          boxShadow: [
            BoxShadow(
              color: AppColor.ebonyClay.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: AppDimens.space_16,
                  top: AppDimens.space_4,
                  bottom: AppDimens.space_4,
                  right: AppDimens.space_16),
              width: AppDimens.height_52,
              height: AppDimens.height_52,
              child: !isNullEmptyOrFalse(wallet.walletImage)
                  ? AppImageWidget(
                      path: wallet.walletImage!,
                      height: AppDimens.height_52,
                      width: AppDimens.height_52)
                  : Assets.images.icWallet.image(
                      height: AppDimens.height_52,
                      width: AppDimens.height_52,
                    ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: AppDimens.space_4),
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wallet.walletName ?? "",
                    style: ThemeText.style14Medium,
                    softWrap: true,
                  ),
                  Text(
                    formatMoney((wallet.balance ?? 0).toString()),
                    style: ThemeText.style12Regular
                        .copyWith(color: AppColor.green),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
