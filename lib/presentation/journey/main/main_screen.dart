import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_spend/presentation/routers/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../themes/themes.dart';
import 'bloc/tab_manger_cubit.dart';
import 'main_constants.dart';
import 'widget/bottom_navigation_bar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _BuildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox.square(
        dimension: MainConstants.floatingActionButtonDimension,
        child: FloatingActionButton(
          backgroundColor: AppColor.black,
          onPressed: () async {
            context.pushRoute(const CreateTransactionRoute());
          },
          child: Icon(
            Icons.add_rounded,
            size: 52.sp,
          ),
        ),
      ),
      bottomNavigationBar: const _BuildBottomNavigationBar(),
    );
  }
}

class _BuildBottomNavigationBar extends StatelessWidget {
  const _BuildBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabMangerCubit, int>(
      builder: (context, state) {
        return BottomNavigationBarWidget(
          currentIndex: state,
          onTap: context.read<TabMangerCubit>().changePage,
          iconsData: MainConstants.bottomIconsData,
        );
      },
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabMangerCubit, int>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: MainConstants.screenAnimatingDuration,
          child: MainConstants.screens[state],
        );
      },
    );
  }
}
