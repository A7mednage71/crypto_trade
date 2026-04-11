import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/favorites/presentation/widgets/favorites_app_bar.dart';
import 'package:crypto_trade/features/favorites/presentation/widgets/favorites_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [FavoritesAppBar(), FavoritesListView()],
        ),
      ),
    );
  }
}
