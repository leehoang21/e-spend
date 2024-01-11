import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import '../../../../../../../common/constants/app_dimens.dart';
import '../../../../../../../data/models/buget_model.dart';
import '../../../../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../../../../widgets/button_widget/text_button_widget.dart';
import '../../../../../../widgets/scaffold_wdiget/scaffold_widget.dart';
import 'bloc/create/create_budget_bloc.dart';
import 'bloc/create/create_budget_state.dart';
import 'create_budget_constants.dart';
import 'widget/create_budget_form.dart';

class CreateBugetScreen extends StatefulWidget {
  final BugetModel? data;

  const CreateBugetScreen({Key? key, this.data}) : super(key: key);
  @override
  State<CreateBugetScreen> createState() => _CreateBugetScreenState();
}

class _CreateBugetScreenState extends State<CreateBugetScreen> {
  BugetModel? _transaction;

  @override
  void initState() {
    _transaction = widget.data;

    if (_transaction != null) {
      context.read<CreateBugetBloc>().initial(_transaction!);
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
            ? CreateBugetConstants.addBuget.tr
            : CreateBugetConstants.updateBuget.tr,
      ),
      body: BlocListener<CreateBugetBloc, CreateBugetState>(
        listener: (context, state) {
          if (state.status == CreateBugetStatus.succes) {
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
                      const CreateBugetForm(),
                      SizedBox(
                        height: AppDimens.height_12,
                      ),
                    ],
                  ),
                  BlocBuilder<CreateBugetBloc, CreateBugetState>(
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
                              ? CreateBugetConstants.create.tr
                              : CreateBugetConstants.update.tr);
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
    context.read<CreateBugetBloc>().onCreate();
  }

  void _onEdit(BuildContext context) {
    context.read<CreateBugetBloc>().onEdit();
  }
}
