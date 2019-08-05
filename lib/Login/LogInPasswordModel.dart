import 'package:flutter/material.dart';
import 'dart:async';
class pwModel2 with ChangeNotifier {
  var MyColor = [Colors.black, Colors.black, Colors.black, Colors.black];
  var MyShape = [
    'images/minus.png',
    'images/minus.png',
    'images/minus.png',
    'images/minus.png'
  ];
  int i = 0;
  int _counter = 0;
  int retry = 1;
  Color circleColor = Color.fromRGBO(231, 21, 97, 1);
  Color barColor = Colors.black;
  String circleShape = 'images/circle.png';
  String barShape = 'images/minus.png';
  String text1 = '비밀번호 입력';
  String text2 = '비밀번호 4자리를 입력해주세요';
  String text3 = '';
  bool route = false;
  BuildContext context;

  getCounter() => _counter;

  void AddCounter() {
    _counter++;



    if ((_counter == 4)) {
      MyColor[3] = circleColor;
      MyShape[3] = circleShape;
      if(retry == 5){
        route = true;
      }
      Timer(Duration(milliseconds: 200),(){
        _counter = 0;

        retry++;
        text1 = '비밀번호 재입력';
        text2 = '잘못 입력하신 것 같아요.';
        text3 = '비밀번호 4자리를 다시 입력해주세요.';

        for (i = 0; i < 4; i++) {
          MyColor[i] = barColor;
          MyShape[i] = barShape;
        }
        notifyListeners();
      });



    }
    if (_counter < 4) {
      for (i = 0; i < 4; i++) {
        if (_counter == (i + 1)) {
          MyColor[i] = circleColor;
          MyShape[i] = circleShape;
        }
      }
    }
    notifyListeners();
  }

  void SubCounter() {
    if (_counter > 0) {
      for (i = 3; i >= 0; i--) {
        if (_counter == (i + 1)) {
          MyColor[i] = barColor;
          MyShape[i] = barShape;
          notifyListeners();
        }
      }
      _counter--;
    }
  }

  notifyListeners();
}
