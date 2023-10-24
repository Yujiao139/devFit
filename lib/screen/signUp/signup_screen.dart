import 'package:flutter/material.dart';
import 'package:ox_tech/screen/login/component/body.dart';
import 'package:ox_tech/screen/signUp/component/signupbody.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'signup_screen.dart';


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(
        //child: Column(),
      ),
    );
  }

}

