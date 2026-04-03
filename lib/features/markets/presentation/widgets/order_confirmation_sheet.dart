import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/constant/app_style.dart';
import 'package:crypto_trade/core/utils/enums/trade_side.dart';
import 'package:crypto_trade/core/utils/widgets/custom_text_button.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/liquidation_warning_box.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/order_summary_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderConfirmationSheet extends StatelessWidget {
  final TradeSide side;

  const OrderConfirmationSheet({super.key, required this.side});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketsCubit, MarketsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Order Confirmation', style: AppStyle.font20_600Weight),
              verticalSpace(24),
              OrderSummaryRow(
                label: 'Symbol',
                value:
                    '${state.selectedMarginCoin?.symbol.toUpperCase() ?? 'N/A'}/USDT',
              ),
              OrderSummaryRow(
                label: 'Leverage',
                value: 'Isolated ${state.leverage.toInt()}x',
              ),
              OrderSummaryRow(
                label: 'Margin Amount',
                value: '\$${state.amountToTrade.toStringAsFixed(2)}',
              ),
              OrderSummaryRow(
                label: 'Total Order Value',
                value: '\$${state.totalOrderValueUSD.toStringAsFixed(2)}',
              ),
              verticalSpace(16),
              const LiquidationWarningBox(),
              verticalSpace(32),
              _ConfirmOrderButton(side: side),
              verticalSpace(12),
            ],
          ),
        );
      },
    );
  }
}

class _ConfirmOrderButton extends StatelessWidget {
  final TradeSide side;

  const _ConfirmOrderButton({required this.side});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (MarketsCubit c) => c.state.tradeStatus == TradeStatus.loading,
    );

    return CustomTextButton(
      onPressed: () => context.read<MarketsCubit>().openMarginPosition(side),
      text: 'Confirm ${side.isLong ? "Long" : "Short"}',
      isLoading: isLoading,
      background: side.isLong ? AppColors.success : AppColors.danger,
      height: 50.h,
      isUpperCase: false,
      customTextStyle: AppStyle.font16_600Weight,
      customBorderRadius: BorderRadius.circular(12.r),
    );
  }
}
