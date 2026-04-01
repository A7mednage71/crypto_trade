import 'package:crypto_trade/core/utils/constant/app_assets.dart';

enum NavItem {
  home,
  markets,
  trades,
  activity,
  wallets;

  String get label {
    switch (this) {
      case NavItem.home:
        return 'Home';
      case NavItem.markets:
        return 'Markets';
      case NavItem.trades:
        return 'Trades';
      case NavItem.activity:
        return 'Activity';
      case NavItem.wallets:
        return 'Wallets';
    }
  }

  String get iconPath {
    switch (this) {
      case NavItem.home:
        return Assets.imagesSvgHome;
      case NavItem.markets:
        return Assets.imagesSvgMarket;
      case NavItem.trades:
        return Assets.imagesSvgTrades;
      case NavItem.activity:
        return Assets.imagesSvgActivity;
      case NavItem.wallets:
        return Assets.imagesSvgWallet;
    }
  }
}
