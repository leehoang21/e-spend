import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/data/models/recurring_model.dart';

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
  const CreateRecurringForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateRecurringForm> createState() => _CreateRecurringFormState();
}

class _CreateRecurringFormState extends State<CreateRecurringForm> {
  late CreateRecurringBloc _createRecurringBloc;
  String _walletImage = '';
  final TextEditingController _amountCtrl = TextEditingController();

  final TextEditingController _walletCtrl = TextEditingController();

  final TextEditingController _categoryCtl = TextEditingController();

  final TextEditingController _dateCtl = TextEditingController();

  final TextEditingController _noteCtl = TextEditingController();
  final TextEditingController _recurringType = TextEditingController();

  @override
  void initState() {
    _createRecurringBloc = context.read<CreateRecurringBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          controller: _amountCtrl,
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
          controller: _walletCtrl,
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
                previous.data.category != current.data.category,
            builder: (context, state) {
              return TextFieldWidget(
                controller: _categoryCtl,
                prefixIcon: AppImageWidget(
                  path: state.data.category != null
                      ? "${StringConstants.imagePath}${state.data.category!.title.toLowerCase()}.png"
                      : Assets.images.category.path,
                ),
                hintText: CreateRecurringConstants.category.tr,
                readOnly: true,
                onTap: () => _chooseCategory(
                  CategoryModel(
                    category: state.data.category ?? CategoryType.other,
                  ),
                ),
              );
            }),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: _dateCtl,
          prefixIcon: Assets.images.calendar.image(),
          hintText: 'firstAt'.tr,
          readOnly: true,
          onTap: _selectDate,
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: _recurringType,
          prefixIcon: Assets.icons.repeat.image(
            width: AppDimens.space_14,
            height: AppDimens.space_14,
          ),
          readOnly: true,
          onTap: () {
            _repeat(context);
          },
          hintText: CreateRecurringConstants.repeat.tr,
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: _noteCtl,
          prefixIcon: Assets.images.note.image(),
          hintText: CreateRecurringConstants.note.tr,
          onChanged: _createRecurringBloc.changeNote,
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

      _categoryCtl.text = translate(
          "transaction_category_screen_${category.category.title.toLowerCase()}");
    }
  }

  Future<void> _chooseWallet() async {
    final wallet = await context.pushRoute(WalletListRoute(isDetail: false));

    if (wallet != null) {
      _createRecurringBloc.chooseWallet(wallet as WalletModel);
      _walletCtrl.text = wallet.walletName ?? '';
      _walletImage = wallet.walletImage ?? '';
      setState(() {});
    }
  }

  void _selectDate() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: BlocBuilder<CreateRecurringBloc, CreateRecurringState>(
            bloc: _createRecurringBloc,
            buildWhen: (previous, current) =>
                previous.data.createAt != current.data.createAt,
            builder: (_, state) {
              return CupertinoDatePicker(
                onDateTimeChanged: _onChangeDate,
                initialDateTime: state.data.createAt ?? DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                maximumDate: DateTime.now(),
              );
            },
          ),
        );
      },
    );
  }

  void _onChangeDate(DateTime date) {
    _dateCtl.text = date.getTextDate;
    _createRecurringBloc.changeSpendTime(date);
  }

  void _repeat(BuildContext context) {
    context.showBottomSheet(
      child: ForCurringWidget(
        onConfirm: (repeat) {
          _recurringType.text = repeat.type?.title.tr ?? "";
        },
        parentContext: context,
        repeat: context.read<CreateRecurringBloc>().state.data.repeat ??
            const Repeat(),
      ),
    );
  }
}
