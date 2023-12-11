import 'dart:async';
import 'package:flutter/material.dart';
import '../../../common/assets/assets.gen.dart';
part 'constants.dart';
part 'snackbar_route.dart';

typedef TopSnackBarStatusCallBack = void Function(TopSnackBarStatus status);

const String topSnackBarRouteName = '/topSnackBarRoute';

// ignore: must_be_immutable
class TopSnackBar<T extends Object> extends StatefulWidget {
  final BuildContext? context;
  final String? title;
  final SnackBarType type;
  TopSnackBarStatusCallBack? onStatusChanged;

  TopSnackBar(
      {Key? key, this.context, this.title, this.type = SnackBarType.success})
      : super(key: key) {
    onStatusChanged = onStatusChanged;
  }

  int duration = 3;

  TopSnackBarRoute<dynamic>? _topSnackBarRoute;

  Future<T?> show(BuildContext context) async {
    _topSnackBarRoute = showSnackBar<T>(context: context, topSnackBar: this);

    return Navigator.of(context, rootNavigator: false)
        .push(_topSnackBarRoute as Route<T>);
  }

  Future<T?> showWithNavigator(
      NavigatorState navigator, BuildContext context) async {
    _topSnackBarRoute = showSnackBar<T>(context: context, topSnackBar: this);
    return navigator.push(_topSnackBarRoute as Route<T>);
  }

  Future<T?> dismiss([T? result]) async {
    if (_topSnackBarRoute == null) {
      return null;
    }

    return null;
  }

  /// Checks if the top snack bar is visible
  bool isShowing() =>
      _topSnackBarRoute?.currentStatus == TopSnackBarStatus.showing;

  /// Checks if the top snack bar is dismissed
  bool isDismissed() =>
      _topSnackBarRoute?.currentStatus == TopSnackBarStatus.dismissed;

  @override
  State createState() {
    return _TopSnackBarState<T>();
  }
}

class _TopSnackBarState<K extends Object> extends State<TopSnackBar>
    with TickerProviderStateMixin {
  FocusScopeNode? _focusScopeNode;
  FocusAttachment? _focusAttachment;

  TopSnackBarStatus? currentStatus;

  GlobalKey backgroundBoxKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _focusScopeNode = FocusScopeNode();
    _focusAttachment = _focusScopeNode?.attach(context);
  }

  @override
  void dispose() {
    _focusScopeNode?.dispose();
    _focusAttachment?.detach();
    super.dispose();
  }

  Widget _buildIcon() {
    if (widget.type == SnackBarType.success) {
      return Container(
        key: const Key('success_container_icon_key'),
        child: Assets.icons.success.svg(
          width: 32,
          height: 32,
        ),
      );
    } else {
      return Container(
        key: const Key('close_container_icon_key'),
        child: Assets.icons.snackbarFailed.svg(
          width: 32,
          height: 32,
        ),
      );
    }
  }

  Widget _buildTitleText() {
    return Text(
      widget.title ?? '',
      softWrap: true,
      key: const ValueKey('snackbar_title_key'),
      style: Theme.of(context).snackBarTheme.contentTextStyle,
    );
  }

  List<Widget> _buildRowLayout() {
    return <Widget>[
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 41.0),
        child: _buildIcon(),
      ),
      Flexible(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
          child: _buildTitleText(),
        ),
      ),
    ];
  }

  Widget _buildSnackBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      key: backgroundBoxKey,
      decoration: BoxDecoration(
        color: Theme.of(context).snackBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
        // boxShadow: const [
        //   BoxShadow(
        //     color: AppColor.grey800,
        //     blurRadius: 1,
        //     offset: Offset(0.5, 0.5),
        //   )
        // ],
      ),
      child: Row(
        children: _buildRowLayout(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: _buildSnackBar(),
      ),
    );
  }
}
