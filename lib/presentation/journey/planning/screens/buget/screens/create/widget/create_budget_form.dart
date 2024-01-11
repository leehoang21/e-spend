import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';

import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../../../../../common/constants/app_dimens.dart';
import '../../../../../../../../common/constants/string_constants.dart';
import '../../../../../../../../common/utils/format_utils.dart';
import '../../../../../../../../data/models/category_model.dart';
import '../../../../../../../../data/models/wallet_model.dart';
import '../../../../../../../widgets/image_app_widget/image_app.dart';
import '../../../../../../../widgets/text_field_widget/text_field_widget.dart';
import '../bloc/create/create_budget_bloc.dart';
import '../bloc/create/create_budget_state.dart';
import '../create_budget_constants.dart';

class CreateBugetForm extends StatefulWidget {
  const CreateBugetForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateBugetForm> createState() => _CreateBugetFormState();
}

class _CreateBugetFormState extends State<CreateBugetForm> {
  late CreateBugetBloc _createBugetBloc;
  String _walletImage = '';
  final TextEditingController _amountCtrl = TextEditingController();

  final TextEditingController _walletCtrl = TextEditingController();

  final TextEditingController _categoryCtl = TextEditingController();

  final TextEditingController _dateCtl = TextEditingController();
  @override
  void initState() {
    _createBugetBloc = context.read<CreateBugetBloc>();

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
            _createBugetBloc.onChangeAmount(
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
          hintText: CreateBugetConstants.chooseAWallet.tr,
          readOnly: true,
          onTap: _chooseWallet,
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
        BlocBuilder<CreateBugetBloc, CreateBugetState>(
            bloc: _createBugetBloc,
            buildWhen: (previous, current) =>
                previous.data.category != current.data.category,
            builder: (context, state) {
              return TextFieldWidget(
                controller: _categoryCtl,
                prefixIcon: AppImageWidget(
                  path: state.data.category != null
                      ? "${StringConstants.imagePath}${state.data.category!.category.title.toLowerCase()}.png"
                      : Assets.images.category.path,
                ),
                hintText: CreateBugetConstants.category.tr,
                readOnly: true,
                onTap: () => _chooseCategory(state.data.category),
              );
            }),
        SizedBox(
          height: AppDimens.height_12,
        ),
        TextFieldWidget(
          controller: _dateCtl,
          prefixIcon: Assets.images.calendar.image(),
          hintText: CreateBugetConstants.lastAt.tr,
          readOnly: true,
          onTap: _selectDate,
        ),
        SizedBox(
          height: AppDimens.height_12,
        ),
      ],
    );
  }

  Future<void> _chooseCategory(CategoryModel? currentCategory) async {
    final category = await context.pushRoute(CategoryRoute(
      category: currentCategory,
    ));
    if (category != null) {
      _createBugetBloc.chooseCategory(category as CategoryModel);

      _categoryCtl.text = translate(
          "transaction_category_screen_${category.category.title.toLowerCase()}");
    }
  }

  Future<void> _chooseWallet() async {
    final wallet = await context.pushRoute(WalletListRoute(isDetail: false));

    if (wallet != null) {
      _createBugetBloc.chooseWallet(wallet as WalletModel);
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
          child: BlocBuilder<CreateBugetBloc, CreateBugetState>(
            bloc: _createBugetBloc,
            buildWhen: (previous, current) =>
                previous.data.lastAt != current.data.lastAt,
            builder: (_, state) {
              return CupertinoDatePicker(
                onDateTimeChanged: _onChangeDate,
                initialDateTime: state.data.lastAt ?? DateTime.now(),
                mode: CupertinoDatePickerMode.date,
              );
            },
          ),
        );
      },
    );
  }

  void _onChangeDate(DateTime date) {
    _dateCtl.text = date.getTextDate;
    _createBugetBloc.changeSpendTime(date);
  }
}
