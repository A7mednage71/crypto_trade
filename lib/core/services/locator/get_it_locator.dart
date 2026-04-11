import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/activity/data/repos/activity_repo.dart';
import 'package:crypto_trade/features/activity/data/repos/activity_repo_impl.dart';
import 'package:crypto_trade/features/activity/presentation/cubits/activity_cubit/activity_cubit.dart';
import 'package:crypto_trade/features/auth/data/repos/auth_repo.dart';
import 'package:crypto_trade/features/auth/data/repos/auth_repo_impl.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/otp_cubit/otp_cubit.dart';
import 'package:crypto_trade/features/coin_details/data/repos/coin_details_repo.dart';
import 'package:crypto_trade/features/coin_details/data/repos/coin_details_repo_impl.dart';
import 'package:crypto_trade/features/coin_details/presentation/cubits/coin_details_cubit/coin_details_cubit.dart';
import 'package:crypto_trade/features/favorites/data/repos/favorites_repo.dart';
import 'package:crypto_trade/features/favorites/data/repos/favorites_repo_impl.dart';
import 'package:crypto_trade/features/favorites/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:crypto_trade/features/home/data/repos/home_repo.dart';
import 'package:crypto_trade/features/home/data/repos/home_repo_impl.dart';
import 'package:crypto_trade/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:crypto_trade/features/markets/data/repos/markets_repo.dart';
import 'package:crypto_trade/features/markets/data/repos/markets_repo_impl.dart';
import 'package:crypto_trade/features/markets/presentation/cubits/markets_cubit/markets_cubit.dart';
import 'package:crypto_trade/features/search/data/repos/search_repo.dart';
import 'package:crypto_trade/features/search/data/repos/search_repo_impl.dart';
import 'package:crypto_trade/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ServicesLocator {
  static final GetIt locator = GetIt.instance;

  static void setup() {
    final Dio dio = DioFactory.getDio();
    locator.registerLazySingleton<ApiService>(() => ApiService(dio));

    locator.registerLazySingleton<HomeRepo>(
      () => HomeRepoImpl(locator<ApiService>()),
    );

    locator.registerFactory<HomeCubit>(() => HomeCubit(locator<HomeRepo>()));

    locator.registerLazySingleton<MarketsRepo>(
      () => MarketsRepoImpl(locator<ApiService>()),
    );

    locator.registerFactory<MarketsCubit>(
      () => MarketsCubit(locator<MarketsRepo>()),
    );

    locator.registerLazySingleton<CoinDetailsRepo>(
      () => CoinDetailsRepoImpl(locator<ApiService>()),
    );

    locator.registerFactory<CoinDetailsCubit>(
      () => CoinDetailsCubit(locator<CoinDetailsRepo>()),
    );

    locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
    locator.registerFactory<AuthCubit>(
      () => AuthCubit(locator<AuthRepository>()),
    );
    locator.registerFactory<OtpCubit>(
      () => OtpCubit(locator<AuthRepository>()),
    );

    locator.registerLazySingleton<IntroAppCubit>(() => IntroAppCubit());

    locator.registerLazySingleton<FavoritesRepo>(
      () => FavoritesRepositoryImpl(),
    );
    locator.registerFactory<FavoriteCubit>(
      () => FavoriteCubit(locator<FavoritesRepo>()),
    );

    locator.registerLazySingleton<SearchRepo>(
      () => SearchRepoImpl(locator<ApiService>()),
    );
    locator.registerFactory<SearchCubit>(
      () => SearchCubit(locator<SearchRepo>()),
    );

    locator.registerLazySingleton<ActivityRepo>(
      () => ActivityRepoImpl(),
    );
    locator.registerLazySingleton<ActivityCubit>(
      () => ActivityCubit(locator<ActivityRepo>()),
    );
  }

  static HomeCubit get homeCubit => locator<HomeCubit>();
  static MarketsCubit get marketsCubit => locator<MarketsCubit>();
  static IntroAppCubit get introAppCubit => locator<IntroAppCubit>();
  static OtpCubit get otpCubit => locator<OtpCubit>();
  static AuthCubit get authCubit => locator<AuthCubit>();
  static CoinDetailsCubit get coinDetailsCubit => locator<CoinDetailsCubit>();
  static FavoriteCubit get favoriteCubit => locator<FavoriteCubit>();
  static SearchCubit get searchCubit => locator<SearchCubit>();
  static ActivityCubit get activityCubit => locator<ActivityCubit>();
}
