import 'dart:core';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   void setupWorldTime() async {
    WorldTime instance = WorldTime("Africa/Lagos", "Nigeria", "flag");
    await instance.getTime();
    //navigate to next along with some data
    // Navigator.pushReplacementNamed(context, "/home", arguments: {
    //   "location": instance.location,
    //   "flag": instance.flag,
    //   "time": instance.time,
    //   "isDayTime": instance.isDayTime
    // });

    print("Testing");
    final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    print(currentTimeZone); // Europe/Moscow

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
