import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/mappers/favorite_mapper.dart';
import 'package:crypto_trade/core/utils/enums/market_tab_type.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_details_args.dart';
import 'package:crypto_trade/features/favorites/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:crypto_trade/features/favorites/presentation/cubits/favorite_cubit/favorite_state.dart'
    show FavoriteState;
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/main_layout/presentation/cubits/app_navigation_cubit/app_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinQuickActionsSheet extends StatelessWidget {
  final CoinResponseModel coin;
  final MarketTabType tabType;

  const CoinQuickActionsSheet({
    super.key,
    required this.coin,
    required this.tabType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFavorite = context.read<FavoriteCubit>().isFavorite(coin.id);
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.darkSurface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    CustomNetworkImage(
                      imageUrl: coin.image,
                      height: 44.h,
                      width: 44.h,
                      borderRadius: BorderRadius.circular(44.r),
                    ),
                    horizontalSpace(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coin.name,
                          style: AppStyle.font18_600Weight.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        verticalSpace(2),
                        Text(
                          coin.symbol.toUpperCase(),
                          style: AppStyle.font14_400Weight.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '\$${coin.currentPrice}',
                      style: AppStyle.font16_600Weight.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(16),
              Divider(
                color: AppColors.lightGrey.withValues(alpha: 0.2),
                thickness: 1,
                height: 1,
              ),
              verticalSpace(8),
              _ActionTile(
                icon: tabType.icon,
                iconColor: AppColors.primary,
                label: tabType.getActionLabel(coin.symbol),
                onTap: () {
                  HapticFeedback.lightImpact();
                  context.pop();
                  context.read<AppNavigationCubit>().mapToTrades(tabType);
                },
              ),
              _ActionTile(
                icon: isFavorite
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                iconColor: isFavorite ? AppColors.secondary : AppColors.grey,
                label: isFavorite
                    ? 'Remove from Favorites'
                    : 'Add to Favorites',
                onTap: () {
                  HapticFeedback.mediumImpact();
                  context.read<FavoriteCubit>().toggleFavorite(
                    coin.toFavoriteCoinModel(),
                  );
                },
              ),
              _ActionTile(
                icon: Icons.insights,
                label: 'Go to Coin Details',
                iconColor: AppColors.primary,
                onTap: () {
                  HapticFeedback.lightImpact();
                  context.pop();
                  context.pushNamed(
                    Routes.coinDetailsScreen,
                    arguments: CoinDetailsArgs(
                      coinId: coin.id,
                      coinName: coin.name,
                    ),
                  );
                },
              ),
              verticalSpace(20),
            ],
          ),
        );
      },
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;

  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: (iconColor ?? AppColors.grey).withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.grey, size: 22.r),
      ),
      title: Text(
        label,
        style: AppStyle.font16_400Weight.copyWith(color: AppColors.white),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.grey.withValues(alpha: 0.2),
        size: 14.r,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
    );
  }
}
