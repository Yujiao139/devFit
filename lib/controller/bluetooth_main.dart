
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:permission_handler/permission_handler.dart';

class BlueToothPageMain extends GetxController {
  FlutterBluePlus bluetooth = FlutterBluePlus();

  Future ScanDevices() async {
    if(await Permission.bluetoothScan.request().isGranted){
      if(await Permission.bluetoothConnect.request().isGranted){
        FlutterBluePlus.startScan(timeout: Duration(seconds: 8));

        FlutterBluePlus.stopScan();
      }
    }
  }

  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;

  
}