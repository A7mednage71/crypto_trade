import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/activity/data/models/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ActivityListTile extends StatelessWidget {
  final ActivityHiveModel activity;

  const ActivityListTile({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final Color statusColor = activity.isSuccess
        ? AppColors.primary
        : activity.status == ActivityStatus.cancelled
        ? AppColors.orange
        : AppColors.error;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _typeInitials(activity.type),
                style: AppStyle.font14_700Weight.copyWith(color: statusColor),
              ),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${activity.coinName ?? activity.coinSymbol} / ${activity.coinSymbol.toUpperCase()}',
                      style: AppStyle.font16_600Weight.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          DateFormat(
                            'yyyy-MM-dd HH:mm',
                          ).format(activity.dateTime),
                          style: AppStyle.font12_400Weight.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                        horizontalSpace(4),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.grey,
                          size: 12.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(8),
                _buildDetailRow('Type', activity.typeLabel),
                verticalSpace(4),
                _buildDetailRow(
                  'Amount',
                  '${activity.amount.toStringAsFixed(6)} ${activity.coinSymbol.toUpperCase()}',
                  valueColor: AppColors.primary,
                ),
                if (activity.priceAtTime != null) ...[
                  verticalSpace(4),
                  _buildDetailRow(
                    'Price',
                    '\$${activity.priceAtTime!.toStringAsFixed(2)}',
                  ),
                ],
                verticalSpace(4),
                _buildDetailRow(
                  'Status',
                  activity.statusLabel,
                  valueColor: statusColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _typeInitials(ActivityType type) {
    return switch (type) {
      ActivityType.buy => 'B',
      ActivityType.sell => 'S',
      ActivityType.deposit => 'D',
      ActivityType.withdraw => 'W',
      ActivityType.swap => 'SW',
    };
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppStyle.font14_400Weight.copyWith(color: AppColors.grey),
        ),
        Text(
          value,
          style: AppStyle.font14_400Weight.copyWith(
            color: valueColor ?? AppColors.lightGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
