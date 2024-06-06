// import 'package:flutter/material.dart';
// import 'package:internet_connection_status/regular_way/regular_way_setState.dart';
// import 'package:internet_connection_status/stream_internet_checking/stream_internet_checking.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // home: const RegularWaySetstate(),
//       home: const StreamInternetChecking(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/internet_cubit.dart';


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
      home: BlocProvider(
        create: (_) => InternetCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Connectivity"),
      ),
      body: Center(
        child: BlocBuilder<InternetCubit, InternetStatus>(
          builder: (context, state) {
            return Text(
              'Connection Status: ${state.status == ConnectivityStatus.connected ? "Connected" : "Disconnected"}',
            );
          },
        ),
      ),
    );
  }
}
