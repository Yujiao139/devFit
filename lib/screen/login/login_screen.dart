
import 'package:flutter/material.dart';
import 'package:ox_tech/others/snack_bar.dart';
import 'package:ox_tech/pages/overview_page.dart';
import 'package:ox_tech/provider/internet_provider.dart';
import 'package:ox_tech/provider/sign_in_provider.dart';
import 'package:ox_tech/screen/login/component/body.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';



class LoginScreen extends StatefulWidget{
  static String id = 'login_screen.dart';
  LoginScreen({Key? key}) :super(key: key);

   

  

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  
  


  

}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  final RoundedLoadingButtonController googleController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController = RoundedLoadingButtonController();
  


  @override
  Widget build(BuildContext context) {


 


    
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Body(),
   );
  }





}
