import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:crypto_trade/features/notifications/data/models/notification_model.dart';
import 'package:crypto_trade/features/notifications/presentation/widgets/notification_empty_state.dart';
import 'package:crypto_trade/features/notifications/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: CustomAppBar(
        title: 'Notifications',
        centerTitle: false,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Mark Read All',
                  style: AppStyle.font14_400Weight.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: SvgPicture.asset(
                  Assets.imagesSvgFilter,
                  height: 22.h,
                  width: 22.w,
                ),
              ),
              horizontalSpace(16),
            ],
          ),
        ],
      ),
      body: Expanded(
        child: isEmpty
            ? const NotificationEmptyState()
            : ListView.separated(
                padding: EdgeInsets.only(top: 8.h, bottom: 24.h),
                itemCount: NotificationModel.notifications.length,
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.lightGrey.withValues(alpha: 0.5),
                  height: 1.h,
                  thickness: 0.5.h,
                  indent: 24.w,
                  endIndent: 24.w,
                ),
                itemBuilder: (context, index) {
                  return NotificationItem(
                    notification: NotificationModel.notifications[index],
                  );
                },
              ),
      ),
    );
  }
}
