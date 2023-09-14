import 'package:flutter/material.dart';
import 'package:ox_tech/pub/business_constants.dart' as globals;

/// user information overview
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

enum ActivityList { running, badminton, pingPang }

class _SettingPageState extends State<SettingPage> {
  String startDay = globals.weekdayEnum[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
              child: Container(
            alignment: Alignment.center,
            child: Image(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
                height: 100.0,
                width: 100.0),
          )),
          Center(
            child: Text(
              'OX Tech Inc.',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'LibreBaskerville'),
            ),
          ),
          Center(
            child: Text(
              'version 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'LibreBaskerville'),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Switch Activity"),
            trailing: Icon(Icons.change_circle_outlined),
          ),
          ListTile(
            title: Text('Week starts from'),
            trailing: DropdownButton(
              value: startDay,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: globals.weekdayEnum
                  .map((String item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )))
                  .toList(),
              onChanged: (String? newValue) {
                setState(() => startDay = newValue!);
              },
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Text("Device Health"),
                Tooltip(
                  message: "Battery Stat",
                  child: Icon(Icons.question_mark_rounded),
                )
              ],
            ),
            trailing: Text("95%"),
          ),
          ListTile(
            title: Text("Support Us"),
            trailing: Icon(Icons.coffee),
          ),
          ListTile(
              title: Text('About'),
              trailing: Icon(Icons.question_mark_rounded)),
          ListTile(
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.redAccent),
            ),
            trailing: Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
