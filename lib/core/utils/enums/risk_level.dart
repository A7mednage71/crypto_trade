import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:flutter/material.dart';

enum RiskLevel {
  low('Low', AppColors.primary),
  moderate('Moderate', AppColors.warning),
  high('High', AppColors.error);

  final String label;
  final Color color;

  const RiskLevel(this.label, this.color);
}
