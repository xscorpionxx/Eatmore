import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:resturant/Controller/Helper.dart';
import 'package:resturant/Model/Authpage.dart';
import 'package:resturant/View/Mainpage.dart';

import 'alerts.dart';

class Authpagecontroller extends GetxController{
   ////////
   int state_of_page = 0;
   void change_state(){
     if(state_of_page==0){
       state_of_page =1;
     }
     else{
       state_of_page =0;
     }
     update();
   }
   /////
   bool statehoveringlogin = false;
   void onhoverlogin(val){
     statehoveringlogin = val;
     update();
   }
   /////// validate password
   GlobalKey<FormState> key = GlobalKey<FormState>();
   TextEditingController passwordcontroller = TextEditingController();
   TextEditingController password_confirm_controller = TextEditingController();
   TextEditingController user_or_email_controller = TextEditingController();
   String? validate_pass(String? value) {
     if (value == null) {
       return 'you should not leave it empty';
     }
     if (value.length < 6) {
       return 'password should not be less than 6 chars';
     }
     return null;
   }
   String? validate_pass_confirm(String? value) {
     if (value == null) {
       return 'you should not leave it empty';
     }
     if (value != passwordcontroller.text) {
       return 'password should be the same';
     }
     return null;
   }
   /////// validate email or username
   String?  validate_useroremail(String? value) {
     if (value == null) {
       return 'you should not leave it empty';
     }
     if(value.contains("@")){
       var reg_email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
       if (!reg_email.hasMatch(value)){
         return 'this email is not valid';
       }
     }
     else{
       if (value.length < 6) {
         return 'username should not be less than 6 chars';
       }
     }
     return null ;
   }

   ////// sign up
   void Sign_up_in() async{
    if(key.currentState!.validate()){
        //// sign up // sign in
        Alerts.alert_wait();
        var response = await Authpagemodel.Sign_up(
            user_or_email_controller.text, passwordcontroller.text);
        Get.back();
        if(response["status"]){
          Helper.save_user(user_or_email_controller.text,  passwordcontroller.text);
          passwordcontroller.text = "";
          user_or_email_controller.text = "";
          password_confirm_controller.text = "";
          if(state_of_page == 1){ Alerts.alert_message_pass(response["msg"] );}else{
            Get.offAll(Mainpage());
          }
        }
        else {
          Alerts.alert_message_not_pass(response["msg"]);
        }

    }
   }


}