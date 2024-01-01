import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';

import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../../../../../../../common/constants/app_dimens.dart';
import '../../../../../../../common/constants/string_constants.dart';
import '../../../../../../../common/utils/format_utils.dart';
import '../../../../../../../data/models/category_model.dart';
import '../../../../../../../data/models/wallet_model.dart';
import '../../../../../../widgets/image_app_widget/image_app.dart';
import '../../../../../../widgets/text_field_widget/text_field_widget.dart';
import '../bloc/create/create_recurring_bloc.dart';
import '../bloc/create/create_recurring_state.dart';
import '../create_recurring_constants.dart';
import 'for_curring_widget.dart';

class CreateRecurringForm extends StatefulWidget {
  final TextEditingController amountCtrl;
  final TextEditingController walletCtrl;
  final TextEditingController categoryCtl;
  final TextEditingController dateCtl;
  final TextEditingController fromController;
  final TextEditingController recurringCountController;
  final TextEditingController recurringType;
  final TextEditingController noteCtl;
  final String walletImage;

  const CreateRecurringForm({
    Key? key,
    required this.amountCtrl,
    required this.walletCtrl,
    required this.categoryCtl,
    required this.dateCtl,
    required this.noteCtl,
    required this.walletImage,
    required this.fromController,
    required this.recurringCountController,
    required this.recurringType,
  }) : super(key: key);

  @override
  State<CreateRecurringForm> createState() => _CreateRecurringFormState();
}

class _CreateRecurringFormState extends State<CreateRecurringForm> {
  late CreateRecurringBloc _createRecurringBloc;
  String _walletImage = '';

  @override
  void initState() {
    _createRecurringBloc = BlocProvider.of(context);
    _walletImage = widget.walletImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          controller: widget.amountCtrl,
          keyboardType: const TextInputType.numberWithOptions(signed: true),
          prefixIcon: Assets.images.icCoins.image(),
          inputFormatter: [
            AmountInputFormatter(),
            LengthLimitingTextInputFormatter(12),
          ],
          hintText: '0₫',
          onChanged: (value) {
            _createRecurringBloc.onChangeAmount(
              int.parse(
                value.replaceAll(RegExp(r'[^0-9]'), ''),
              ),
            );
          },
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: widget.walletCtrl,
          prefixIcon: AppImageWidget(
            path: _walletImage,
            defultImage: Assets.images.icWallet.image(),
            height: AppDimens.space_36,
            width: AppDimens.space_36,
          ),
          hintText: CreateRecurringConstants.chooseAWallet.tr,
          readOnly: true,
          onTap: _chooseWallet,
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        BlocBuilder<CreateRecurringBloc, CreateRecurringState>(
            bloc: _createRecurringBloc,
            buildWhen: (previous, current) =>
                previous.category != current.category,
            builder: (context, state) {
              return TextFieldWidget(
                controller: widget.categoryCtl,
                prefixIcon: AppImageWidget(
                  path: state.category != null
                      ? "${StringConstants.imagePath}${state.category!.category.title.toLowerCase()}.png"
                      : Assets.images.category.path,
                ),
                hintText: CreateRecurringConstants.category.tr,
                readOnly: true,
                onTap: () => _chooseCategory(state.category),
              );
            }),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: widget.dateCtl,
          prefixIcon: Assets.images.calendar.image(),
          hintText: 'no for'.tr,
          readOnly: true,
          onTap: () {
            _selectDate(context);
          },
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: widget.noteCtl,
          prefixIcon: Assets.images.note.image(),
          hintText: CreateRecurringConstants.note.tr,
        ),
      ],
    );
  }

  Future<void> _chooseCategory(CategoryModel? currentCategory) async {
    final category = await context.pushRoute(CategoryRoute(
      category: currentCategory,
    ));
    if (category != null) {
      _createRecurringBloc.chooseCategory(category as CategoryModel);
      widget.categoryCtl.text = translate(
          "transaction_category_screen_${category.category.title.toLowerCase()}");
    }
  }

  Future<void> _chooseWallet() async {
    final wallet = await context.pushRoute(WalletListRoute(isDetail: false));

    if (wallet != null) {
      _createRecurringBloc.chooseWallet(wallet as WalletModel);
      widget.walletCtrl.text = wallet.walletName ?? '';
      _walletImage = wallet.walletImage ?? '';
      setState(() {});
    }
  }

  void _selectDate(BuildContext context) {
    context.showBottomSheet(
      child: ForCurringWidget(
        parentContext: context,
        fromController: widget.fromController,
        recurringCountController: widget.recurringCountController,
        recurringType: widget.recurringType,
      ),
    );
  }
}
