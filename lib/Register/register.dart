import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 1024, height: 768)..init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            padding: EdgeInsets.only(left: 25),
            icon: Image.asset('images/left_icon.png'),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('등록하기',
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(25.6),
                fontWeight: FontWeight.bold)),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(38, 120, 29, 0),
                child: signIn(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(38, 90, 29, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: ScreenUtil().setHeight(132),
                  padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(37),
                      ScreenUtil().setHeight(30), 0, 0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(247, 245, 249, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '알림',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(22),
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Biock EDC에 정보가 먼저 입력되어 있어야만 태블릿에서도 등록할 수 있어요.',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(20), height: 2.18))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(),
              ),
              Row(
                children: <Widget>[nextButton()],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
            style: TextStyle(fontSize: ScreenUtil().setSp(22)),
            cursorColor: Color.fromRGBO(231, 21, 97, 1),
            decoration: InputDecoration(
              focusedBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(
                color: Color.fromRGBO(231, 21, 97, 1),
              )),
              prefixIcon: Image.asset(
                'images/gift.png',
                scale: 1.7,
                color: Colors.black,
              ),
              hintText: ' 생년월일 8자리 입력',
            )),
        TextField(
          style: TextStyle(fontSize: ScreenUtil().setSp(22)),
          cursorColor: Color.fromRGBO(231, 21, 97, 1),
          decoration: InputDecoration(
              focusedBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(
                color: Color.fromRGBO(231, 21, 97, 1),
              )),
              prefixIcon: Image.asset(
                'images/name_copy.png',
                color: Colors.black,
                scale: 1.7,
              ),
              hintText: ' 대상자 번호 (Subject Number)'),
        )
      ],
    );
  }
}

class nextButton extends StatefulWidget {
  @override
  _nextButtonState createState() => _nextButtonState();
}

class _nextButtonState extends State<nextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: RaisedButton(
          child: Text(
            '다음',
            style: TextStyle(
                color: Colors.white, fontSize: ScreenUtil().setSp(25.6)),
          ),
          color: Color.fromRGBO(231, 21, 97, 1),
          onPressed: () {
            Navigator.pushNamed(context, '/register/pin');
          },
        ));
  }
}
