import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/widgets/custom_sliver_appBar.dart';
import 'package:flutter/material.dart';

class FavoritesAppBar extends StatelessWidget {
  const FavoritesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      pinned: true,
      backgroundColor: AppColors.darkBackground,
      title: 'Favorites',
      centerTitle: true,
    );
  }
}
