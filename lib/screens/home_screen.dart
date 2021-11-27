import 'package:eproxy/services/bluetoothlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eproxy/screens/report.dart';
import 'package:eproxy/constants.dart';
import 'package:eproxy/screens/register.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: myAppBar(title: 'BT Attendance'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton(title: 'Take Attendance', onPress: () {}),
            buildButton(
                title: 'Today\'s Report',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BluePage()),
                  );
                }),
            buildButton(
                title: 'Register Students',
                onPress: (){
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context)=>const Register()),
                  );
                }
            ),
            buildButton(
                title: 'View Students List',
                onPress: (){}
                ),
            const SizedBox(height: 20.0,)
          ],
        ),
      ),
    );
  }

  Widget buildButton({title,required Function() onPress}) {
    return Center(
      child: SizedBox(
        height: 65,
        width: 250,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            elevation: 20.0,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: const BorderSide(
              color: Colors.deepPurpleAccent,
              width: 1.6,
            ),

          ),
            child: Text(
                title,
                style:const TextStyle(fontSize: 20),
            ),
            onPressed: onPress,
        ),
      ),
    );
  }
}


