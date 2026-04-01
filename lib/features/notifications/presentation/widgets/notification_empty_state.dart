import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationEmptyState extends StatelessWidget {
  const NotificationEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesPngNoNotifications),
          SizedBox(height: 24.h),
          Text('You have no notifications', style: AppStyle.font14_700Weight),
        ],
      ),
    );
  }
}
