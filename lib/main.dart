import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:ox_tech/pages/improve_page.dart';
import 'package:ox_tech/pages/overview_page.dart';
import 'package:ox_tech/provider/internet_provider.dart';
import 'package:ox_tech/provider/sign_in_provider.dart';
import 'package:ox_tech/screen/login/login_screen.dart';
import 'package:ox_tech/screen/signUp/signup_screen.dart';
//import 'package:ox_tech/pages/validate_session.dart';
 
import 'package:ox_tech/screen/welcome/welcome.dart';
import 'package:provider/provider.dart';
//import 'package:ox_tech/welcome/component/mainView.dart';

import 'firebase_options.dart';
import 'pub/design_constants.dart' as globals;

import 'package:firebase_core/firebase_core.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;


//void main() async => runApp(const MyApp());
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  //runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => InternetProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// class AppRoutes {
//   static String detail = "/ActivityDetail";
//   static String newSession = "/StartNewSession";
//   static String overview = "/Overview";
//   static String home = "/";
// }


//body
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      theme: ThemeData(
        primaryColor: Colors.white,//globals.primaryColor,
        fontFamily: 'LibreBaskerville',
        scaffoldBackgroundColor: Colors.white,
      ),
      
      initialRoute: Welcome.id,//"/",
      routes: {
        Welcome.id:(context) => Welcome(),
        LoginScreen.id:(context) => LoginScreen(),
        SignUpScreen.id:(context) => SignUpScreen(),
        //AppRoutes.home: (context) => OverviewPage(),
     },
     home:Welcome(),
     //home: HomePage(),
    );


  }
}
