import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/wallets/presentation/cubits/wallet_cubit/wallet_cubit.dart';
import 'package:crypto_trade/features/wallets/presentation/cubits/wallet_cubit/wallet_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletBalanceHeader extends StatefulWidget {
  const WalletBalanceHeader({super.key});

  @override
  State<WalletBalanceHeader> createState() => _WalletBalanceHeaderState();
}

class _WalletBalanceHeaderState extends State<WalletBalanceHeader> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Balance',
                    style: AppStyle.font14_400Weight.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    child: Icon(
                      _isVisible
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: AppColors.grey,
                      size: 24.w,
                    ),
                  ),
                ],
              ),
              verticalSpace(8),
              Text(
                _isVisible ? state.myBalance.toStringAsFixed(2) : '******',
                style: AppStyle.font24_700Weight.copyWith(
                  color: AppColors.white,
                  fontSize: 32.sp,
                ),
              ),
              verticalSpace(4),
              Text(
                _isVisible ? '\$468,554.23' : '******',
                style: AppStyle.font14_400Weight.copyWith(
                  color: AppColors.grey,
                ),
              ),
              verticalSpace(24),
            ],
          ),
        );
      },
    );
  }
}
