import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TradesScreenHeader extends StatelessWidget {
  const TradesScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20.w,
            backgroundImage: const AssetImage(Assets.imagesPngUserAvatar),
          ),
          Row(
            children: [
              _buildActionIcon(Assets.imagesSvgCandles, () {}),
              horizontalSpace(20),
              _buildActionIcon(Assets.imagesSvgDollar, () {}),
              horizontalSpace(20),
              _buildActionIcon(Assets.imagesSvgStar, () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(String svgPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: SvgPicture.asset(
        svgPath,
        width: 24.w,
        height: 24.w,
        colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
      ),
    );
  }
}
