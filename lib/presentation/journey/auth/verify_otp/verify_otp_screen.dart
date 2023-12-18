import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/common/assets/assets.gen.dart';
import 'package:flutter_e_spend/common/extension/show_extension.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';

import '../../../widgets/loading_widget/loader_widget.dart';
import 'cubit/verify_cubit.dart';
import 'verify_otp_constants.dart';
import 'widget/otp_widget.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyCubit, VerifyState>(
      listener: (context, state) {
        if (state is VerifySuccess) {
          if (state.isUserFirestore) {
            context.router.pushAndPopUntil(const MainRoute(),
                predicate: (route) => false);
          } else {
            context.router.replace(
              RegisterRoute(
                phoneNumber: context.read<VerifyCubit>().phoneNumber,
              ),
            );
          }
        } else if (state is VerifyFailure) {
          verifyFailure(state, context);
        }
      },
      child: Scaffold(
        body: BlocBuilder<VerifyCubit, VerifyState>(
          builder: (context, state) {
            if (state is VerifyLoading) {
              return const Center(
                child: LoaderWidget(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: VerifyOtpConstants.topHeightLogo),
                    child: Assets.images.logoSplash.image(
                      height: VerifyOtpConstants.sizeLogo,
                      width: VerifyOtpConstants.sizeLogo,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: VerifyOtpConstants.horizontalScreen,
                    ).copyWith(
                      top: VerifyOtpConstants.topColumn,
                    ),
                    child: const OtpWidget(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void verifyFailure(VerifyFailure state, BuildContext context) {
    if (state.error == VerifyOtpConstants.invalidOtp) {
      context.showSnackbar(
        translationKey: state.error,
      );
    } else {
      Navigator.pop(context, state.error);
    }
  }

  @override
  void initState() {
    context.read<VerifyCubit>().verifyPhonenumber();
    super.initState();
  }
}
