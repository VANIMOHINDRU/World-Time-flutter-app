import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

//loads first
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime()async{
    WorldTime instance=WorldTime(location: 'Berlin',flag: 'germany.png',url:'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });

  }


  @override
  //when the widget starts,we run this fn first
  void initState() {

    super.initState();
    setupWorldTime();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
      child: SpinKitPulse(
        color:Colors.white,
        size:80.0,
      ),
      )
    );
  }
}
