import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PercentageSlider extends StatefulWidget {
  const PercentageSlider({
    super.key,
    required this.onPercentageChanged,
    this.activeColor = AppColors.primary,
  });

  final Function(int) onPercentageChanged;
  final Color activeColor;

  @override
  State<PercentageSlider> createState() => _PercentageSliderState();
}

class _PercentageSliderState extends State<PercentageSlider> {
  double _currentValue = 0;
  final List<int> _percentages = [0, 25, 50, 75, 100];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 2.h,
            activeTrackColor: widget.activeColor,
            inactiveTrackColor: AppColors.lightGrey.withValues(alpha: 0.1),
            thumbColor: AppColors.white,
            overlayColor: widget.activeColor.withValues(alpha: 0.1),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 6.r,
              pressedElevation: 4.r,
            ),
            tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 3.r),
            activeTickMarkColor: widget.activeColor,
            inactiveTickMarkColor: AppColors.lightGrey.withValues(alpha: 0.2),
          ),
          child: Slider(
            value: _currentValue,
            min: 0,
            max: 100,
            divisions: 4,
            onChanged: (value) {
              setState(() => _currentValue = value);
              widget.onPercentageChanged(value.toInt());
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _percentages.map((p) {
              return Text(
                p == 0 ? '' : '$p%',
                style: AppStyle.font12_400Weight.copyWith(
                  color: _currentValue >= p ? AppColors.white : AppColors.grey,
                  fontWeight: _currentValue == p
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
