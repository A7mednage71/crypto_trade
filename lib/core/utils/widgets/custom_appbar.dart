import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.textColor,
    this.actions,
    this.onBackTap,
    this.actionsPadding,
    this.centerTitle,
  });
  final String? title;
  final Color? textColor;
  final bool? centerTitle;
  final List<Widget>? actions;
  final void Function()? onBackTap;
  final EdgeInsetsGeometry? actionsPadding;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
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
                    'assets/images/svgs/arrow_back.svg',
                    colorFilter: ColorFilter.mode(
                      textColor ?? AppColors.lightGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : SvgPicture.asset(
                  'assets/images/svgs/arrow_back.svg',
                  colorFilter: ColorFilter.mode(
                    AppColors.lightGrey,
                    BlendMode.srcIn,
                  ),
                ),
        ),
      ),
      title: Text(
        title ?? '',
        style: AppStyle.font24_600Weight.copyWith(color: textColor),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      centerTitle: centerTitle ?? true,
      actions: actions,
      actionsPadding: actionsPadding,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
