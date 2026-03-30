import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();

  void doublePop() {
    Navigator.of(this).pop();
    Navigator.of(this).pop();
  }
}

extension ContextLangX on BuildContext {
  bool get isArabic => locale.languageCode == 'ar';
}

extension StringDateTimeFormatter on String {
  String formatBackendDateWithTime({required String langCode}) {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      return DateFormat('dd MMMM yyyy - hh:mm a', langCode).format(dateTime);
    } catch (e) {
      return this;
    }
  }

  String formatBackendDate({required String langCode}) {
    try {
      final dateTime = DateTime.parse(this).toLocal();
      return DateFormat('dd MMMM yyyy', langCode).format(dateTime);
    } catch (e) {
      return this;
    }
  }
}
