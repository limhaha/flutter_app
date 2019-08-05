import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainPageModel with ChangeNotifier{
  //DB에서 가져온 정보들을 임의 변수로 지정해 놓음
  String ID = 'ID'; //회원id
  String site_name = 'site_name'; //사이트 이름
  String IP_name = 'IP_name'; //임상시험이름
  int time =7;  //소요시간;
  Color main = Color.fromRGBO(231, 21, 97, 1);

  var isSelected =[false,false,false];  //버튼이 눌렸는지를 판단

  isClicked(int index){
    for(var i =0; i <isSelected.length; i++){
      if(index == i)
        isSelected[i] = true;
      else
        isSelected[i] = false;
    }
    notifyListeners();
  }

  changeTextColor(int index){

    if(isSelected[index] == true)
      return main;
    else
      return Color.fromRGBO(23, 41,87, 1);
  }
  changeBackColor(int index){

    if(isSelected[index] == true)
      return Color.fromRGBO(231, 21, 97, 0.05);
    else
      return Colors.white;
  }
  changeIconColor(int index){
    if(isSelected[index] == true)
      return main;
    else
      return Colors.black;
  }
  changeSideColor(int index){
    if(isSelected[index] == true)
      return main;
    else
      return Colors.transparent;
  }

}