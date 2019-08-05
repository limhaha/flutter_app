import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mainpageModel.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ScreenUtil.instance = ScreenUtil(width: 1024, height: 768)..init(context);
    return new Scaffold(
        //primary: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: new Builder(builder: (context) {
            return new IconButton(
                icon: Image.asset(
                  'images/menu.png',
                  scale: 2,
                ),
                color: Color.fromRGBO(231, 21, 97, 1),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }),
          title: Text('나와 우리를 위한 임상시험',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(25),
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        drawer: Drawer(),
        body: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
              color: Color.fromRGBO(250, 250, 250, 1),
              width: size.width,
              height: ScreenUtil().setHeight(411),
            )),
            ContentSection()
          ],
        ));
  }
}

class Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainModel = Provider.of<MainPageModel>(context);
    return new Container(
      constraints: BoxConstraints.expand(
          width: ScreenUtil().setWidth(387),
          height: MediaQuery.of(context).size.height),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setHeight(275),
            child: DrawerHeader(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Padding(
                      padding:
                          EdgeInsets.only(left: ScreenUtil().setWidth(40))),
                  IconButton(
                    icon: new Icon(
                      Icons.close,
                      color: Color.fromRGBO(231, 21, 97, 1),
                      size: 35,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(83.2),
                          left: ScreenUtil().setWidth(30)),
                      child: Column(
                        children: <Widget>[
                          Text(
                            '환영합니다',
                            style: TextStyle(
                                color: Color.fromRGBO(23, 41, 87, 1),
                                fontSize: ScreenUtil().setSp(28.8),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                          ),
                          Text(mainModel.ID,
                              style: TextStyle(
                                  color: Color.fromRGBO(155, 155, 155, 1),
                                  fontSize: ScreenUtil().setSp(21.6),
                                  letterSpacing: 0.8))
                        ],
                      ))
                ])),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left:
                    BorderSide(color: mainModel.changeSideColor(0), width: 4.3),
              ),
              color: mainModel.changeBackColor(0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30),
                  ScreenUtil().setHeight(23), 0, ScreenUtil().setHeight(23)),
              leading: Icon(
                Icons.lock_outline,
                color: mainModel.changeIconColor(0),
                size: 35,
              ),
              title: Text('비밀번호 변경',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(27),
                      fontWeight: FontWeight.bold,
                      color: mainModel.changeTextColor(0))),
              onTap: () {
                mainModel.isClicked(0);
                // Navigator.pop(context);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left:
                    BorderSide(color: mainModel.changeSideColor(1), width: 4.3),
              ),
              color: mainModel.changeBackColor(1),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30),
                  ScreenUtil().setHeight(23), 0, ScreenUtil().setHeight(23)),
              leading: Image.asset('images/icon_analytics.png',
                  width: 35, color: mainModel.changeIconColor(1)),
              title: Text('임상시험 정보',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(27),
                      color: mainModel.changeTextColor(1))),
              onTap: () {
                mainModel.isClicked(1);
                //Navigator.pop(context);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left:
                    BorderSide(color: mainModel.changeSideColor(2), width: 4.3),
              ),
              color: mainModel.changeBackColor(2),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30),
                  ScreenUtil().setHeight(23), 0, ScreenUtil().setHeight(23)),
              leading: Image.asset('images/mobile2.png',
                  width: 35, color: mainModel.changeIconColor(2)),
              title: Text('앱 정보',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(27),
                      color: mainModel.changeTextColor(2))),
              onTap: () {
                mainModel.isClicked(2);
                //Navigator.pop(context);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(54)),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: Color.fromRGBO(155, 155, 155, 0.7), width: 2.0),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(45),
                  ScreenUtil().setHeight(20), 0, ScreenUtil().setHeight(20)),
              leading: Image.asset('images/logout.png', width: 30),
              title: Text(
                '로그아웃',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(25.6),
                    color: Color.fromRGBO(23, 41, 87, 1),
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mainModel = Provider.of<MainPageModel>(context);
    return new Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(106)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(29))),
            Image.asset(
              'images/start_survey.png',
              width: ScreenUtil().setWidth(483),
              height: ScreenUtil().setHeight(433),
            ),
            Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(39))),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '첫 설문조사를 부탁드려요!',
                    style: TextStyle(
                        color: Color.fromRGBO(74, 74, 74, 1),
                        fontSize: ScreenUtil().setSp(36),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(top: ScreenUtil().setHeight(50))),
                  Container(
                      width: ScreenUtil().setWidth(405),
                      child: Text(
                          mainModel.ID +
                              '님, ' +
                              mainModel.site_name +
                              '에서 진행하는 ' +
                              mainModel.IP_name +
                              ' 임상시험에 참여해 주셔서 감사합니다. \n첫 설문조사를 부탁드립니다.\n'
                                  '설문조사는 약 ' +
                              mainModel.time.toString() +
                              '분정도 소요됩니다.',
                          style: TextStyle(
                              color: Color.fromRGBO(106, 106, 106, 1),
                              fontSize: ScreenUtil().setSp(25)))),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(50))),
                  SizedBox(
                    width: ScreenUtil().setWidth(358),
                    height: ScreenUtil().setHeight(80),
                    child: FlatButton(
                        child: Text('설문조사 시작',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(26.4))),
                        color: Color.fromRGBO(231, 21, 97, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(6.5)),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
