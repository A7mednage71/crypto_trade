import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyActivities extends StatelessWidget {
  const EmptyActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.history_toggle_off_outlined,
            size: 64.r,
            color: AppColors.grey.withValues(alpha: 0.3),
          ),
          verticalSpace(16),
          Text('No Activity Yet', style: AppStyle.font18_600Weight),
          verticalSpace(8),
          Text(
            'Your trades, deposits and withdrawals will appear here.',
            style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
            textAlign: TextAlign.center,
          ),
          verticalSpace(100),
        ],
      ),
    );
  }
}
