import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/enums/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SettingsItemWidget extends StatelessWidget {
  final SettingsItem item;
  final VoidCallback? onTap;

  const SettingsItemWidget({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          splashColor: AppColors.primary.withValues(alpha: 0.08),
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  item.icon,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                  width: 22.w,
                  height: 22.h,
                ),
                horizontalSpace(16),
                Expanded(
                  child: Text(
                    item.title,
                    style: AppStyle.font16_400Weight.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                if (item.trailingText.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Text(
                      item.trailingText,
                      style: AppStyle.font14_400Weight.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.grey,
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
        if (item.showDivider)
          Divider(
            height: 1.h,
            thickness: 0.4,
            color: AppColors.grey.withValues(alpha: 0.25),
          ),
      ],
    );
  }
}
