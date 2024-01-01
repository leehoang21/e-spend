import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/enums/category.dart';
import 'package:flutter_e_spend/common/extension/date_time_extension.dart';
import 'package:flutter_e_spend/common/extension/num_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import '../../../../../../common/constants/app_dimens.dart';
import '../../../../../../data/models/recurring_model.dart';
import '../../../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../../../widgets/button_widget/text_button_widget.dart';
import '../../../../../widgets/scaffold_wdiget/scaffold_widget.dart';
import '../../../../transaction/create/bloc/add_photo/add_photo_bloc.dart';
import 'bloc/create/create_recurring_bloc.dart';
import 'bloc/create/create_recurring_state.dart';
import 'create_recurring_constants.dart';
import 'widget/create_recurring_form.dart';
import 'widget/inovoice_photos_widget.dart';

class CreateRecurringScreen extends StatefulWidget {
  final RecurringModel? data;

  const CreateRecurringScreen({Key? key, this.data}) : super(key: key);
  @override
  State<CreateRecurringScreen> createState() => _CreateRecurringScreenState();
}

class _CreateRecurringScreenState extends State<CreateRecurringScreen> {
  final TextEditingController _amountCtrl = TextEditingController();

  final TextEditingController _walletCtrl = TextEditingController();

  final TextEditingController _categoryCtl = TextEditingController();

  final TextEditingController _dateCtl = TextEditingController();

  final TextEditingController _noteCtl = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController recurringCountController =
      TextEditingController();
  final TextEditingController recurringType = TextEditingController();

  RecurringModel? _transaction;
  String _walletImage = '';

  @override
  void initState() {
    _transaction = widget.data;

    if (_transaction != null) {
      _amountCtrl.text = _transaction!.transaction.amount.getTextAmount;
      _walletCtrl.text = _transaction!.transaction.wallet.walletName ?? '';
      _categoryCtl.text = _transaction!.transaction.category.category.title;
      _dateCtl.text = _transaction!.transaction.spendTime.toDate().getTextDate;
      _noteCtl.text = _transaction?.transaction.note ?? '';
      _walletImage = _transaction!.transaction.wallet.walletImage ?? '';
      context.read<CreateRecurringBloc>().initial(_transaction!);
      context.read<AddPhotoBloc>().init(_transaction!.transaction.photos);
    }
    super.initState();
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _walletCtrl.dispose();
    _categoryCtl.dispose();
    _dateCtl.dispose();
    _noteCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appbar: AppBarWidget(
        title: widget.data == null
            ? CreateRecurringConstants.addTransaction.tr
            : CreateRecurringConstants.updateTransaction.tr,
      ),
      body: BlocListener<CreateRecurringBloc, CreateRecurringState>(
        listener: (context, state) {
          if (state.status == CreateRecurringStatus.succes) {
            Navigator.pop(context);
          }
        },
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: AppDimens.height_24,
                      ),
                      CreateRecurringForm(
                        walletImage: _walletImage,
                        amountCtrl: _amountCtrl,
                        walletCtrl: _walletCtrl,
                        categoryCtl: _categoryCtl,
                        dateCtl: _dateCtl,
                        noteCtl: _noteCtl,
                        fromController: fromController,
                        recurringCountController: recurringCountController,
                        recurringType: recurringType,
                      ),
                      SizedBox(
                        height: AppDimens.height_12,
                      ),
                      const InvoicePhotosWidget(),
                      SizedBox(
                        height: AppDimens.height_12,
                      ),
                    ],
                  ),
                  BlocBuilder<CreateRecurringBloc, CreateRecurringState>(
                    buildWhen: (previous, current) =>
                        previous.buttonIsValid != current.buttonIsValid,
                    builder: (context, state) {
                      return TextButtonWidget(
                          buttonState: state.buttonIsValid
                              ? ButtonState.active
                              : ButtonState.inactive,
                          onPressed: () {
                            if (state.buttonIsValid) {
                              if (widget.data != null) {
                                _onEdit(context);
                              } else {
                                _onCreate(context);
                              }
                            }
                          },
                          title: widget.data == null
                              ? CreateRecurringConstants.create.tr
                              : CreateRecurringConstants.update.tr);
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _onCreate(BuildContext context) {
    context.read<CreateRecurringBloc>().onCreate(
          note: _noteCtl.text,
          photos: context.read<AddPhotoBloc>().state.photos,
          recurringCount: recurringCountController.text,
          recurringType: recurringType.text,
          startFrom: fromController.text,
        );
  }

  void _onEdit(BuildContext context) {
    context.read<CreateRecurringBloc>().onEdit(
          id: '',
          note: _noteCtl.text,
          photos: context.read<AddPhotoBloc>().state.photos,
          recurringCount: recurringCountController.text,
          recurringType: recurringType.text,
          startFrom: fromController.text,
        );
  }
}
