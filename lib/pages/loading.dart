import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:world_time/services/world_time.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading..';
  String? location;
  String? timezone;

  void setUpTime() async {
    try {
      Response response = await get(
        Uri.parse("http://worldtimeapi.org/api/ip"),
      );
      Map data = jsonDecode(response.body);

      location = data['timezone'].substring(5, 11);
      timezone = data['timezone'];
      print(location);
    } catch (e) {
      print('Could not get the time');
    }
    WorldTime karon =
        WorldTime(location: location!, flag: 'ph.png', url: timezone!);

    await karon.getTime();
    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //   'location': karon.location,
    //   'flag': karon.flag,
    //   'time': karon.time,
    //   'isDayTime': karon.isDayTime,
    // });
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      setUpTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Image(
          image: AssetImage('assets/img/nezuko_run.gif'),
        ),
      ),
    );
  }
}
