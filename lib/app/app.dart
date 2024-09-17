import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../core/theme/app_theme.dart';
import '../router/router.dart';

final GlobalKey<NavigatorState> myAppKey = GlobalKey<NavigatorState>();

class WasityCaptin extends StatefulWidget {
  const WasityCaptin({super.key});

  @override
  State<WasityCaptin> createState() => _WasityCaptinState();
}

class _WasityCaptinState extends State<WasityCaptin> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        theme: lightTheme(),
        navigatorKey: myAppKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: RouteNamedScreens.init,
      );
    });
  }
}
