import 'package:crypto_trade/core/export.dart';
import 'package:crypto_trade/core/utils/bloc_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await CacheHelper.init();

  ServicesLocator.setup();
  await ScreenUtil.ensureScreenSize();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await MessagingConfig.initFirebaseMessaging();
  // FirebaseMessaging.onBackgroundMessage(MessagingConfig.messageHandler);

  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  Bloc.observer = AppBlocObserver();
}
