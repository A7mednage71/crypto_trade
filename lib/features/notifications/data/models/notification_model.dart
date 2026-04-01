import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:flutter/material.dart';

enum NotificationStatus { success, pending, alert }

class NotificationModel {
  final String title;
  final String message;
  final NotificationStatus status;

  const NotificationModel({
    required this.title,
    required this.message,
    required this.status,
  });

  Color get statusColor {
    switch (status) {
      case NotificationStatus.success:
        return AppColors.primary;
      case NotificationStatus.pending:
        return AppColors.orange;
      case NotificationStatus.alert:
        return AppColors.red;
    }
  }

  static List<NotificationModel> notifications = [
    const NotificationModel(
      title: 'Withdrawal Successful',
      message: 'You have successfully withdrawn lorem ipsum dolor sit...',
      status: NotificationStatus.success,
    ),
    const NotificationModel(
      title: 'Deposit Successful',
      message: 'You have successfully deposited lorem ipsum dolor sit...',
      status: NotificationStatus.pending,
    ),
    const NotificationModel(
      title: 'Login From An Unknown Device',
      message: 'Your account was logged from an unknown device lorem...',
      status: NotificationStatus.alert,
    ),
    const NotificationModel(
      title: 'Withdrawal Successful',
      message: 'You have successfully withdrawn lorem ipsum dolor sit...',
      status: NotificationStatus.success,
    ),
    const NotificationModel(
      title: 'Withdrawal Successful',
      message: 'You have successfully withdrawn lorem ipsum dolor sit...',
      status: NotificationStatus.success,
    ),
    const NotificationModel(
      title: 'Withdrawal Successful',
      message: 'You have successfully withdrawn lorem ipsum dolor sit...',
      status: NotificationStatus.success,
    ),
    const NotificationModel(
      title: 'Withdrawal Successful',
      message: 'You have successfully withdrawn lorem ipsum dolor sit...',
      status: NotificationStatus.success,
    ),
  ];
}
