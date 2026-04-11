import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:crypto_trade/features/favorites/data/models/favorite_coin_model.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';

extension FavoriteCoinMapperOnCoinResponse on CoinResponseModel {
  FavoriteCoinModel toFavoriteCoinModel() {
    return FavoriteCoinModel(
      id: id,
      name: name,
      symbol: symbol,
      image: image,
      currentPrice: currentPrice,
      priceChangePercentage24h: priceChangePercentage24h,
    );
  }
}

extension FavoriteCoinMapperOnCoinDetail on CoinDetailResponseModel {
  FavoriteCoinModel toFavoriteCoinModel() {
    return FavoriteCoinModel(
      id: id,
      name: name,
      symbol: symbol,
      image: image.small,
      currentPrice: marketData.currentPrice['usd'] ?? 0,
      priceChangePercentage24h: marketData.priceChangePercentage24h,
    );
  }
}
