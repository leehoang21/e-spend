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

import '../../data/repositories/auth_repository_impl.dart' as _i30;
import '../../data/repositories/statistics_repository_impl.dart' as _i14;
import '../../data/repositories/storage_repository_impl.dart' as _i16;
import '../../data/repositories/transaction_repository_impl.dart' as _i43;
import '../../data/repositories/user_repository_impl.dart' as _i21;
import '../../data/repositories/vn_bank_repository.dart' as _i24;
import '../../data/repositories/wallet_repository.dart' as _i27;
import '../../domain/repositories/auth_repository.dart' as _i29;
import '../../domain/repositories/statistics_repository.dart' as _i13;
import '../../domain/repositories/storage_repository.dart' as _i15;
import '../../domain/repositories/transaction_repository.dart' as _i42;
import '../../domain/repositories/user_repository.dart' as _i20;
import '../../domain/repositories/vn_bank_repository.dart' as _i23;
import '../../domain/repositories/wallet_repository.dart' as _i26;
import '../../domain/use_cases/auth_use_case.dart' as _i31;
import '../../domain/use_cases/statistic_use_case.dart' as _i41;
import '../../domain/use_cases/storage_use_case.dart' as _i17;
import '../../domain/use_cases/transaction_use_case.dart' as _i44;
import '../../domain/use_cases/user_use_case.dart' as _i22;
import '../../domain/use_cases/vn_bank_use_case.dart' as _i25;
import '../../domain/use_cases/wallet_use_case.dart' as _i28;
import '../../presentation/bloc/loading_bloc/loading_bloc.dart' as _i10;
import '../../presentation/journey/account/auth_setting/cubit/auth_settings_cubit.dart'
    as _i48;
import '../../presentation/journey/account/cubit/account_cubit.dart' as _i47;
import '../../presentation/journey/account/profile/cubit/profile_cubit.dart'
    as _i36;
import '../../presentation/journey/account/register_login_with_password/cubit/register_login_with_password_cubit.dart'
    as _i39;
import '../../presentation/journey/account/settings/cubit/settings_cubit.dart'
    as _i40;
import '../../presentation/journey/auth/login/cubit/login_cubit.dart' as _i35;
import '../../presentation/journey/auth/register/cubit/register_cubit.dart'
    as _i38;
import '../../presentation/journey/auth/register_account/cubit/register_account_cubit.dart'
    as _i37;
import '../../presentation/journey/auth/verify_otp/cubit/verify_cubit.dart'
    as _i45;
import '../../presentation/journey/home/cubit/home_cubit.dart' as _i51;
import '../../presentation/journey/main/bloc/tab_manger_cubit.dart' as _i18;
import '../../presentation/journey/planning/cubit/planning_cubit.dart' as _i12;
import '../../presentation/journey/statistics/cubit/statistic_cubit.dart'
    as _i52;
import '../../presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart'
    as _i32;
import '../../presentation/journey/transaction/category_screen/bloc/category_select_cubit.dart'
    as _i5;
import '../../presentation/journey/transaction/create/bloc/add_photo/add_photo_bloc.dart'
    as _i3;
import '../../presentation/journey/transaction/create/bloc/create/create_transaction_bloc.dart'
    as _i49;
import '../../presentation/journey/transaction/detail/bloc/detail_transaction_bloc.dart'
    as _i50;
import '../../presentation/journey/transaction/transaction_list_screen/bloc/transaction_list_cubit.dart'
    as _i53;
import '../../presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart'
    as _i33;
import '../../presentation/journey/wallet/screens/detail_wallet_screen/bloc/detail_wallet_cubit.dart'
    as _i34;
import '../../presentation/journey/wallet/screens/wallet_list_screen/bloc/wallet_list_cubit.dart'
    as _i46;
import '../../presentation/widgets/change_time/time/time_cubit.dart' as _i19;
import '../../presentation/widgets/pick_image/cubit/pick_image_cubit.dart'
    as _i11;
import '../configs/biometric/biometric_config.dart' as _i4;
import '../configs/dio/dio_config.dart' as _i6;
import '../configs/firebase_config.dart' as _i8;
import '../configs/hive/hive_config.dart' as _i9;

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
    gh.singleton<_i8.FirebaseConfig>(_i8.FirebaseConfig()..init());
    gh.singleton<_i9.HiveConfig>(_i9.HiveConfig()..init());
    gh.lazySingleton<_i10.LoadingBloc>(() => _i10.LoadingBloc());
    gh.factory<_i11.PickImageCubit>(() => _i11.PickImageCubit());
    gh.factory<_i12.PlanningCubit>(() => _i12.PlanningCubit());
    gh.factory<_i13.StatisticsRepository>(
        () => _i14.StatisticsRepositoryImpl(gh<_i8.FirebaseConfig>()));
    gh.factory<_i15.StorageRepository>(
        () => _i16.StorageRepositoryImpl(gh<_i8.FirebaseConfig>()));
    gh.factory<_i17.StorageUseCase>(
        () => _i17.StorageUseCase(gh<_i15.StorageRepository>()));
    gh.factory<_i18.TabMangerCubit>(() => _i18.TabMangerCubit());
    gh.singleton<_i19.TimeCubit>(_i19.TimeCubit());
    gh.factory<_i20.UserRepository>(() => _i21.UserRepositoryImpl(
          gh<_i8.FirebaseConfig>(),
          gh<_i9.HiveConfig>(),
          gh<_i15.StorageRepository>(),
        ));
    gh.factory<_i22.UserUseCase>(
        () => _i22.UserUseCase(gh<_i20.UserRepository>()));
    gh.factory<_i23.VnBankRepository>(
        () => _i24.VnBankRepositoryImpl(gh<_i6.DioApiClient>()));
    gh.factory<_i25.VnBankUseCase>(
        () => _i25.VnBankUseCase(gh<_i23.VnBankRepository>()));
    gh.factory<_i26.WalletRepository>(
        () => _i27.WalletRepositoryImpl(gh<_i8.FirebaseConfig>()));
    gh.factory<_i28.WalletUseCase>(
        () => _i28.WalletUseCase(repository: gh<_i26.WalletRepository>()));
    gh.factory<_i29.AuthRepository>(() => _i30.AuthRepositoryImpl(
          gh<_i9.HiveConfig>(),
          gh<_i8.FirebaseConfig>(),
          gh<_i4.BiometricConfig>(),
        ));
    gh.factory<_i31.AuthUseCase>(() => _i31.AuthUseCase(
          gh<_i9.HiveConfig>(),
          repository: gh<_i29.AuthRepository>(),
          userRepository: gh<_i20.UserRepository>(),
        ));
    gh.factory<_i32.BankSearchCubit>(
        () => _i32.BankSearchCubit(gh<_i25.VnBankUseCase>()));
    gh.factory<_i33.CreateWalletCubit>(
        () => _i33.CreateWalletCubit(walletUseCase: gh<_i28.WalletUseCase>()));
    gh.factory<_i34.DetailWalletCubit>(
        () => _i34.DetailWalletCubit(walletUseCase: gh<_i28.WalletUseCase>()));
    gh.factory<_i35.LoginCubit>(() => _i35.LoginCubit(
          gh<_i31.AuthUseCase>(),
          gh<_i4.BiometricConfig>(),
          gh<_i9.HiveConfig>(),
        ));
    gh.factory<_i36.ProfileCubit>(() => _i36.ProfileCubit(
          useCase: gh<_i22.UserUseCase>(),
          pickImageUseCase: gh<_i17.StorageUseCase>(),
          hiveConfig: gh<_i9.HiveConfig>(),
        ));
    gh.factory<_i37.RegisterAccountCubit>(
        () => _i37.RegisterAccountCubit(gh<_i31.AuthUseCase>()));
    gh.factory<_i38.RegisterCubit>(() => _i38.RegisterCubit(
          useCase: gh<_i22.UserUseCase>(),
          pickImageUseCase: gh<_i17.StorageUseCase>(),
          authUseCase: gh<_i31.AuthUseCase>(),
        ));
    gh.factory<_i39.RegisterLoginWithPasswordCubit>(
        () => _i39.RegisterLoginWithPasswordCubit(
              gh<_i31.AuthUseCase>(),
              gh<_i9.HiveConfig>(),
            ));
    gh.factory<_i40.SettingsCubit>(() => _i40.SettingsCubit(
          gh<_i9.HiveConfig>(),
          gh<_i31.AuthUseCase>(),
        ));
    gh.factory<_i41.StatisticUseCase>(
        () => _i41.StatisticUseCase(gh<_i13.StatisticsRepository>()));
    gh.factory<_i42.TransactionRepository>(() => _i43.TransactionRepositoryImpl(
          gh<_i8.FirebaseConfig>(),
          gh<_i26.WalletRepository>(),
          gh<_i15.StorageRepository>(),
        ));
    gh.factory<_i44.TransactionUseCase>(() => _i44.TransactionUseCase(
          gh<_i42.TransactionRepository>(),
          gh<_i13.StatisticsRepository>(),
          gh<_i15.StorageRepository>(),
        ));
    gh.factory<_i45.VerifyCubit>(() => _i45.VerifyCubit(
          gh<_i31.AuthUseCase>(),
          gh<_i22.UserUseCase>(),
          gh<_i9.HiveConfig>(),
        ));
    gh.factory<_i46.WalletListCubit>(
        () => _i46.WalletListCubit(gh<_i28.WalletUseCase>()));
    gh.factory<_i47.AccountCubit>(() => _i47.AccountCubit(
          gh<_i9.HiveConfig>(),
          gh<_i31.AuthUseCase>(),
        ));
    gh.factory<_i48.AuthSettingsCubit>(() => _i48.AuthSettingsCubit(
          gh<_i9.HiveConfig>(),
          gh<_i31.AuthUseCase>(),
          gh<_i4.BiometricConfig>(),
        ));
    gh.factory<_i49.CreateTransactionBloc>(() => _i49.CreateTransactionBloc(
          gh<_i44.TransactionUseCase>(),
          gh<_i17.StorageUseCase>(),
        ));
    gh.factory<_i50.DetailTransactionBloc>(
        () => _i50.DetailTransactionBloc(gh<_i44.TransactionUseCase>()));
    gh.factory<_i51.HomeCubit>(() => _i51.HomeCubit(
          gh<_i44.TransactionUseCase>(),
          gh<_i22.UserUseCase>(),
          gh<_i41.StatisticUseCase>(),
          gh<_i19.TimeCubit>(),
        ));
    gh.factory<_i52.StatisticCubit>(() => _i52.StatisticCubit(
          gh<_i41.StatisticUseCase>(),
          gh<_i22.UserUseCase>(),
          gh<_i19.TimeCubit>(),
        ));
    gh.factory<_i53.TransactionListCubit>(
        () => _i53.TransactionListCubit(gh<_i44.TransactionUseCase>()));
    return this;
  }
}
