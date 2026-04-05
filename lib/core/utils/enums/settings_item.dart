import 'package:crypto_trade/core/utils/constant/app_assets.dart';

enum SettingsItem {
  logout(icon: Assets.imagesSvgLogout, title: 'Logout'),
  language(
    icon: Assets.imagesSvgLanguage,
    title: 'Language',
    trailingText: 'English',
  ),
  currency(
    icon: Assets.imagesSvgDollar,
    title: 'Currency',
    trailingText: 'USD',
  ),
  appearance(
    icon: Assets.imagesSvgAppearance,
    title: 'Appearance',
    trailingText: 'Use Device Settings',
  ),
  preference(
    icon: Assets.imagesSvgFilterSettings,
    title: 'Preference',
    trailingText: 'Customize',
  ),
  aboutUs(
    icon: Assets.imagesSvgGroup,
    title: 'About Us',
    trailingText: 'v1.2.3',
    showDivider: false,
  );

  final String icon;
  final String title;
  final String trailingText;
  final bool showDivider;

  const SettingsItem({
    required this.icon,
    required this.title,
    this.trailingText = '',
    this.showDivider = true,
  });
}
