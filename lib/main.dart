import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'navigation/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Status Update Helper',
      routes: Navigate.routes,
      theme: appTheme(),
      initialRoute: '/login',
    );
  }
}

const Color primaryColor = Color.fromARGB(255, 245, 229, 86);
const Color primaryColorLight = Color.fromARGB(195, 233, 220, 106);
const Color primaryColorDark = Color.fromARGB(255, 255, 217, 0);
const Color appBarColor = Color.fromARGB(255, 245, 229, 86);
const Color textColor = Colors.black;

ThemeData appTheme() {
  return ThemeData(
      primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      appBarTheme: const AppBarTheme(
          backgroundColor: appBarColor,
          iconTheme: IconThemeData(color: textColor, size: 30),
          titleTextStyle: TextStyle(
              color: textColor, fontSize: 25.0, fontWeight: FontWeight.bold)),
      //secondaryHeaderColor: Colors.black,
      textTheme: const TextTheme(
          bodyText1: TextStyle(color: textColor),
          bodyText2: TextStyle(color: textColor),
          // bodyMedium: TextStyle(color: textColor),
          headline1: TextStyle(
              //color: textColor,
              fontSize: 40.0,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              //color: textColor,
              fontSize: 30.0,
              fontWeight: FontWeight.bold),
          headline3: TextStyle(
              //color: textColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black))));
}
