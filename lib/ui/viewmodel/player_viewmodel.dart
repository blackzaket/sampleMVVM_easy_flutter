import 'package:flutter/material.dart';

class PlayerViewModel with ChangeNotifier {
  //player 중인지를 확인할 값
  var _isPlaying = false;

  bool get isPlaying => _isPlaying;

  void playSwitch() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }
}
