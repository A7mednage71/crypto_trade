import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/settings/data/models/settings_item_model.dart';
import 'package:crypto_trade/features/settings/presentation/widgets/settings_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: CustomAppBar(title: 'Settings', centerTitle: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: SettingsItemModel.settingsList.length,
            separatorBuilder: (context, index) => verticalSpace(8),
            itemBuilder: (context, index) {
              final settings = SettingsItemModel.settingsList;
              return SettingsItemWidget(item: settings[index], onTap: () {});
            },
          ),
        ),
      ),
    );
  }
}
