import 'package:crypto_trade/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final double? width;
  final TextInputType textInputType;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChanged;
  final Color bgColor;
  final Color? textColor;
  final Color? cursorColor;
  final Color? borderColor;
  final String hint;
  final Color? hintColor;
  final String? label;
  final bool isRequired;
  final Color? labelColor;
  final double? labelFontSize;
  final bool isDense;
  final bool isPassword;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final dynamic maxLines;
  final dynamic minLines;
  final FormFieldValidator<String>? validator;
  final String counterText;
  final bool? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? suffixIconPressed;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Color floatingLabelColor;
  final bool isClickable;
  final bool expands;
  final bool hasCode;
  final EdgeInsetsGeometry? textPadding;
  final String? prefixImage;
  final Color? prefixImageColor;
  final void Function()? onEditingComplete;
  final bool? changePhoneNumber;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.width,
    this.maxLines = 1,
    required this.textInputType,
    this.onSubmit,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconPressed,
    this.inputFormatters,
    this.isPassword = false,
    this.isClickable = true,
    this.hint = '',
    this.hintColor,
    this.counterText = '',
    this.onTap,
    this.isDense = true,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.bgColor = AppColors.darkBackground,
    this.focusNode,
    this.maxLength,
    this.margin,
    this.contentPadding = const EdgeInsets.all(15),
    this.floatingLabelColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.cursorColor = AppColors.primary,
    this.borderColor,
    this.expands = false,
    this.hasCode = false,
    this.textPadding,
    this.prefixImage,
    this.prefixImageColor,
    this.minLines,
    this.onEditingComplete,
    this.changePhoneNumber = false,
    this.label,
    this.isRequired = false,
    this.labelColor,
    this.labelFontSize,
  });

  @override
  State<CustomTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode myFocusNode;
  int lengthCounter = 0;
  bool _obscureText = true;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Row(
            children: [
              Text(
                widget.label!,
                style: AppStyle.font13_400Weight.copyWith(
                  color: widget.labelColor ?? AppColors.lightGrey,
                ),
              ),
              if (widget.isRequired)
                Text(
                  ' *',
                  style: AppStyle.font13_400Weight.copyWith(
                    color: AppColors.error,
                  ),
                ),
            ],
          ),
          verticalSpace(10),
        ],
        TextFormField(
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          style: TextStyle(color: widget.textColor),
          cursorColor: widget.cursorColor,
          controller: widget.controller,
          focusNode: widget.focusNode,
          maxLines: widget.expands ? null : widget.maxLines,
          minLines: widget.expands ? null : widget.minLines,
          expands: widget.expands,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            filled: true,
            counterText: widget.maxLength != null
                ? '$lengthCounter/${widget.maxLength}'
                : '',
            fillColor: widget.bgColor,
            hintText: widget.hint,
            hintStyle: AppStyle.font18_400Weight.copyWith(
              color: widget.hintColor ?? AppColors.lightGrey,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.primary,
                      size: 25.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : widget.suffixIcon,
            prefixIcon: widget.prefixIcon != null && widget.prefixIcon == true
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      horizontalSpace(20),
                      SvgPicture.asset(
                        widget.prefixImage!,
                        fit: BoxFit.cover,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(
                          widget.prefixImageColor ?? AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  )
                : null,
            isDense: widget.isDense,
            contentPadding: widget.contentPadding,
            border: AppStyle.borderDone(
              color: widget.borderColor ?? AppColors.darkBackground,
            ),
            disabledBorder: AppStyle.borderDone(
              color: widget.borderColor ?? AppColors.darkBackground,
            ),
            enabledBorder: AppStyle.borderDone(
              color: widget.borderColor ?? AppColors.darkBackground,
            ),
            errorBorder: AppStyle.borderError(context),
            focusedBorder: AppStyle.borderFocuse(
              color: widget.borderColor ?? AppColors.darkBackground,
            ),
            errorMaxLines: 1,
          ),
          onFieldSubmitted: widget.onSubmit,
          onChanged: widget.maxLength != null ? (value) {} : widget.onChanged,
          validator: widget.validator,
          keyboardType: widget.textInputType,
          obscureText: widget.isPassword ? _obscureText : false,
          enabled: widget.isClickable,
        ),
      ],
    );
  }
}
