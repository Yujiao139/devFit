import 'package:flutter/material.dart';

void openSnackbar(context,snackMessage,color){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color,
    action: SnackBarAction(
      label:"OK",
      textColor: Colors.red,
      onPressed: (){},
    ),
    content: Text(
      snackMessage,style: TextStyle(fontSize: 15),),
  ));
}