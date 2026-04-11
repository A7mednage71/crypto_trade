import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/features/search/data/models/search_result_model.dart';
import 'package:crypto_trade/features/search/presentation/widgets/search_result_gridview.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchLoadingView extends StatelessWidget {
  const SearchLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SearchResultModel> searchSkeletonList = [
      SearchResultModel(
        id: '1',
        name: 'Bitcoin',
        symbol: 'BTC',
        thumbImageUrl: '',
        largeImageUrl: '',
        marketCapRank: 1,
      ),
      SearchResultModel(
        id: '2',
        name: 'Ethereum',
        symbol: 'ETH',
        thumbImageUrl: '',
        largeImageUrl: '',
        marketCapRank: 2,
      ),
      SearchResultModel(
        id: '3',
        name: 'Binance Coin',
        symbol: 'BNB',
        thumbImageUrl: '',
        largeImageUrl: '',
        marketCapRank: 3,
      ),
      SearchResultModel(
        id: '4',
        name: 'Solana',
        symbol: 'SOL',
        thumbImageUrl: '',
        largeImageUrl: '',
        marketCapRank: 4,
      ),
      SearchResultModel(
        id: '5',
        name: 'Cardano',
        symbol: 'ADA',
        thumbImageUrl: '',
        largeImageUrl: '',
        marketCapRank: 5,
      ),
      SearchResultModel(
        id: '6',
        name: 'Ripple',
        symbol: 'XRP',
        thumbImageUrl: '',
        largeImageUrl: '',
        marketCapRank: 6,
      ),
    ];
    return Skeletonizer(
      enabled: true,
      containersColor: AppColors.darkSurface,
      effect: const ShimmerEffect(
        baseColor: AppColors.skeletonBase,
        highlightColor: AppColors.skeletonHighlight,
      ),
      child: SearchResultGridView(coins: searchSkeletonList),
    );
  }
}
