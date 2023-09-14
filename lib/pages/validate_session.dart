import 'dart:async';

import 'package:flutter/material.dart';

import 'package:ox_tech/pub/design_constants.dart' as design_const;

import 'package:ox_tech/pages/training_result.dart';

/// switch from validate type or freestyle
/// freestyle session: stopwatch, stop/start/pause/restart
/// instructed session:
///   steps of instructions: 1. set running speed to 5m/s, slope to 0, etc.
///   stop/start/pause/restart
class RecordValidateSession extends StatefulWidget {
  const RecordValidateSession({super.key});

  @override
  State<RecordValidateSession> createState() => _RecordValidateSessionState();
}

class _RecordValidateSessionState extends State<RecordValidateSession> {
  Stopwatch _stopwatch = Stopwatch();
  String _elapsedTime = '00:00:00.00';
  late Timer _timer;
  bool _isRunning = false;


  int typeIndex = 0;
  String selectedAspect = '';
  List<String> sessionType = ['Validate', 'Freestyle'];

  @override
  void initState() {
    _isRunning = false;
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) => ());
    selectedAspect = sessionType[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.white),
          backgroundColor: design_const.bgLighter,
          elevation: 0.0,
          title: const Text('Start New Session',
              style: TextStyle(
                  fontFamily: 'LibreBaskerville',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true),
      body:Container(
        padding: const EdgeInsets.all(50),
        child:ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text('1. Setup the xxx',
                  style: TextStyle(fontSize: 18)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text('2. Setup the yyy',
                  style: TextStyle(fontSize: 18)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text('3. Setup the zzz',
                  style: TextStyle(fontSize: 18)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text('4. Start the timer!',
                  style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 150),
            Center(
              child: Text(
                '$_elapsedTime',
                style: TextStyle(fontSize: 35),
              ),
            ),

            _buildControl(),
          ],
        ),

      ),



    );
  }

  Widget _buildControl(){
    return Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => _resetTimer(),
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () => _startTimer(),
              icon: Icon(
                _isRunning ? Icons.pause : Icons.play_arrow,
              )),
          if (_isRunning)
            IconButton(
                onPressed: () {
                  if (_timer == null || _timer!.isActive) {
                    _stopTimer();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => TrainingResult()));
                  }
                },
                icon: const Icon(Icons.stop)),
        ],
      ),
    );
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        _elapsedTime = _stopwatch.elapsed.toString().substring(0, 10);
      });
    });
    _isRunning = true;
  }

  void _stopTimer() {
    _stopwatch.stop();
    _timer.cancel();
    _isRunning = false;
  }

  void _resetTimer() {
    _stopwatch.reset();
    _timer.cancel();
    setState(() {
      _elapsedTime = '00:00:00.00';
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
