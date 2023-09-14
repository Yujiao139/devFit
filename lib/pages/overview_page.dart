import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ox_tech/pages/session_select.dart';
import 'package:ox_tech/pages/setting_page.dart';
import 'package:ox_tech/pages/user_page.dart';
import 'package:ox_tech/pub/business_constants.dart' as business_constant;
import 'package:ox_tech/pub/design_constants.dart' as design_const;

import 'improve_page.dart';

/// current date time
/// user avatar
/// dropdown list to toggle training aspects: force, speed,
/// bar chart, y axis: average score/personal score last time, x axis: score
/// line chart, y axis: score, x axis: history score, starting Monday
/// flocating action button: click to start new freestyle/instructed session
class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  var globalKey = GlobalKey<ScaffoldState>();
  String selectedAspect = '';

  @override
  State<StatefulWidget> createState() {
    return _OverviewPageState();
  }

  @override
  void initState() {
    selectedAspect = business_constant.trainingAspects[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SettingPage()))),
        elevation: 0,
        backgroundColor: design_const.primaryColor,
        title: Text(
          DateFormat.yMMMEd().format(DateTime.now()),
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          _userInfo(),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 30),
                  child: const Text('Training Goal of the day: \t',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'LibreBaskerville',
                          fontSize: 15.0)),
              ),
              DropdownButton(
                  elevation: 0,
                  value: selectedAspect,
                  disabledHint: const Text('Not Available'),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: business_constant.trainingAspects
                      .map((String item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() => selectedAspect = newValue!);
                  }),
            ],
          ),
          Container(
            margin: EdgeInsets.all(30),
            height: 150.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(75.0)),
            ),
            child: InkWell(
              child: _buildLastToAvgView(),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ImprovePage())),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            height: 150.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(75.0),
              ),
            ),
            child: _buildCurrentWeekView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SessionSelect())),
        backgroundColor: Color(0xffe4d9bb),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  /// build the welcome message
  Widget _userInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(child:
          Container(
            //margin: EdgeInsets.only(top: 25.0),
            padding: EdgeInsets.only(left: 30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text('Good day,',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'LibreBaskerville',
                          fontSize: 15.0)),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Text(business_constant.sampleUserName,
                      style: const TextStyle(
                          fontFamily: 'LibreBaskerville',
                          color: Colors.black,
                          fontSize: 23.0))
                ]),
          ),
        ),
        Expanded(child:
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: 50, top: 50),
            child: InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UserPage())),
              child: Hero(
                tag: 'profileAvatar',
                child: ClipOval(
                    child: Image(
                        image: new AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                        height: 100.0,
                        width: 100.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // List _trainingResult = [];
  //
  // Future<void> readLocalFile() async {
  //   final String json = await rootBundle
  //       .loadString('../../assets/loggedData/LoggedData_ActivityLog.json');
  //   final data = ActivityLog.fromRawJson(json);
  //   setState(() {
  //     _trainingResult = data.trainingResults;
  //   });
  // }

  var _sampleDataShort = [SampleData('Average', 23), SampleData('Latest', 45)];

  /// build chart compare only the Last training score with the Average training score
  Widget _buildLastToAvgView() {
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

  var _sampleDataLong = [
    SampleData('08/01', 23),
    SampleData('08/02', 84),
    SampleData('08/03', 12),
    SampleData('08/04', 12),
    SampleData('08/05', 45)
  ];

  /// build chart display current week's (starting date can be toggled in user setting page) training socre trend
  Widget _buildCurrentWeekView() {
    var seriesList = [
      charts.Series<SampleData, String>(
          id: 'Score',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (SampleData sample, _) => sample.timestamp,
          measureFn: (SampleData sample, _) => sample.score,
          data: _sampleDataLong)
    ];
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 20.0),
      child: Container(
        width: 800,
        height: 150,
        child: charts.BarChart(
          seriesList,
          animate: true,
        ),
      ),
    );
  }
}

class SampleData {
  final String timestamp;
  final int score;

  SampleData(this.timestamp, this.score);
}
