import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color,textColor;
  const LoginButton({
    Key? key, 
    required this.text, 
    required this.press, 
    this.color = Colors.purple, 
    this.textColor = Colors.black,

  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical:10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
          style: TextButton.styleFrom(
            padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),      
          onPressed: press, 
          child: Text(
            text,
            style: TextStyle(color: textColor),
            ),
          ),
      ),
    );
  }
}