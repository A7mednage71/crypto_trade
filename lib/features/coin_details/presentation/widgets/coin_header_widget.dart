import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/mappers/favorite_mapper.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:crypto_trade/features/favorites/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:crypto_trade/features/favorites/presentation/cubits/favorite_cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinHeaderWidget extends StatelessWidget {
  final CoinDetailResponseModel coinDetails;

  const CoinHeaderWidget({super.key, required this.coinDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomNetworkImage(
          imageUrl: coinDetails.image.large,
          width: 44.w,
          height: 44.h,
          borderRadius: BorderRadius.circular(22.r),
        ),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coinDetails.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.font18_600Weight, // Updated to bolder weight
            ),
            verticalSpace(4),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.05),
                ),
              ),
              child: Text(
                coinDetails.symbol.toUpperCase(),
                style: AppStyle.font12_400Weight.copyWith(
                  color: AppColors.white.withValues(alpha: 0.8),
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final isFavorite = context.read<FavoriteCubit>().isFavorite(
              coinDetails.id,
            );
            return GestureDetector(
              onTap: () {
                HapticFeedback.mediumImpact();
                context.read<FavoriteCubit>().toggleFavorite(
                  coinDetails.toFavoriteCoinModel(),
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: isFavorite
                      ? AppColors.secondary.withValues(alpha: 0.2)
                      : AppColors.grey.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isFavorite ? AppColors.secondary : AppColors.grey,
                    width: 1,
                  ),
                ),
                child: Icon(
                  isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
                  color: isFavorite ? AppColors.secondary : AppColors.grey,
                  size: 24.w,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
