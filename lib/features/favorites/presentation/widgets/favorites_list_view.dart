import 'package:crypto_trade/features/favorites/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:crypto_trade/features/favorites/presentation/cubits/favorite_cubit/favorite_state.dart';
import 'package:crypto_trade/features/favorites/presentation/widgets/empty_favorites_view.dart';
import 'package:crypto_trade/features/favorites/presentation/widgets/favorite_coin_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final favorites = state.favorites;
        if (favorites.isEmpty) {
          return const SliverFillRemaining(child: EmptyFavoritesView());
        }
        return SliverList.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final coin = favorites[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              child: FavoriteCoinTile(coin: coin),
            );
          },
        );
      },
    );
  }
}
