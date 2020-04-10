
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //await valid only for async
  void createObject() async {
    //creating WorldTime object
    WorldTime object = WorldTime(location:'Kathmandu',flag:'Nepal.png',url:'Asia/Kathmandu');
    await object.getTime(); // await + async then use Future<void>
    
    //sending data to home page.
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':object.location,
      'flag':object.flag,
      'time':object.time,
      'isDay':object.isDay,
    });
  }

  //cant make initState() async so making another function that creates an object of WorldTime
  @override
  void initState() {
    super.initState();
    createObject();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
),
      
    );
  }
}