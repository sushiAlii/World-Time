// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:world_time/services/world_time.dart';

class LoadingLocation extends StatefulWidget {
  const LoadingLocation({Key? key}) : super(key: key);

  @override
  _LoadingLocationState createState() => _LoadingLocationState();
}

class _LoadingLocationState extends State<LoadingLocation> {
  List<String>? location;
  List<String>? timezone;
  void setUpLocationList() async {
    try {
      Response response = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/Asia"),
      );
      print(response.body[0]);
    } catch (e) {
      print("Can't Retrieve Data");
    }
  }

  @override
  void initState() {
    super.initState();
    setUpLocationList();
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

  // List<String> populateLocation(Map data) {
  //   for (int i = 0; i < data.length; i++) {

  //   }
  // }
}
