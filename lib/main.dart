import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:deer/homepage.dart';
void main() {
  
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
 ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
    
  }
}



