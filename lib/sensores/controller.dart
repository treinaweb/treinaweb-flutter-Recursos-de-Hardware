import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensoresController extends ChangeNotifier {
  final streamSubscription = <StreamSubscription>[];
  var accelerometerValues = const <double>[];
  var gyroscopeValues = const <double>[];
  var magnetometerValues = const <double>[];

  void getAccelerometer() {
    streamSubscription.add(
      accelerometerEvents.listen((event) {
        accelerometerValues = _convertValues(event.x, event.y, event.z);
        notifyListeners();
      }),
    );
  }

  void getGyroscope() {
    streamSubscription.add(gyroscopeEvents.listen((event) {
      gyroscopeValues = _convertValues(event.x, event.y, event.z);
      notifyListeners();
    }));
  }

  void getMagnetometer() {
    streamSubscription.add(
      magnetometerEvents.listen((event) {
        magnetometerValues = _convertValues(event.x, event.y, event.z);
        notifyListeners();
      }),
    );
  }

  List<double> _convertValues(double evX, double evY, double evZ) {
    final x = double.parse(evX.toStringAsFixed(1));
    final y = double.parse(evY.toStringAsFixed(1));
    final z = double.parse(evZ.toStringAsFixed(1));
    return [x, y, z];
  }
}
