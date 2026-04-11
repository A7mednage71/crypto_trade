import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/search/presentation/widgets/search_result_view_body.dart';
import 'package:crypto_trade/features/search/presentation/widgets/search_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: CustomAppBar(title: 'Search'),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            SearchScreenHeader(),
            verticalSpace(16),
            SearchResultViewBody(),
          ],
        ),
      ),
    );
  }
}
