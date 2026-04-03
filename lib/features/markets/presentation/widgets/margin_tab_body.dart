import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/leverage_selector_slider.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/margin_action_section.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/margin_amount_input_card.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/margin_details_card.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/margin_header_selector.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/margin_risk_meter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarginTabBody extends StatelessWidget {
  const MarginTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          sliverVerticalSpace(24),
          const SliverToBoxAdapter(child: MarginHeaderSelector()),
          sliverVerticalSpace(24),
          SliverToBoxAdapter(child: MarginAmountInputCard()),
          sliverVerticalSpace(24),
          const SliverToBoxAdapter(child: LeverageSelectorSlider()),
          sliverVerticalSpace(32),
          const SliverToBoxAdapter(child: MarginDetailsCard()),
          sliverVerticalSpace(24),
          const SliverToBoxAdapter(child: MarginRiskMeter()),
          sliverVerticalSpace(40),
          const SliverToBoxAdapter(child: MarginActionSection()),
          sliverVerticalSpace(40),
        ],
      ),
    );
  }
}
