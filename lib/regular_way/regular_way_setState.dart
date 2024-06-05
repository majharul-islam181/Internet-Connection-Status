import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class RegularWaySetstate extends StatefulWidget {
  const RegularWaySetstate({super.key});

  @override
  State<RegularWaySetstate> createState() => _RegularWaySetstateState();
}

class _RegularWaySetstateState extends State<RegularWaySetstate> {
  bool? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet connection check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Connection status :${result == true ? "Conntected" : "Not Connected"} '),
            ElevatedButton(
                onPressed: () async {
                  result = await InternetConnection().hasInternetAccess;
                  if (kDebugMode) {
                    print("connection status: $result");
                  }
                  setState(() {});
                },
                child: const Text('Check Connection Status'))
          ],
        ),
      ),
    );
  }
}
