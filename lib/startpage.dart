import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'startpageModel.dart';


class Startpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final startPageModel = Provider.of<StartPageModel>(context);

    final Size size = MediaQuery.of(context).size;

    ScreenUtil.instance = ScreenUtil(width: 1024, height: 768)..init(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false, // 키보드 위에 경고창 지우기
        body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Stack(
              children: <Widget>[
                Image.asset('images/login_background.png',
                    width: size.width, height: size.height, fit: BoxFit.fill),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(72),
                            top: ScreenUtil().setHeight(197)),
                        child: TitleSection()),
                    Container(
                        width: ScreenUtil().setWidth(501.3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(6.5)),
                        margin: EdgeInsets.only(
                            left: ScreenUtil().setWidth(50.8),
                            top: ScreenUtil().setHeight(138.8),
                            right: ScreenUtil().setWidth(82.3),
                            bottom: ScreenUtil().setHeight(156.3)),
                        child: InputSection()),
                  ],
                )
              ],
            )));
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            //제목과 소제목
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Row(//굵은글씨와 얇은 글씨
              children: [
            Text("나와 우리",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(43.8),
                    fontWeight: FontWeight.bold)),
            Text("를 위한",
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(43.8))),
          ]),
          Text('임상시험',
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(43.8))),
          Text('\n여러분들의 소중한 의견을 기다립니다.',
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: ScreenUtil().setSp(20)))
        ]));
  }
}

class InputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final startPageModel = Provider.of<StartPageModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 83.5)),
        Text('Subject 번호를 입력해주세요.',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(22.5),
                color: Color.fromRGBO(23, 41, 87, 1),
                fontWeight: FontWeight.bold)),
        Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(56))),
        Container(
            width: ScreenUtil().setWidth(376.6),
            height: ScreenUtil().setHeight(70.6),
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(24.3)),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(6.5),
                border: Border.all(color: startPageModel.isFocused())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'images/name_copy.png',
                  width: ScreenUtil().setWidth(20),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(right: ScreenUtil().setWidth(16.9))),
                Expanded(
                  child: TextField(
                      controller: startPageModel.myController,
                      focusNode: startPageModel.focus,
                      cursorColor: startPageModel.mainColor,
                      style: TextStyle(fontSize: ScreenUtil().setSp(17.5)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' 대상자번호 입력 (Subject Number)',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(179, 179, 179, 1),
                            fontSize: ScreenUtil().setSp(17.5),
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            )),
        Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(32.7))),
        SizedBox(
          width: ScreenUtil().setWidth(377.5),
          height: ScreenUtil().setHeight(68.8),
          child: FlatButton(
            child: Text("로그인",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.bold)),
            color: startPageModel.mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(6.5)),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ),
        Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(47.7))),
        Container(
          width: ScreenUtil().setWidth(220),
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(236.5)),
          child: FlatButton(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "새 대상자 등록하기",
                    style: TextStyle(
                        color: Color.fromRGBO(231, 21, 97, 1),
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(right: ScreenUtil().setWidth(15.8))),
                  Image.asset('images/path.png',
                      width: ScreenUtil().setWidth(11.4)),
                ],
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              }),
        ),
        //Padding(padding: EdgeInsets.only(top:ScreenUtil().setHeight(47.7))),
      ],
    );
  }
}
