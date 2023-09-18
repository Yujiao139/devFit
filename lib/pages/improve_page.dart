import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:ox_tech/pages/session_select.dart';
import 'package:ox_tech/pub/business_constants.dart' as business_constant;
import 'package:ox_tech/pub/design_constants.dart' as design_constant;
import 'package:video_player/video_player.dart';

/// dropdown list to toggle aspect
/// video of 2-3 min training guide
/// 3-5 min training plan
class ImprovePage extends StatefulWidget {
  late final Function _setTrainingAspect;

  @override
  State<ImprovePage> createState() => _ImprovePageState();
}

class _ImprovePageState extends State<ImprovePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

/*
  String filepath = '../../assets/loggedData/';

  List<ActivityLog> _items = [];


  Future<void> loadData() async {
    final String response = await rootBundle.loadString('${filepath}LoggedData_ActivityLog.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }
*/
  var data = [];

  @override
  void initState() {
    // loadData();
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async => Navigator.of(context).pop(),
            color: Colors.white),
        backgroundColor: design_constant.bgDarker,
        elevation: 0.0,
        title: Text('Improve your skills'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 30, top: 30, right: 30),
            child: DropdownButton(
                value: business_constant.trainingAspects[0],
                icon: const Icon(Icons.keyboard_arrow_down),
                items: business_constant.trainingAspects
                    .map((String item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (String? newValue) {
                  setState(
                      () => business_constant.trainingAspects[0] = newValue!);
                }),
          ),
          Container(
              alignment: Alignment.center,
              height: 150,
              width: width * 0.8,
              // comparison with history on current aspect
              child: _buildHisComparison()),
          Container(
            padding: EdgeInsets.all(20),
            height: 200,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ), // video
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  // If the video is playing, pause it.
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50, top: 20, bottom: 20),
            child: Text("3 - 5 minutes Training Tips:\n1. xxx\n2. yyy\n3.zzz"),
          ),
          Center(
              child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(75)),
                      color: design_constant.bgLighter),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => SessionSelect())),
                    child: Text("Start a new training session now!"),
                  )))
        ],
      ),
    );
  }

  var _sampleDataShort = [SampleData('Average', 23), SampleData('Latest', 45)];

  Widget _buildHisComparison() {
    /// build chart compare only the Last training score with the Average training score
    var seriesList = [
      charts.Series<SampleData, String>(
          id: 'Score',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (SampleData sample, _) => sample.timestamp,
          measureFn: (SampleData sample, _) => sample.score,
          data: _sampleDataShort)
    ];
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: 800,
        height: 150,
        child: charts.BarChart(seriesList, animate: true, vertical: false),
      ),
    );
  }
}

class SampleData {
  final String timestamp;
  final int score;

  SampleData(this.timestamp, this.score);
}
