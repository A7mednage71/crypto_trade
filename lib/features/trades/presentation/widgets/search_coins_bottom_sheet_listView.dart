// ignore: file_names
import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/trades/presentation/widgets/coin_picker_sheet_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCoinsBottomSheetListView extends StatefulWidget {
  const SearchCoinsBottomSheetListView({
    super.key,
    required this.filteredCoins,
    this.onCoinSelected,
  });

  final List<CoinResponseModel> filteredCoins;
  final Function(CoinResponseModel)? onCoinSelected;

  @override
  State<SearchCoinsBottomSheetListView> createState() =>
      _SearchCoinsBottomSheetListViewState();
}

class _SearchCoinsBottomSheetListViewState
    extends State<SearchCoinsBottomSheetListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.5) {
      context.read<MarketsCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.filteredCoins.length,
      separatorBuilder: (_, __) => verticalSpace(12),
      itemBuilder: (context, index) {
        return CoinPickerSheetItem(
          coin: widget.filteredCoins[index],
          onTap: () {
            Navigator.pop(context);
            widget.onCoinSelected?.call(widget.filteredCoins[index]);
          },
        );
      },
    );
  }
}
