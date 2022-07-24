import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    //Data from loading page
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings?.arguments as Map;

    String bgImage = data['isDayTime'] ? 'day_time.jpg' : 'night_time.jpg';
    print(data);

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () async{
                          dynamic result = await Navigator.pushNamed(context, '/location');
                          setState((){
                            data = {
                              'time': result['time'],
                              'location' : result['location'],
                              'isDayTime': result['isDayTime'],
                              'flag': result['flag'],
                            };
                          });
                        },
                        icon: Icon(Icons.edit_location),
                        color: Colors.white,
                        label: Text('Edit Location')),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/${data['flag']}'),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}
