import 'package:crypto_trade/core/helpers/space_helper.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/coin_picker_sheet_Item.dart';
import 'package:flutter/material.dart';

class SearchCoinsBottomSheetListView extends StatelessWidget {
  const SearchCoinsBottomSheetListView({
    super.key,
    required this.filteredCoins,
    this.onCoinSelected,
  });

  final List<CoinResponseModel> filteredCoins;
  final Function(CoinResponseModel)? onCoinSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: filteredCoins.length,
      separatorBuilder: (_, __) => verticalSpace(12),
      itemBuilder: (context, index) => CoinPickerSheetItem(
        coin: filteredCoins[index],
        onTap: () {
          Navigator.pop(context);
          onCoinSelected?.call(filteredCoins[index]);
        },
      ),
    );
  }
}
