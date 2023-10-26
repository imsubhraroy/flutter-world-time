import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String location;
  late String time;
  late String bg;
  late Color bgColor;

  @override
  Widget build(BuildContext context) {

    Object? data = ModalRoute.of(context)!.settings.arguments;

    if (data != null) {
      if (data is Map<String, dynamic>) {
        // Check if the data is a map, adjust the type according to your needs
        Map<String, dynamic> mapData = data as Map<String, dynamic>;

        setState(() {
          location = mapData['location'];
          time = mapData['time'];
          bg = mapData['isDayTime'] ? 'animated-4828785_1280.jpg' : 'download.png';
          bgColor =  (mapData['isDayTime'] ? Colors.blue: Colors.indigo[700])!;
        });

      }
    };

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assests/$bg'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: [
                  TextButton.icon(onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                    label: Text('Edit Location'),
                    icon: Icon(Icons.edit_location),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            location,
                            style: TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0
                            ),
                        )
                      ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 30.0
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
