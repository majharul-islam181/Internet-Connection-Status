// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// part 'internet_state.dart';

// class InternetCubit extends Cubit<InternetStatus> {
//   InternetCubit()
//       : super(const InternetStatus(status: ConnectivityStatus.disconnected));

//   void checkConnectivity() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     _upadateConnectivityStatus(connectivityResult as ConnectivityResult);
//   }

//   void _upadateConnectivityStatus(ConnectivityResult result) {
//     if (result == ConnectivityResult.none) {
//       emit(const InternetStatus(status: ConnectivityStatus.disconnected));
//     } else {
//       emit(const InternetStatus(status: ConnectivityStatus.connected));
//     }
//   }

//   late StreamSubscription<ConnectivityResult> _subscription;
//   void tracConnectivityChange() {
//     _subscription = Connectivity().onConnectivityChanged.listen((result) {
//       _updateConnectivityStatus(result);
//     });
//   }
// }


import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetStatus> {
  InternetCubit() : super(const InternetStatus(status: ConnectivityStatus.disconnected)) {
    tracConnectivityChange(); // Start tracking connectivity changes on initialization
  }

  void checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult as ConnectivityResult);
  }

  void _updateConnectivityStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(const InternetStatus(status: ConnectivityStatus.disconnected));
    } else {
      emit(const InternetStatus(status: ConnectivityStatus.connected));
    }
  }

  late StreamSubscription<ConnectivityResult> _subscription;
  void tracConnectivityChange() {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      _updateConnectivityStatus(result as ConnectivityResult);
    }) as StreamSubscription<ConnectivityResult>;
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
