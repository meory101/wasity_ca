import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasity_captin/core/navigation/fade_builder_route.dart';
import 'package:wasity_captin/core/storage/shared/shared_pref.dart';
import 'package:wasity_captin/core/widget/page/not_found_page.dart';
import 'package:wasity_captin/feature/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:wasity_captin/feature/auth/presentation/cubit/verify_code_cubit/verify_code_cubit.dart';
import 'package:wasity_captin/feature/auth/presentation/screen/signin_screen.dart';
import 'package:wasity_captin/feature/auth/presentation/screen/verify_code_screen.dart';
import 'package:wasity_captin/feature/delivered_orders/presentation/cubit/signin_cubit/delivered_orders_cubit.dart';
import 'package:wasity_captin/feature/main/presentation/screen/main_home.dart';
import 'package:wasity_captin/feature/map/screen/map_screen.dart';
import 'package:wasity_captin/feature/profile/presentation/cubit/get_profile_cubit/get_profile_cubit.dart';
import 'package:wasity_captin/feature/profile/presentation/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:wasity_captin/feature/profile/presentation/screen/profile_screen.dart';
import '../core/injection/injection_container.dart' as di;

abstract class RouteNamedScreens {
  static String init =  signin;
      // AppSharedPreferences.getUserId().isEmpty ? signin : mainHome;
  static const String map = '/map';
  static const String signin = '/login';
  static const String verifyCode = '/verify-code';
  static const String mainHome = '/main-home';
  static const String profile = '/profile';
  static const String deliveredOrders = '/delivered-orders';
}

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case RouteNamedScreens.map:
        return MaterialPageRoute(
          builder: (context) {
            return const MapScreen();
          },
        );
      case RouteNamedScreens.signin:
        return FadeBuilderRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<SigninCubit>(),
              )
            ],
            child: const SigninScreen(),
          ),
        );
      case RouteNamedScreens.verifyCode:
        argument as VerifyCodeArgs;
        return FadeBuilderRoute(
            page: BlocProvider(
          create: (context) => di.sl<VerifyCodeCubit>(),
          child: VerifyCodeScreen(
            args: argument,
          ),
        ));
      case RouteNamedScreens.mainHome:
        return FadeBuilderRoute(page: const MainHomeScreen());
      case RouteNamedScreens.profile:
        return FadeBuilderRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => di.sl<GetProfileCubit>()..getProfile(),
              ),
              BlocProvider(
                create: (context) => di.sl<UpdateProfileCubit>(),
              ),
            ],
            child: const ProfileScreen(),
          ),
        );

      case RouteNamedScreens.deliveredOrders:
        return FadeBuilderRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    di.sl<DeliveredOrdersCubit>()..getDeliveredOrder(),
              ),
            ],
            child: const ProfileScreen(),
          ),
        );
    }
    return FadeBuilderRoute(page: const NotFoundScreen());
  }
}
