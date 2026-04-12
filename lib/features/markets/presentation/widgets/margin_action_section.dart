import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/enums/trade_side.dart';
import 'package:crypto_trade/core/utils/widgets/app_status_dialog.dart';
import 'package:crypto_trade/features/activity/data/models/activity_model.dart';
import 'package:crypto_trade/features/activity/presentation/cubits/activity_cubit/activity_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/margin_cubit/margin_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/margin_cubit/margin_state.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/margin_action_button.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/order_confirmation_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarginActionSection extends StatelessWidget {
  const MarginActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MarginCubit, MarginState>(
      listenWhen: (p, c) => p.tradeStatus != c.tradeStatus,
      listener: (context, state) {
        _handleTradeStatus(context, state);
      },
      child: Row(
        children: [
          Expanded(
            child: MarginActionButton(
              label: 'Buy / Long',
              color: AppColors.success,
              onPressed: () => _openConfirmation(context, TradeSide.long),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: MarginActionButton(
              label: 'Sell / Short',
              color: AppColors.danger,
              onPressed: () => _openConfirmation(context, TradeSide.short),
            ),
          ),
        ],
      ),
    );
  }

  void _handleTradeStatus(BuildContext context, MarginState state) {
    if (state.tradeStatus == TradeStatus.success) {
      context.read<MarginCubit>().updateAvailableBalance(
        state.availableBalance - state.amountToTrade,
      );
      context.read<MarketsCubit>().decrementAvailableBalance(
        state.amountToTrade,
      );
      context.read<ActivityCubit>().log(
        type: state.tradeSide == TradeSide.long
            ? ActivityType.buy
            : ActivityType.sell,
        name:
            'Margin ${state.tradeSide == TradeSide.long ? 'Long' : 'Short'} '
            '(${state.leverage}x)',
        symbol: state.selectedMarginCoin?.symbol.toUpperCase() ?? '',
        amount: state.actualOrderAmount,
        price: state.selectedMarginCoin?.currentPrice ?? 0.0,
      );
      Navigator.pop(context);
      AppStatusDialog.show(
        context,
        isSuccess: true,
        title: 'Order Placed!',
        message: 'Your position is now active.',
        onDone: () {
          context.read<MarginCubit>().resetForm();
          Navigator.pop(context);
        },
      );
    } else if (state.tradeStatus == TradeStatus.failure) {
      Navigator.pop(context);
      AppStatusDialog.show(
        context,
        isSuccess: false,
        message: state.tradeErrorMessage ?? 'Failed to place order',
      );
    }
  }

  void _openConfirmation(BuildContext context, TradeSide side) {
    final cubit = context.read<MarginCubit>();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: OrderConfirmationSheet(side: side),
      ),
    );
  }
}
