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
              style: AppStyle.font18_500Weight,
            ),
            Text(
              coinDetails.symbol.toUpperCase(),
              style: AppStyle.font14_400Weight.copyWith(
                color: AppColors.white.withValues(alpha: 0.6),
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
            );
          },
        ),
      ],
    );
  }
}
