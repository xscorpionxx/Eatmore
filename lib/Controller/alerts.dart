import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../View/Mainpage.dart';

class Alerts{
 static void alert_wait(){
    Get.dialog(
        AlertDialog(backgroundColor: Colors.transparent, elevation: 0,
          content: Container(height: 50, width: 50,
            child:  SpinKitHourGlass(color: Colors.white,
                size: 40.0,),
            ),

        ), barrierDismissible: false
    );
  }
  static void alert_message_pass(message){
    Get.dialog(
        AlertDialog(
          content: Container(height: 100, width: 200,
            child: Column(children: [Container(child: Text( message , style: TextStyle(fontSize: 15 , color: Colors.grey),),),
              Container(margin:   EdgeInsets.only(top: 30),width: 100 , height: 30,child: InkWell( onTap: ()=>Get.offAll(Mainpage()),child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromRGBO(255, 0, 54, 1) ),child: Center(
                child: Text("Go",style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.white ,fontSize: 14
                ), ),
              ),)),)
            ])
          ),
        ), barrierDismissible: false
    );
  }

 static void alert_message_not_pass(message){
   Get.dialog(
       AlertDialog(
         content: Container(height: 100, width: 200,
             child: Column(children: [Container(child: Text(message , style: TextStyle(fontSize: 15 , color: Colors.grey),),),
               Container(child: ElevatedButton(child: Text("ok" ),onPressed:()=> Get.back(),),)
             ])
         ),
       ), barrierDismissible: false
   );
 }


}