import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/di/di.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/presentation/journey/auth/verify_otp/cubit/verify_cubit.dart';

import 'verify_otp_screen.dart';

@RoutePage()
class VerifyOtpScreenProvider extends StatefulWidget {
  const VerifyOtpScreenProvider({
    super.key,
    required this.phoneNumber,
    required this.loginType,
    this.password,
  });
  final String phoneNumber;
  final LoginType loginType;
  final String? password;

  @override
  State<VerifyOtpScreenProvider> createState() =>
      _VerifyOtpScreenProviderState();
}

class _VerifyOtpScreenProviderState extends State<VerifyOtpScreenProvider> {
  late final VerifyCubit cubit;

  @override
  void initState() {
    cubit = getIt.get<VerifyCubit>();
    cubit.initState(widget.phoneNumber, widget.loginType, widget.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: const VerifyOtpScreen(),
    );
  }
}
