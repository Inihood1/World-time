import 'dart:core';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location;
  late String time;
  late String flag;
  late String url;

  late bool isDayTime;

  WorldTime(this.url, this.location, this.flag,);

  Future<void> getTime() async{
    // make a request
    try{
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map jsonData = jsonDecode(response.body);
      String ofset = jsonData["utc_offset"].substring(1, 3);
      String dateTime = jsonData["datetime"];
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(ofset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    }catch(e){
      print("error: $e");
      time = "Error getting time";
    }
  }

}