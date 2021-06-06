import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String? time;
  String flag;
  String location;
  String url;
  bool? isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
        Uri.parse('https://worldtimeapi.org/api/timezone/$url'),
      );
      //  MAP DATA => JSON DECODE
      Map data = jsonDecode(response.body);

      //  PUT INTO STRING VARIABLES
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1, 3);

      DateTime currentTime = DateTime.parse(dateTime);
      currentTime = currentTime.add(Duration(hours: int.parse(offSet)));

      isDayTime = currentTime.hour > 6 && currentTime.hour < 19 ? true : false;
      time = DateFormat.jm().format(currentTime);
    } catch (e) {
      time = "Couldn't get the time data";
    }
    // HTTP REQUEST
  }
}
