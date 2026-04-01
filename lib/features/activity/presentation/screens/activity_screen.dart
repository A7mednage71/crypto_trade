import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Center(
        child: Text(
          'Activity Screen',
          style: AppStyle.font18_600Weight.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
