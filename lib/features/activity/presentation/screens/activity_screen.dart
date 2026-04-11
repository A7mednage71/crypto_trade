import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/activity/presentation/cubits/activity_cubit/activity_cubit.dart';
import 'package:crypto_trade/features/activity/presentation/widgets/activity_list_tile.dart';
import 'package:crypto_trade/features/activity/presentation/widgets/empty_activities.dart';
import 'package:crypto_trade/features/activity/presentation/widgets/quick_action_card.dart';
import 'package:crypto_trade/features/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: const HomeAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(24),
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
          Expanded(
            child: BlocBuilder<ActivityCubit, ActivityState>(
              builder: (context, state) {
                final activities = state.activities;

                if (activities.isEmpty) {
                  return const EmptyActivities();
                }

                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: AppColors.grey.withValues(alpha: 0.1),
                    height: 1,
                    indent: 16.w,
                    endIndent: 16.w,
                  ),
                  padding: EdgeInsets.only(bottom: 100.h),
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    return ActivityListTile(activity: activities[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
