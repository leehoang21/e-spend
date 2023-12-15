// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local_auth/local_auth.dart' as _i28;

import '../../data/repositories/auth_repository_impl.dart' as _i27;
import '../../data/repositories/statistics_repository_impl.dart' as _i11;
import '../../data/repositories/storage_repository_impl.dart' as _i13;
import '../../data/repositories/transaction_repository_impl.dart' as _i38;
import '../../data/repositories/user_repository_impl.dart' as _i17;
import '../../data/repositories/vn_bank_repository.dart' as _i20;
import '../../data/repositories/wallet_repository.dart' as _i23;
import '../../domain/repositories/auth_repository.dart' as _i26;
import '../../domain/repositories/statistics_repository.dart' as _i10;
import '../../domain/repositories/storage_repository.dart' as _i12;
import '../../domain/repositories/transaction_repository.dart' as _i37;
import '../../domain/repositories/user_repository.dart' as _i16;
import '../../domain/repositories/vn_bank_repository.dart' as _i19;
import '../../domain/repositories/wallet_repository.dart' as _i22;
import '../../domain/use_cases/auth_use_case.dart' as _i29;
import '../../domain/use_cases/pick_image_use_case.dart' as _i14;
import '../../domain/use_cases/statistic_use_case.dart' as _i36;
import '../../domain/use_cases/transaction_use_case.dart' as _i39;
import '../../domain/use_cases/user_use_case.dart' as _i18;
import '../../domain/use_cases/vn_bank_use_case.dart' as _i21;
import '../../domain/use_cases/wallet_use_case.dart' as _i24;
import '../../presentation/bloc/loading_bloc/loading_bloc.dart' as _i8;
import '../../presentation/journey/account/auth_setting/cubit/auth_settings_cubit.dart'
    as _i43;
import '../../presentation/journey/account/cubit/account_cubit.dart' as _i42;
import '../../presentation/journey/auth/login/cubit/login_cubit.dart' as _i32;
import '../../presentation/journey/auth/register/cubit/register_cubit.dart'
    as _i35;
import '../../presentation/journey/auth/register_account/cubit/register_account_cubit.dart'
    as _i34;
import '../../presentation/journey/auth/verify_otp/cubit/verify_cubit.dart'
    as _i40;
import '../../presentation/journey/home/cubit/home_cubit.dart' as _i45;
import '../../presentation/journey/main/bloc/tab_manger_cubit.dart' as _i15;
import '../../presentation/journey/planning/cubit/planning_cubit.dart' as _i9;
import '../../presentation/journey/statistics/cubit/statistic_cubit.dart'
    as _i46;
import '../../presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart'
    as _i30;
import '../../presentation/journey/transaction/category_screen/bloc/category_select_cubit.dart'
    as _i3;
import '../../presentation/journey/transaction/create/bloc/add_photo/add_photo_bloc.dart'
    as _i25;
import '../../presentation/journey/transaction/create/bloc/create/create_transaction_bloc.dart'
    as _i44;
import '../../presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart'
    as _i31;
import '../../presentation/journey/wallet/screens/wallet_list_screen/bloc/wallet_list_cubit.dart'
    as _i41;
import '../../presentation/widgets/pick_image/cubit/pick_image_cubit.dart'
    as _i33;
import '../configs/dio/dio_config.dart' as _i4;
import '../configs/firebase_config.dart' as _i6;
import '../configs/hive/hive_config.dart' as _i7;

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
    gh.factory<_i3.CategorySelectCubit>(() => _i3.CategorySelectCubit());
    gh.lazySingleton<_i4.DioApiClient>(
        () => _i4.DioApiClient(options: gh<_i5.BaseOptions>()));
    gh.singleton<_i6.FirebaseConfig>(_i6.FirebaseConfig()..init());
    gh.singleton<_i7.HiveConfig>(_i7.HiveConfig()..init());
    gh.lazySingleton<_i8.LoadingBloc>(() => _i8.LoadingBloc());
    gh.factory<_i9.PlanningCubit>(() => _i9.PlanningCubit());
    gh.factory<_i10.StatisticsRepository>(
        () => _i11.StatisticsRepositoryImpl(gh<_i6.FirebaseConfig>()));
    gh.factory<_i12.StorageRepository>(
        () => _i13.StorageRepositoryImpl(gh<_i6.FirebaseConfig>()));
    gh.factory<_i14.StorageUseCase>(
        () => _i14.StorageUseCase(gh<_i12.StorageRepository>()));
    gh.factory<_i15.TabMangerCubit>(() => _i15.TabMangerCubit());
    gh.factory<_i16.UserRepository>(() => _i17.UserRepositoryImpl(
          gh<_i6.FirebaseConfig>(),
          gh<_i7.HiveConfig>(),
        ));
    gh.factory<_i18.UserUseCase>(
        () => _i18.UserUseCase(gh<_i16.UserRepository>()));
    gh.factory<_i19.VnBankRepository>(
        () => _i20.VnBankRepositoryImpl(gh<_i4.DioApiClient>()));
    gh.factory<_i21.VnBankUseCase>(
        () => _i21.VnBankUseCase(gh<_i19.VnBankRepository>()));
    gh.factory<_i22.WalletRepository>(() => _i23.WalletRepositoryImpl(
          gh<_i6.FirebaseConfig>(),
          gh<_i7.HiveConfig>(),
        ));
    gh.factory<_i24.WalletUseCase>(
        () => _i24.WalletUseCase(repository: gh<_i22.WalletRepository>()));
    gh.factory<_i25.AddPhotoBloc>(
        () => _i25.AddPhotoBloc(gh<_i14.StorageUseCase>()));
    gh.factory<_i26.AuthRepository>(() => _i27.AuthRepositoryImpl(
          gh<_i7.HiveConfig>(),
          gh<_i6.FirebaseConfig>(),
          gh<_i28.LocalAuthentication>(),
        ));
    gh.factory<_i29.AuthUseCase>(() => _i29.AuthUseCase(
          repository: gh<_i26.AuthRepository>(),
          userRepository: gh<_i16.UserRepository>(),
        ));
    gh.factory<_i30.BankSearchCubit>(
        () => _i30.BankSearchCubit(gh<_i21.VnBankUseCase>()));
    gh.factory<_i31.CreateWalletCubit>(
        () => _i31.CreateWalletCubit(walletUseCase: gh<_i24.WalletUseCase>()));
    gh.factory<_i32.LoginCubit>(() => _i32.LoginCubit(
          gh<_i29.AuthUseCase>(),
          gh<_i7.HiveConfig>(),
        ));
    gh.factory<_i33.PickImageCubit>(
        () => _i33.PickImageCubit(gh<_i14.StorageUseCase>()));
    gh.factory<_i34.RegisterAccountCubit>(
        () => _i34.RegisterAccountCubit(gh<_i29.AuthUseCase>()));
    gh.factory<_i35.RegisterCubit>(() => _i35.RegisterCubit(
          useCase: gh<_i18.UserUseCase>(),
          pickImageUseCase: gh<_i14.StorageUseCase>(),
          authUseCase: gh<_i29.AuthUseCase>(),
        ));
    gh.factory<_i36.StatisticUseCase>(
        () => _i36.StatisticUseCase(gh<_i10.StatisticsRepository>()));
    gh.factory<_i37.TransactionRepository>(() => _i38.TransactionRepositoryImpl(
          gh<_i6.FirebaseConfig>(),
          gh<_i7.HiveConfig>(),
          gh<_i22.WalletRepository>(),
        ));
    gh.factory<_i39.TransactionUseCase>(() => _i39.TransactionUseCase(
          gh<_i37.TransactionRepository>(),
          gh<_i10.StatisticsRepository>(),
        ));
    gh.factory<_i40.VerifyCubit>(() => _i40.VerifyCubit(
          gh<_i29.AuthUseCase>(),
          gh<_i18.UserUseCase>(),
          gh<_i7.HiveConfig>(),
        ));
    gh.factory<_i41.WalletListCubit>(
        () => _i41.WalletListCubit(gh<_i24.WalletUseCase>()));
    gh.factory<_i42.AccountCubit>(() => _i42.AccountCubit(
          gh<_i7.HiveConfig>(),
          gh<_i29.AuthUseCase>(),
          gh<_i14.StorageUseCase>(),
        ));
    gh.factory<_i43.AuthSettingsCubit>(() => _i43.AuthSettingsCubit(
          gh<_i7.HiveConfig>(),
          gh<_i29.AuthUseCase>(),
        ));
    gh.factory<_i44.CreateTransactionBloc>(() => _i44.CreateTransactionBloc(
          gh<_i39.TransactionUseCase>(),
          gh<_i14.StorageUseCase>(),
        ));
    gh.factory<_i45.HomeCubit>(() => _i45.HomeCubit(
          gh<_i39.TransactionUseCase>(),
          gh<_i18.UserUseCase>(),
        ));
    gh.factory<_i46.StatisticCubit>(() => _i46.StatisticCubit(
          gh<_i36.StatisticUseCase>(),
          gh<_i18.UserUseCase>(),
        ));
    return this;
  }
}
