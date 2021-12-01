import 'package:eproxy/services/get_devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {

  bool scanStarted = false;
  GetDevices getDevices= GetDevices();
  List deviceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(onPressed: () async{
              setState(() {
                scanStarted = !scanStarted;
              });
              if(!scanStarted){
                getDevices.startScan();
                deviceList = await getDevices.getDevicesList();
              }else{
                print('Devices obtained: ${deviceList.length}');
                getDevices.stopScan();
              }
            },
                child: Container(
                  height: 70.0,
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(scanStarted?'Stop Scan':'Start Scan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      ),
                      ),
                    ),
                  ),
                )
            ),
          ),
          Text(scanStarted?'Scanning...\nPress Stop Scan to Start':'Press Start Scan to Start',
          style: TextStyle(
            color: Colors.black,
          ),
          )
        ],
      ),
    );
  }
}
