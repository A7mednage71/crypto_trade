import 'package:crypto_trade/features/markets/data/models/market_coin_model.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_add_favorite_button.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_coin_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketScreenListView extends StatelessWidget {
  const MarketScreenListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 100.h),
      itemCount: dummyMarketCoins.length + 1,
      itemBuilder: (context, index) {
        if (index == dummyMarketCoins.length) {
          return const MarketAddFavoriteButton();
        }
        return MarketCoinTile(coin: dummyMarketCoins[index]);
      },
    );
  }
}
