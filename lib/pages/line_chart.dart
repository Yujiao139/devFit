// import 'package:csv/csv.dart';
// 
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// 
// class _LineChart extends StatelessWidget {
//   const _LineChart({required this.isShowingMainData});
// 
//   final bool isShowingMainData;
// 
//   
// @override
//   void initState(){
//     chartData = getChartData();
//     Timer.periodic(const Duration(seconds:1),updateDataSource);
//     super.initState();
//   }
// 
// 
//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//       isShowingMainData ? sampleData1 : sampleData2,
//       duration: const Duration(milliseconds: 250),
//     );
//   }
// 
//   LineChartData get sampleData1 => LineChartData(
//         lineTouchData: lineTouchData1,
//         gridData: gridData,
//         titlesData: titlesData1,
//         borderData: borderData,
//         lineBarsData: lineBarsData1,
//         minX: 1,
//         maxX: 8,
//         maxY: 5,
//         minY: 0,
//       );
// 
//   LineChartData get sampleData2 => LineChartData(
//         lineTouchData: lineTouchData2,
//         gridData: gridData,
//         titlesData: titlesData2,
//         borderData: borderData,
//         lineBarsData: lineBarsData2,
//         minX: 1,
//         maxX: 8,
//         maxY: 5,
//         minY: 0,
//       );
// 
//   LineTouchData get lineTouchData1 => LineTouchData(
//         handleBuiltInTouches: true,
//         touchTooltipData: LineTouchTooltipData(
//           tooltipBgColor: Colors.white.withOpacity(0.8),
//         ),
//       );
// 
//   FlTitlesData get titlesData1 => FlTitlesData(
//         bottomTitles: AxisTitles(
//           sideTitles: bottomTitles,
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: leftTitles(),
//         ),
//       );
// 
//   List<LineChartBarData> get lineBarsData1 => [
//         lineChartBarData1_1,
//         lineChartBarData1_2,
//         lineChartBarData1_3,
//       ];
// 
//   LineTouchData get lineTouchData2 => const LineTouchData(
//         enabled: false,
//       );
// 
//   FlTitlesData get titlesData2 => FlTitlesData(
//         bottomTitles: AxisTitles(
//           sideTitles: bottomTitles,
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: leftTitles(),
//         ),
//       );
// 
//   List<LineChartBarData> get lineBarsData2 => [
//         lineChartBarData2_1,
//         lineChartBarData2_2,
//         lineChartBarData2_3,
//       ];
// 
//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 14,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 1:
//         text = '-2';
//         break;
//       case 2:
//         text = '-1';
//         break;
//       case 3:
//         text = '0';
//         break;
//       case 4:
//         text = '1';
//         break;
//       case 5:
//         text = '2';
//         break;
//       default:
//         return Container();
//     }
// 
//     return Text(text, style: style, textAlign: TextAlign.center);
//   }
// 
//   SideTitles leftTitles() => SideTitles(
//         getTitlesWidget: leftTitleWidgets,
//         showTitles: true,
//         interval: 1,
//         reservedSize: 40,
//       );
// 
//   Widget bottomTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     );
//     Widget text;
//     switch (value.toInt()) {
//       case 2:
//         text = const Text('1.69906', style: style);
//         break;
//       case 7:
//         text = const Text('1.69906', style: style);
//         break;
//       case 12:
//         text = const Text('1.69906', style: style);
//         break;
//       default:
//         text = const Text('');
//         break;
//     }
// 
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 10,
//       child: text,
//     );
//   }
// 
//   SideTitles get bottomTitles => SideTitles(
//         showTitles: true,
//         reservedSize: 32,
//         interval: 1,
//         getTitlesWidget: bottomTitleWidgets,
//       );
// 
//   FlGridData get gridData => const FlGridData(show: true);
// 
//   FlBorderData get borderData => FlBorderData(
//         show: true,
//         border: const Border(
//           bottom:
//               BorderSide(color: Colors.blue, width: 2),
//           left: BorderSide(color: Colors.transparent),
//           right: BorderSide(color: Colors.transparent),
//           top: BorderSide(color: Colors.transparent),
//         ),
//       );
// 
//   LineChartBarData get lineChartBarData1_1 => LineChartBarData(
//         isCurved: true,
//         color: Colors.green,
//         barWidth: 8,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1.699060702277,-0.7480469),
//           FlSpot(1.699060702277,-0.7272339),
//           FlSpot(1.699060702277,-0.7271118),
//           FlSpot(1.699060702336,-0.7421875),
//           FlSpot(1.699060702425,-0.72576904),
//           FlSpot(1.699060702425,-0.7249756),
//           FlSpot(1.699060702427,-0.7214966),
//         ],
//       );
// 
//   LineChartBarData get lineChartBarData1_2 => LineChartBarData(
//         isCurved: true,
//         color: Colors.pink,
//         barWidth: 8,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(
//           show: false,
//           color: Colors.pink.withOpacity(0),
//         ),
//         spots: const [
//           FlSpot(1.699060702277, 0.2975464),
//           FlSpot(1.699060702277, 0.27905273),
//           FlSpot(1.699060702277, 0.28961182),
//           FlSpot(1.699060702336, 0.28527832),
//           FlSpot(1.699060702425, 0.27764893),
//           FlSpot(1.699060702425, 0.31188965),
//         ],
//       );
// 
//   LineChartBarData get lineChartBarData1_3 => LineChartBarData(
//         isCurved: true,
//         color: Colors.cyan,
//         barWidth: 8,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1.699060702277, 0.585022),
//           FlSpot(1.699060702277, 0.5940552),
//           FlSpot(1.699060702277, 0.55493164),
//           FlSpot(1.699060702336, 0.52557373),
//           FlSpot(1.699060702425, 0.5560913),
//         ],
//       );
// 
//   LineChartBarData get lineChartBarData2_1 => LineChartBarData(
//         isCurved: true,
//         curveSmoothness: 0,
//         color: Colors.green.withOpacity(0.5),
//         barWidth: 4,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1.699060702277,-0.7480469),
//           FlSpot(1.699060702277,-0.7272339),
//           FlSpot(1.699060702277,-0.7271118),
//           FlSpot(1.699060702336,-0.7421875),
//           FlSpot(1.699060702425,-0.72576904),
//           FlSpot(1.699060702425,-0.7249756),
//           FlSpot(1.699060702427,-0.7214966),
//         ],
//       );
// 
//   LineChartBarData get lineChartBarData2_2 => LineChartBarData(
//         isCurved: true,
//         color: Colors.pink.withOpacity(0.5),
//         barWidth: 4,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: false),
//         belowBarData: BarAreaData(
//           show: true,
//           color: Colors.pink.withOpacity(0.2),
//         ),
//         spots: const [
//           FlSpot(1.699060702277, 0.2975464),
//           FlSpot(1.699060702277, 0.27905273),
//           FlSpot(1.699060702277, 0.28961182),
//           FlSpot(1.699060702336, 0.28527832),
//           FlSpot(1.699060702425, 0.27764893),
//           FlSpot(1.699060702425, 0.31188965),
//           //_listData: const FlListData()
//         ],
//       );
// 
//   LineChartBarData get lineChartBarData2_3 => LineChartBarData(
//         isCurved: true,
//         curveSmoothness: 0,
//         color: Colors.cyan.withOpacity(0.5),
//         barWidth: 2,
//         isStrokeCapRound: true,
//         dotData: const FlDotData(show: true),
//         belowBarData: BarAreaData(show: false),
//         spots: const [
//           FlSpot(1.699060702277, 0.585022),
//           FlSpot(1.699060702277, 0.5940552),
//           FlSpot(1.699060702277, 0.55493164),
//           FlSpot(1.699060702336, 0.52557373),
//           FlSpot(1.699060702425, 0.5560913),
//         ],
//       );
// }
// 
// class LineChartSample1 extends StatefulWidget {
//   const LineChartSample1({super.key});
// 
//   @override
//   State<StatefulWidget> createState() => LineChartSample1State();
// }
// 
// class LineChartSample1State extends State<LineChartSample1> {
//   late bool isShowingMainData;
//   List<List<dynamic>> _csvData=[];
// 
//   @override
//   void initState() {
//     super.initState();
//     isShowingMainData = true;
//   }
// 
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.23,
//       child: Stack(
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               const SizedBox(
//                 height: 37,
//               ),
//               const Text(
//                 'Monthly Sales',
//                 style: TextStyle(
//                   color: Colors.brown,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 2,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(
//                 height: 37,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 16, left: 6),
//                   child: _LineChart(isShowingMainData: isShowingMainData),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.refresh,
//               color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
//             ),
//             onPressed: () {
//               setState(() {
//                 isShowingMainData = !isShowingMainData;
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
// 
// 
//   void _loadCSV() async{
//     final _rawData = await rootBundle.loadString("assets/loggedData/Stream.csv");
//     List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData);
//     setState(() {
//       _csvData = _listData;
//     });
//     _csvData;
// 
//   }
// 
// 
// 
// 
// //   List<LiveData> getChartData() {
// //       Text(_csvData as String);
// //       return <LiveData>[
// //         LiveData(0,42),
// //         LiveData(1,47),
// //         // for(var i=0;i<=_csvData.length-1;i++){
// //         //  LiveData = ;
// //         // }
// //       ];
// // }
// 
// 
// }