import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/enums/trade_order_type.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/percentage_slider.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/segmented_order_tabs.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/sheet_top_bar.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/trading_number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TradeActionSheet extends StatefulWidget {
  const TradeActionSheet({super.key, required this.isBuy});

  final bool isBuy;

  @override
  State<TradeActionSheet> createState() => _TradeActionSheetState();
}

class _TradeActionSheetState extends State<TradeActionSheet> {
  final TextEditingController _priceController = TextEditingController(
    text: '0.000000',
  );
  final TextEditingController _quantityController = TextEditingController(
    text: '0.000000',
  );

  TradeOrderType _selectedOrderType = TradeOrderType.limit;
  int _sliderPercentage = 0;

  @override
  void dispose() {
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color actionColor = widget.isBuy
        ? AppColors.primary
        : AppColors.error;
    final String actionText = widget.isBuy ? 'Buy' : 'Sell';

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 32.h),
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SheetTopBar(),
          SegmentedOrderTabs(
            onTabChanged: (type) {
              setState(() => _selectedOrderType = type);
            },
          ),
          verticalSpace(24),
          TradingNumberInput(
            label: 'Price:',
            controller: _priceController,
            onIncrement: () {},
            onDecrement: () {},
          ),
          verticalSpace(16),
          TradingNumberInput(
            label: 'Quantity:',
            controller: _quantityController,
            hintText: 'Minimum 10 BUSD',
            onIncrement: () {},
            onDecrement: () {},
          ),
          verticalSpace(24),
          PercentageSlider(
            onPercentageChanged: (val) {
              setState(() => _sliderPercentage = val);
            },
          ),
          verticalSpace(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _selectedOrderType == TradeOrderType.market
                    ? 'ESTIMATED TOTAL:'
                    : 'TOTAL:',
                style: AppStyle.font12_400Weight.copyWith(
                  color: AppColors.grey,
                ),
              ),
              horizontalSpace(8),
              Text('25.234164400', style: AppStyle.font14_400Weight),
            ],
          ),
          if (_sliderPercentage > 0)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Using $_sliderPercentage% of available balance',
                  style: AppStyle.font10_400Weight.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          verticalSpace(24),
          CustomTextButton(
            height: 52.h,
            background: actionColor,
            text: actionText,
            isUpperCase: false,
            customBorderRadius: BorderRadius.circular(12.r),
            onPressed: () {},
            customTextStyle: AppStyle.font18_400Weight.copyWith(
              color: widget.isBuy ? AppColors.darkBackground : AppColors.white,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
