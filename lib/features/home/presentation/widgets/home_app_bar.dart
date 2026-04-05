import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(50.r),
            onTap: () {
              context.pushNamed(Routes.profileScreen);
            },
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  width: 1.5.w,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  Assets.imagesPngUser,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.primary.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              _buildActionIcon(Assets.imagesSvgSearch),
              horizontalSpace(24),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  context.pushNamed(Routes.settingsScreen);
                },
                child: _buildActionIcon(Assets.imagesSvgSettings),
              ),
              horizontalSpace(24),
              InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  context.pushNamed(Routes.notificationScreen);
                },
                child: _buildActionIcon(Assets.imagesSvgNotif),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(String iconPath) {
    return SvgPicture.asset(
      iconPath,
      width: 24.w,
      height: 24.w,
      colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
