
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ox_tech/components/already_have_account.dart';
import 'package:ox_tech/components/input_container.dart';
import 'package:ox_tech/components/login_button.dart';
import 'package:ox_tech/components/password_container.dart';
import 'package:ox_tech/components/text_container.dart';
import 'package:ox_tech/others/snack_bar.dart';
import 'package:ox_tech/pages/overview_page.dart';
import 'package:ox_tech/provider/sign_in_provider.dart';
import 'package:ox_tech/screen/login/component/background.dart';
import 'package:ox_tech/screen/login/login_screen.dart';
import 'package:ox_tech/screen/signUp/component/or_divider.dart';
import 'package:ox_tech/screen/signUp/signup_screen.dart';
import 'package:ox_tech/screen/welcome/welcome.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../provider/internet_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Body extends StatelessWidget {


  final RoundedLoadingButtonController googleController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController = RoundedLoadingButtonController(); 
  Body({
    Key? key
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Image.asset("assets/images/logo.png",
            width: size.width * 0.4,
            ),
          
          InputField(
            inputText:"Your Email",
            onChanged: (value) {},
          ),
          PasswordContainer(
            onChanged: (value) {},
         ),
         LoginButton(
          text: "LOGIN", 
          press: () async {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context){
            //       return const OverviewPage();
            //     }
            //   ),
            // );
            //excute login
            UserCredential user =   await FirebaseAuth.instance.signInWithEmailAndPassword(email: "test@gmail.com", password: "123456");
            print("===login success====${user.user?.email}");

          },
          ),
          AlreadyHaveAccountCheck(
            press: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context){
                    return SignUpScreen();
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
                  onPressed: () async {
                    //await SignInProvider().signInWithGoogle();
                    // await LoginScreen().handleGoogleSignIn();
                    handleGoogleSignIn(context);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder:  (context) => const OverviewPage()));
                    //handleGoogleSignIn(context);
                  },//handleGoogleSignIn();}, 
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
                Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),),
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
                Padding(padding:  EdgeInsets.symmetric(horizontal: 20.0),),
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
              ],
            )
        ], 
      ),
    );





  }


   


  //google sign in
  Future handleGoogleSignIn(BuildContext context) async {


    //var context;
    final sp = context.read<SignInProvider>();
    final ip= context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if(ip.hasInternet == false){
      
      openSnackbar(context, "Check your internet connection", Colors.red);
      googleController.reset();
      //facebookController.reset();
    }else{
      await sp.signInWithGoogle().then((value) {
        if(sp.hasError==true){
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          googleController.reset();
          //facebookController.reset();
        }else{
          //checking whether user exists or not
          sp.checkUserExists().then((value) async{
            if(value==true){//user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) =>sp
              .saveDataToSharedPreferences()
              .then((value)=>sp.setSignIn().then((value){
                googleController.reset();
                handleAfterSignIn(context);
              })));

            }else{//user does not exist
                sp.saveDataToFirestore().then((value) => sp
                .saveDataToSharedPreferences().then((value)=>sp
                .setSignIn().then((value){
                  googleController.success();
                  handleAfterSignIn(context);
                })));

            }
          });
        }
      });
    }

  }


  

//handle after google sign in
handleAfterSignIn(BuildContext context) async {
  Future.delayed(const Duration(milliseconds: 1000)).then((value){

    Navigator.push(
      context , 
      MaterialPageRoute(
        builder: (context){
          return const OverviewPage();
        }
      ),
    );
  });
}


  handleAfterSignOut(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 1000)).then((value){

      Navigator.push(
        context ,
        MaterialPageRoute(
            builder: (context){
              return Welcome();
            }
        ),
      );
    });
  }




}

