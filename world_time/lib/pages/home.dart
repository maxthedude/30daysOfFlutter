import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context)  {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //choose image
    String bgImage = data['isDayTime'] ? "day.png" : "night.png";
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
       backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0,0),
              child: SafeArea(
                  child: Column(children: [
      FlatButton.icon(
                onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                            data = result;
                            print(data);
                                    });
                },
                icon: Icon(Icons.edit_location,
                color: Colors.grey[300]),
                label: Text('Edit Location',
                style: TextStyle(color: Colors.grey[300]),)),
      SizedBox(height: 20.0),
      Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(fontSize: 28.0, letterSpacing: 2.0, color: Colors.white),
                ),
              ],
      ),
      SizedBox(height: 20.0),
      Text(data['time'],
      style: TextStyle(fontSize: 66.0, color: Colors.white))
    ])),
            ),
          ),
        ));
  }
}
