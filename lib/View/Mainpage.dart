import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Controller/Mainpage.dart';


class Mainpage extends StatelessWidget {
  final Mainpagecontroller c = Get.put(Mainpagecontroller(), permanent: true);
  @override
  Widget build(BuildContext contexta) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    var background_color = Color.fromRGBO(234, 245, 255, 1);
    // TODO: implement build
    return Scaffold(key: _key,
      drawer: Drawer(backgroundColor:background_color  ,child: Column(children: [
        Container(margin: EdgeInsets.only(top: 50),width: 150 ,height: 150,child: CircleAvatar( backgroundColor: Colors.white,child: Icon(Icons.person,size: 100,)),) ,
        Container(margin:  EdgeInsets.only(top: 20),child: ListTile(title: Text("Settings" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ,color: Color.fromRGBO(255, 0, 54, 1)),),trailing: Icon(Icons.settings ,color: Color.fromRGBO(255, 0, 54, 1),),onTap: (){},),),
        Container(margin:  EdgeInsets.only(top: 20),child: ListTile(title: Text("Market" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ,color: Color.fromRGBO(255, 0, 54, 1)),),trailing: Icon(Icons.shopping_cart_rounded ,color: Color.fromRGBO(255, 0, 54, 1),),onTap: (){},),),
        Container(margin:  EdgeInsets.only(top: 20),child: ListTile(title: Text("Log out" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ,color: Color.fromRGBO(255, 0, 54, 1)),),trailing: Icon(Icons.logout ,color: Color.fromRGBO(255, 0, 54, 1),),onTap: (){c.logout();},))
      ],),)
      ,body: Builder(
          builder: (context) =>  Container(height: MediaQuery.of(context).size.height,color: Color.fromRGBO(234, 245, 255, 1),child: Stack(
            children:[ SingleChildScrollView(
              child: Column(children: [
        Container(margin: EdgeInsets.only(left: 25,right: 25,top: 30),child: Row(children: [
               Expanded(child: Container(alignment: Alignment.centerLeft,child: InkWell(onTap:()=>  _key.currentState?.openDrawer(),child: Container(width: 27,height: 11,child: Image(image: AssetImage("images/Group 37@2x.png")),)))),
              Expanded(child: Container(alignment: Alignment.centerRight,width: 45,height: 45,child: CircleAvatar(child: Image(image: AssetImage("images/Group 5@2x.png"),fit: BoxFit.fill,)),))
        ],),),
                Container(margin: EdgeInsets.only(left: 25,top: 20),alignment: Alignment.centerLeft,child: Text("Choose the",style: TextStyle(color: Color.fromRGBO(39, 39, 39, 15) , fontSize: 18,),),),
                Container(margin: EdgeInsets.only(left: 25,top: 3),alignment: Alignment.centerLeft,child: Text("Food you love",style: TextStyle(color: Color.fromRGBO(39, 39, 39, 15),fontSize: 18 , fontWeight: FontWeight.bold),),),
                Container( margin: EdgeInsets.only(left: 25,right: 25,top: 20), padding: EdgeInsets.only(left : 10,bottom: 3),decoration: BoxDecoration(border: Border.all(color: Colors.black12),color: Colors.white , borderRadius: BorderRadius.circular(20)), height: 45
                  ,child: TextFormField(decoration: InputDecoration(border: InputBorder.none,hintText: "Search for a food item" , hintStyle: TextStyle(fontSize: 12 , color: Colors.black26)),style:TextStyle(fontSize: 12 , color: Colors.black26) ,),),
                Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 25,top: 50),child: Text("Categories",style: TextStyle(fontSize: 12 , color: Colors.black,fontWeight: FontWeight.bold),),)
                ,GetBuilder<Mainpagecontroller>(init: Mainpagecontroller(),
                  builder:(controller)=> Container(height: 90,child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: controller.listcats.length,itemBuilder: (context,i){
                  return Container(
                    child:controller.activeindex==i? Container(width: 111,margin: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(255, 0, 54,1) ),color: Color.fromRGBO(255, 0, 54,1),borderRadius: BorderRadius.circular(20),boxShadow: [
                      BoxShadow(color: Colors.black38,spreadRadius: 1,blurRadius: 3,offset: Offset(0.5,0.5))
                    ]),child:Column(children:[ Spacer(),Container(width: 27,height: 21,child: Image(image: AssetImage(controller.listcats[i].url),fit: BoxFit.scaleDown,),)
                      ,Text(controller.listcats[i].name,style: TextStyle(color: Colors.white,fontSize: 11),),Spacer() ],))
                        :InkWell(onTap: ()=>controller.choosefromlist(i),
                      child: Container(width: 111,margin: EdgeInsets.all(10),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),boxShadow: [
                        BoxShadow(color: Colors.black12,spreadRadius: 0.1,blurRadius: 2,offset: Offset(0.5,0.5))
                      ]),child:Column(children:[ Spacer(),Container(width: 27,height: 21,child: Image(image: AssetImage(controller.listcats[i].url),fit: BoxFit.scaleDown,),)
                        ,Text(controller.listcats[i].name,style: TextStyle(color: Colors.black26,fontSize: 11),),Spacer() ],)),
                    ),
                  ) ;
                  },)),
                ),GetBuilder<Mainpagecontroller>(builder:(controller)=> Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 25,top: 30),
                  child: Text(controller.listcats[controller.activeindex].name,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                )),
                GetBuilder<Mainpagecontroller>(
                  builder:(controller)=> Container(margin: EdgeInsets.only(left: 10),height: 222,child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: controller.burgers.length,itemBuilder: (context,i){
                    return Container(
                      child:controller.activeindex2==i?
                          Container(width: 174,margin: EdgeInsets.only(top:10),decoration: BoxDecoration(gradient: LinearGradient(end: Alignment.bottomLeft,begin: Alignment.topRight,
                          stops: [0,1],colors: [ Color.fromRGBO(255,0,54,0.9019607843137255 ) , Color.fromRGBO(255,103,135,0.8 )]
                          ),color: Colors.white,borderRadius: BorderRadius.circular(20),boxShadow: [
                            BoxShadow(color: Colors.black12,spreadRadius: 0.1,blurRadius: 2,offset: Offset(0.5,0.5))
                          ]),child:Column(children:[ GetX<Mainpagecontroller>( builder:(controller)=>
                              Transform.rotate(angle: double.parse(controller.rotateangel.toString()) /50,child: Container(margin: EdgeInsets.only(top: 15),width: 112,height: 92,child: Image(image: AssetImage(controller.burgers[i]["url"]),fit: BoxFit.scaleDown,),)))
                            ,Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 25,top: 15),child: Text(controller.burgers[i]["name"],style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),)),
                            Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 25,top: 1),child: Row(children: [
                              Icon(Icons.star , color: Colors.amber.withGreen(230),size: 18,),
                              Icon(Icons.star , color: Colors.amber.withGreen(230),size: 18,),Icon(Icons.star , color: Colors.amber.withGreen(230),size: 18,),
                              Icon(Icons.star_border , color: Colors.amber.withGreen(230),size: 18,),
                              Icon(Icons.star_border , color: Colors.amber.withGreen(230),size: 18,)
                            ],)) ,
                            Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 25,top: 5),child: Text(r"$15",style: TextStyle(color: Colors.white,fontSize: 24),),),Spacer()]))
                          :InkWell(onTap: ()=>controller.choosefromsubcat(i),
                          child: Container(width: 160,margin: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),boxShadow: [
                            BoxShadow(color: Colors.black12,spreadRadius: 0.1,blurRadius: 2,offset: Offset(0.5,0.5))
                          ]),child:Column(children:[ Container(margin: EdgeInsets.only(top: 15),width: 112,height: 92,child: Image(image: AssetImage(controller.burgers[i]["url"]),fit: BoxFit.scaleDown,),)
                            ,Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 25,top: 15),child: Text(controller.burgers[i]["name"],style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),)),
                            Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 25,top: 1),child: Row(children: [
                              Icon(Icons.star , color: Colors.amber.withGreen(230),size: 15,),
                              Icon(Icons.star , color: Colors.amber.withGreen(230),size: 15,),Icon(Icons.star , color: Colors.amber.withGreen(230),size: 15,),
                              Icon(Icons.star_border , color: Colors.amber.withGreen(230),size: 15,),
                              Icon(Icons.star_border , color: Colors.amber.withGreen(230),size: 15,)
                            ],)) ,
                          Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(left: 25,top: 5),child: Text(r"$15",style: TextStyle(color: Colors.black,fontSize: 15),),),Spacer()])),
                        ),
                    ) ;
                  },)),
                ),GetBuilder<Mainpagecontroller>(
                  builder:(controller)=> Container(margin: EdgeInsets.only(top: 10),child: AnimatedSmoothIndicator(
                    activeIndex:controller.activeindex2 ,
                    count:  controller.burgers.length,
                    onDotClicked: (val)=>controller.choosefromsubcat(val),
                    effect:  WormEffect(dotColor: Colors.black12 ,activeDotColor: Color.fromRGBO(255, 0, 54,1)),
                  )   ,),
                )
              ]),) , Positioned(bottom: 15,right: 15,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black26,
                spreadRadius: 2,blurRadius: 10)],color: Color.fromRGBO(255, 0, 54,1),shape: BoxShape.circle,border: Border.all(color: Colors.white,width: 2)),width: 56,height: 56,padding: EdgeInsets.all(8),child:CircleAvatar(backgroundColor: Color.fromRGBO(255, 0, 54,1),child: Image(image: AssetImage("images/Union 1@2x.png"),)),))],
          ),),
      ),);
  }


}