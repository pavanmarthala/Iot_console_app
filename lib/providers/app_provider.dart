import 'package:flutter/material.dart';
import 'package:iot_console/models/Status_model.dart';

class StatusProvider extends ChangeNotifier {
  Statusmodel _statusData = Statusmodel(
    powerStatus: 'OFF',
    motorStatus: 'OFF',
    motorSwitch: false,
  );

  Statusmodel get statusData => _statusData;

  void updateStatus(Statusmodel newData) {
    _statusData = newData;
    notifyListeners();
  }
}
