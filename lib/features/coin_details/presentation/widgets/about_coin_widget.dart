import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutCoinWidget extends StatefulWidget {
  final String description;

  const AboutCoinWidget({super.key, required this.description});

  @override
  State<AboutCoinWidget> createState() => _AboutCoinWidgetState();
}

class _AboutCoinWidgetState extends State<AboutCoinWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About', style: AppStyle.font18_600Weight),
        verticalSpace(16),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.darkSurface.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.glassBorder, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
                maxLines: isExpanded ? null : 4,
                overflow: isExpanded
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis,
                style: AppStyle.font14_400Weight.copyWith(
                  color: AppColors.white.withValues(alpha: 0.5),
                  height: 1.6,
                  letterSpacing: 0.2,
                ),
              ),
              verticalSpace(12),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isExpanded ? 'Read Less' : 'Read More',
                      style: AppStyle.font14_700Weight.copyWith(
                        color: AppColors.primaryGreen.withValues(alpha: 0.8),
                      ),
                    ),
                    horizontalSpace(4),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: AppColors.primaryGreen.withValues(alpha: 0.8),
                      size: 20.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
