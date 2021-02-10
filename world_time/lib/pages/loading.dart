import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  
  
  void setupWorldTime() async {
    WorldTime wtInstance = WorldTime(location:'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await wtInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : wtInstance.location,
      'flag' : wtInstance.flag,
      'time' : wtInstance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
     Padding(
       padding: const EdgeInsets.all(50.0),
       child: Text('loading'),
     )
     );
  }
}
