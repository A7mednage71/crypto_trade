import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButtonFormField<T> extends StatefulWidget {
  const CustomDropdownButtonFormField({
    required this.hint,
    this.label,
    this.vaidationText,
    required this.items,
    super.key,
    this.onChanged,
    this.chosenValue,
    this.itemToText,
  });

  final String hint;
  final String? label;
  final String? vaidationText;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final T? chosenValue;
  final String Function(T)? itemToText;

  @override
  State<CustomDropdownButtonFormField<T>> createState() =>
      _CustomDropdownButtonFormFieldState<T>();
}

class _CustomDropdownButtonFormFieldState<T>
    extends State<CustomDropdownButtonFormField<T>> {
  T? value;

  @override
  Widget build(BuildContext context) {
    final effectiveValue =
        (value ?? widget.chosenValue) != null &&
            widget.items.any((e) => e.value == (value ?? widget.chosenValue))
        ? value ?? widget.chosenValue
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          verticalSpace(10),
          Text(
            widget.label ?? '',
            style: AppStyle.font18_600Weight.copyWith(color: AppColors.primary),
          ),
          verticalSpace(10),
        ],
        DropdownButtonFormField<T>(
          hint: Text(
            widget.hint,
            style: AppStyle.font18_400Weight.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
          value: effectiveValue,
          iconSize: 30.r,
          iconEnabledColor: AppColors.primary,
          style: AppStyle.font18_400Weight.copyWith(color: AppColors.black),
          validator: (value) {
            if (value == null) {
              return widget.vaidationText;
            }
            return null;
          },
          menuMaxHeight: 300.h,
          iconDisabledColor: Colors.transparent,
          dropdownColor: AppColors.lightBackground,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: AppColors.lightGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          items: widget.items,
          selectedItemBuilder: (context) {
            return widget.items.map((item) {
              return Text(
                widget.itemToText != null
                    ? widget.itemToText!(item.value as T)
                    : '',
              );
            }).toList();
          },
          onChanged: (newValue) {
            setState(() {
              value = newValue;
            });
            widget.onChanged?.call(newValue);
          },
        ),
      ],
    );
  }
}
