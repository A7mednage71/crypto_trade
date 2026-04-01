import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/activity/presentation/screens/activity_screen.dart';
import 'package:crypto_trade/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:crypto_trade/features/home/presentation/screens/home_screen.dart';
import 'package:crypto_trade/features/main_layout/presentation/widgets/custom_floating_nav_bar.dart';
import 'package:crypto_trade/features/main_layout/presentation/widgets/nav_item.dart'; // تأكد من الـ import للـ enum
import 'package:crypto_trade/features/markets/presentation/screens/markets_screen.dart';
import 'package:crypto_trade/features/trades/presentation/screens/trades_screen.dart';
import 'package:crypto_trade/features/wallets/presentation/screens/wallets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  NavItem _selectedItem = NavItem.home;

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => ServicesLocator.locator<HomeCubit>()..getHomeData(),
      child: HomeScreen(),
    ),
    MarketsScreen(),
    TradesScreen(),
    ActivityScreen(),
    WalletsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      extendBody: true,
      body: IndexedStack(index: _selectedItem.index, children: _screens),
      bottomNavigationBar: CustomFloatingNavBar(
        currentItem: _selectedItem,
        onTap: (item) {
          setState(() {
            _selectedItem = item;
          });
        },
      ),
    );
  }
}
