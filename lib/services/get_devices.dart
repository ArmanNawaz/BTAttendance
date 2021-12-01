import 'package:flutter_blue/flutter_blue.dart';

class GetDevices{
  List<BluetoothDevice> deviceList = [];
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  print1(){
    print('Test print');
  }
  Stream<BluetoothDevice> scanResults() async*{
    flutterBlue.scanResults.listen((results) async*{
      for(ScanResult result in results){
        yield result.device;
      }
    });
  }


  Future<List<BluetoothDevice>> getDevicesList() async{

    await flutterBlue.scanResults.listen((List<ScanResult> results) {
      for(ScanResult result in results){
        deviceList.add(result.device);
      }
    });
    // Stream<BluetoothDevice> devices = await scanResults();
    // Future.delayed(Duration(seconds: 1));
    // print(devices);
    // await for(var device in devices){
    //   print('device: ' + device.id.toString());
    //   if(!deviceList.contains(device)) deviceList.add(device);
    // }
    Future.delayed(Duration(seconds: 2));
    print(deviceList.length);
    return deviceList;
  }

  startScan() async{
    await flutterBlue.startScan();
  }
  stopScan() async{
    await flutterBlue.stopScan();
  }
  Stream scannedReults() async*{
    print('Scan Starts');
    await flutterBlue.startScan();
    flutterBlue.scanResults
        .listen((List<ScanResult> results){
      for(ScanResult result in results){
        // print('results');
        // print(result.device.id.toString());
        // print(result.device.type);
        // print('\n');
        deviceList.add(result.device);
      }
      print(deviceList);
    });
    flutterBlue.stopScan();

  }


}