import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';

class CoinsDummyModel {
  static List<CoinResponseModel> dummyCoins = [
    CoinResponseModel(
      id: 'bitcoin',
      symbol: 'btc',
      name: 'Bitcoin',
      image: 'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
      currentPrice: 65432.10,
      priceChangePercentage24h: 2.5,
      sparkline: SparklineModel(
        prices: [64000, 64200, 64100, 64500, 65000, 65432],
      ),
    ),
    CoinResponseModel(
      id: 'ethereum',
      symbol: 'eth',
      name: 'Ethereum',
      image: 'https://assets.coingecko.com/coins/images/279/large/ethereum.png',
      currentPrice: 3456.78,
      priceChangePercentage24h: -1.2,
      sparkline: SparklineModel(prices: [3500, 3480, 3490, 3460, 3440, 3456]),
    ),
    CoinResponseModel(
      id: 'tether',
      symbol: 'usdt',
      name: 'Tether',
      image: 'https://assets.coingecko.com/coins/images/325/large/tether.png',
      currentPrice: 1.0,
      priceChangePercentage24h: 0.01,
      sparkline: SparklineModel(prices: [1.0, 1.0, 0.99, 1.0, 1.0, 1.0]),
    ),
    CoinResponseModel(
      id: 'solana',
      symbol: 'sol',
      name: 'Solana',
      image: 'https://assets.coingecko.com/coins/images/4128/large/solana.png',
      currentPrice: 145.20,
      priceChangePercentage24h: 5.4,
      sparkline: SparklineModel(prices: [130, 135, 132, 140, 142, 145]),
    ),
    CoinResponseModel(
      id: 'cardano',
      symbol: 'ada',
      name: 'Cardano',
      image: 'https://assets.coingecko.com/coins/images/975/large/cardano.png',
      currentPrice: 0.45,
      priceChangePercentage24h: -0.5,
      sparkline: SparklineModel(prices: [0.46, 0.46, 0.45, 0.44, 0.45, 0.45]),
    ),
  ];
}
