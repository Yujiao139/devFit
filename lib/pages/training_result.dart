import 'package:flutter/material.dart';

import 'overview_page.dart';

class TrainingResult extends StatefulWidget {
  const TrainingResult({super.key});

  @override
  State<TrainingResult> createState() => _TrainingResultState();
}

class _TrainingResultState extends State<TrainingResult> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    String trainingStyle = 'Validate';
    String trainingAspect = 'Force';
    String trainingTime = '30\'56"';
    int resultScore = 80;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async => Navigator.of(context).pop(),
              color: Colors.white),
          title: Text('Training Result'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(50),
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text('Training style: \t $trainingStyle',
                    style: TextStyle(fontSize: 18)),
              ),
              Divider(color: Colors.grey),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text('Training aspect:\t$trainingAspect',
                    style: TextStyle(fontSize: 18)),
              ),
              Divider(color: Colors.grey),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text('Training time: \t $trainingTime',
                    style: TextStyle(fontSize: 18)),
              ),
              Divider(color: Colors.grey),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text('Overall score: \t $resultScore',
                    style: TextStyle(fontSize: 18)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80, left: 50, right: 50),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {},
                        //style: TextButton.styleFrom(foregroundColor: Colors.blue),
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 20),
                        )),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OverviewPage())),
                        child: Text(
                          'Discard',
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
