import 'package:flutter/material.dart';
import 'package:crypto_trade/core/utils/constant/app_assets.dart';

class SettingsItemModel {
  final String icon;
  final Color iconColor;
  final String title;
  final String trailingText;
  final bool showDivider;

  const SettingsItemModel({
    required this.icon,
    this.iconColor = const Color(0xFF6EC4A1),
    required this.title,
    this.trailingText = '',
    this.showDivider = true,
  });

  static const List<SettingsItemModel> settingsList = [
    SettingsItemModel(
      icon: Assets.imagesSvgLanguage,
      title: 'Language',
      trailingText: 'English',
    ),
    SettingsItemModel(
      icon: Assets.imagesSvgDollar,
      title: 'Currency',
      trailingText: 'USD',
    ),
    SettingsItemModel(
      icon: Assets.imagesSvgAppearance,
      title: 'Appearance',
      trailingText: 'Use Device Settings',
    ),
    SettingsItemModel(
      icon: Assets.imagesSvgFilterSettings,
      title: 'Preference',
      trailingText: 'Customize',
    ),
    SettingsItemModel(
      icon: Assets.imagesSvgGroup,
      title: 'About Us',
      trailingText: 'v1.2.3',
      showDivider: false,
    ),
  ];
}
