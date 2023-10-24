import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ox_tech/pages/training_result.dart';

class RecordFreestyleSession extends StatefulWidget {
  const RecordFreestyleSession({super.key});

  @override
  State<RecordFreestyleSession> createState() => _RecordFreestyleSessionState();
}

class _RecordFreestyleSessionState extends State<RecordFreestyleSession> {
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 15);
  bool _isRunning = false;
  String selectedTimeGoal = '';
  List<String> _trainingTimeEnum = ['15 min', '20 min', '25 min', '30 min'];

  @override
  void initState() {
    selectedTimeGoal = _trainingTimeEnum[0];
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    setState(() {
      _isRunning = true;
    });
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async => Navigator.of(context).pop(),
              color: Colors.white),
          title: Text('Start your training',
              style: TextStyle(
                  fontFamily: 'LibreBaskerville',
                  fontSize: 18.0,
                  color: Colors.black)),
          backgroundColor: Colors.amberAccent,
          elevation: 0.0,
          centerTitle: true),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              Text('Time goal: '),
              DropdownButton(
                elevation: 0,
                value: selectedTimeGoal,
                icon: Icon(Icons.keyboard_arrow_down),
                items: _trainingTimeEnum
                    .map((String item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedTimeGoal = value!);
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            '$hours:$minutes:$seconds',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
          ),
          SizedBox(height: MediaQuery.of(context).size.height - 400),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => resetTimer(),
                  icon: const Icon(Icons.refresh)),
              IconButton(
                  onPressed: () => startTimer(),
                  icon: Icon(
                    _isRunning ? Icons.pause : Icons.play_arrow,
                  )),
              if (_isRunning)
                IconButton(
                    onPressed: () {
                      if (countdownTimer == null || countdownTimer!.isActive) {
                        stopTimer();
                            Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => TrainingResult()));
                      }
                    },
                    icon: const Icon(Icons.stop)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    countdownTimer!.cancel();
    super.dispose();
  }
}
