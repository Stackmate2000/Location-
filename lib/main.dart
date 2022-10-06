import 'package:flutter/material.dart';
import 'package:locationremiender/screens/auth/pageView_start.dart';
import 'package:locationremiender/screens/bottomnav/bottomNav_bar.dart';
import 'package:locationremiender/screens/homepages/map_sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BottomNavBar(),
        ));
  }
}
