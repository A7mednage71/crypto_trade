import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/profile/presentation/widgets/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _mobileController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: 'User1234');
    _emailController = TextEditingController(text: 'Example@mail.com');
    _passwordController = TextEditingController(text: 'password12345');
    _mobileController = TextEditingController(text: '+1 234 567 8900');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: 'Edit Profile', centerTitle: false),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            verticalSpace(100),
            ProfileAvatarWidget(
              userName: 'User1234',
              showCameraOverlay: true,
              onCameraTap: () {},
            ),
            verticalSpace(8),
            CustomTextFormField(
              controller: _usernameController,
              textInputType: TextInputType.text,
              label: 'Username',
              hint: 'Enter username',
              bgColor: Colors.transparent,
              borderColor: AppColors.grey.withValues(alpha: 0.3),
            ),
            verticalSpace(20),
            CustomTextFormField(
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
              label: 'Email',
              bgColor: Colors.transparent,
              borderColor: AppColors.grey.withValues(alpha: 0.3),
            ),
            verticalSpace(20),
            CustomTextFormField(
              controller: _passwordController,
              textInputType: TextInputType.visiblePassword,
              label: 'Password',
              isPassword: true,
              bgColor: Colors.transparent,
              borderColor: AppColors.grey.withValues(alpha: 0.3),
            ),
            verticalSpace(20),
            CustomTextFormField(
              controller: _mobileController,
              textInputType: TextInputType.phone,
              label: 'Mobile Number',
              bgColor: Colors.transparent,
              borderColor: AppColors.grey.withValues(alpha: 0.3),
            ),
            verticalSpace(40),
            Row(
              children: [
                Expanded(
                  child: CustomTextButton(
                    text: 'Cancel',
                    isUpperCase: false,
                    onPressed: () => context.pop(),
                    background: AppColors.lightBackground.withValues(
                      alpha: 0.25,
                    ),
                    height: 50.h,
                    customBorderRadius: BorderRadius.circular(12.r),
                    customTextStyle: AppStyle.font18_400Weight.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomTextButton(
                    text: 'Save Changes',
                    isUpperCase: false,
                    onPressed: () {},
                    background: AppColors.primary,
                    height: 50.h,
                    customBorderRadius: BorderRadius.circular(12.r),
                    customTextStyle: AppStyle.font18_400Weight.copyWith(
                      color: AppColors.darkBackground,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(32),
          ],
        ),
      ),
    );
  }
}
