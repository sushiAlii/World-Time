import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    String background =
        data['isDayTime'] ? 'kimi_no_na_wa.png' : 'zinetsu_moon.png';

    Color? bgColor;
    Color? textColor;
    Color? iconColor;
    Color? locationColor;
    Color? timeeColor;

    if (data['isDayTime'] == true) {
      bgColor = Colors.blue[800];
      textColor = Colors.grey[300];
      iconColor = Colors.grey[300];
      locationColor = Colors.white;
      timeeColor = Colors.white;
    } else {
      bgColor = Colors.grey[800];
      textColor = Colors.grey[900];
      iconColor = Colors.grey[300];
      locationColor = Colors.black;
      timeeColor = Colors.black;
    }

    print(data);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/$background'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/choose_location');

                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: iconColor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: locationColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: timeeColor,
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
