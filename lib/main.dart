import 'package:flutter/material.dart';
import 'package:internet_connection_status/regular_way/regular_way_setState.dart';
import 'package:internet_connection_status/stream_internet_checking/stream_internet_checking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const RegularWaySetstate(),
      home: const StreamInternetChecking(),
    );
  }
}
