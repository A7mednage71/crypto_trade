import 'package:crypto_trade/core/cubit/internet/internet_cubit.dart';
import 'package:crypto_trade/core/services/locator/get_it_locator.dart';
import 'package:crypto_trade/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildAppWithProviders({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => InternetCubit()..checkStreamConnection()),
      BlocProvider(create: (_) => ServicesLocator.introAppCubit),
      BlocProvider(create: (_) => ServicesLocator.locator<AuthCubit>()),
    ],
    child: child,
  );
}
