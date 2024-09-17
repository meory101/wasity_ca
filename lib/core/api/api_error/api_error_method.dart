import 'package:flutter/cupertino.dart';

import '../../storage/shared/shared_pref.dart';


abstract class ApiErrorMethod {
  static void invalidSessionToken({required BuildContext context}) {

    AppSharedPreferences.clear();
    // Navigator.of(context)
    //     .pushNamedAndRemoveUntil(RouteNamedScreens.auth, (route) => false);
  }





  static void noInternetConnection({required BuildContext context}) {
    // Navigator.of(context)
    //     .pushReplacementNamed(RouteNamedScreens.noInternet)
    //  ;
  }

  static void serverError({required BuildContext context}) {
    // Navigator.of(context)
    //     .pushReplacementNamed(RouteNamedScreens.noInternet);
  }
}



