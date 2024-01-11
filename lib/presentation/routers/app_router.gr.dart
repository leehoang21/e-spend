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
    BugetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BugetScreenProvider(),
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
    CreateBugetRoute.name: (routeData) {
      final args = routeData.argsAs<CreateBugetRouteArgs>(
          orElse: () => const CreateBugetRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateBugetScreenProvider(
          key: args.key,
          data: args.data,
        ),
      );
    },
    CreateRecurringRoute.name: (routeData) {
      final args = routeData.argsAs<CreateRecurringRouteArgs>(
          orElse: () => const CreateRecurringRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateRecurringScreenProvider(
          key: args.key,
          data: args.data,
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
    DetailBugetRoute.name: (routeData) {
      final args = routeData.argsAs<DetailBugetRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailBugetScreenProvider(
          key: args.key,
          bugetModel: args.bugetModel,
        ),
      );
    },
    DetailRecurringRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRecurringRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailRecurringScreenProvider(
          key: args.key,
          model: args.model,
        ),
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
    DetailWalletRoute.name: (routeData) {
      final args = routeData.argsAs<DetailWalletRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailWalletScreenProvider(
          key: args.key,
          wallet: args.wallet,
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
    RecurringListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RecurringListScreenProvider(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreenProvider(),
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
    WalletListRoute.name: (routeData) {
      final args = routeData.argsAs<WalletListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WalletListScreenProvider(
          key: args.key,
          isDetail: args.isDetail,
        ),
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
/// [BugetScreenProvider]
class BugetRoute extends PageRouteInfo<void> {
  const BugetRoute({List<PageRouteInfo>? children})
      : super(
          BugetRoute.name,
          initialChildren: children,
        );

  static const String name = 'BugetRoute';

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
/// [CreateBugetScreenProvider]
class CreateBugetRoute extends PageRouteInfo<CreateBugetRouteArgs> {
  CreateBugetRoute({
    Key? key,
    BugetModel? data,
    List<PageRouteInfo>? children,
  }) : super(
          CreateBugetRoute.name,
          args: CreateBugetRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateBugetRoute';

  static const PageInfo<CreateBugetRouteArgs> page =
      PageInfo<CreateBugetRouteArgs>(name);
}

class CreateBugetRouteArgs {
  const CreateBugetRouteArgs({
    this.key,
    this.data,
  });

  final Key? key;

  final BugetModel? data;

  @override
  String toString() {
    return 'CreateBugetRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [CreateRecurringScreenProvider]
class CreateRecurringRoute extends PageRouteInfo<CreateRecurringRouteArgs> {
  CreateRecurringRoute({
    Key? key,
    RecurringModel? data,
    List<PageRouteInfo>? children,
  }) : super(
          CreateRecurringRoute.name,
          args: CreateRecurringRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateRecurringRoute';

  static const PageInfo<CreateRecurringRouteArgs> page =
      PageInfo<CreateRecurringRouteArgs>(name);
}

class CreateRecurringRouteArgs {
  const CreateRecurringRouteArgs({
    this.key,
    this.data,
  });

  final Key? key;

  final RecurringModel? data;

  @override
  String toString() {
    return 'CreateRecurringRouteArgs{key: $key, data: $data}';
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
/// [DetailBugetScreenProvider]
class DetailBugetRoute extends PageRouteInfo<DetailBugetRouteArgs> {
  DetailBugetRoute({
    Key? key,
    required BugetModel bugetModel,
    List<PageRouteInfo>? children,
  }) : super(
          DetailBugetRoute.name,
          args: DetailBugetRouteArgs(
            key: key,
            bugetModel: bugetModel,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailBugetRoute';

  static const PageInfo<DetailBugetRouteArgs> page =
      PageInfo<DetailBugetRouteArgs>(name);
}

class DetailBugetRouteArgs {
  const DetailBugetRouteArgs({
    this.key,
    required this.bugetModel,
  });

  final Key? key;

  final BugetModel bugetModel;

  @override
  String toString() {
    return 'DetailBugetRouteArgs{key: $key, bugetModel: $bugetModel}';
  }
}

/// generated route for
/// [DetailRecurringScreenProvider]
class DetailRecurringRoute extends PageRouteInfo<DetailRecurringRouteArgs> {
  DetailRecurringRoute({
    Key? key,
    required RecurringModel model,
    List<PageRouteInfo>? children,
  }) : super(
          DetailRecurringRoute.name,
          args: DetailRecurringRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRecurringRoute';

  static const PageInfo<DetailRecurringRouteArgs> page =
      PageInfo<DetailRecurringRouteArgs>(name);
}

class DetailRecurringRouteArgs {
  const DetailRecurringRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final RecurringModel model;

  @override
  String toString() {
    return 'DetailRecurringRouteArgs{key: $key, model: $model}';
  }
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
/// [DetailWalletScreenProvider]
class DetailWalletRoute extends PageRouteInfo<DetailWalletRouteArgs> {
  DetailWalletRoute({
    Key? key,
    required WalletModel wallet,
    List<PageRouteInfo>? children,
  }) : super(
          DetailWalletRoute.name,
          args: DetailWalletRouteArgs(
            key: key,
            wallet: wallet,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailWalletRoute';

  static const PageInfo<DetailWalletRouteArgs> page =
      PageInfo<DetailWalletRouteArgs>(name);
}

class DetailWalletRouteArgs {
  const DetailWalletRouteArgs({
    this.key,
    required this.wallet,
  });

  final Key? key;

  final WalletModel wallet;

  @override
  String toString() {
    return 'DetailWalletRouteArgs{key: $key, wallet: $wallet}';
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
/// [RecurringListScreenProvider]
class RecurringListRoute extends PageRouteInfo<void> {
  const RecurringListRoute({List<PageRouteInfo>? children})
      : super(
          RecurringListRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecurringListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreenProvider]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [WalletListScreenProvider]
class WalletListRoute extends PageRouteInfo<WalletListRouteArgs> {
  WalletListRoute({
    Key? key,
    required bool isDetail,
    List<PageRouteInfo>? children,
  }) : super(
          WalletListRoute.name,
          args: WalletListRouteArgs(
            key: key,
            isDetail: isDetail,
          ),
          initialChildren: children,
        );

  static const String name = 'WalletListRoute';

  static const PageInfo<WalletListRouteArgs> page =
      PageInfo<WalletListRouteArgs>(name);
}

class WalletListRouteArgs {
  const WalletListRouteArgs({
    this.key,
    required this.isDetail,
  });

  final Key? key;

  final bool isDetail;

  @override
  String toString() {
    return 'WalletListRouteArgs{key: $key, isDetail: $isDetail}';
  }
}
