import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coin_card_model.dart';
import 'package:crypto_trade/features/home/presentation/widgets/coin_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinSectionWidget extends StatelessWidget {
  final String title;
  final List<CoinCardModel> coins;

  const CoinSectionWidget({
    super.key,
    required this.title,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            title,
            style: AppStyle.font18_600Weight.copyWith(color: AppColors.black),
          ),
        ),
        verticalSpace(10),
        SizedBox(
          height: 175.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: coins.length,
            itemBuilder: (context, index) {
              final coin = coins[index];
              return CoinCardWidget(coin: coin);
            },
          ),
        ),
      ],
    );
  }
}
