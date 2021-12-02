import 'package:eproxy/constants.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/material.dart';



class BluePage extends StatefulWidget {

  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> deviceList = [];
  //final BluetoothState state = BluetoothState.off;

  @override
  _BluePageState createState() => _BluePageState();
}

class _BluePageState extends State<BluePage> {

  @override
  void initState() {
    super.initState();
    widget.flutterBlue.connectedDevices
    .asStream()
    .listen((List<BluetoothDevice> devices){
      for(BluetoothDevice device in devices){
        _addDeviceToList(device);
      }
    });

    widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
      for(ScanResult result in results){
        _addDeviceToList(result.device);
        // result.device returns a BluetoothDevice object
      }
    });
    widget.flutterBlue.startScan();
  }

  // Adds element to the device list if the device object is not initially added
  _addDeviceToList(BluetoothDevice bluetoothDevice){
    if(!widget.deviceList.contains(bluetoothDevice)){
      setState(() {
        widget.deviceList.add(bluetoothDevice);
      });
    }
  }


  ListView _buildListViewOfDevices(){
    List<Container> containers = [];
    for(BluetoothDevice device in widget.deviceList){
      containers.add(
        Container(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(device.name == '' ? '(unknown device)' : device.name),
                    Text(device.id.toString()),
                  ],
                ),
              ),
              TextButton(
                child: Container(
                  width: 80.0,
                    height: 30.0,
                    child: const Text(
                    'Connect',
                    style: TextStyle(color: Colors.black),
                    ),
                ),
                onPressed: () {},
              ),

            ],
          ),
        )
      );
    }
    return ListView(
      padding: const EdgeInsets.all(8),
      children: containers,
    );
  }

  // ListView _buildView(){
  //   if(_connectedDevice != null){
  //     return _buildConnectDeviceView();
  //   }
  //   return _buildListViewOfDevices();
  // }
  //
  // ListView _buildConnectDeviceView(){
  //   return ListView(
  //     padding: EdgeInsets.all(8.0),
  //     children: [],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: 'Device List'),
      body: _buildListViewOfDevices(),
    );
  }

}
