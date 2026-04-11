import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInitialView extends StatelessWidget {
  const SearchInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.candlestick_chart_rounded,
            size: 64.r,
            color: AppColors.primary.withValues(alpha: 0.3),
          ),
          verticalSpace(16),
          Text('Discover Crypto', style: AppStyle.font18_600Weight),
          verticalSpace(8),
          Text(
            'Search for coins, tokens, and more',
            style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
