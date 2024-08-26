import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String? location;//location name for UI
  String? time;//time in that location.. location, flag, and url can be null if not provided(?)
  String? flag;//url to an asset flag icon
  String? url;//location in the url for api endpoint
  bool? isDayTime;

  WorldTime({this.location,this.flag,this.url}) ;
  Future<void> getTime() async {//Future <void>: return void but only after this async fn is fully complete,put because we have used await on a custom fn,tells await when this fn is complete and then it can move forward
    //make the requestt

    try{//to search for error
      http.Response response=await http.get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data= jsonDecode(response.body);
      //print(data);
      //get properties from data
      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);
      // print(datetime);
      //print(offset);

      //create a datetime object so that we can add offset to datetime
      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour>6 && now.hour<19?true:false;
      //set time property, dateformat is through the package imported,the line below is written to make the time more readable
      time=DateFormat.jm().format(now);

    }
    catch(e){
      print('Caught error: $e');

    }
  }

}

