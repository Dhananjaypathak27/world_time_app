import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name for the ui
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; //location url for api endpoint
  bool isDayTime; // is is day or not

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async{

    try {
      Response response = await get(Uri.https('worldtimeapi.org', 'api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //print(data);

      //getting properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1,3);
      //print(datetime);
      //print(offset);

      //create date object
      DateTime now = DateTime.parse(datetime);
      now =now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour >6 && now.hour < 20 ? true: false;


      // set the time property
      time = DateFormat.jm().format(now);


    } catch (e) {
      print('caught error $e');
      time = 'could not get the time date';
    }

  }
}