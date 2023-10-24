import 'package:flutter/material.dart';

class SocialMediaIcon extends StatelessWidget {
  final String iconSrc;
  final VoidCallback press;
  const SocialMediaIcon({
    Key? key, 
    required this.iconSrc, 
    required this.press,
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          "assets/images/logo.png",
          //iconSrc,
          height: 20,
          width: 20,
        ),   
      ),
    );
  }
}

