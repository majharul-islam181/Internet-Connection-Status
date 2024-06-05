import 'package:flutter/material.dart';

class InternetAlert extends StatefulWidget {
  final bool isConnected;
  const InternetAlert({super.key, required this.isConnected});

  @override
  State<InternetAlert> createState() => _InternetAlertState();
}

class _InternetAlertState extends State<InternetAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.isConnected
                ? const Icon(
                    Icons.sentiment_satisfied_alt_rounded,
                    color: Colors.green,
                    size: 50,
                  )
                : const Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 50,
                  ),

                  Text(widget.isConnected ? 'Internet is back': "No Internet Connection")
          ],
        ),
      ),
    );
  }
}
