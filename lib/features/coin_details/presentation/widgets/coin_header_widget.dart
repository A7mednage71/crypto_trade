import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinHeaderWidget extends StatefulWidget {
  final CoinDetailResponseModel coinDetails;

  const CoinHeaderWidget({super.key, required this.coinDetails});

  @override
  State<CoinHeaderWidget> createState() => _CoinHeaderWidgetState();
}

class _CoinHeaderWidgetState extends State<CoinHeaderWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        CustomNetworkImage(
          imageUrl: widget.coinDetails.image.small,
          width: 32.w,
          height: 32.h,
          borderRadius: BorderRadius.circular(16.r),
        ),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.coinDetails.name, style: AppStyle.font18_500Weight),
            Text(
              widget.coinDetails.symbol.toUpperCase(),
              style: AppStyle.font14_400Weight.copyWith(
                color: AppColors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: AppColors.darkSurface,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
              color: isFavorite ? Colors.amber : Colors.white,
              size: 24.w,
            ),
          ),
        ),
      ],
    );
  }
}
