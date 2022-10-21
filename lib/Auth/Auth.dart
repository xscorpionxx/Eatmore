import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:resturant/main.dart';


class Auth extends GetMiddleware{
  @override
     int ? get Priority => 2 ;
  @override
  RouteSettings ? redirect(String? route) {
    var user_name = sharedPreferences?.get("username");
    if(user_name != null) return RouteSettings(name: "homepage");
  }


}