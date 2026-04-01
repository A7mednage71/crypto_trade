import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/home/presentation/widgets/coin_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinSectionWidget extends StatelessWidget {
  final List<CoinResponseModel> coins;

  const CoinSectionWidget({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
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
    );
  }
}
