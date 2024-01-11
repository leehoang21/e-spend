// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/auth_repository_impl.dart' as _i32;
import '../../data/repositories/buget_repository_impl.dart' as _i36;
import '../../data/repositories/recurring_repository_impl.dart' as _i43;
import '../../data/repositories/statistics_repository_impl.dart' as _i15;
import '../../data/repositories/storage_repository_impl.dart' as _i17;
import '../../data/repositories/transaction_repository_impl.dart' as _i49;
import '../../data/repositories/user_repository_impl.dart' as _i23;
import '../../data/repositories/vn_bank_repository.dart' as _i26;
import '../../data/repositories/wallet_repository.dart' as _i29;
import '../../domain/repositories/auth_repository.dart' as _i31;
import '../../domain/repositories/buget_repository.dart' as _i35;
import '../../domain/repositories/recurring_repository.dart' as _i42;
import '../../domain/repositories/statistics_repository.dart' as _i14;
import '../../domain/repositories/storage_repository.dart' as _i16;
import '../../domain/repositories/transaction_repository.dart' as _i48;
import '../../domain/repositories/user_repository.dart' as _i22;
import '../../domain/repositories/vn_bank_repository.dart' as _i25;
import '../../domain/repositories/wallet_repository.dart' as _i28;
import '../../domain/use_cases/auth_use_case.dart' as _i33;
import '../../domain/use_cases/buget_use_case.dart' as _i37;
import '../../domain/use_cases/recurring_use_case.dart' as _i44;
import '../../domain/use_cases/statistic_use_case.dart' as _i47;
import '../../domain/use_cases/storage_use_case.dart' as _i18;
import '../../domain/use_cases/transaction_use_case.dart' as _i50;
import '../../domain/use_cases/user_use_case.dart' as _i24;
import '../../domain/use_cases/vn_bank_use_case.dart' as _i27;
import '../../domain/use_cases/wallet_use_case.dart' as _i30;
import '../../presentation/bloc/loading_bloc/loading_bloc.dart' as _i10;
import '../../presentation/bloc/schedule/schedule_cubit.dart' as _i60;
import '../../presentation/journey/account/auth_setting/cubit/auth_settings_cubit.dart'
    as _i53;
import '../../presentation/journey/account/cubit/account_cubit.dart' as _i52;
import '../../presentation/journey/account/profile/cubit/profile_cubit.dart'
    as _i41;
import '../../presentation/journey/account/settings/cubit/settings_cubit.dart'
    as _i46;
import '../../presentation/journey/auth/login/cubit/login_cubit.dart' as _i59;
import '../../presentation/journey/auth/register/cubit/register_cubit.dart'
    as _i45;
import '../../presentation/journey/home/cubit/home_cubit.dart' as _i58;
import '../../presentation/journey/main/bloc/tab_manger_cubit.dart' as _i19;
import '../../presentation/journey/planning/main/cubit/planning_cubit.dart'
    as _i13;
import '../../presentation/journey/planning/screens/buget/screens/buget_list/cubit/buget_cubit.dart'
    as _i54;
import '../../presentation/journey/planning/screens/buget/screens/create/bloc/create/create_budget_bloc.dart'
    as _i38;
import '../../presentation/journey/planning/screens/recurring/create/bloc/create/create_recurring_bloc.dart'
    as _i55;
import '../../presentation/journey/statistics/cubit/statistic_cubit.dart'
    as _i61;
import '../../presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart'
    as _i34;
import '../../presentation/journey/transaction/category_screen/bloc/category_select_cubit.dart'
    as _i5;
import '../../presentation/journey/transaction/create/bloc/add_photo/add_photo_bloc.dart'
    as _i3;
import '../../presentation/journey/transaction/create/bloc/create/create_transaction_bloc.dart'
    as _i56;
import '../../presentation/journey/transaction/detail/bloc/detail_transaction_bloc.dart'
    as _i57;
import '../../presentation/journey/transaction/transaction_list_screen/bloc/transaction_list_cubit.dart'
    as _i62;
import '../../presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart'
    as _i39;
import '../../presentation/journey/wallet/screens/detail_wallet_screen/bloc/detail_wallet_cubit.dart'
    as _i40;
import '../../presentation/journey/wallet/screens/wallet_list_screen/bloc/wallet_list_cubit.dart'
    as _i51;
import '../../presentation/widgets/change_time/time/time_cubit.dart' as _i20;
import '../../presentation/widgets/pick_image/cubit/pick_image_cubit.dart'
    as _i12;
import '../configs/biometric/biometric_config.dart' as _i4;
import '../configs/dio/dio_config.dart' as _i6;
import '../configs/firebase_config.dart' as _i8;
import '../configs/hive/hive_config.dart' as _i9;
import '../configs/lang/translate_preferences.dart' as _i21;
import '../configs/notification/notification_config.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AddPhotoBloc>(() => _i3.AddPhotoBloc());
    gh.singleton<_i4.BiometricConfig>(_i4.BiometricConfig()..init());
    gh.factory<_i5.CategorySelectCubit>(() => _i5.CategorySelectCubit());
    gh.lazySingleton<_i6.DioApiClient>(
        () => _i6.DioApiClient(options: gh<_i7.BaseOptions>()));
    gh.lazySingleton<_i8.FirebaseConfig>(() => _i8.FirebaseConfig()..init());
    gh.singleton<_i9.HiveConfig>(_i9.HiveConfig()..init());
    gh.lazySingleton<_i10.LoadingBloc>(() => _i10.LoadingBloc());
    gh.lazySingleton<_i11.NotificationConfig>(
        () => _i11.NotificationConfig(gh<_i6.DioApiClient>()));
    gh.factory<_i12.PickImageCubit>(() => _i12.PickImageCubit());
    gh.factory<_i13.PlanningCubit>(() => _i13.PlanningCubit());
    gh.factory<_i14.StatisticsRepository>(
        () => _i15.StatisticsRepositoryImpl(gh<_i8.FirebaseConfig>()));
    gh.factory<_i16.StorageRepository>(
        () => _i17.StorageRepositoryImpl(gh<_i8.FirebaseConfig>()));
    gh.factory<_i18.StorageUseCase>(
        () => _i18.StorageUseCase(gh<_i16.StorageRepository>()));
    gh.factory<_i19.TabMangerCubit>(() => _i19.TabMangerCubit());
    gh.singleton<_i20.TimeCubit>(_i20.TimeCubit());
    gh.singleton<_i21.TranslatePreferences>(
        _i21.TranslatePreferences(gh<_i9.HiveConfig>()));
    gh.factory<_i22.UserRepository>(() => _i23.UserRepositoryImpl(
          gh<_i8.FirebaseConfig>(),
          gh<_i9.HiveConfig>(),
          gh<_i16.StorageRepository>(),
        ));
    gh.factory<_i24.UserUseCase>(
        () => _i24.UserUseCase(gh<_i22.UserRepository>()));
    gh.factory<_i25.VnBankRepository>(
        () => _i26.VnBankRepositoryImpl(gh<_i6.DioApiClient>()));
    gh.factory<_i27.VnBankUseCase>(
        () => _i27.VnBankUseCase(gh<_i25.VnBankRepository>()));
    gh.factory<_i28.WalletRepository>(
        () => _i29.WalletRepositoryImpl(gh<_i8.FirebaseConfig>()));
    gh.factory<_i30.WalletUseCase>(
        () => _i30.WalletUseCase(repository: gh<_i28.WalletRepository>()));
    gh.factory<_i31.AuthRepository>(() => _i32.AuthRepositoryImpl(
          gh<_i9.HiveConfig>(),
          gh<_i8.FirebaseConfig>(),
          gh<_i4.BiometricConfig>(),
        ));
    gh.factory<_i33.AuthUseCase>(() => _i33.AuthUseCase(
          gh<_i9.HiveConfig>(),
          repository: gh<_i31.AuthRepository>(),
          userRepository: gh<_i22.UserRepository>(),
        ));
    gh.factory<_i34.BankSearchCubit>(
        () => _i34.BankSearchCubit(gh<_i27.VnBankUseCase>()));
    gh.factory<_i35.BugetRepository>(() => _i36.BugetRepositoryImpl(
          gh<_i28.WalletRepository>(),
          gh<_i16.StorageRepository>(),
          gh<_i8.FirebaseConfig>(),
        ));
    gh.factory<_i37.BugetUseCase>(
        () => _i37.BugetUseCase(gh<_i35.BugetRepository>()));
    gh.factory<_i38.CreateBugetBloc>(
        () => _i38.CreateBugetBloc(gh<_i37.BugetUseCase>()));
    gh.factory<_i39.CreateWalletCubit>(
        () => _i39.CreateWalletCubit(walletUseCase: gh<_i30.WalletUseCase>()));
    gh.factory<_i40.DetailWalletCubit>(
        () => _i40.DetailWalletCubit(walletUseCase: gh<_i30.WalletUseCase>()));
    gh.factory<_i41.ProfileCubit>(() => _i41.ProfileCubit(
          useCase: gh<_i24.UserUseCase>(),
          pickImageUseCase: gh<_i18.StorageUseCase>(),
          hiveConfig: gh<_i9.HiveConfig>(),
        ));
    gh.factory<_i42.RecurringRepository>(() => _i43.RecurringRepositoryImpl(
          gh<_i28.WalletRepository>(),
          gh<_i16.StorageRepository>(),
          gh<_i8.FirebaseConfig>(),
        ));
    gh.factory<_i44.RecurringUseCase>(
        () => _i44.RecurringUseCase(gh<_i42.RecurringRepository>()));
    gh.factory<_i45.RegisterCubit>(() => _i45.RegisterCubit(
          pickImageUseCase: gh<_i18.StorageUseCase>(),
          authUseCase: gh<_i33.AuthUseCase>(),
        ));
    gh.factory<_i46.SettingsCubit>(() => _i46.SettingsCubit(
          gh<_i9.HiveConfig>(),
          gh<_i33.AuthUseCase>(),
        ));
    gh.factory<_i47.StatisticUseCase>(
        () => _i47.StatisticUseCase(gh<_i14.StatisticsRepository>()));
    gh.factory<_i48.TransactionRepository>(() => _i49.TransactionRepositoryImpl(
          gh<_i8.FirebaseConfig>(),
          gh<_i28.WalletRepository>(),
          gh<_i16.StorageRepository>(),
          gh<_i35.BugetRepository>(),
        ));
    gh.factory<_i50.TransactionUseCase>(() => _i50.TransactionUseCase(
          gh<_i48.TransactionRepository>(),
          gh<_i14.StatisticsRepository>(),
          gh<_i16.StorageRepository>(),
        ));
    gh.factory<_i51.WalletListCubit>(
        () => _i51.WalletListCubit(gh<_i30.WalletUseCase>()));
    gh.factory<_i52.AccountCubit>(() => _i52.AccountCubit(
          gh<_i9.HiveConfig>(),
          gh<_i33.AuthUseCase>(),
        ));
    gh.factory<_i53.AuthSettingsCubit>(() => _i53.AuthSettingsCubit(
          gh<_i9.HiveConfig>(),
          gh<_i33.AuthUseCase>(),
          gh<_i4.BiometricConfig>(),
        ));
    gh.factory<_i54.BugetCubit>(() => _i54.BugetCubit(gh<_i37.BugetUseCase>()));
    gh.factory<_i55.CreateRecurringBloc>(
        () => _i55.CreateRecurringBloc(gh<_i44.RecurringUseCase>()));
    gh.factory<_i56.CreateTransactionBloc>(() => _i56.CreateTransactionBloc(
          gh<_i50.TransactionUseCase>(),
          gh<_i18.StorageUseCase>(),
        ));
    gh.factory<_i57.DetailTransactionBloc>(
        () => _i57.DetailTransactionBloc(gh<_i50.TransactionUseCase>()));
    gh.factory<_i58.HomeCubit>(() => _i58.HomeCubit(
          gh<_i50.TransactionUseCase>(),
          gh<_i24.UserUseCase>(),
          gh<_i47.StatisticUseCase>(),
          gh<_i20.TimeCubit>(),
        ));
    gh.factory<_i59.LoginCubit>(() => _i59.LoginCubit(
          gh<_i33.AuthUseCase>(),
          gh<_i4.BiometricConfig>(),
          gh<_i9.HiveConfig>(),
          gh<_i8.FirebaseConfig>(),
          gh<_i44.RecurringUseCase>(),
        ));
    gh.singleton<_i60.RecurringListCubit>(_i60.RecurringListCubit(
      gh<_i44.RecurringUseCase>(),
      gh<_i11.NotificationConfig>(),
    ));
    gh.factory<_i61.StatisticCubit>(() => _i61.StatisticCubit(
          gh<_i47.StatisticUseCase>(),
          gh<_i24.UserUseCase>(),
          gh<_i20.TimeCubit>(),
        ));
    gh.factory<_i62.TransactionListCubit>(
        () => _i62.TransactionListCubit(gh<_i50.TransactionUseCase>()));
    return this;
  }
}
