import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Text(
          'Wallets Screen',
          style: AppStyle.font18_600Weight.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
