import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:fl_chart/fl_chart.dart';

class MarketCoinModel {
  final String name;
  final String symbol;
  final String price;
  final bool isPositive;
  final String iconPath;
  final String changePercentage;
  final List<FlSpot> sparklineData;

  const MarketCoinModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.isPositive,
    required this.iconPath,
    required this.changePercentage,
    required this.sparklineData,
  });
}

// Mock Data
final List<MarketCoinModel> dummyMarketCoins = [
  MarketCoinModel(
    name: 'Bitcoin',
    symbol: 'BTC',
    price: '32,697.05',
    changePercentage: '+0.81%',
    isPositive: true,
    iconPath: Assets.imagesSvgBitcoin,
    sparklineData: const [
      FlSpot(0, 3),
      FlSpot(1, 4.5),
      FlSpot(2, 3.5),
      FlSpot(3, 5),
      FlSpot(4, 4),
      FlSpot(5, 6.5),
      FlSpot(6, 5.5),
      FlSpot(7, 7),
      FlSpot(8, 6),
      FlSpot(9, 8),
    ],
  ),
  MarketCoinModel(
    name: 'Chainlink',
    symbol: 'LINK',
    price: '32,697.05',
    changePercentage: '-0.81%',
    isPositive: false,
    iconPath: Assets.imagesSvgChainLink,
    sparklineData: const [
      FlSpot(0, 7),
      FlSpot(1, 6.5),
      FlSpot(2, 8),
      FlSpot(3, 5),
      FlSpot(4, 6),
      FlSpot(5, 4),
      FlSpot(6, 4.5),
      FlSpot(7, 3),
      FlSpot(8, 4),
      FlSpot(9, 2),
    ],
  ),
  MarketCoinModel(
    name: 'Cardano',
    symbol: 'ADA',
    price: '32,697.05',
    changePercentage: '+0.81%',
    isPositive: true,
    iconPath: Assets.imagesSvgCardano,
    sparklineData: const [
      FlSpot(0, 3),
      FlSpot(1, 4.5),
      FlSpot(2, 3.5),
      FlSpot(3, 5),
      FlSpot(4, 4),
      FlSpot(5, 6.5),
      FlSpot(6, 5.5),
      FlSpot(7, 7),
      FlSpot(8, 6),
      FlSpot(9, 8),
    ],
  ),
  MarketCoinModel(
    name: 'SHIBA INU',
    symbol: 'SHIB',
    price: '32,697.05',
    changePercentage: '-0.81%',
    isPositive: false,
    iconPath: Assets.imagesSvgShipaInu,
    sparklineData: const [
      FlSpot(0, 7),
      FlSpot(1, 6.5),
      FlSpot(2, 8),
      FlSpot(3, 5),
      FlSpot(4, 6),
      FlSpot(5, 4),
      FlSpot(6, 4.5),
      FlSpot(7, 3),
      FlSpot(8, 4),
      FlSpot(9, 2),
    ],
  ),
  MarketCoinModel(
    name: 'HIFI',
    symbol: 'MFT',
    price: '32,697.05',
    changePercentage: '-0.81%',
    isPositive: false,
    iconPath: Assets.imagesSvgHifiFinance,
    sparklineData: const [
      FlSpot(0, 7),
      FlSpot(1, 6.5),
      FlSpot(2, 8),
      FlSpot(3, 5),
      FlSpot(4, 6),
      FlSpot(5, 4),
      FlSpot(6, 4.5),
      FlSpot(7, 3),
      FlSpot(8, 4),
      FlSpot(9, 2),
    ],
  ),
  MarketCoinModel(
    name: 'REN',
    symbol: 'REN',
    price: '32,697.05',
    changePercentage: '+0.81%',
    isPositive: true,
    iconPath: Assets.imagesSvgRen,
    sparklineData: const [
      FlSpot(0, 3),
      FlSpot(1, 4.5),
      FlSpot(2, 3.5),
      FlSpot(3, 5),
      FlSpot(4, 4),
      FlSpot(5, 6.5),
      FlSpot(6, 5.5),
      FlSpot(7, 7),
      FlSpot(8, 6),
      FlSpot(9, 8),
    ],
  ),
];
