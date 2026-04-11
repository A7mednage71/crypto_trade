import 'package:crypto_trade/core/utils/constant/app_assets.dart';
import 'package:crypto_trade/core/utils/constant/app_color.dart';
import 'package:crypto_trade/core/utils/widgets/custom_text_form_field.dart';
import 'package:crypto_trade/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenHeader extends StatelessWidget {
  const SearchScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchCubit>();
    return CustomTextFormField(
      controller: searchCubit.searchController,
      textInputType: TextInputType.text,
      hint: 'Search coins, tokens...',
      bgColor: AppColors.darkSurface,
      borderColor: AppColors.white.withValues(alpha: 0.08),
      prefixIcon: true,
      prefixImage: Assets.imagesSvgSearch,
      onChanged: (q) => searchCubit.onSearchChanged(),
    );
  }
}
