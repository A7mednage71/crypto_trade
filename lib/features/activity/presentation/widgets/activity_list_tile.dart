import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/activity/data/models/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityListTile extends StatelessWidget {
  final ActivityModel activity;

  const ActivityListTile({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final isFilled = activity.status == 'Filled';
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: isFilled ? AppColors.primary10 : AppColors.error16,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                activity.type,
                style: AppStyle.font14_700Weight.copyWith(
                  color: isFilled ? AppColors.primary : AppColors.error,
                ),
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
                      activity.pair,
                      style: AppStyle.font16_600Weight.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          activity.date,
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
                _buildDetailRow(
                  'Amount',
                  activity.amount,
                  valueColor: AppColors.primary,
                ),
                verticalSpace(4),
                _buildDetailRow(
                  'Price',
                  activity.price,
                  valueColor: AppColors.white,
                ),
                verticalSpace(4),
                _buildDetailRow(
                  'Status',
                  activity.status,
                  valueColor: isFilled ? AppColors.primary : AppColors.error,
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
