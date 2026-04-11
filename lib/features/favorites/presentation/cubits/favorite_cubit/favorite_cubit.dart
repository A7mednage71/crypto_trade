import 'package:crypto_trade/features/favorites/data/models/favorite_coin_model.dart';
import 'package:crypto_trade/features/favorites/data/repos/favorites_repo.dart';
import 'package:crypto_trade/features/favorites/presentation/cubits/favorite_cubit/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoritesRepo _repository;

  FavoriteCubit(this._repository) : super(const FavoriteState()) {
    getFavorites();
  }

  Box<FavoriteCoinModel> get favoriteBox => _repository.favoriteBox;

  Future<void> getFavorites() async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    try {
      final favorites = _repository.getFavorites();
      emit(state.copyWith(status: FavoriteStatus.success, favorites: favorites));
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoriteStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> toggleFavorite(FavoriteCoinModel coin) async {
    try {
      await _repository.toggleFavorite(coin);
      await getFavorites();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoriteStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> removeFavorite(String coinId) async {
    try {
      await _repository.removeFavorite(coinId);
      await getFavorites();
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoriteStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  bool isFavorite(String coinId) {
    return _repository.isFavorite(coinId);
  }
}
