import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String userName;
  final String? avatarImagePath;
  final bool showCameraOverlay;
  final VoidCallback? onCameraTap;

  const ProfileAvatarWidget({
    super.key,
    required this.userName,
    this.avatarImagePath,
    this.showCameraOverlay = false,
    this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(16),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 110.w,
              height: 110.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.35),
                    blurRadius: 28.r,
                    spreadRadius: 4.r,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    width: 2.5.w,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    avatarImagePath ?? 'assets/images/png/user_avatar.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (showCameraOverlay)
              Positioned(
                bottom: 2.h,
                right: 2.w,
                child: GestureDetector(
                  onTap: onCameraTap,
                  child: Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                      color: AppColors.darkSurface,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.6),
                        width: 1.5.w,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: AppColors.primary,
                        size: 22.sp,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        verticalSpace(16),
        Text(userName, style: AppStyle.font20_700Weight),
        verticalSpace(24),
      ],
    );
  }
}
