import 'package:crypto_trade/core/utils/enums/market_tab_type.dart';
import 'package:crypto_trade/features/main_layout/presentation/widgets/nav_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_navigation_state.freezed.dart';

@freezed
class AppNavigationState with _$AppNavigationState {
  const factory AppNavigationState({
    @Default(NavItem.home) NavItem selectedBottomNavItem,
    @Default(MarketTabType.spot) MarketTabType selectedTradesTab,
  }) = _AppNavigationState;
}
