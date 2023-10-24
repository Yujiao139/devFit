import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Hero(
              tag: "profileAvatar",
              child: ClipOval(
                child: Image(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.fill,
                    height: 150.0,
                    width: 150.0),
              ),
            ),
          ),
          Container(
            // four percentage circle
            height: 150,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Speed:",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),
                    ),
                    CircularPercentIndicator(
                      //Text:TextStyle("Speed:"),
                      animation: true,
                      radius: 40.0,
                      lineWidth: 9.0,
                      percent: 0.52,
                      center: Text('52%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0)),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Color(0xffdd9598),
                    ),
                    CircularPercentIndicator(
                      animation: true,
                      radius: 40.0,
                      lineWidth: 9.0,
                      percent: 0.31,
                      center: Text('31%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0)),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Color(0xffdd9598),
                    ),
                    CircularPercentIndicator(
                      animation: true,
                      radius: 40.0,
                      lineWidth: 9.0,
                      percent: 0.52,
                      center: Text('52%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0)),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Color(0xffdd9598),
                    ),
                    CircularPercentIndicator(
                      animation: true,
                      radius: 40.0,
                      lineWidth: 9.0,
                      percent: 0.88,
                      center: Text('88%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0)),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Color(0xffdd9598),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
