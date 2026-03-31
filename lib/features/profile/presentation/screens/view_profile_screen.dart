import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/navigation/routes.dart';
import 'package:crypto_trade/features/profile/presentation/widgets/profile_avatar_widget.dart';
import 'package:crypto_trade/features/profile/presentation/widgets/profile_info_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: CustomAppBar(
        title: 'Profile',
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.editProfileScreen);
            },
            icon: Icon(
              Icons.edit_square,
              color: AppColors.primary,
              size: 25.sp,
            ),
          ),
          horizontalSpace(8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            const ProfileAvatarWidget(userName: 'User1234'),
            verticalSpace(32),
            ProfileInfoItemWidget(
              label: 'Username',
              value: 'Username1234',
              onTap: () {},
            ),
            ProfileInfoItemWidget(
              label: 'Email',
              value: 'example@mail.com',
              onTap: () {},
            ),
            ProfileInfoItemWidget(
              label: 'Mobile Number',
              value: '+1 234 567 8900',
              onTap: () {},
            ),
            ProfileInfoItemWidget(
              label: 'Password',
              value: '••••••••••',
              showDivider: false,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
