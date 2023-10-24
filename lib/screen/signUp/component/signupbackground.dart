import 'package:flutter/material.dart';

class SignUpBackground extends StatelessWidget {
  final Widget child;
  const SignUpBackground({
    Key? key, 
    required this.child,

  }) : super(key:key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height, 
      width: size.width,
      child: Stack(
        alignment:Alignment(0.2,0.6),
        children: <Widget>[
          // Positioned(
          //   top: 150,
          //   child: Image.asset("assets/images/logo.png"),
          //   width: size.width * 0.3,
          // ),
          child,
        ],
      ),//size.width
    );
  }
}