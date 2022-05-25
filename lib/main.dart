import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/Screens/Dashboard.dart';
import 'package:mobile_app/Screens/IntroductionScreens.dart';
import 'package:mobile_app/authantication/Manager.dart';
import 'package:mobile_app/authantication/spiner.dart';
import 'package:provider/provider.dart';

import 'authantication/auth.dart';
import 'authantication/user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([
    SystemUiOverlay.bottom,

  ]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<User>.value(
      initialData: null,
      value: AuthanticateUser().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "fred",
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white),
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black),
            subtitle1: TextStyle(color: Colors.black),


          ),

          tabBarTheme: TabBarTheme(
            labelColor: Colors.white,

          ),
          primaryColor: Colors.black,
          primarySwatch: MaterialColor(0xFF111111, {
            50:Color.fromRGBO(6,3,7, .1),
            100:Color.fromRGBO(1,1,7, .2),
            200:Color.fromRGBO(1,1,7, .3),
            300:Color.fromRGBO(1,1,7, .4),
            400:Color.fromRGBO(1,1,7, .5),
            500:Color.fromRGBO(1,1,7, .6),
            600:Color.fromRGBO(1,1,7, .7),
            700:Color.fromRGBO(1,1,7, .8),
            800:Color.fromRGBO(1,1,7, .9),
            900:Color.fromRGBO(1,1,7, .9),
          }),
        ),
        // home:Dashboard(),
        home: Wraper(),
        // home:Spiner(),
      )
    );
  }
}


