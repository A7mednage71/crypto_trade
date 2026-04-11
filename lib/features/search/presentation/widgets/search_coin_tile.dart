import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/coin_details/data/models/coin_details_args.dart';
import 'package:crypto_trade/features/search/data/models/search_result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCoinTile extends StatelessWidget {
  final SearchResultModel coin;

  const SearchCoinTile({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.coinDetailsScreen,
        arguments: CoinDetailsArgs(coinId: coin.id, coinName: coin.name),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkSurface,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: coin.marketCapRank != null
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary10,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          '#${coin.marketCapRank}',
                          style: AppStyle.font10_400Weight.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : SizedBox(height: 18.h),
              ),
              verticalSpace(8),
              Center(
                child: CustomNetworkImage(
                  imageUrl: coin.thumbImageUrl,
                  height: 48.r,
                  width: 48.r,
                  borderRadius: BorderRadius.circular(48.r),
                ),
              ),
              verticalSpace(10),
              Text(
                coin.name,
                style: AppStyle.font14_700Weight,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              verticalSpace(4),
              Text(
                coin.symbol.toUpperCase(),
                style: AppStyle.font12_400Weight.copyWith(
                  color: AppColors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.primary10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bar_chart_rounded,
                      color: AppColors.primary,
                      size: 12.r,
                    ),
                    horizontalSpace(4),
                    Text(
                      'View',
                      style: AppStyle.font11_400Weight.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
