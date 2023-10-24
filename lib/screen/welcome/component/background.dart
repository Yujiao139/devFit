import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          // Positioned(
          //   child: Image.asset(
          //     "assets/images/logo.png",
          //     width:size.width * 0.2,
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset("assets/images/profile.png",
          //   width:size.width * 0.4,
          //   height: size.height * 0.4,
          //   ),
          // ),
          child,
        ],
      ),
    );
  }
}