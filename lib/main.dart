import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasity_captin/app/app.dart';
import 'core/injection/injection_container.dart' as di;
import 'core/storage/shared/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();


  SharedPreferences shPref = await SharedPreferences.getInstance();
  AppSharedPreferences.init(shPref);
  runApp(const WasityCaptin());

}
