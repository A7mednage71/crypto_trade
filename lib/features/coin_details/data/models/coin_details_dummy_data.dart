import 'package:crypto_trade/features/coin_details/data/models/coin_detail_response_model.dart';
import 'package:crypto_trade/features/coin_details/data/models/market_chart_response_model.dart';

class CoinDetailsDummyData {
  static final CoinDetailResponseModel dummyDetails = CoinDetailResponseModel(
    id: 'bitcoin',
    symbol: 'btc',
    name: 'Bitcoin',
    image: CoinImageModel(thumb: '...', small: '...', large: '...'),
    description: CoinDescriptionModel(
      en: 'Bitcoin is a decentralized digital currency, without a central bank or single administrator, that can be sent from user to user on the peer-to-peer bitcoin network without the need for intermediaries. Transactions are verified by network nodes through cryptography and recorded in a public distributed ledger called a blockchain. The cryptocurrency was invented in 2008 by an unknown person or group of people using the name Satoshi Nakamoto.',
    ),
    marketData: MarketDataModel(
      currentPrice: {'usd': 65432.10},
      marketCap: {'usd': 1200000000000},
      totalVolume: {'usd': 35000000000},
      ath: {'usd': 73737.94},
      priceChangePercentage24h: 2.5,
      high24h: {'usd': 66000.0},
      low24h: {'usd': 64000.0},
      circulatingSupply: 19600000,
    ),
  );

  static final MarketChartResponseModel dummyChart = MarketChartResponseModel(
    prices: List.generate(100, (index) {
      double x = index.toDouble();
      // Simulating some volatility in dummy chart
      double y = 60000 + (index * 50) + (index % 5 == 0 ? 500 : -200);
      return [x, y];
    }),
  );
}
