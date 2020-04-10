
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(location:'Kathmandu',flag:'indonesia.png',url:'Asia/Kathmandu'),
    
  ];

  void updateTime(index) async {
    WorldTime clickedObject = locations[index];
    await clickedObject.getTime();
    Navigator.pop(context,{
      'location':clickedObject.location,
      'flag':clickedObject.flag,
      'time':clickedObject.time,
      'isDay':clickedObject.isDay,
      
    });
  }

  @override
  //runs when widget tree is to be built or trigerred by setState()
  Widget build(BuildContext context) {
    print('build function ran');
    
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: locations.length,

        //with ListTile we can set image + label
        itemBuilder: (context,index){
          return ListTile(
            onTap: (){
              updateTime(index);
            },
            title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage : AssetImage('assets/${locations[index].flag}'),
            ),
            );
      }),
    );
  }
}