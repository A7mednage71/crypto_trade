import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/favorites/data/models/favorite_coin_model.dart';
import 'package:crypto_trade/features/favorites/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteCoinTile extends StatelessWidget {
  final FavoriteCoinModel coin;

  const FavoriteCoinTile({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final Color stateColor = coin.priceChangePercentage24h >= 0
        ? AppColors.primary
        : AppColors.error;

    return Dismissible(
      key: Key(coin.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return _showRemoveDialog(context);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 24.w),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          Icons.delete_sweep_rounded,
          color: AppColors.error,
          size: 28.r,
        ),
      ),
      child: InkWell(
        onTap: () {
          context.pushNamed(Routes.coinDetailsScreen, arguments: coin.id);
        },
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              CustomNetworkImage(
                imageUrl: coin.image,
                height: 44.h,
                width: 44.w,
                radius: 12.r,
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coin.name,
                      style: AppStyle.font16_600Weight.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      coin.symbol.toUpperCase(),
                      style: AppStyle.font14_400Weight.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${coin.currentPrice.toStringAsFixed(2)}',
                    style: AppStyle.font16_600Weight.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  verticalSpace(4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        coin.priceChangePercentage24h >= 0
                            ? Icons.trending_up_rounded
                            : Icons.trending_down_rounded,
                        color: stateColor,
                        size: 16.r,
                      ),
                      horizontalSpace(4),
                      Text(
                        '${coin.priceChangePercentage24h.abs().toStringAsFixed(2)}%',
                        style: AppStyle.font14_400Weight.copyWith(
                          color: stateColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> _showRemoveDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertWarningDialog(
          title: 'Remove from favorites',
          subtitle:
              'Are you sure you want to remove this coin from your favorites?',
          onConfirmPressed: () async {
            await context.read<FavoriteCubit>().removeFavorite(coin.id);
            if (dialogContext.mounted) {
              Navigator.of(dialogContext).pop(true);
            }
          },
          buttonTitle: 'Remove',
          onCancelPressed: () {
            if (dialogContext.mounted) {
              Navigator.of(dialogContext).pop(false);
            }
          },
        );
      },
    );
  }
}
