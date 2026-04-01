import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/features/home/data/repos/home_repo.dart';
import 'package:crypto_trade/features/home/data/repos/home_repo_impl.dart';
import 'package:crypto_trade/features/home/presentation/cubits/home_cubit/home_cubit.dart';
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

    locator.registerLazySingleton<IntroAppCubit>(() => IntroAppCubit());
  }

  static HomeCubit get homeCubit => locator<HomeCubit>();
  static IntroAppCubit get introAppCubit => locator<IntroAppCubit>();
}
