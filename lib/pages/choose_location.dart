import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime('Europe/London', 'London','uk.png'),
    WorldTime('Europe/Berlin', 'Athens', 'greece.png'),
    WorldTime('Africa/Cairo', 'Cairo', 'egypt.png'),
    WorldTime('Africa/Nairobi', 'Nairobi','kenya.png'),
    WorldTime('America/Chicago', 'Chicago', 'usa.png'),
    WorldTime('America/New_York', 'New York', 'usa.png'),
    WorldTime('Asia/Seoul', 'Seoul', 'south_korea.png'),
    WorldTime('Asia/Jakarta', 'Jakarta', 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime timeInstance = locations[index];
    await timeInstance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      "location": timeInstance.location,
      "flag": timeInstance.flag,
      "time": timeInstance.time,
      "isDayTime": timeInstance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
   // print('Init build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Choose Location'),
      ),
      body: ListView.builder(
          itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
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
          },
        itemCount: locations.length,
      )
    );
  }
}
