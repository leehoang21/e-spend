import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/app_dimens.dart';
import '../../../themes/themes.dart';
import '../../../widgets/appbar_widget/appbar_widget.dart';
import '../../../widgets/image_app_widget/image_app.dart';
import '../../../widgets/loading_widget/loader_widget.dart';
import '../../../widgets/text_field_widget/text_field_widget.dart';
import 'bank_list_screen_constants.dart';
import 'bloc/bank_search_cubit.dart';

class BankListScreen extends StatelessWidget {
  BankListScreen({Key? key}) : super(key: key);

  final bankSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: BankListScreenConstants.title,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppDimens.space_8),
        child: Column(
          children: [
            TextFieldWidget(
              controller: bankSearchController
                ..addListener(
                  () {
                    context
                        .read<BankSearchCubit>()
                        .search(bankSearchController.text);
                  },
                ),
              hintText: BankListScreenConstants.searchBarHint,
              suffixIcon: context.read<BankSearchCubit>().state.keyword.isEmpty
                  ? const Icon(Icons.search, color: AppColor.ebonyClay)
                  : IconButton(
                      icon: const Icon(Icons.clear, color: AppColor.ebonyClay),
                      onPressed: () {
                        bankSearchController.clear();
                        context
                            .read<BankSearchCubit>()
                            .search(bankSearchController.text);
                      },
                    ),
            ),
            Expanded(
              child: BlocBuilder<BankSearchCubit, BankSearchState>(
                builder: (context, state) {
                  if (state is BankSearchLoaded) {
                    final bankList = state.bankList;
                    return ListView.builder(
                      key: const ValueKey<String>("bankList"),
                      itemBuilder: (context, index) {
                        final bank = bankList[index];
                        return ListTile(
                          title: Text("${bank.shortName!} (${bank.code!})"),
                          subtitle: Text(bank.name!),
                          leading: AppImageWidget(
                            path: bank.logo!,
                            width: AppDimens.space_72,
                            height: AppDimens.space_72,
                          ),
                          onTap: () async {
                            await context.popRoute(bank);
                          },
                        );
                      },
                      itemCount: bankList.length,
                    );
                  }
                  if (state is BankSearchNoResult) {
                    return Center(
                      child: Text(BankListScreenConstants.noResultText),
                    );
                  }

                  if (state is BankSearchError) {
                    return Center(
                      child: Text(BankListScreenConstants.errorMessage),
                    );
                  }
                  return const LoaderWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
