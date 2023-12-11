import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class RefreshWidget extends StatelessWidget {
  final RefreshController? controller;
  final bool enableLoadMore;
  final Function()? onRefresh;
  final Function()? onLoadMore;
  final Widget? child;
  final Widget? footer;

  const RefreshWidget(
      {Key? key,
      this.controller,
      this.enableLoadMore = true,
      this.onRefresh,
      this.onLoadMore,
      this.footer,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: enableLoadMore,
      controller: controller ?? RefreshController(),
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      physics: const AlwaysScrollableScrollPhysics(),
      header: const MaterialClassicHeader(),
      footer: CustomFooter(
        onClick: onLoadMore,
        builder: (context, mode) {
          if (mode == LoadStatus.loading) {
            return footer!;
          }
          return const SizedBox.shrink();
        },
      ),
      child: child,
    );
  }
}
