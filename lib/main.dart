import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'package:plantask/Screens/add_screen.dart';
import 'package:provider/provider.dart';
import 'package:plantask/Models/task_data.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';



void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        initialRoute: '/',
        theme: ThemeData.dark().copyWith(
          accentColor: Color(0xFF03DAC5),
          backgroundColor: Color(0xFF16161a),
          primaryColor: Color(0xFF6200EE),
        ),
        routes: {
          '/' : (context) => HomeScreen(),
          '/add' : (context) =>  AddScreen(),
        },
      ), create: (context) => TaskData(),
    );
  }
}


