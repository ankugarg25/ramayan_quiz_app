import 'package:flutter/material.dart';
import 'ui/home.dart';

final ThemeData _appTheme = _buildAppTheme();
ThemeData _buildAppTheme(){
final ThemeData base = ThemeData.dark();

return base.copyWith(
  brightness: Brightness.dark,
  accentColor: Colors.amber,
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Colors.blue,
  backgroundColor:Colors.yellow,

  textTheme: _appTextTheme(base.textTheme)


);

}
TextTheme _appTextTheme(TextTheme base){

  return base.copyWith(
     headline: base.headline.copyWith(
      fontSize: 23,
        fontWeight: FontWeight.w900
    ),

     title: base.title.copyWith(
        fontSize: 23,
        fontWeight: FontWeight.w900
    ),

      body1: base.body1.copyWith(
        fontSize: 25,
        color:Colors.white
    ),
      button: base.button.copyWith(
    letterSpacing: 6,
    fontSize: 23.9,
        fontFamily: "Roboto",
  )
  ).apply(
    fontFamily: "Roboto",
    displayColor: Colors.red,
    bodyColor: Colors.blue
  );
}
void main(){
  runApp(new MaterialApp(
   // theme: _appTheme,


//    theme: ThemeData(
//      brightness: Brightness.dark,
//      primaryColor: Colors.yellow[800],
//
//      textTheme: TextTheme(
//        headline: TextStyle(
//          fontSize: 34,
//          fontWeight: FontWeight.bold,
//        ),
//        body1: TextStyle(
//          fontSize: 16,
//          color: Colors.deepOrangeAccent
//        )
//      )
//    ),
    home: QuizApp(),
  ));
}