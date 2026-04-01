import 'package:crypto_trade/core/utils/constant/app_assets.dart';

class WalletCoinModel {
  final String name;
  final String symbol;
  final String price;
  final bool isPositive;
  final String iconPath;

  final String fiatBalance;

  const WalletCoinModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.isPositive,
    required this.iconPath,
    required this.fiatBalance,
  });
}

// Mock Data
final List<WalletCoinModel> dummyWalletCoins = [
  WalletCoinModel(
    name: 'Bitcoin',
    symbol: 'BTC',
    price: '32,697.05',
    fiatBalance: '\$468,554.23',
    isPositive: true,
    iconPath: Assets.imagesSvgBitcoin,
  ),
  WalletCoinModel(
    name: 'Chainlink',
    symbol: 'LINK',
    price: '32,697.05',
    fiatBalance: '\$468,554.23',
    isPositive: false,
    iconPath: Assets.imagesSvgChainLink,
  ),
  WalletCoinModel(
    name: 'Cardano',
    symbol: 'ADA',
    price: '32,697.05',
    fiatBalance: '\$468,554.23',
    isPositive: true,
    iconPath: Assets.imagesSvgCardano,
  ),
  WalletCoinModel(
    name: 'SHIBA INU',
    symbol: 'SHIB',
    price: '32,697.05',
    fiatBalance: '\$468,554.23',
    isPositive: false,
    iconPath: Assets.imagesSvgShipaInu,
  ),
  WalletCoinModel(
    name: 'HIFI',
    symbol: 'MFT',
    price: '32,697.05',
    fiatBalance: '\$468,554.23',
    isPositive: false,
    iconPath: Assets.imagesSvgHifiFinance,
  ),
  WalletCoinModel(
    name: 'REN',
    symbol: 'REN',
    price: '32,697.05',
    fiatBalance: '\$468,554.23',
    isPositive: true,
    iconPath: Assets.imagesSvgRen,
  ),
];
