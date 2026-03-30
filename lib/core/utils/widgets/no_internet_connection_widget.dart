import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/widgets/empty_widget_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({super.key, required this.onPressed});

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyWidgetScreen(
            sizeBox: 30.h,
            image: 'assets/images/svgs/no_internet_connection.svg',
            title: 'Oops! No Internet Connection',
            titleStyle: AppStyle.font20_600Weight.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              letterSpacing: 0,
            ),
            description:
                'No internet? No problem! Reconnect and get back to exploring',
            descriptionStyle: AppStyle.font13_400Weight.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              height: 1.8,
              letterSpacing: 0,
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 120.w),
            child: CustomTextButton(
              onPressed: onPressed,
              text: 'Reconnect',
              customTextStyle: AppStyle.font14_700Weight.copyWith(
                color: AppColors.primary,
              ),
              isBorder: true,
              background: AppColors.white,
              height: 54.h,
              customBorderRadius: BorderRadius.circular(8.r),
              isUpperCase: false,
            ),
          ),
        ],
      ),
    );
  }
}
