import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; //location name for UI
  String time=''; //time at location
  String flag; //url to flag icon
  String url; //location url for API endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{

      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    //get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //Set time property
    time = now.toString();

    }
    catch(e) {

      print('caught error : $e');
      time = 'could not update time';
    }

  }

}

WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');