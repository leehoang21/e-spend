import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/enums/login_type.dart';
import '../../data/models/category_model.dart';
import '../journey/account/account_screen_provider.dart';
import '../journey/account/auth_setting/auth_setting_screen_provider.dart';
import '../journey/account/auth_setting/widgets/login_with_password_screen.dart';
import '../journey/auth/login/login_screen_provider.dart';
import '../journey/auth/register/register_screen_provider.dart';
import '../journey/auth/register_account/register_account_provider.dart';
import '../journey/auth/verify_otp/verify_otp_screen_provider.dart';
import '../journey/home/home_screen_provider.dart';
import '../journey/main/main_screen_provider.dart';
import '../journey/planning/planning_screen_provider.dart';
import '../journey/statistics/statistic_screen_provider.dart';
import '../journey/transaction/bank_list_screen/bank_list_screen_provider.dart';
import '../journey/transaction/category_screen/category_screen_provider.dart';
import '../journey/transaction/create/create_transaction_screen_provider.dart';
import '../journey/wallet/screens/create_wallet_screen/create_wallet_screen_provider.dart';
import '../journey/wallet/screens/wallet_list_screen/wallet_list_screen_provider.dart';
part 'app_router.gr.dart';
//flutter pub run build_runner build --delete-conflicting-outputs

@AutoRouterConfig(replaceInRouteName: 'ScreenProvider,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //auth
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: RegisterAccountRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: VerifyOtpRoute.page,
        ),
        //transaction
        AutoRoute(
          page: BankListRoute.page,
        ),
        AutoRoute(
          page: CategoryRoute.page,
        ),
        AutoRoute(
          page: CreateTransactionRoute.page,
        ),
        //wallet
        AutoRoute(
          page: CreateWalletRoute.page,
        ),
        AutoRoute(
          page: WalletListRoute.page,
        ),
        //main
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: StatisticRoute.page,
            ),
            AutoRoute(
              page: PlanningRoute.page,
            ),
            AutoRoute(
              page: AccountRoute.page,
            ),
          ],
        ),
        //account
        AutoRoute(
          page: AuthSettingsRoute.page,
        ),
        AutoRoute(
          page: LoginWithPasswordRoute.page,
        ),
      ];
}
