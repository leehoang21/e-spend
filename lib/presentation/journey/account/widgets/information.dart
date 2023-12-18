import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../data/models/user_model.dart';
import '../../../themes/themes.dart';
import '../cubit/account_cubit.dart';
import 'babs_component_big_user_card.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable:
          context.read<AccountCubit>().hiveConfig.appBox.listenable(),
      builder: (context, box, widget) {
        final user =
            context.read<AccountCubit>().hiveConfig.user ?? UserModel();
        return BigUserCard(
          onTap: () {
            context.pushRoute(const ProfileRoute());
          },
          userName: user.userName,
          userProfilePic: user.avatar,
          backgroundColor: AppColor.ebonyClay,
          userMoreInfo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.email ?? '',
                style: ThemeText.body1.copyWith(color: AppColor.white),
                textAlign: TextAlign.start,
              ),
              Text(
                user.phoneNumber ?? '',
                style: ThemeText.body1.copyWith(color: AppColor.white),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        );
      },
    );
  }
}
