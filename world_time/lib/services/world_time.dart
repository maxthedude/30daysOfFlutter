import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String flag; // url to an asset icon
  String url; // world time api endpoint location
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url });

  Future<void> getTime() async{
    try{

    // request time from worldttimeapi
    Response resp = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(resp.body);
    print(data);

    // parse the data from the map
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    print(dateTime);
    print(offset);

    // create a DateTime object from the parsed string
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    time = DateFormat.jm().format(now);
    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    }
    catch(e) {
      print("caught: $e" );
      return "Problem getting time";
    }
    //time = now.toString();

   
  }

  
}