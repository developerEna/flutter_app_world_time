import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location>{


  @override
  Widget build(BuildContext context) {
    List<WorldTime> locations = [
        WorldTime(url: 'Africa/Accra',location: 'Accra',flag:'ghana.png'),
        WorldTime(url: 'Africa/Cairo',location: 'Cairo',flag:'egypt.png'),
        WorldTime(url: 'Africa/Nairobi',location: 'Nairobi',flag:'kenya.png'),
        WorldTime(url: 'Europe/Berlin',location: 'Berlin',flag:'germany.png'),
        WorldTime(url: 'Europe/Madrid',location: 'Madrid',flag:'spain.png'),
        WorldTime(url: 'America/Mexico_City',location: 'Mexico City',flag:'mexico.png'),
    ];

    void updateTime(index) async{
        WorldTime instance = locations[index];
        String city = instance.url;
        await instance.getTime(city);

        Navigator.pop(context, {
          'location': instance.location,
          'flag': instance.flag,
          'time': instance.time,
          'isDayTime' : instance.isDayTime,
        }
        );
    }

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
          ),
    );
  }
}
