import 'dart:async';
import 'dart:developer';

import 'package:crypto_trade/app.dart';
import 'package:crypto_trade/app_initi.dart';
import 'package:crypto_trade/core/navigation/app_router.dart';
import 'package:crypto_trade/core/utils/route_observer.dart';
import 'package:crypto_trade/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    logFlutterError(details);
  };

  runZonedGuarded(
    () async {
      await initializeApp();
      runApp(
        EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          fallbackLocale: Locale('en'),
          startLocale: Locale('en'),
          assetLoader: CodegenLoader(),
          child: MyApp(appRouter: AppRouter(), routeLogger: RouteLogger()),
        ),
      );
    },
    (error, stackTrace) {
      logDartError(error, stackTrace);
      log(stackTrace.toString(), name: 'main');
    },
  );
}

void logFlutterError(FlutterErrorDetails details) {
  debugPrint('A.B.O.N.A.G.E.H Flutter Error: ${details.exception}');
  debugPrint('A.B.O.N.A.G.E.H Stack trace: ${details.stack}');
}

void logDartError(Object error, StackTrace stackTrace) {
  debugPrint('A.B.O.N.A.G.E.H Dart Error: $error');
  debugPrint('A.B.O.N.A.G.E.H Stack trace: $stackTrace');
}
