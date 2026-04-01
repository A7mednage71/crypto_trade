import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/notifications/data/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(notification.title, style: AppStyle.font14_400Weight),
              horizontalSpace(8),
              Container(
                width: 13.r,
                height: 13.r,
                decoration: BoxDecoration(
                  color: notification.statusColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          verticalSpace(8),
          Text(
            notification.message,
            style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
