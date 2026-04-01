import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/activity/data/models/activity_model.dart';
import 'package:crypto_trade/features/activity/presentation/widgets/activity_list_tile.dart';
import 'package:crypto_trade/features/activity/presentation/widgets/quick_action_card.dart';
import 'package:crypto_trade/features/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            const QuickActionCard(),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Recent Activity',
                style: AppStyle.font18_600Weight.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            verticalSpace(16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => verticalSpace(8),
              padding: EdgeInsets.only(bottom: 100.h),
              itemCount: dummyActivities.length,
              itemBuilder: (context, index) {
                return ActivityListTile(activity: dummyActivities[index]);
              },
            ),
            verticalSpace(50),
          ],
        ),
      ),
    );
  }
}
