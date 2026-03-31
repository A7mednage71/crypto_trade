import 'package:flutter/material.dart';

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
      icon: 'assets/images/svg/language.svg',
      title: 'Language',
      trailingText: 'English',
    ),
    SettingsItemModel(
      icon: 'assets/images/svg/dollar.svg',
      title: 'Currency',
      trailingText: 'USD',
    ),
    SettingsItemModel(
      icon: 'assets/images/svg/appearance.svg',
      title: 'Appearance',
      trailingText: 'Use Device Settings',
    ),
    SettingsItemModel(
      icon: 'assets/images/svg/filter_settings.svg',
      title: 'Preference',
      trailingText: 'Customize',
    ),
    SettingsItemModel(
      icon: 'assets/images/svg/group.svg',
      title: 'About Us',
      trailingText: 'v1.2.3',
      showDivider: false,
    ),
  ];
}
