import 'package:crypto_trade/core/utils/constant/app_assets.dart';

class ServiceItemModel {
  final String title;
  final String iconPath;

  const ServiceItemModel({required this.title, required this.iconPath});

  static const List<ServiceItemModel> items = [
    ServiceItemModel(title: 'Deposit', iconPath: Assets.imagesSvgDeposit),
    ServiceItemModel(title: 'Referral', iconPath: Assets.imagesSvgReferral),
    ServiceItemModel(
      title: 'Grid Trading',
      iconPath: Assets.imagesSvgGridTrading,
    ),
    ServiceItemModel(title: 'Margin', iconPath: Assets.imagesSvgMargin),
    ServiceItemModel(title: 'Launchpad', iconPath: Assets.imagesSvgLaunchpad),
    ServiceItemModel(title: 'Savings', iconPath: Assets.imagesSvgSavings),
    ServiceItemModel(
      title: 'Liquid Swap',
      iconPath: Assets.imagesSvgLiquidSwap,
    ),
    ServiceItemModel(title: 'More', iconPath: Assets.imagesSvgMore),
  ];
}
