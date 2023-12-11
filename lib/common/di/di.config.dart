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
import 'package:local_auth/local_auth.dart' as _i27;

import '../../data/repositories/auth_repository_impl.dart' as _i26;
import '../../data/repositories/statistics_repository_impl.dart' as _i10;
import '../../data/repositories/storage_repository_impl.dart' as _i12;
import '../../data/repositories/transaction_repository_impl.dart' as _i36;
import '../../data/repositories/user_repository_impl.dart' as _i16;
import '../../data/repositories/vn_bank_repository.dart' as _i19;
import '../../data/repositories/wallet_repository.dart' as _i22;
import '../../domain/repositories/auth_repository.dart' as _i25;
import '../../domain/repositories/statistics_repository.dart' as _i9;
import '../../domain/repositories/storage_repository.dart' as _i11;
import '../../domain/repositories/transaction_repository.dart' as _i35;
import '../../domain/repositories/user_repository.dart' as _i15;
import '../../domain/repositories/vn_bank_repository.dart' as _i18;
import '../../domain/repositories/wallet_repository.dart' as _i21;
import '../../domain/use_cases/auth_use_case.dart' as _i28;
import '../../domain/use_cases/pick_image_use_case.dart' as _i13;
import '../../domain/use_cases/transaction_use_case.dart' as _i37;
import '../../domain/use_cases/user_use_case.dart' as _i17;
import '../../domain/use_cases/vn_bank_use_case.dart' as _i20;
import '../../domain/use_cases/wallet_use_case.dart' as _i23;
import '../../presentation/bloc/loading_bloc/loading_bloc.dart' as _i8;
import '../../presentation/journey/account/auth_setting/cubit/auth_settings_cubit.dart'
    as _i41;
import '../../presentation/journey/account/cubit/account_cubit.dart' as _i40;
import '../../presentation/journey/auth/login/cubit/login_cubit.dart' as _i31;
import '../../presentation/journey/auth/register/cubit/register_cubit.dart'
    as _i34;
import '../../presentation/journey/auth/register_account/cubit/register_account_cubit.dart'
    as _i33;
import '../../presentation/journey/auth/verify_otp/cubit/verify_cubit.dart'
    as _i38;
import '../../presentation/journey/home/cubit/home_cubit.dart' as _i43;
import '../../presentation/journey/main/bloc/tab_manger_cubit.dart' as _i14;
import '../../presentation/journey/statistics/cubit/statistic_cubit.dart'
    as _i44;
import '../../presentation/journey/transaction/bank_list_screen/bloc/bank_search_cubit.dart'
    as _i29;
import '../../presentation/journey/transaction/category_screen/bloc/category_select_cubit.dart'
    as _i3;
import '../../presentation/journey/transaction/create/bloc/add_photo/add_photo_bloc.dart'
    as _i24;
import '../../presentation/journey/transaction/create/bloc/create/create_transaction_bloc.dart'
    as _i42;
import '../../presentation/journey/wallet/screens/create_wallet_screen/bloc/create_wallet_cubit.dart'
    as _i30;
import '../../presentation/journey/wallet/screens/wallet_list_screen/bloc/wallet_list_cubit.dart'
    as _i39;
import '../../presentation/widgets/pick_image/cubit/pick_image_cubit.dart'
    as _i32;
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
    gh.factory<_i9.StatisticsRepository>(
        () => _i10.StatisticsRepositoryImpl(gh<_i6.FirebaseConfig>()));
    gh.factory<_i11.StorageRepository>(
        () => _i12.StorageRepositoryImpl(gh<_i6.FirebaseConfig>()));
    gh.factory<_i13.StorageUseCase>(
        () => _i13.StorageUseCase(gh<_i11.StorageRepository>()));
    gh.factory<_i14.TabMangerCubit>(() => _i14.TabMangerCubit());
    gh.factory<_i15.UserRepository>(() => _i16.UserRepositoryImpl(
          gh<_i6.FirebaseConfig>(),
          gh<_i7.HiveConfig>(),
        ));
    gh.factory<_i17.UserUseCase>(
        () => _i17.UserUseCase(gh<_i15.UserRepository>()));
    gh.factory<_i18.VnBankRepository>(
        () => _i19.VnBankRepositoryImpl(gh<_i4.DioApiClient>()));
    gh.factory<_i20.VnBankUseCase>(
        () => _i20.VnBankUseCase(gh<_i18.VnBankRepository>()));
    gh.factory<_i21.WalletRepository>(() => _i22.WalletRepositoryImpl(
          gh<_i6.FirebaseConfig>(),
          gh<_i7.HiveConfig>(),
        ));
    gh.factory<_i23.WalletUseCase>(
        () => _i23.WalletUseCase(repository: gh<_i21.WalletRepository>()));
    gh.factory<_i24.AddPhotoBloc>(
        () => _i24.AddPhotoBloc(gh<_i13.StorageUseCase>()));
    gh.factory<_i25.AuthRepository>(() => _i26.AuthRepositoryImpl(
          gh<_i7.HiveConfig>(),
          gh<_i6.FirebaseConfig>(),
          gh<_i27.LocalAuthentication>(),
        ));
    gh.factory<_i28.AuthUseCase>(() => _i28.AuthUseCase(
          repository: gh<_i25.AuthRepository>(),
          userRepository: gh<_i15.UserRepository>(),
        ));
    gh.factory<_i29.BankSearchCubit>(
        () => _i29.BankSearchCubit(gh<_i20.VnBankUseCase>()));
    gh.factory<_i30.CreateWalletCubit>(
        () => _i30.CreateWalletCubit(walletUseCase: gh<_i23.WalletUseCase>()));
    gh.factory<_i31.LoginCubit>(() => _i31.LoginCubit(
          gh<_i28.AuthUseCase>(),
          gh<_i7.HiveConfig>(),
        ));
    gh.factory<_i32.PickImageCubit>(
        () => _i32.PickImageCubit(gh<_i13.StorageUseCase>()));
    gh.factory<_i33.RegisterAccountCubit>(
        () => _i33.RegisterAccountCubit(gh<_i28.AuthUseCase>()));
    gh.factory<_i34.RegisterCubit>(() => _i34.RegisterCubit(
          useCase: gh<_i17.UserUseCase>(),
          pickImageUseCase: gh<_i13.StorageUseCase>(),
          authUseCase: gh<_i28.AuthUseCase>(),
        ));
    gh.factory<_i35.TransactionRepository>(() => _i36.TransactionRepositoryImpl(
          gh<_i6.FirebaseConfig>(),
          gh<_i7.HiveConfig>(),
          gh<_i21.WalletRepository>(),
        ));
    gh.factory<_i37.TransactionUseCase>(() => _i37.TransactionUseCase(
          gh<_i35.TransactionRepository>(),
          gh<_i9.StatisticsRepository>(),
        ));
    gh.factory<_i38.VerifyCubit>(() => _i38.VerifyCubit(
          gh<_i28.AuthUseCase>(),
          gh<_i17.UserUseCase>(),
          gh<_i7.HiveConfig>(),
        ));
    gh.factory<_i39.WalletListCubit>(
        () => _i39.WalletListCubit(gh<_i23.WalletUseCase>()));
    gh.factory<_i40.AccountCubit>(() => _i40.AccountCubit(
          gh<_i7.HiveConfig>(),
          gh<_i28.AuthUseCase>(),
          gh<_i13.StorageUseCase>(),
        ));
    gh.factory<_i41.AuthSettingsCubit>(() => _i41.AuthSettingsCubit(
          gh<_i7.HiveConfig>(),
          gh<_i28.AuthUseCase>(),
        ));
    gh.factory<_i42.CreateTransactionBloc>(() => _i42.CreateTransactionBloc(
          gh<_i37.TransactionUseCase>(),
          gh<_i13.StorageUseCase>(),
        ));
    gh.factory<_i43.HomeCubit>(() => _i43.HomeCubit(
          gh<_i37.TransactionUseCase>(),
          gh<_i17.UserUseCase>(),
        ));
    gh.factory<_i44.StatisticCubit>(() => _i44.StatisticCubit(
          gh<_i37.TransactionUseCase>(),
          gh<_i17.UserUseCase>(),
        ));
    return this;
  }
}
