import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mainpageModel.dart';
import 'startpageModel.dart';
import 'startpage.dart';
import 'package:epro_4/Register/register.dart';
import 'package:epro_4/Login/LogInPassword.dart';
import 'package:epro_4/Login/LogInPasswordModel.dart';
import 'package:epro_4/Register/pinForRegister.dart';
import 'package:epro_4/Register/pinForRegisterModel.dart';
import 'package:flutter/services.dart';
import 'package:epro_4/Login/findPassword.dart';
import 'mainpage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StartPageModel>(builder: (_) => StartPageModel()),
        ChangeNotifierProvider<pwModel2>(builder: (_) => pwModel2(),),
        ChangeNotifierProvider<pwModel>(builder: (_) => pwModel(),),
        ChangeNotifierProvider<MainPageModel>(builder: (_) => MainPageModel()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'epro',
        initialRoute: '/',
        routes: {
          '/': (context) => Startpage(),
          '/register': (context) => Register(),
          '/login': (context) => LogIn(),
          '/register/pin': (context) => SignInPin(),
          '/login/findpassword': (context) => FindPassword(),
          '/mainpage': (context) => MainPage(),
        },
      ),
    );
  }
}
