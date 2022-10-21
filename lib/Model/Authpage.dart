import 'package:resturant/main.dart';

class Authpagemodel{
 static Sign_up(username , password) async {
  // var url = Helper.Base_url + "signin" ;
  // var encryptedBosy = jsonEncode({"username" : username , "password" : password});
  // var response = await http.post( Uri.parse(url),headers: <String, String>{
  //  'Content-Type': 'application/json; charset=UTF-8',
  // } ,body:encryptedBosy
  //      );
  // var body = jsonDecode(response.body);
  await Future.delayed(Duration(seconds: 2) ,(){
  });
  return { "status": true, "msg": "this account has been created successfuly"};
 }

}

