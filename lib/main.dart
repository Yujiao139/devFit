import 'package:flutter/material.dart';
import 'package:ox_tech/pages/improve_page.dart';
import 'package:ox_tech/pages/overview_page.dart';
import 'package:ox_tech/pages/validate_session.dart';

import 'pub/design_constants.dart' as globals;

void main() async => runApp(const MyApp());

class AppRoutes {
  static String detail = "/ActivityDetail";
  static String newSession = "/StartNewSession";
  static String overview = "/Overview";
  static String home = "/";
}
//body
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: globals.primaryColor,
        fontFamily: 'LibreBaskerville',
      ),
      initialRoute: "/",
      routes: {
        AppRoutes.home: (context) => OverviewPage(),
      },
      //home: HomePage(),
    );
  }
}
