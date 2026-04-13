import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/activity/presentation/screens/activity_screen.dart';
import 'package:crypto_trade/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:crypto_trade/features/home/presentation/screens/home_screen.dart';
import 'package:crypto_trade/features/home/presentation/widgets/home_app_bar.dart';
import 'package:crypto_trade/features/main_layout/presentation/cubits/app_navigation_cubit/app_navigation_cubit.dart';
import 'package:crypto_trade/features/main_layout/presentation/cubits/app_navigation_cubit/app_navigation_state.dart';
import 'package:crypto_trade/features/main_layout/presentation/widgets/custom_floating_nav_bar.dart';
import 'package:crypto_trade/features/markets/presentation/screens/markets_screen.dart';
import 'package:crypto_trade/features/trades/presentation/screens/trades_screen.dart';
import 'package:crypto_trade/features/wallets/presentation/screens/wallets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationCubit, AppNavigationState>(
      builder: (context, state) {
        final cubit = context.read<AppNavigationCubit>();

        final List<Widget> screens = [
          BlocProvider(
            create: (context) =>
                ServicesLocator.locator<HomeCubit>()..getHomeData(),
            child: const HomeScreen(),
          ),
          const MarketsScreen(),
          const TradesScreen(),
          const ActivityScreen(),
          const WalletsScreen(),
        ];

        return Scaffold(
          backgroundColor: AppColors.darkBackground,
          extendBody: true,
          appBar: const HomeAppBar(),
          body: IndexedStack(
            index: state.selectedBottomNavItem.index,
            children: screens,
          ),
          bottomNavigationBar: CustomFloatingNavBar(
            currentItem: state.selectedBottomNavItem,
            onTap: (item) => cubit.changeBottomNavItem(item),
          ),
        );
      },
    );
  }
}
