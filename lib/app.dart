import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'core/cubit/internet/internet_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final RouteLogger routeLogger;

  const MyApp({super.key, required this.appRouter, required this.routeLogger});

  @override
  Widget build(BuildContext context) {
    return buildAppWithProviders(
      child: BlocListener<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state is ConnectedState) {
            ServicesLocator.introAppCubit.initApp();
          }
          if (state is NotConnectedState) {
            FToast()
                .init(context)
                .showToast(
                  child: worningToast('There is no internet connection..!'),
                  gravity: ToastGravity.CENTER,
                  toastDuration: const Duration(seconds: 3),
                );
          }
        },
        child: ScreenUtilInit(
          designSize: const Size(414, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorObservers: [routeLogger],
            navigatorKey: navigatorKey,
            title: 'Crypto Trade',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.darkBackground,
              primaryColor: AppColors.primary,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              fontFamily: 'NueMontreal',
              textTheme: const TextTheme().apply(fontFamily: 'NueMontreal'),
            ),
            onGenerateRoute: appRouter.onGenerateRoute,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        ),
      ),
    );
  }
}
