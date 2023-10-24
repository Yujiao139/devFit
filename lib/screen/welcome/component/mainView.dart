// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ox_tech/components/login_button.dart';
import 'package:ox_tech/screen/login/login_screen.dart';
import 'package:ox_tech/screen/signUp/signup_screen.dart';
import 'package:ox_tech/screen/welcome/component/background.dart';

class MainView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    //total  height and width of screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Text("GOOD DAY",
            
            style: TextStyle(fontWeight: FontWeight.bold,
            height: size.height * 0.015,
            fontSize: 20,),
            ),
            SizedBox(height: size.height * 0.01,),
            Image.asset("assets/images/logo.png",
            //set container position
            height: size.height * 0.25,
            width: size.width * 1.0,
            ),
            SizedBox(height: size.height * 0.02,),
            LoginButton(
              text: "LOGIN",
              press: (){
                Navigator.pushNamed(context,LoginScreen.id);
                // Navigator.push(
                //   context, MaterialPageRoute(
                //     builder: (context){
                //       return LoginScreen();
                //       },
                //     ),
                //   );
                },
            ),
            LoginButton(
              text: "SIGNUP",
              color: Colors.lightBlue,
              textColor: Colors.white,
              press: (){
                 Navigator.pushNamed(context, SignUpScreen.id);
              //    Navigator.push(
              //   context, 
              //   MaterialPageRoute(
              //     builder: (context){
              //       return SignUpScreen();
              //     },
              //   ),
              // );
              },
            ),
          ],
        ),
      ),
    );
  }
}



