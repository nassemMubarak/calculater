import 'package:calculater/screen/calculater_1.dart';
import 'package:calculater/screen/calculater_2.dart';
import 'package:calculater/screen/splash_screen.dart';
import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            // fontFamily: 'Dancing',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.black
          ),
          button: TextStyle(
            fontFamily: 'Dancing',
            fontSize: 22,
            fontWeight: FontWeight.w700,
              color: Colors.black,
          ),
        ),
      ),
      initialRoute: '/splash_screen',
      routes: {
        '/calculate1':(context)=>Calculate1(),
        '/splash_screen':(context)=>SplashScreen(),
        '/calculate2':(context)=>Calculate2(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
