import 'package:flutter/material.dart';
import 'package:epro_4/Login/LogInPasswordModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              ('images/add.png'),
            ),
            padding: EdgeInsets.only(right: 35, top: 35),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[PWText(), PinShape()],
              ),
            ),
            Container(
              width: 400,
              height: 400,
              child: PinPad(),
            )
          ],
        ),
      ),
    );
  }
}

class PWText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pwmodel = Provider.of<pwModel2>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            pwmodel.text1,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          Text(''),
          Text(
            pwmodel.text2,
            style: TextStyle(fontSize: ScreenUtil().setSp(17)),
          ),
          Text(
            pwmodel.text3,
            style: TextStyle(fontSize: ScreenUtil().setSp(17)),
          ),
          Text('\n\n\n')
        ],
      ),
    );
  }
}

class PinShape extends StatefulWidget {
  @override
  _PinShapeState createState() => _PinShapeState();
}

class _PinShapeState extends State<PinShape> {
  @override
  Widget build(BuildContext context) {
    final pwmodel = Provider.of<pwModel2>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                child: Image.asset(pwmodel.MyShape[0],
                    width: 30, height: 20, color: pwmodel.MyColor[0]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                child: Image.asset(pwmodel.MyShape[1],
                    width: 30, height: 20, color: pwmodel.MyColor[1]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                child: Image.asset(pwmodel.MyShape[2],
                    width: 30, height: 20, color: pwmodel.MyColor[2]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                child: Image.asset(pwmodel.MyShape[3],
                    width: 30, height: 20, color: pwmodel.MyColor[3]),
              ),
            ],
          ),
          Text('\n\n'),
          Text.rich(
            TextSpan(
                text: '(시도횟수 ',
                style: TextStyle(fontSize: ScreenUtil().setSp(17)),
                children: <TextSpan>[
                  TextSpan(
                      text: pwmodel.retry.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(17),
                          color: Color.fromRGBO(231, 21, 97, 1))),
                  TextSpan(
                      text: '/5',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(17),
                          color: Color.fromRGBO(231, 21, 97, 1))),
                  TextSpan(
                      text: ')',
                      style: TextStyle(fontSize: ScreenUtil().setSp(17)))
                ]),
          ),
          Text('\n\n'),
          forgottenButton()
        ],
      ),
    );
  }
}

class forgottenButton extends StatefulWidget {
  @override
  _forgottenButtonState createState() => _forgottenButtonState();
}

class _forgottenButtonState extends State<forgottenButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 70,
      height: 25,
      child: RaisedButton(
        color: Color.fromRGBO(243, 243, 243, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        onPressed: () {
          Navigator.pushNamed(context, '/login/findpassword');
        },
        child: Text(
          '비밀번호를 잊으셨나요?',
          style: TextStyle(fontSize: ScreenUtil().setSp(16.5)),
        ),
        textColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}

class PinPad extends StatefulWidget {
  @override
  _PinPadState createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> {
  @override
  Widget build(BuildContext context) {
    final pwmodel = Provider.of<pwModel2>(context);

    void routeToMainPage() {
      if (pwmodel.route == true) {
        Navigator.pushNamed(context, '/mainpage');
      }
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  pwmodel.AddCounter();
                  routeToMainPage();
                },
                child: Text(
                  '1',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.2),
                      fontWeight: FontWeight.w400),
                ),
                shape: new CircleBorder(),
                padding: EdgeInsets.all(22),
              ),
              FlatButton(
                onPressed: () {
                  pwmodel.AddCounter();
                  routeToMainPage();
                },
                child: Text(
                  '2',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.2),
                      fontWeight: FontWeight.w400),
                ),
                shape: new CircleBorder(),
                padding: EdgeInsets.all(22),
              ),
              FlatButton(
                onPressed: () {
                  pwmodel.AddCounter();
                  routeToMainPage();
                },
                child: Text(
                  '3',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.2),
                      fontWeight: FontWeight.w400),
                ),
                shape: new CircleBorder(),
                padding: EdgeInsets.all(22),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  pwmodel.AddCounter();
                  routeToMainPage();
                },
                child: Text(
                  '4',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.2),
                      fontWeight: FontWeight.w400),
                ),
                shape: new CircleBorder(),
                padding: EdgeInsets.all(22),
              ),
              FlatButton(
                onPressed: () {
                  pwmodel.AddCounter();
                  routeToMainPage();
                },
                child: Text(
                  '5',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.2),
                      fontWeight: FontWeight.w400),
                ),
                shape: new CircleBorder(),
                padding: EdgeInsets.all(22),
              ),
              FlatButton(
                onPressed: () {
                  pwmodel.AddCounter();
                  routeToMainPage();
                },
                child: Text(
                  '6',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.2),
                      fontWeight: FontWeight.w400),
                ),
                shape: new CircleBorder(),
                padding: EdgeInsets.all(22),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  pwmodel.AddCounter();
                  routeToMainPage();
                },
                child: Text(
                  '7',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.2),
                      fontWeight: FontWeight.w400),
                ),
                shape: new CircleBorder(),
                padding: EdgeInsets.all(22),
              ),
              FlatButton(
                onPressed: () {
                  pwmodel.AddCounter();
                  routeToMainPage();
                },
                child: Text(
                  '8',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.2),
                      fontWeight: FontWeight.w400),
                ),
                shape: new CircleBorder(),
                padding: EdgeInsets.all(22),
              ),
              FlatButton(
                onPressed: () {
                  pwmodel.AddCounter();
                  routeToMainPage();
                },
                child: Text(
                  '9',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(25.2),
                      fontWeight: FontWeight.w400),
                ),
                shape: new CircleBorder(),
                padding: EdgeInsets.all(22),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: null,
                child: Text(''),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(7, 0, 6, 0),
                child: FlatButton(
                  onPressed: () {
                    pwmodel.AddCounter();
                    routeToMainPage();
                  },
                  child: Text(
                    '0',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(25.2),
                        fontWeight: FontWeight.w400),
                  ),
                  shape: new CircleBorder(),
                  padding: EdgeInsets.all(22),
                ),
              ),
              FlatButton.icon(
                  shape: new CircleBorder(),
                  padding: EdgeInsets.all(25),
                  onPressed: () {
                    pwmodel.SubCounter();
                  },
                  icon: Image.asset(
                    'images/delete.png',
                    scale: 1.5,
                  ),
                  label: Text(''))
            ],
          )
        ],
      ),
    );
  }
}
