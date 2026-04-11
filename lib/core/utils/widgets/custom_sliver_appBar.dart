import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.title,
    this.textColor,
    this.actions,
    this.onBackTap,
    this.centerTitle,
    this.pinned = true,
    this.floating = true,
    this.backgroundColor,
  });

  final String? title;
  final Color? textColor;
  final bool? centerTitle;
  final List<Widget>? actions;
  final void Function()? onBackTap;
  final bool pinned;
  final bool floating;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      floating: floating,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: backgroundColor ?? Colors.transparent,
      centerTitle: centerTitle ?? true,
      leading: Padding(
        padding: EdgeInsets.all(10.r),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onBackTap ?? () => context.pop(),
          child: context.isArabic
              ? RotatedBox(
                  quarterTurns: 2,
                  child: SvgPicture.asset(
                    'assets/images/svg/arrow_back.svg',
                    colorFilter: ColorFilter.mode(
                      textColor ?? AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : SvgPicture.asset(
                  'assets/images/svg/arrow_back.svg',
                  colorFilter: ColorFilter.mode(
                    textColor ?? AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
        ),
      ),
      title: Text(
        title ?? '',
        style: AppStyle.font20_600Weight.copyWith(color: textColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      actions: actions,
    );
  }
}
