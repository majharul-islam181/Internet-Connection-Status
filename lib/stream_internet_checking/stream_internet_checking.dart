
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../utils/connection_alert.dart';

class StreamInternetChecking extends StatefulWidget {
  const StreamInternetChecking({super.key});

  @override
  State<StreamInternetChecking> createState() => _StreamInternetCheckingState();
}

class _StreamInternetCheckingState extends State<StreamInternetChecking> {
  bool? result;
  bool? _isConnected;
  late StreamSubscription<InternetStatus> listener;
  BuildContext? _dialogContext;
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    listener =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      if (status == InternetStatus.connected) {
        if (!isFirstTime) {
          _showInternetStatusDialog(status == InternetStatus.connected);
        }
      } else {
        _showInternetStatusDialog(status == InternetStatus.connected);
      }
      isFirstTime = false;
      setState(() {
        _isConnected = (status == InternetStatus.connected);
      });
    });
  }

  void _showInternetStatusDialog(bool isConnected) {
    // Close previous dialog if it exists
    if (_dialogContext != null) {
      Navigator.of(_dialogContext!).pop();
    }

    // Show new dialog
    showDialog(
      context: context,
      builder: (context) {
        _dialogContext = context; // Store the context of the current dialog
        return InternetAlert(isConnected: isConnected);
      },
    ).then((_) {
      _dialogContext = null; // Clear the dialog context after it is closed
    });
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Connection Check"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Stream Connection Status : ${_isConnected == true ? "Connected" : "Not Connected"}"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  result = await InternetConnection().hasInternetAccess;
                  if (kDebugMode) {
                    print("Connection Status :$result");
                  }
                  setState(() {});
                },
                child: const Text("Check Connection Status"))
          ],
        ),
      ),
    );
  }
}
