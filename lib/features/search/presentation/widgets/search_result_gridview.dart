import 'package:crypto_trade/features/search/data/models/search_result_model.dart';
import 'package:crypto_trade/features/search/presentation/widgets/search_coin_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key, required this.coins});
  final List<SearchResultModel> coins;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 12.r,
        crossAxisSpacing: 12.r,
      ),
      itemCount: coins.length,
      itemBuilder: (context, index) => SearchCoinTile(coin: coins[index]),
    );
  }
}
