import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resturant/View/Mainpage.dart';
import 'package:resturant/View/Authpage.dart';

import 'Auth/Auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences ;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent
   ));
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title : "Foodi" ,
      debugShowCheckedModeBanner:  false,
      theme: ThemeData(),
      initialRoute: "/Authpage",
        getPages: [
        GetPage(name: "/homepage", page: ()=>Mainpage()),
        GetPage(name: "/Authpage", page: ()=>Start_page2() ,middlewares: [Auth()] ),
       ],
    );
  }

}