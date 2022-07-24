import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

    void setupWorldTime() async{
      WorldTime worldTime = new WorldTime(location: 'Accra',flag: 'ghana.png',url:'Africa/Accra');
      String city = worldTime.url;
      await worldTime.getTime(city);

      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location': worldTime.location,
        'flag': worldTime.flag,
        'time': worldTime.time,
        'isDayTime' : worldTime.isDayTime,
      });
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: SpinKitPianoWave(
              color: Colors.white,
              size: 50.0,
            ),
        ),
      ),
    );
  }
}
