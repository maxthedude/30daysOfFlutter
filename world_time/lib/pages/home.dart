import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0,0),
          child: SafeArea(
              child: Column(children: [
      FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: Icon(Icons.edit_location),
            label: Text('Edit Location')),
      SizedBox(height: 20.0),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data['location'],
              style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
            ),
          ],
      ),
      SizedBox(height: 20.0),
      Text(data['time'],
      style: TextStyle(fontSize: 66.0))
    ])),
        ));
  }
}