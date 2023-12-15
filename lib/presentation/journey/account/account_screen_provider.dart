import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/account/account_screen.dart';
import 'package:flutter_e_spend/presentation/journey/account/cubit/account_cubit.dart';

@RoutePage()
class AccountScreenProvider extends StatefulWidget {
  const AccountScreenProvider({super.key});

  @override
  State<AccountScreenProvider> createState() => _AccountScreenProviderState();
}

class _AccountScreenProviderState extends State<AccountScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AccountCubit>(),
      child: const AccountScreen(),
    );
  }
}
