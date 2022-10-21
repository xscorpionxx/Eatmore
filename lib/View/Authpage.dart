import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Authpage.dart';
import '../Model/Authpage.dart';
import 'Mainpage.dart';


class Start_page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // measurments , colors and decoration
    var width = Get.size.width ;
    var height = Get.size.height ;
    var box_decoration = BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(
      color: Colors.black12,
      blurRadius: 2.0,
      spreadRadius: 1.0,
      offset: Offset(0.5, 0.5), // shadow direction: bottom right
    )]);
    var background_color = Color.fromRGBO(234, 245, 255, 1);
    // TODO: implement build
    return
      Scaffold(body: SingleChildScrollView(child: Column(children: [
        Container(height: height,color: background_color,
          child: Stack(children:[
            Positioned(top: - height * 0.251,left: - width * 0.08 ,
              child: Container( child:CircleAvatar(backgroundImage: AssetImage("images/pexels-photo-14.png"),) ,width: width *1.09 ,height:
              width *1.09 , decoration:
              BoxDecoration(color: Colors.red,shape: BoxShape.circle,),),
            ),
            Positioned(top: - height * 0.251,left: - width * 0.08 ,
              child: Container(width:width * 1.09 ,height:
              width * 1.09, decoration:
              BoxDecoration(color: Colors.red,shape: BoxShape.circle,gradient: LinearGradient(end: Alignment.bottomLeft,begin: Alignment.topRight,
                  stops: [0,1],colors: [ Color.fromRGBO(255,0,54,0.9019607843137255 ) , Color.fromRGBO(255,103,135,0.8 )]
              )),),
            ),
            Positioned(top: height * 0.06,child: Container(width: width,height: height * 0.07,child: Image(image: AssetImage("images/Eatmore Logo.png"),),)),
            Positioned(right: width * 0.1,left: width * 0.1,top: height * 0.2
                ,child:GetBuilder<Authpagecontroller>(
              init: Authpagecontroller(),builder: (controller)=>
                    Form(key: controller.key,
                      child: Container(decoration: box_decoration ,child:
                       SingleChildScrollView(
                         child: Column(children: [
              Container( decoration: BoxDecoration(border: Border.all(color: Colors.black12),borderRadius: BorderRadius.circular(20)),margin: EdgeInsets.only(top: 45,right: 30,left: 30), child: Row(children: [
                Expanded(child:controller.state_of_page==0? login_active(controller , height) :login_inactive(controller) )
                , Expanded(child: controller.state_of_page==0?signin_inactive(controller) : signin_active(controller,height) )
              ],),)
              ,Container(margin: EdgeInsets.only(top:controller.state_of_page==0 ?35:20),width: width * 0.55,child:
                            TextFormField(validator: controller.validate_useroremail,controller: controller.user_or_email_controller ,
                decoration: InputDecoration(focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color:Color.fromRGBO(255, 0, 54,1)),
                ),hintText: "Enter email or username",hintStyle: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  13)),style:  TextStyle(color: Color.fromRGBO(255, 0, 54,1),fontSize:  13),),)
              ,Container(margin: EdgeInsets.only(top: 5),width: width * 0.55,child: TextFormField(obscureText: true,validator: controller.validate_pass,controller: controller.passwordcontroller,
                  decoration: InputDecoration(suffixIcon: Icon(Icons.remove_red_eye,color: Color.fromRGBO(168, 167, 167,1),size: 20,),hintText: "Password",hintStyle: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  13),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color.fromRGBO(255, 0, 54,1)),
                          ),),style:  TextStyle(color: Color.fromRGBO(255, 0, 54,1),fontSize:  13)),),
              Container(
                child:controller.state_of_page==0 ?Container() :Container(margin: EdgeInsets.only(top: 5),width: width * 0.55,child: TextFormField(obscureText: true,validator: controller.validate_pass_confirm,controller: controller.password_confirm_controller,
                  decoration: InputDecoration(focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Color.fromRGBO(255, 0, 54,1)),
                  ),hintText: "Confirm Password"  ,hintStyle: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  13)),style:  TextStyle(color: Color.fromRGBO(255, 0, 54,1),fontSize:  13),),),
              ),
                        Container(child:controller.state_of_page==1 ?Container(): Container(alignment: Alignment.centerRight,margin: EdgeInsets.only(top: 20,right: 50),child: Text("Forgot Password?",style: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  11),),)),
              Container(margin: EdgeInsets.only(top: 30), width: width * 0.55,height: height * 0.06,child: ElevatedButton(onPressed: ()=>controller.Sign_up_in()
                  , child: Text(controller.state_of_page==0? "Log In":"Sign Up",style:   TextStyle(color: Colors.white, fontSize: 14),) ,style:
              ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.red)
                  )
              ),backgroundColor:MaterialStateProperty.all<Color>(Color.fromRGBO(255, 0, 54,1))))),
              Container(alignment: Alignment.center,margin: EdgeInsets.only(top: 10),child: Text("OR",style: TextStyle(color: Color.fromRGBO(168, 167, 167,1),fontSize:  13),),),
              Container(margin: EdgeInsets.only(top: 10,right: 40,left: 40,bottom: 40),child: Row(children: [
                Expanded(child:  Container(alignment: Alignment.centerRight,child: Container(width: width * 0.12,height: width * 0.12,decoration: BoxDecoration(border: Border.all(color: Colors.black12) , shape: BoxShape.circle),child: Image(image: AssetImage("images/twitter.png"),),))),
                Expanded(child: Container(width: width * 0.12,height: width * 0.12,decoration: BoxDecoration(border: Border.all(color: Colors.black12) , shape: BoxShape.circle),child: Image(image: AssetImage("images/1004px-Google__.png"),),)),
                Expanded(child:  Container(alignment: Alignment.centerLeft,child: Container(width: width * 0.12,height: width * 0.12,decoration: BoxDecoration(border: Border.all(color: Colors.black12) , shape: BoxShape.circle),child: Image(image: AssetImage("images/facebook.png"),),)))
              ],),),
            ],
            ),
                       ),
            ),
                    ),
            ) ),
            Positioned(bottom: - 130,right: 20 ,child:Image(image: AssetImage("images/salad-23.png"),) ),
            Positioned(bottom: - 40,right: - 20 ,child:Image(image: AssetImage("images/two-red-tomatoe.png"),) )
          ],
          ),
        )


      ],)),);
  }
  login_active (controller , height){
    return  Container(height: height * 0.04 ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromRGBO(255, 0, 54,1)),alignment: Alignment.center
      ,child: Text("Log In",style:   TextStyle(color: Colors.white, fontSize: 13),),
    );
  }
  login_inactive (controller){
    return InkWell(onTap: ()=>controller.change_state(),
      child:Container(alignment: Alignment.center,child: Text("Log In",style: TextStyle(color: Color.fromRGBO(255, 0, 54,1), fontSize: 13),),) ,
    );
  }
  signin_active (controller ,height ) {
    return Container(
      height: height * 0.04,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(255, 0, 54, 1)),
      alignment: Alignment.center
      ,
      child: Text(
        "Sign Up", style: TextStyle(color: Colors.white, fontSize: 13),),);
  }
  signin_inactive(controller){
    return InkWell( onTap: ()=>controller.change_state(),child: Container(alignment: Alignment.center,child: Text("Sign Up",style: TextStyle(color: Color.fromRGBO(255, 0, 54,1), fontSize: 13),),));
  }


}