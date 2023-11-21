import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';


import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bluetooth_main.dart';


class BlueToothPage extends StatefulWidget {
  const BlueToothPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _BlueToothPage();
  }
  

}
 



  
class _BlueToothPage extends State<BlueToothPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan Bluetooth"),),
      body: GetBuilder<BlueToothPageMain>(
        init:BlueToothPageMain(),
        builder: (BlueToothPageMain controller){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                StreamBuilder<List<ScanResult>>(
                  stream: controller.scanResults, 
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context,index){
                          final data = snapshot.data![index];
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              title: Text(data.device.platformName),
                              subtitle: Text(data.device.remoteId as String),
                              trailing:Text(data.rssi.toString()),
                            ),
                          );
                        },
                      );

                    }else{
                      return Center(child:Text("No Devices"));

                    }
                  }
                  ),
                SizedBox(height: 8,),
                ElevatedButton(
                  onPressed: ()=>controller.ScanDevices(), 
                  child: Text("Scan"))
              ],
            ),
          );
        },
      ),

    );
  }

}






