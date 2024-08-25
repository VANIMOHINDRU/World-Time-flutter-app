import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations=[
    WorldTime(url: 'Europe/London',location: 'London',flag:'uk.png'),
    WorldTime(url: 'Europe/Berlin',location: 'Athens',flag:'greece.png'),
    WorldTime(url: 'Africa/Cairo',location: 'Cairo',flag:'egypt.png'),
    WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flag:'kenya.png'),
    WorldTime(url: 'America/Chicago',location: 'Chicago',flag:'usa.png'),
    WorldTime(url: 'America/New_York',location: 'New York',flag:'usa.png'),
    WorldTime(url: 'Asia/Seoul',location: 'Seoul',flag:'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta',location: 'Jakarta',flag:'indonesia.png'),



  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    //navigate to homescreen
    Navigator.pop(context,{//data we want to send back to homepage
      'location': instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle:true,
        elevation:0,

      ),
      //allows us to return a widget template for each item inside the list (~map)
      body: ListView.builder(
        itemCount: locations.length,//items inside the list
        itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1.0,horizontal:13.0),
            child: Card(//flag icon and text
              child:ListTile(
                onTap:(){
                  updateTime(index);
                },
                title: Text(locations[index].location.toString()),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }    //returns a widget for each item, we also get access to each item, use it to get its data
    ),
    );

  }
}
