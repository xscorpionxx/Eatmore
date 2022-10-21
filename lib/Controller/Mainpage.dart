import 'dart:async';
import 'package:get/get.dart';

import '../main.dart';


class Mainpagecontroller extends GetxController {
  List listcats = [
    new myview(name: "burger", url: "images/chicken@2x.png"),
    new myview(name: "pizza", url: "images/fast-food@2x.png"),
    new myview(name: "chicken", url: "images/chicken@2x.png"),
  ];
  List burgers = [
    {"name": "Zinger", "url": "images/Zinger.png"},
    {"name": "Chicken", "url": "images/Checken Burger.png"}
  ];
  int activeindex = 0;

  void choosefromlist(i) {
    activeindex = i;
    update();
  }

  int activeindex2 = 0;

  void choosefromsubcat(i) {
    activeindex2 = i;
    update();
  }
  void logout(){
  sharedPreferences?.clear();
  Get.toNamed("/Authpage");
  }
  RxInt rotateangel = 0.obs;

  @override
  void onReady() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      rotateangel ++;
      ;
    });
    super.onReady();
  }
}
class myview {
  var name ;
  var url ;
  myview({this.name,this.url});
}