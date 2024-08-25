import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //to access the properties sent by loading via argument
  Map data={};

  @override
  Widget build(BuildContext context) {
    //we receive the actual arguments from loading here

    data= (data.isNotEmpty)?data:ModalRoute.of(context)!.settings.arguments as Map;

   print(data);

    //set background

    String bgImage= data['isDayTime']? 'day.png':'night.png';
    Color? bgColor=data['isDayTime']? Colors.blue[200]: Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover, //cover the entire screen


            )
          ),
        child:Padding(
          padding:const EdgeInsets.fromLTRB(0,120.0,0,0),


          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async{
                dynamic result=await Navigator.pushNamed(context,'/location');
                setState(() {
                  data={
                    'time':result['time'],
                    'location':result['location'],
                    'isDayTime':result['isDayTime'],
                    'flag':result['flag'],
                  };
                });
          },
                icon:Icon(
                    Icons.edit_location,
                    color: Colors.grey[900],
                ),
                label: Text(
                    'Edit Location',
                  style:TextStyle(
                    color: Colors.grey[900],
                  ),
                )

          ),

          SizedBox(height:20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                    color:Colors.black87,
                  )
                ),
              ],
            ),
            SizedBox(height:20.0),
              Text(
                data['time'],
                style:TextStyle(
                  fontSize: 66.0,
                  color:Colors.black87,
                ),
              ),

          ],
          ),
          ),
    ),
    ),
    );
  }
}
