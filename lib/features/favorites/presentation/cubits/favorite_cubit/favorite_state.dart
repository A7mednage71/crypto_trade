import 'package:crypto_trade/features/favorites/data/models/favorite_coin_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

enum FavoriteStatus { initial, loading, success, failure }

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(FavoriteStatus.initial) FavoriteStatus status,
    @Default([]) List<FavoriteCoinModel> favorites,
    String? errorMessage,
  }) = _FavoriteState;
}
