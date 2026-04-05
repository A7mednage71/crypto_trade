import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/core/utils/enums/settings_item.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_state.dart';
import 'package:crypto_trade/features/settings/presentation/widgets/settings_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: const CustomAppBar(title: 'Settings', centerTitle: false),
      body: BlocListener<AuthCubit, AuthState>(
        listenWhen: (prev, curr) => prev.signOutStatus != curr.signOutStatus,
        listener: (context, state) {
          if (state.signOutStatus == SignOutStatus.success) {
            context.pushNamedAndRemoveUntil(
              Routes.authScreen,
              predicate: (route) => false,
            );
          }
        },
        child: SafeArea(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            physics: const BouncingScrollPhysics(),
            itemCount: SettingsItem.values.length,
            separatorBuilder: (_, __) => verticalSpace(8),
            itemBuilder: (context, index) {
              final item = SettingsItem.values[index];
              return SettingsItemWidget(
                item: item,
                onTap: () => _onItemTapped(context, item),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, SettingsItem item) {
    switch (item) {
      case SettingsItem.logout:
        _showLogoutDialog(context);
        break;
      case SettingsItem.language:
        break;
      case SettingsItem.currency:
        break;
      case SettingsItem.appearance:
      case SettingsItem.preference:
      case SettingsItem.aboutUs:
        debugPrint("Tapped on ${item.title}");
        break;
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertWarningDialog(
          title: 'Logout',
          subtitle: 'Are you sure you want to log out?',
          onConfirmPressed: () async {
            await context.read<AuthCubit>().signOut();
          },
          buttonTitle: 'Logout',
        );
      },
    );
  }
}
