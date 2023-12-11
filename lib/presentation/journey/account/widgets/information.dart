import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../themes/themes.dart';
import '../cubit/account_cubit.dart';
import 'babs_component_big_user_card.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BigUserCard(
      userName: context.watch<AccountCubit>().state.userModel.userName,
      userProfilePic: context.watch<AccountCubit>().state.userModel.avatar,
      backgroundColor: AppColor.ebonyClay,
      userMoreInfo: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.watch<AccountCubit>().state.userModel.email ?? '',
            style: ThemeText.body1.copyWith(color: AppColor.white),
            textAlign: TextAlign.start,
          ),
          Text(
            context.watch<AccountCubit>().state.userModel.phoneNumber,
            style: ThemeText.body1.copyWith(color: AppColor.white),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
