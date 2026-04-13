import 'package:crypto_trade/core/utils/enums/market_tab_type.dart';
import 'package:crypto_trade/features/main_layout/presentation/cubits/app_navigation_cubit/app_navigation_state.dart';
import 'package:crypto_trade/features/main_layout/presentation/widgets/nav_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigationCubit extends Cubit<AppNavigationState> {
  AppNavigationCubit() : super(const AppNavigationState());

  void changeBottomNavItem(NavItem item) {
    emit(state.copyWith(selectedBottomNavItem: item));
  }

  void changeTradesTab(MarketTabType tab) {
    emit(state.copyWith(selectedTradesTab: tab));
  }

  void mapToTrades(MarketTabType targetTab) {
    emit(state.copyWith(
      selectedBottomNavItem: NavItem.trades,
      selectedTradesTab: targetTab,
    ));
  }
}
