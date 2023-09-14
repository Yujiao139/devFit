import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ParseCsv extends StatefulWidget {
  const ParseCsv({super.key});

  @override
  State<ParseCsv> createState() => _ParseCsvState();
}

class _ParseCsvState extends State<ParseCsv> {


  String filePath = '../assets/loggedData/';

  List<List<dynamic>> _data = [];

  Future<void> loadCsvFile(String fileName) async {
    final rawData = await rootBundle
        .loadString('${filePath}${fileName}');

    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    print(listData[0]);
    setState(() {
      _data = listData;
    });
  }

  Widget buildListData() {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (_, index) {
        return Card(
          margin: const EdgeInsets.all(3),
          color: index == 0 ? Colors.amber : Colors.white,
          child: ListTile(
            leading: Text(_data[index][0].toString()),
            title: Text(_data[index][1].toString()),
            trailing: Text(_data[index][2].toString()),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    //loadCsvFile('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildListData();
  }

}
