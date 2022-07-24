import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  var location;
  var time;
  var flag;
  var url;
  var isDayTime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime(String city) async{

    try{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$city'));
    Map data = jsonDecode(response.body);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'];
    offset = offset.substring(1,3);

    DateTime now = DateTime.parse(dateTime);
    now.add(Duration(hours: int.parse(offset)));

    isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
    time = DateFormat().add_jm().format(now);

    }catch(e){
      print('Error caught: $e');
      time = 'Could not get data';
    }
  }


}