import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import '../../themes/themes.dart';
import 'bloc/tab_manger_cubit.dart';
import 'main_constants.dart';
import 'widget/bottom_navigation_bar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: context.read<TabMangerCubit>().tabs,
      lazyLoad: true,
      transitionBuilder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      builder: (context, child) => Scaffold(
        body: child,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.black,
          onPressed: () async {
            context.pushRoute(CreateTransactionRoute());
          },
          shape: const CircleBorder(),
          child: Icon(
            Icons.add_rounded,
            size: MainConstants.floatingActionButtonIconSize,
          ),
        ),
        bottomNavigationBar: const _BuildBottomNavigationBar(),
      ),
    );
  }
}

class _BuildBottomNavigationBar extends StatelessWidget {
  const _BuildBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarWidget(
      currentIndex: context.watch<TabMangerCubit>().state,
      onTap: (page) {
        context.read<TabMangerCubit>().changePage(page);
        context.tabsRouter.setActiveIndex(page);
      },
      iconsData: MainConstants.bottomIconsData,
    );
  }
}
