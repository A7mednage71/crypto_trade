import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_add_favorite_button.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_coin_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketScreenListView extends StatelessWidget {
  final List<CoinResponseModel> coins;

  const MarketScreenListView({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 100.h),
      itemCount: coins.length + 1,
      itemBuilder: (context, index) {
        if (index == coins.length) {
          return const MarketAddFavoriteButton();
        }
        return MarketCoinTile(coin: coins[index]);
      },
    );
  }
}
