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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateTransactionScreenProvider(),
      );
    },
    CreateWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateWalletScreenProvider(),
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
    LoginWithPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<LoginWithPasswordRouteArgs>(
          orElse: () => const LoginWithPasswordRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginWithPasswordScreenProvider(key: args.key),
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
    RegisterAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterAccountScreenProvider(),
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
    StatisticRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatisticScreenProvider(),
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
class CreateTransactionRoute extends PageRouteInfo<void> {
  const CreateTransactionRoute({List<PageRouteInfo>? children})
      : super(
          CreateTransactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTransactionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [LoginWithPasswordScreenProvider]
class LoginWithPasswordRoute extends PageRouteInfo<LoginWithPasswordRouteArgs> {
  LoginWithPasswordRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginWithPasswordRoute.name,
          args: LoginWithPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginWithPasswordRoute';

  static const PageInfo<LoginWithPasswordRouteArgs> page =
      PageInfo<LoginWithPasswordRouteArgs>(name);
}

class LoginWithPasswordRouteArgs {
  const LoginWithPasswordRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginWithPasswordRouteArgs{key: $key}';
  }
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
