import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/configs/hive/hive_config.dart';
import 'package:flutter_e_spend/common/constants/string_constants.dart';
import 'package:flutter_e_spend/common/enums/login_type.dart';
import 'package:flutter_e_spend/common/extension/bloc_extension.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import 'package:flutter_e_spend/presentation/bloc/base_bloc/base_bloc.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/utils/app_utils.dart';
import '../../../../../domain/use_cases/auth_use_case.dart';
import '../../../../../domain/use_cases/user_use_case.dart';

part 'verify_state.dart';

@injectable
class VerifyCubit extends BaseBloc<VerifyState> {
  VerifyCubit(
    this.authenticationUseCase,
    this.userUseCase,
    this.hiveConfig,
  ) : super(const VerifyInitial());
  final AuthUseCase authenticationUseCase;
  final UserUseCase userUseCase;
  final HiveConfig hiveConfig;
  String? _verificationId;
  int? _reSenToken;
  String? _phoneNumber;
  LoginType? _loginType;
  String? _password;
  final TextEditingController pinCodeController = TextEditingController();

  StreamSubscription? _streamSubscription;
  final Duration _time = const Duration(seconds: 1);
  static const Duration _timeMax = Duration(seconds: 300);

  initState(String? phoneNumber, LoginType loginType, String? password) {
    _phoneNumber = phoneNumber;
    _loginType = loginType;
    _password = password;
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();

    return super.close();
  }

  String get phoneNumber => _phoneNumber!;

  Future<void> verifyPhonenumber() async {
    if (isNullEmpty(_phoneNumber)) {
      VerifyFailure(
        error: 'missing_phone',
        timeResend: state.timeResend,
      );
    }

    emit(VerifyLoading(state.timeResend));

    await authenticationUseCase.verifyPhoneNumber(
      phoneNumber: _phoneNumber!,
      verificationCompleted: (credential) async {
        pinCodeController.text = credential.smsCode!;
      },
      verificationFailed: (e) {
        emit(
          VerifyFailure(
            error: _handleExceptionVerificationFailed(e.code),
            timeResend: state.timeResend,
          ),
        );
      },
      codeSent: (verificationId, token) async {
        _verificationId = verificationId;

        _reSenToken = token;

        emit(Verifyloaded(state.timeResend));
        startTimer();
      },
      reSendToken: _reSenToken,
    );
  }

  void verifyOtp() async {
    //showLoading();
    try {
      String smsCode = pinCodeController.text;
      if (_loginType == LoginType.phone) {
        final result = await authenticationUseCase.login(
          loginType: LoginType.phone,
          userName: _verificationId!,
          password: smsCode,
        );
        //
        if (result.isRight &&
            result.right.message == StringConstants.accountNotExits) {
          final result2 = await authenticationUseCase.register(
            loginType: LoginType.phone,
            verificationId: _verificationId!,
            smsCode: smsCode,
          );
          result2.fold((left) {
            push(RegisterRoute(phoneNumber: phoneNumber));
          }, (right) {
            if (right.message == StringConstants.accountNotExits) {
              push(RegisterRoute(phoneNumber: phoneNumber));
            }
            showSnackbar(translationKey: right.message);
          });
        }
      } else if (_loginType == LoginType.biometrics) {
        final user = await authenticationUseCase.registerWithBiometric(
          verificationId: _verificationId!,
          smsCode: smsCode,
        );
        if (user.isRight) {
          await pop(false);
          showSnackbar(translationKey: user.right.message);
          hideLoading();
          return;
        }
      } else {
        if (_loginType == null) {
          await pop(false);
          hideLoading();
          return;
        }
        final user = await authenticationUseCase.register(
            loginType: _loginType!,
            verificationId: _verificationId!,
            smsCode: smsCode,
            emailAndPassword: (
              (_phoneNumber ?? '').formatPhoneToEmail,
              _password ?? '',
            ));
        if (user.isRight) {
          await pop(false);
          showSnackbar(translationKey: user.right.message);
          hideLoading();
          return;
        }
      }

      bool isUserFirestore = await userUseCase.exits();

      emit(VerifySuccess(state.timeResend, isUserFirestore));

      _streamSubscription?.cancel();
    } catch (e) {
      emit(VerifyFailure(
        error: e.toString(),
        timeResend: state.timeResend,
      ));
    }
    hideLoading();
  }

  String _handleExceptionVerificationFailed(String code) {
    switch (code) {
      case 'network-request-failed':
        return 'network_request_failed';
      case 'invalid-phone-number':
        return 'invalid_phone';
      case 'missing-phone-number':
        return 'missing_phone';
      case 'quota-exceeded':
        return 'quota_exceeded';
      case 'user-disabled':
        return 'user_disabled';
      case 'captcha-check-failed':
        return 'captcha_check_failed';
      default:
        return 'error_message';
    }
  }

  void startTimer() {
    emit(Verifyloaded(stringTimeFormat(_timeMax)));
    _streamSubscription?.cancel();

    _streamSubscription = changeTime().listen((event) {
      if (event == const Duration()) {
        _streamSubscription?.cancel();
      } else {
        emit(
          Verifyloaded(stringTimeFormat(event)),
        );
      }
    });
  }

  Stream<Duration> changeTime() {
    return Stream.periodic(
      _time,
      (computationCount) {
        return _timeMax - _time - Duration(seconds: computationCount);
      },
    );
  }

  bool timeOut() => state.timeResend == '0:00:00';

  String stringTimeFormat(Duration time) =>
      timeOut() ? '0:00:00' : time.toString().split(".").first.substring(2);

  bool isStarted() {
    return state.timeResend != '0:05:00';
  }
}
