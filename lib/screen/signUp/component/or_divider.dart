import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  //const name({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical:size.height * 0.03),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR", 
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              ),
          ),
            buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
          child: Divider(
            color: Colors.blue,
            height:1.6 ,
            ),
        );
  }
}

