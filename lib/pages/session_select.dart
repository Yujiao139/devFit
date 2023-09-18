import 'package:flutter/material.dart';
import 'package:ox_tech/pages/freestyle_session.dart';
import 'package:ox_tech/pages/validate_session.dart';
import 'package:ox_tech/pub/design_constants.dart' as design_const;

class SessionSelect extends StatefulWidget {
  const SessionSelect({super.key});

  @override
  State<SessionSelect> createState() => _SessionSelectState();
}

class _SessionSelectState extends State<SessionSelect> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: design_const.backgroundColor,
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async => Navigator.of(context).pop(),
              color: Colors.white),
          backgroundColor: Colors.amberAccent,
          elevation: 0.0,
          title: const Text('Build your new Session',
              style: TextStyle(
                  fontFamily: 'LibreBaskerville',
                  fontSize: 18.0,
                  color: design_const.textColor)),
          centerTitle: true),
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 120),
            SizedBox(
              width: width,
              child: const Text(
                'Select your training style',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'LibreBaskerville'),
              ),
            ),
            const SizedBox(height: 80),
            Center(
                child: SizedBox(
              width: width*0.7,
              child: Row(
                children: <Widget>[
                  _buildSelectionBox(
                      pageRoute: RecordValidateSession(),
                      imgPath: '',
                      text: 'Validate',
                      buttonColor: Color(0xffa7c7c4)),
                  const Spacer(),
                  _buildSelectionBox(
                      pageRoute: RecordFreestyleSession(),
                      imgPath: '',
                      text: 'Freestyle',
                      buttonColor: Color(0xffe4d9bb))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionBox(
      {dynamic pageRoute,
      required String imgPath,
      required String text,
      required Color buttonColor}) {
    return Column(children: [
      SizedBox(
        width: 125,
        height: 125,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://picsum.photos/seed/321/600',
            fit: BoxFit.contain,
          ),
        ),
      ),
      const SizedBox(height: 20),
      InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => pageRoute)),
        child: Container(
          width: 125,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(75.0),
              )),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      )
    ]);
  }
}
