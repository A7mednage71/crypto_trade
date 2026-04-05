import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';

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
        verticalSpace(12),
        Text(
          widget.description.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
          maxLines: isExpanded ? null : 3,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: AppStyle.font14_400Weight.copyWith(
            color: AppColors.white.withValues(alpha: 0.6),
            height: 1.5,
          ),
        ),
        verticalSpace(8),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Read Less' : 'Read More',
            style: AppStyle.font14_700Weight.copyWith(
              color: AppColors.primaryGreen,
            ),
          ),
        ),
      ],
    );
  }
}
