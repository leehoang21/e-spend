// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreenProvider(),
      );
    },
    AuthSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthSettingsScreenProvider(),
      );
    },
    BankListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BankListScreenProvider(),
      );
    },
    CategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoryScreenProvider(
          key: args.key,
          category: args.category,
        ),
      );
    },
    CreateTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTransactionRouteArgs>(
          orElse: () => const CreateTransactionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateTransactionScreenProvider(
          key: args.key,
          transaction: args.transaction,
        ),
      );
    },
    CreateWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateWalletScreenProvider(),
      );
    },
    DetailTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<DetailTransactionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailTransactionScreenProvider(
          key: args.key,
          data: args.data,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreenProvider(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreenProvider(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreenProvider(),
      );
    },
    PlanningRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlanningScreenProvider(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreenProvider(),
      );
    },
    RegisterAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterAccountScreenProvider(),
      );
    },
    RegisterLoginWithPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterLoginWithPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterLoginWithPasswordScreenProvider(
          key: args.key,
          enabled: args.enabled,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterScreenProvider(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreenProvider(),
      );
    },
    StatisticRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatisticScreenProvider(),
      );
    },
    TransactionListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransactionListScreenProvider(),
      );
    },
    VerifyOtpRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyOtpRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyOtpScreenProvider(
          key: args.key,
          phoneNumber: args.phoneNumber,
          loginType: args.loginType,
          password: args.password,
        ),
      );
    },
    WalletListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WalletListScreenProvider(),
      );
    },
  };
}

/// generated route for
/// [AccountScreenProvider]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthSettingsScreenProvider]
class AuthSettingsRoute extends PageRouteInfo<void> {
  const AuthSettingsRoute({List<PageRouteInfo>? children})
      : super(
          AuthSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BankListScreenProvider]
class BankListRoute extends PageRouteInfo<void> {
  const BankListRoute({List<PageRouteInfo>? children})
      : super(
          BankListRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryScreenProvider]
class CategoryRoute extends PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({
    Key? key,
    required CategoryModel? category,
    List<PageRouteInfo>? children,
  }) : super(
          CategoryRoute.name,
          args: CategoryRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const PageInfo<CategoryRouteArgs> page =
      PageInfo<CategoryRouteArgs>(name);
}

class CategoryRouteArgs {
  const CategoryRouteArgs({
    this.key,
    required this.category,
  });

  final Key? key;

  final CategoryModel? category;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [CreateTransactionScreenProvider]
class CreateTransactionRoute extends PageRouteInfo<CreateTransactionRouteArgs> {
  CreateTransactionRoute({
    Key? key,
    TransactionModel? transaction,
    List<PageRouteInfo>? children,
  }) : super(
          CreateTransactionRoute.name,
          args: CreateTransactionRouteArgs(
            key: key,
            transaction: transaction,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateTransactionRoute';

  static const PageInfo<CreateTransactionRouteArgs> page =
      PageInfo<CreateTransactionRouteArgs>(name);
}

class CreateTransactionRouteArgs {
  const CreateTransactionRouteArgs({
    this.key,
    this.transaction,
  });

  final Key? key;

  final TransactionModel? transaction;

  @override
  String toString() {
    return 'CreateTransactionRouteArgs{key: $key, transaction: $transaction}';
  }
}

/// generated route for
/// [CreateWalletScreenProvider]
class CreateWalletRoute extends PageRouteInfo<void> {
  const CreateWalletRoute({List<PageRouteInfo>? children})
      : super(
          CreateWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateWalletRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetailTransactionScreenProvider]
class DetailTransactionRoute extends PageRouteInfo<DetailTransactionRouteArgs> {
  DetailTransactionRoute({
    Key? key,
    required TransactionModel data,
    List<PageRouteInfo>? children,
  }) : super(
          DetailTransactionRoute.name,
          args: DetailTransactionRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailTransactionRoute';

  static const PageInfo<DetailTransactionRouteArgs> page =
      PageInfo<DetailTransactionRouteArgs>(name);
}

class DetailTransactionRouteArgs {
  const DetailTransactionRouteArgs({
    this.key,
    required this.data,
  });

  final Key? key;

  final TransactionModel data;

  @override
  String toString() {
    return 'DetailTransactionRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [HomeScreenProvider]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreenProvider]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreenProvider]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PlanningScreenProvider]
class PlanningRoute extends PageRouteInfo<void> {
  const PlanningRoute({List<PageRouteInfo>? children})
      : super(
          PlanningRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlanningRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreenProvider]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterAccountScreenProvider]
class RegisterAccountRoute extends PageRouteInfo<void> {
  const RegisterAccountRoute({List<PageRouteInfo>? children})
      : super(
          RegisterAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterLoginWithPasswordScreenProvider]
class RegisterLoginWithPasswordRoute
    extends PageRouteInfo<RegisterLoginWithPasswordRouteArgs> {
  RegisterLoginWithPasswordRoute({
    Key? key,
    required bool enabled,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterLoginWithPasswordRoute.name,
          args: RegisterLoginWithPasswordRouteArgs(
            key: key,
            enabled: enabled,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterLoginWithPasswordRoute';

  static const PageInfo<RegisterLoginWithPasswordRouteArgs> page =
      PageInfo<RegisterLoginWithPasswordRouteArgs>(name);
}

class RegisterLoginWithPasswordRouteArgs {
  const RegisterLoginWithPasswordRouteArgs({
    this.key,
    required this.enabled,
  });

  final Key? key;

  final bool enabled;

  @override
  String toString() {
    return 'RegisterLoginWithPasswordRouteArgs{key: $key, enabled: $enabled}';
  }
}

/// generated route for
/// [RegisterScreenProvider]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [SettingsScreenProvider]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatisticScreenProvider]
class StatisticRoute extends PageRouteInfo<void> {
  const StatisticRoute({List<PageRouteInfo>? children})
      : super(
          StatisticRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatisticRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransactionListScreenProvider]
class TransactionListRoute extends PageRouteInfo<void> {
  const TransactionListRoute({List<PageRouteInfo>? children})
      : super(
          TransactionListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyOtpScreenProvider]
class VerifyOtpRoute extends PageRouteInfo<VerifyOtpRouteArgs> {
  VerifyOtpRoute({
    Key? key,
    required String phoneNumber,
    required LoginType loginType,
    String? password,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyOtpRoute.name,
          args: VerifyOtpRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            loginType: loginType,
            password: password,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyOtpRoute';

  static const PageInfo<VerifyOtpRouteArgs> page =
      PageInfo<VerifyOtpRouteArgs>(name);
}

class VerifyOtpRouteArgs {
  const VerifyOtpRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.loginType,
    this.password,
  });

  final Key? key;

  final String phoneNumber;

  final LoginType loginType;

  final String? password;

  @override
  String toString() {
    return 'VerifyOtpRouteArgs{key: $key, phoneNumber: $phoneNumber, loginType: $loginType, password: $password}';
  }
}

/// generated route for
/// [WalletListScreenProvider]
class WalletListRoute extends PageRouteInfo<void> {
  const WalletListRoute({List<PageRouteInfo>? children})
      : super(
          WalletListRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
