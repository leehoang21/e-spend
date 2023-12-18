import 'package:flutter/material.dart';
import 'package:flutter_e_spend/common/constants/layout_constants.dart';
import 'package:flutter_e_spend/common/extension/string_extension.dart';
import '../../presentation/widgets/snackbar_widget/snackbar_widget.dart';

extension ShowExtensionContext on BuildContext {
  void showSnackbar({
    SnackBarType type = SnackBarType.error,
    String? translationKey,
  }) {
    TopSnackBar(
      title: (translationKey ?? '').tr,
      type: type,
    ).show(this);
  }

  Future<void> showDialog({
    bool barrierDismissible = true,
    required Widget child,
  }) async {
    await showGeneralDialog(
      barrierLabel: '',
      context: this,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (cxt, __, ___) {
        return child;
      },
      transitionBuilder: (cxt, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: Align(
              alignment: Alignment.center,
              child: IntrinsicHeight(
                child: Material(
                  color: Colors.transparent,
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
    return;
  }

  Future<dynamic> showBottomSheet({
    required Widget child,
    Function? whenComplete,
  }) async {
    return await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: this,
      barrierColor: Colors.black.withOpacity(0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(LayoutConstants.borderSmall),
          topRight: Radius.circular(LayoutConstants.borderSmall),
        ),
      ),
      backgroundColor: Theme.of(this).scaffoldBackgroundColor,
      builder: (BuildContext context) {
        return child;
      },
    ).whenComplete(
      () {
        whenComplete?.call();
      },
    );
  }
}
