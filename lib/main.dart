
import 'package:admin/providers/ChefRecordsProvider.dart';
import 'package:admin/providers/CustomerRecordsProvider.dart';
import 'package:admin/providers/MealRecordsProvider.dart';
import 'package:admin/providers/deleviryRecordsProvider.dart';
import 'package:admin/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  // لمنع الهاتف من القلب
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => deleviryRecordsProvider()),
    ChangeNotifierProvider(create: (context) => MealRecordsProvider()),
    ChangeNotifierProvider(create: (context) => ChefRecordsProvider()),
    ChangeNotifierProvider(create: (context) => CustomerRecordsProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
