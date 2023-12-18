import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/presentation/journey/account/register_login_with_password/cubit/register_login_with_password_cubit.dart';
import 'package:flutter_e_spend/presentation/journey/account/register_login_with_password/register_login_with_password_screen.dart';

@RoutePage()
class RegisterLoginWithPasswordScreenProvider extends StatefulWidget {
  const RegisterLoginWithPasswordScreenProvider({
    Key? key,
    required this.enabled,
  }) : super(key: key);

  final bool enabled;

  @override
  State<RegisterLoginWithPasswordScreenProvider> createState() =>
      _RegisterLoginWithPasswordScreenProviderState();
}

class _RegisterLoginWithPasswordScreenProviderState
    extends State<RegisterLoginWithPasswordScreenProvider> {
  late final RegisterLoginWithPasswordCubit _bloc;

  @override
  void initState() {
    _bloc = getIt.get<RegisterLoginWithPasswordCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: RegisterLoginWithPasswordScreen(
        enabled: widget.enabled,
      ),
    );
  }
}
