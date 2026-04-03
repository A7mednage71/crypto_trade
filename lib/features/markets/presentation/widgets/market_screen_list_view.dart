import 'package:crypto_trade/features/home/data/models/coin_response_model.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/markets/presentation/widgets/market_coin_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketScreenListView extends StatefulWidget {
  final List<CoinResponseModel> coins;

  const MarketScreenListView({super.key, required this.coins});

  @override
  State<MarketScreenListView> createState() => _MarketScreenListViewState();
}

class _MarketScreenListViewState extends State<MarketScreenListView> {
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
        _scrollController.position.maxScrollExtent * 0.7) {
      context.read<MarketsCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.only(bottom: 100.h),
      itemCount: widget.coins.length,
      itemBuilder: (context, index) {
        return MarketCoinTile(coin: widget.coins[index]);
      },
    );
  }
}
