import 'package:flutter/material.dart';
import 'dart:async';

class pwModel with ChangeNotifier {
  var MyColor = [Colors.black, Colors.black, Colors.black, Colors.black];
  var MyShape = [
    'images/minus.png',
    'images/minus.png',
    'images/minus.png',
    'images/minus.png'
  ];
  int i = 0;
  int _counter = 0;
  int _confirm = 0;
  Color circleColor = Color.fromRGBO(231, 21, 97, 1);
  Color barColor = Colors.black;
  String circleShape = 'images/circle.png';
  String barShape = 'images/minus.png';
  String text1 = '비밀번호 설정';
  String text2 = '비밀번호 4자리를 설정해주세요';

  getCounter() => _counter;

  void AddCounter() {

    _counter++;

    if((_counter == 4) && (_confirm != 1)){
      MyColor[3] = circleColor;
      MyShape[3] = circleShape;
      Timer(Duration(milliseconds: 200), (){
        _counter = 0;
        _confirm ++;
        text1 = '비밀번호 설정 확인';
        text2 = '비밀번호 4자리를 다시 설정해 주세요';

        for(i = 0; i < 4; i++){
          MyColor[i] = barColor;
          MyShape[i] = barShape;
        }
        notifyListeners();
      });

    }

    if((_counter == 4) && (_confirm == 1)){
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
