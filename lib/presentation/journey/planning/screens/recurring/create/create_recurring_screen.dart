import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import '../../../../../../common/constants/app_dimens.dart';
import '../../../../../../data/models/recurring_model.dart';
import '../../../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../../../widgets/button_widget/text_button_widget.dart';
import '../../../../../widgets/scaffold_wdiget/scaffold_widget.dart';
import 'bloc/create/create_recurring_bloc.dart';
import 'bloc/create/create_recurring_state.dart';
import 'create_recurring_constants.dart';
import 'widget/create_recurring_form.dart';

class CreateRecurringScreen extends StatefulWidget {
  final RecurringModel? data;

  const CreateRecurringScreen({Key? key, this.data}) : super(key: key);
  @override
  State<CreateRecurringScreen> createState() => _CreateRecurringScreenState();
}

class _CreateRecurringScreenState extends State<CreateRecurringScreen> {
  RecurringModel? _transaction;

  @override
  void initState() {
    _transaction = widget.data;

    if (_transaction != null) {
      context.read<CreateRecurringBloc>().initial(_transaction!);
    }
    super.initState();
  }

  @override
  void dispose() {
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
                      const CreateRecurringForm(),
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
    context.read<CreateRecurringBloc>().onCreate();
  }

  void _onEdit(BuildContext context) {
    context.read<CreateRecurringBloc>().onEdit();
  }
}
