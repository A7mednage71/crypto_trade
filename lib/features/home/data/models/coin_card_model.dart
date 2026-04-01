import 'package:crypto_trade/core/utils/constant/app_assets.dart';

class CoinCardModel {
  final String price;
  final String pair;
  final String change;
  final bool isPositive;
  final String iconPath;
  final String sparklineChartPath;

  const CoinCardModel({
    required this.price,
    required this.pair,
    required this.change,
    required this.isPositive,
    required this.iconPath,
    required this.sparklineChartPath,
  });

  static const List<CoinCardModel> recentCoins = [
    CoinCardModel(
      price: '40,059.83',
      pair: 'BTC/BUSD',
      change: '+0.81%',
      isPositive: true,
      iconPath: Assets.imagesSvgBitcoin,
      sparklineChartPath: Assets.imagesSvgGraph,
    ),
    CoinCardModel(
      price: '2,059.83',
      pair: 'SOL/BUSD',
      change: '-0.81%',
      isPositive: false,
      iconPath: Assets.imagesSvgChainLink,
      sparklineChartPath: Assets.imagesSvgGraph,
    ),
    CoinCardModel(
      price: '38,124.50',
      pair: 'ETH/BUSD',
      change: '+1.20%',
      isPositive: true,
      iconPath: Assets.imagesSvgCardano,
      sparklineChartPath: Assets.imagesSvgGraph,
    ),
  ];

  static const List<CoinCardModel> topCoins = [
    CoinCardModel(
      price: '1.00',
      pair: 'USDT/BUSD',
      change: '+0.01%',
      isPositive: true,
      iconPath: Assets.imagesSvgChainLink,
      sparklineChartPath: Assets.imagesSvgGraph,
    ),
    CoinCardModel(
      price: '420.50',
      pair: 'BNB/BUSD',
      change: '-2.10%',
      isPositive: false,
      iconPath: Assets.imagesSvgBitcoin,
      sparklineChartPath: Assets.imagesSvgGraph,
    ),
    CoinCardModel(
      price: '12.30',
      pair: 'ADA/BUSD',
      change: '+5.40%',
      isPositive: true,
      iconPath: Assets.imagesSvgCardano,
      sparklineChartPath: Assets.imagesSvgGraph,
    ),
  ];
}
