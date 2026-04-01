import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';

class TradesScreen extends StatelessWidget {
  const TradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Text(
          'Trades Screen',
          style: AppStyle.font18_600Weight.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
