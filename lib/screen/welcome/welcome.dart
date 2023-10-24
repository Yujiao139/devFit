import 'package:flutter/material.dart';
import 'package:ox_tech/screen/welcome/component/mainView.dart';

class Welcome extends StatelessWidget{

  static String id = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:MainView(),);
  }

}