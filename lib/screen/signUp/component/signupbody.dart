import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ox_tech/components/already_have_account.dart';
import 'package:ox_tech/components/input_container.dart';
import 'package:ox_tech/components/login_button.dart';
import 'package:ox_tech/components/password_container.dart';
import 'package:ox_tech/screen/login/login_screen.dart';
import 'package:ox_tech/screen/signUp/component/or_divider.dart';
import 'package:ox_tech/screen/signUp/component/signupbackground.dart';
import 'package:ox_tech/screen/signUp/component/social_icon.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignUpBody extends StatelessWidget {
  
  final RoundedLoadingButtonController googleController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {  
    Size size = MediaQuery.of(context).size;
   // mainAxisAlignment: MainAxisAlignment.end;
    
    return SignUpBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Image.asset("assets/images/logo.png",
            width: size.width * 0.4,
            ),
            Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),
            ),
            //from login-component-body.dart
            InputField(
              inputText: "Your Email",
              onChanged: (value){},
            ),
            PasswordContainer(
              onChanged: (value){},
            ),
            LoginButton(
              text: "SignUp", 
              press: (){},
            ),
            SizedBox(height: size.height * 0.03,),
            AlreadyHaveAccountCheck(
              login: false,
              press: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context){
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedLoadingButton(
                  controller: googleController,
                  successColor: Colors.blue, 
                  onPressed: (){}, 
                  child: const Wrap(
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        size: 22,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),),
                RoundedLoadingButton(
                  controller: googleController,
                  successColor: Colors.blue, 
                  onPressed: (){}, 
                  child: const Wrap(
                    children: [
                      Icon(
                        FontAwesomeIcons.facebook,
                        size: 22,
                        color: Colors.white,
                        
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                Padding(padding:  EdgeInsets.symmetric(horizontal: 8.0),),
                RoundedLoadingButton(
                  controller: googleController,
                  successColor: Colors.blue, 
                  onPressed: (){}, 
                  child: const Wrap(
                    children: [
                      Icon(
                        FontAwesomeIcons.twitter,
                        size: 22,
                        color: Colors.white,
                        
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                // SocialMediaIcon(
                //   iconSrc: "assets/images/logo.png",
                //   press:(){} ,
                // ),
                // SocialMediaIcon(
                //   iconSrc: "assets/images/logo.png",
                //   press:(){} ,
                // ),
                // SocialMediaIcon(
                //   iconSrc: "assets/images/logo.png",
                //   press:(){} ,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

